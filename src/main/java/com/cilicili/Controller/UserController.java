package com.cilicili.Controller;

import com.cilicili.Beans.UserBean;
import com.cilicili.Services.Impl.FollowServiceImpl;
import com.cilicili.Services.Impl.UserServiceImpl;
import com.cilicili.Services.Impl.VideoServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    UserServiceImpl userService;
    @Autowired
    VideoServiceImpl videoService;
    @Autowired
    FollowServiceImpl followService;
    @RequestMapping("/toUser")
    public String toUser(Model model, @RequestParam Long uid, HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        for (int i = 0; cookies!=null&&i < cookies.length; i++) {
            if (cookies[i].getName().equals("uid")) {
                model.addAttribute("userEntity",userService.getById(uid));
                if (cookies[i].getValue().equals(uid+"")) {
                    model.addAttribute("access",1);
                }
                else {
                    model.addAttribute("access",0);
                }
                return "user";
            }
        }
        return "redirect:/toLogin";
    }
    @RequestMapping("/toFollowingList")
    public String toFollowingList(@RequestParam Long uid, Model model,@RequestParam int access) {
        List<UserBean> list = followService.getFollowingInfo(uid);
        model.addAttribute("list",list);
        List<Integer> statusList = new ArrayList<>();
        for (int i=0;i<list.size();i++) {
            statusList.add(0);
        }
        for (int i=0;i<list.size();i++) {
            Long owner = list.get(i).getUid();
            HashMap<String, Object> columnMap = new HashMap<>();
            columnMap.put("follower",uid);
            columnMap.put("followed",owner);
            if (followService.listByMap(columnMap).size()>0) {
                statusList.set(i,1);
            }
            else {
                statusList.set(i,0);
            }
        }
        model.addAttribute("statusList",statusList);
        model.addAttribute("access",access);
        return "following";
    }

    @RequestMapping("/toFanList")
    public String toFanList(@RequestParam Long uid, Model model,@RequestParam int access) {
        List<UserBean> list = followService.getFollowersInfo(uid);
        model.addAttribute("list",list);
        List<Integer> statusList = new ArrayList<>();
        for (int i=0;i<list.size();i++) {
            statusList.add(0);
        }
        for (int i=0;i<list.size();i++) {
            Long owner = list.get(i).getUid();
            HashMap<String, Object> columnMap = new HashMap<>();
            columnMap.put("follower",uid);
            columnMap.put("followed",owner);
            if (followService.listByMap(columnMap).size()>0) {
                statusList.set(i,1);
            }
            else {
                statusList.set(i,0);
            }
        }
        model.addAttribute("statusList",statusList);
        model.addAttribute("access",access);
        return "fans";
    }

    @RequestMapping("/toContributeList")
    public String toContributeList(@RequestParam Long uid, Model model,@RequestParam int access) {
        HashMap<String, Object> columnMap = new HashMap<>();
        columnMap.put("vowner",uid);
        model.addAttribute("conlist",videoService.listByMap(columnMap));
        model.addAttribute("access",access);
        return "contribute";
    }
}
