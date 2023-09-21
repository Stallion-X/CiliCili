package com.cilicili.Controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.cilicili.Beans.CollectionBean;
import com.cilicili.Beans.UserBean;
import com.cilicili.Beans.VideoBean;
import com.cilicili.Services.Impl.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;


@Controller
public class VideoController {
    @Autowired
    VideoServiceImpl videoService;
    @Autowired
    CommentsServiceImpl commentsService;
    @Autowired
    CollectionServiceImpl collectionService;
    @Autowired
    UserServiceImpl userService;
    @Autowired
    FollowServiceImpl followService;

//    @RequestMapping("/video")
//    public String video(@RequestParam(required=false) Long vid, Model model, HttpServletRequest request) {
    @RequestMapping("/video/{vid}")
    public String video(@PathVariable(required=false) Long vid, Model model, HttpServletRequest request) {
        model.addAttribute("vid",vid);

        HashMap<String, Object> columnMap = new HashMap<>();
        columnMap.put("comvid",vid);
        model.addAttribute("comList",commentsService.listByMap(columnMap));

        VideoBean videoEntity = videoService.getById(vid);
        model.addAttribute("videoEntity",videoEntity);

        VideoBean tempv = videoService.getById(vid);
        tempv.setVviews(tempv.getVviews()+1);
        videoService.updateById(tempv);

        HashMap<String, Object> columnMap2 = new HashMap<>();
        columnMap2.put("uid",tempv.getVowner());
        UserBean owner = userService.listByMap(columnMap2).get(0);
        model.addAttribute("vownerEntity",owner);

        List<VideoBean> hotlist=videoService.list(
                new QueryWrapper<VideoBean> ()
                        .eq("islocked",0)
                        .eq("vpart",videoEntity.getVpart())
                        .orderByDesc("vviews")
        );
        model.addAttribute("hotList",hotlist);

        model.addAttribute("followersnum",followService.getFollowersInfo(tempv.getVowner()).size());

        Cookie[] cookies = request.getCookies();
        for (int i = 0; cookies!=null&&i < cookies.length; i++) {
            if (cookies[i].getName().equals("uid")) {
                String uid = cookies[i].getValue();
                HashMap<String, Object> columnMap3 = new HashMap<>();
                columnMap3.put("follower",Long.parseLong(uid));
                columnMap3.put("followed",owner.getUid());
                if (followService.listByMap(columnMap3).size()>0) {
                    model.addAttribute("followStatus",1);
                }
                else {
                    model.addAttribute("followStatus",0);
                }
                break;
            }
        }

        return "video";
    }

    @RequestMapping("/addVideoCollection")
    @ResponseBody
    public String Collection(@RequestParam Long uid ,@RequestParam Long vid){
        HashMap<String, Object> columnMap = new HashMap<>();
        columnMap.put("colv",vid);
        columnMap.put("colu",uid);
        List<CollectionBean> COL = collectionService.listByMap(columnMap);
        if(COL.size()>0){
            System.out.println("已经在收藏夹");
            return "duplicate";
        }else {
            System.out.println("收藏夹没有");
            CollectionBean col=new CollectionBean();
            col.setColu(uid);
            col.setColv(vid);
            collectionService.save(col);
            VideoBean tempv = videoService.getById(vid);
            tempv.setVcolnum(tempv.getVcolnum()+1);
            videoService.updateById(tempv);
            return "success";
        }
    }

    @RequestMapping("/addVideoLikes")
    @ResponseBody
    public String videoLikes(@RequestParam Long vid) {
        VideoBean tempv = videoService.getById(vid);
        tempv.setVlikes(tempv.getVlikes()+1);
        if (videoService.updateById(tempv)) {
            return "success";
        }
        else {
            return "error";
        }
    }

    @RequestMapping("/addVideoCoins")
    @ResponseBody
    public String videoCoins(@RequestParam Long vid,@RequestParam Long uid) {
        VideoBean tempv = videoService.getById(vid);
        tempv.setVid(vid);
        tempv.setVcoins(tempv.getVcoins()+1);
        UserBean tempu = userService.getById(uid);
        int coins = tempu.getCoins();
        if (coins>=1) {
            if (videoService.updateById(tempv)) {
                tempu.setCoins(coins-1);
                userService.updateById(tempu);
                return "success";
            }
            else {
                return "error";
            }
        }
        else {
            return "not enough";
        }
    }

    @RequestMapping("/getVideoLikes")
    @ResponseBody
    public String getVideoLikes(@RequestParam Long vid) {
        return videoService.getById(vid).getVlikes()+"";
    }

    @RequestMapping("/getVideoCoins")
    @ResponseBody
    public String getVideoCoins(@RequestParam Long vid) {
        return videoService.getById(vid).getVcoins()+"";
    }

    @RequestMapping("/getVideoCollection")
    @ResponseBody
    public String getVideoCollection(@RequestParam Long vid) {
        return videoService.getById(vid).getVcolnum()+"";
    }

    @RequestMapping("/getHotList")
    @ResponseBody
    public List<VideoBean> getHotList(@RequestParam int vpart) {
        return videoService.list(
                new QueryWrapper<VideoBean> ()
                        .eq("islocked",0)
                        .eq("vpart",vpart)
                        .orderByDesc("vviews")
        );
    }

    @RequestMapping("/searchVideosByViews")
    @ResponseBody
    public List<VideoBean> searchVideosByViews(@RequestParam String vtitle) {
        return videoService.list(
                new QueryWrapper<VideoBean> ()
                        .eq("islocked",0)
                        .like("vtitle",vtitle)
                        .orderByDesc("vviews")
        );
    }

    @RequestMapping("/searchVideosByTime")
    @ResponseBody
    public List<VideoBean> searchVideosByTime(@RequestParam String vtitle) {
        return videoService.list(
                new QueryWrapper<VideoBean> ()
                        .eq("islocked",0)
                        .like("vtitle",vtitle)
                        .orderByDesc("uptime")
        );
    }
}
