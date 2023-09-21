package com.cilicili.Controller;

import com.cilicili.Beans.UserBean;
import com.cilicili.Services.Impl.CommentsServiceImpl;
import com.cilicili.Services.Impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;

@Controller
public class LoginController {
    @Autowired
    UserServiceImpl userService;
    @Autowired
    CommentsServiceImpl commentsService;
    @Autowired
    BCryptPasswordEncoder PwdSecurity;
    @RequestMapping("/toLogin")
    public String toLogin(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        for (int i = 0; cookies!=null && i < cookies.length; i++) {
            if (cookies[i].getName().equals("uid")) {
                return "redirect:/";
            }
        }
        return "login";
    }
    @PostMapping("/login")
    public String login(HttpServletRequest request, HttpServletResponse response, @RequestParam String username, @RequestParam String password,@RequestParam String verify) {
        HashMap<String, Object> columnMap = new HashMap<>();
        columnMap.put("username",username);
        List<UserBean> login = userService.listByMap(columnMap);
        String regex = "^(?i)"+request.getSession().getAttribute("logincode")+"$";
        if(login.size()>0) {
            if (PwdSecurity.matches(password,login.get(0).getPwd())&&verify.matches(regex)) {
                UserBean user =login.get(0);
                Cookie uidCookie = new Cookie("uid",user.getUid().toString());
                Cookie userNameCookie = new Cookie("username",user.getUsername());
                Cookie nickNameCookie = new Cookie("nickname",user.getNickname());
                Cookie avatarCookie = new Cookie("avatar",user.getAvatar());
                uidCookie.setMaxAge(60*60);
                userNameCookie.setMaxAge(60*60);
                nickNameCookie.setMaxAge(60*60);
                avatarCookie.setMaxAge(60*60);
                response.addCookie(uidCookie);
                response.addCookie(userNameCookie);
                response.addCookie(nickNameCookie);
                response.addCookie(avatarCookie);

                Cookie vip = new Cookie("vip", String.valueOf(user.getRoles()));
                vip.setMaxAge(60*60);
                response.addCookie(vip);
                return "redirect:/";
            }
            else {
                request.setAttribute("returninfo","密码或验证码错误");
                return "login";
            }
        }
        else {
            request.setAttribute("returninfo","找不到账号");
            return "login";
        }
    }

    @PostMapping ("/signup")
    @ResponseBody
    public String signup(
            @RequestParam String username,
            @RequestParam String password,
            @RequestParam String nickname,
            @RequestParam String sex
    ) {
        UserBean user=new UserBean();
        user.setUsername(username);
        user.setPwd(PwdSecurity.encode(password));
        user.setNickname(nickname);
        user.setSex(sex);
        HashMap<String, Object> columnMap = new HashMap<>();
        columnMap.put("username",username);
        if (userService.listByMap(columnMap).size()==0) {
            if (userService.save(user)) {
                return "success";
            }
            else {
                return "error";
            }
        }
        else {
            return "error";
        }
    }

    @RequestMapping("/toAdminLogin")
    public String toAdminLogin() {
        return "adminLogin";
    }
    @RequestMapping("/adminLogin")
    public String adminLogin(@RequestParam String acc,@RequestParam String pwd,HttpServletResponse response) {
        HashMap<String, Object> columnMap = new HashMap<>();
        columnMap.put("username",acc);
        columnMap.put("pwd",pwd);
        columnMap.put("roles",2);
        List<UserBean> list = userService.listByMap(columnMap);
        if (list.size()>0) {
            Cookie admin = new Cookie("admin",acc);
            response.addCookie(admin);
            return "redirect:/toExamine";
        }
        else {
            return "redirect:/toAdminLogin?isSuc=0";
        }

    }
}
