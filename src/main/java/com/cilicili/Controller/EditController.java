package com.cilicili.Controller;

import com.cilicili.Beans.UserBean;
import com.cilicili.Services.Impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class EditController {
    @Autowired
    UserServiceImpl userService;
    @Autowired
    BCryptPasswordEncoder PwdSecurity;

    @RequestMapping("/toEdit")
    public String toEdit(Model model,HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        for (int i=0;i<cookies.length;i++) {
            if (cookies[i].getName().equals("uid")) {
                model.addAttribute("user",userService.getById(cookies[i].getValue()));
            }
        }
        return "editUser";
    }

    @PostMapping("/information1")
    @ResponseBody
    public String information1(
            HttpServletRequest request,
            @RequestParam Long uid,
            @RequestParam(required = false) String nickname,
            @RequestParam(required = false) String phone,
            @RequestParam String sex,
            @RequestParam(required = false) String birth,
            @RequestParam(required = false) String email,
            @RequestParam(required = false) MultipartFile avatar,
            @RequestParam(required = false) String signature
    ) throws ParseException {
        UserBean UA = userService.getById(uid);
        UA.setUid(uid);
        UA.setNickname(nickname);
        UA.setPhone(phone);
        UA.setSex(sex);
        if (!birth.equals("")) {
            Date bir = new SimpleDateFormat("yyyy-MM-dd").parse(birth);
            UA.setBirth(bir);
        }
        UA.setEmail(email);
        UA.setSignature(signature);
        String isuffix = "";
        String iname = "";
        if (avatar!=null&&!avatar.isEmpty()) {
            isuffix = avatar.getOriginalFilename().substring(avatar.getOriginalFilename().lastIndexOf("."));
            iname = uid+isuffix;
            UA.setAvatar(iname);
        }
        String ipath = new File("./src/main/webapp/views/img/avatar").getAbsolutePath();
        if(userService.updateById(UA)){
            List<UserBean> list=userService.list();
            UserBean user =userService.getById(list.get(0).getUid());
            request.getSession().setAttribute("user", user);
            request.setAttribute("allUsers", list);
            try {
                if (avatar!=null&&!avatar.isEmpty()) {
                    avatar.transferTo(new File(ipath+"/"+iname));
                }
                return "success";
            }catch(IOException e) {
                return "error";
            }
        }else {
            return "error";
        }
    }

    @PostMapping("/information2")
    @ResponseBody
    public String information2(
            HttpServletRequest request,
            @RequestParam Long uid,
            @RequestParam String pwd1
    ){
        UserBean UA = userService.getById(uid);
        UA.setPwd(PwdSecurity.encode(pwd1));
        if(userService.updateById(UA)){
            List<UserBean> list=userService.list();
            System.out.println(list.get(0).getUid());
            UserBean user = userService.getById(list.get(0).getUid());
            request.getSession().setAttribute("user", user);
            request.setAttribute("allUsers", list);
            return "success";
        }else {
            return "error";
        }
    }

    @PostMapping("/oldCheck")
    @ResponseBody
    public String oldCheck(@RequestParam Long uid, @RequestParam String oldpwd) {
        String encodedPwd = userService.getById(uid).getPwd();
        if (PwdSecurity.matches(oldpwd,encodedPwd)) {
            return "success";
        }
        else {
            return "error";
        }
    }
}
