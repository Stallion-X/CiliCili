package com.cilicili.Controller;

import com.cilicili.Beans.VideoBean;
import com.cilicili.Services.Impl.VideoServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
public class ExamineController {
    @Autowired
    VideoServiceImpl videoService;
    @RequestMapping("/toExamine")
    public String toExamine(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        for (int i=0;i<cookies.length;i++) {
            if (cookies[i].getName().equals("admin")&&!cookies[i].getValue().equals("")) {
                //HashMap<String, Object> columnMap = new HashMap<>();
                //columnMap.put("islocked",1);
                //request.setAttribute("reviewList",videoService.listByMap(columnMap));
                return "examine";
            }
        }
        return "permissionError";
    }
    @RequestMapping("/restExamine")
    @ResponseBody
    public List<VideoBean> restExamine() {
        HashMap<String, Object> columnMap = new HashMap<>();
        columnMap.put("islocked",1);
        return videoService.listByMap(columnMap);
    }

    @RequestMapping("/examinePass")
    @ResponseBody
    public String examinePass(@RequestParam Long vid) {
        VideoBean tempv = videoService.getById(vid);
        tempv.setIslocked(0);
        if (videoService.updateById(tempv)) {
            return "success";
        }
        else {
            return "error";
        }
    }

    @RequestMapping("/examineNotPass")
    @ResponseBody
    public String examineNotPass(@RequestParam Long vid) {
        if (videoService.removeById(vid)) {
            return "success";
        }
        else {
            return "error";
        }
    }
}
