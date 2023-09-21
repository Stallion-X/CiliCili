package com.cilicili.Controller;

import com.cilicili.Beans.UserBean;
import com.cilicili.Services.Impl.UserServiceImpl;
import com.cilicili.Services.Impl.VideoServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

@Controller
public class IndexController {
    @Autowired
    UserServiceImpl userService;
    @Autowired
    VideoServiceImpl videoService;
    @RequestMapping("/")
    public String toIndex(Model model, HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        for (int i = 0; cookies!=null&&i < cookies.length; i++) {
            if (cookies[i].getName().equals("uid")) {
                model.addAttribute("userEntity",userService.getById(cookies[i].getValue()));
            }
        }
        return "index";
    }
    @RequestMapping("/toHome")
    public String toHome(Model model, HttpServletRequest request) {
        HashMap<String, Object> animeMap = new HashMap<>();
        animeMap.put("vpart",1);
        animeMap.put("islocked",0);

        model.addAttribute("animeList",videoService.listByMap(animeMap));
        HashMap<String, Object> fanjuMap = new HashMap<>();
        fanjuMap.put("vpart",2);
        fanjuMap.put("islocked",0);
        model.addAttribute("fanjuList",videoService.listByMap(fanjuMap));
        HashMap<String, Object> musicMap = new HashMap<>();
        musicMap.put("vpart",3);
        musicMap.put("islocked",0);
        model.addAttribute("musicList",videoService.listByMap(musicMap));
        HashMap<String, Object> danceMap = new HashMap<>();
        danceMap.put("vpart",4);
        danceMap.put("islocked",0);
        model.addAttribute("danceList",videoService.listByMap(danceMap));
        HashMap<String, Object> gameMap = new HashMap<>();
        gameMap.put("vpart",5);
        gameMap.put("islocked",0);
        model.addAttribute("gameList",videoService.listByMap(gameMap));
        HashMap<String, Object> sciMap = new HashMap<>();
        sciMap.put("vpart",6);
        sciMap.put("islocked",0);
        model.addAttribute("sciList",videoService.listByMap(sciMap));
        HashMap<String, Object> lifeMap = new HashMap<>();
        lifeMap.put("vpart",7);
        lifeMap.put("islocked",0);
        model.addAttribute("lifeList",videoService.listByMap(lifeMap));
        HashMap<String, Object> guichuMap = new HashMap<>();
        guichuMap.put("vpart",8);
        guichuMap.put("islocked",0);
        model.addAttribute("guichuList",videoService.listByMap(guichuMap));
        HashMap<String, Object> fashionMap = new HashMap<>();
        fashionMap.put("vpart",9);
        fashionMap.put("islocked",0);
        model.addAttribute("fashionList",videoService.listByMap(fashionMap));
        HashMap<String, Object> entertainmentMap = new HashMap<>();
        entertainmentMap.put("vpart",10);
        entertainmentMap.put("islocked",0);
        model.addAttribute("entertainmentList",videoService.listByMap(entertainmentMap));
        HashMap<String, Object> moviesMap = new HashMap<>();
        moviesMap.put("vpart",11);
        moviesMap.put("islocked",0);
        model.addAttribute("moviesList",videoService.listByMap(moviesMap));

        Cookie[] cookies = request.getCookies();
        for (int i = 0; cookies!=null && i < cookies.length; i++) {
            if (cookies[i].getName().equals("uid")) {
                model.addAttribute("userEntity",userService.getById(cookies[i].getValue()));
            }
        }

        return "home";
    }

}
