package com.cilicili.Controller;

import com.alipay.api.AlipayApiException;
import com.alipay.api.internal.util.AlipaySignature;
import com.cilicili.Beans.UserBean;
import com.cilicili.Services.Impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

@Controller
public class PayController {
    @Autowired
    UserServiceImpl userService;
    private final String ALIPAY_PUBLIC_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAlufLJAaqrxBP3iWEs3bF4hiU7hTuSYA3vqf3YoZ8LcP2HygCxjjuajs7TWkh6pdLk/Ufp8q7IAzIBS5Wz0gWIqgYgit+vEqt/kiupmGtOXemvgL2537HBez+HQ5NVZUc4F2L0R6Ym0nB6HBUWLvx4uUTnTAuTWeheebqK0bZhpw7YaGulRuw8aKaNjcHVZ6e9WOOoEWuLSc2vsZekFZ9xxHedeqzd71nNEselTKH7u0xptigThokjyQRC3i5hiwEMRIwoc2HnJhtViOwkF3/YFg3L8idfZpfd95cOB78iktZxF91w+eTAfjhDGNj/RedMjLzzktyy1aEaMx8UY7J5QIDAQAB";
    @RequestMapping("/toPay")
    public String toPay(HttpServletRequest request) {
        int loginflag = 0;
        Cookie[] cookies = request.getCookies();
        for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals("uid")) {
                loginflag = 1;
            }
        }
        if (loginflag == 1) {
            return "VIPpay";
        }
        else {
            return "redirect:/";
        }

    }
    @RequestMapping("/returnUrl")
    public String returnUrlMethod(HttpServletRequest request, HttpServletResponse response, Model model) throws AlipayApiException, UnsupportedEncodingException {
        System.out.println("=================================同步回调=====================================");

        // 获取支付宝GET过来反馈信息
        Map<String, String> params = new HashMap<String, String>();
        Map<String, String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
            }
            // 乱码解决，这段代码在出现乱码时使用
            valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }

        System.out.println(params);//查看参数都有哪些
        //验证签名（支付宝公钥）
        boolean signVerified = AlipaySignature.rsaCheckV1(params, ALIPAY_PUBLIC_KEY, "UTF8", "RSA2"); // 调用SDK验证签名
        //验证签名通过
        if(signVerified){
            // 商户订单号
            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");

            // 支付宝交易流水号
            String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");

            // 付款金额
            float money = Float.parseFloat(new String(request.getParameter("total_amount").getBytes("ISO-8859-1"), "UTF-8"));

            System.out.println("商户订单号="+out_trade_no);
            System.out.println("支付宝交易号="+trade_no);
            System.out.println("付款金额="+money);

            //在这里编写自己的业务代码（对数据库的操作）
            Cookie[] cookies = request.getCookies();
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals("uid")) {
                    UserBean tempu = userService.getById(cookies[i].getValue());
                    tempu.setRoles(1);
                    userService.updateById(tempu);
                }
            }
            Cookie vip = new Cookie("vip","1");
            response.addCookie(vip);

			/*
			################################
			*/
            //跳转到提示页面（成功或者失败的提示页面）
            model.addAttribute("flag",1);
            model.addAttribute("msg","支持");
            return "payTips";
        }else{
            //跳转到提示页面（成功或者失败的提示页面）
            model.addAttribute("flag",0);
            model.addAttribute("msg","支持");
            return "payTips";
        }
    }
}
