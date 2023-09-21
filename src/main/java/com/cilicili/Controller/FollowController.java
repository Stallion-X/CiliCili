package com.cilicili.Controller;

import com.cilicili.Beans.FollowBean;
import com.cilicili.Beans.UserBean;
import com.cilicili.Services.Impl.FollowServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Objects;

@RestController
public class FollowController {
    @Autowired
    FollowServiceImpl followService;
    @RequestMapping("/follow")
    public String follow(@RequestParam Long follower,@RequestParam Long followed) {
        if (!Objects.equals(followed, follower)) {
            FollowBean followBean = new FollowBean();
            followBean.setFollower(follower);
            followBean.setFollowed(followed);
            if (followService.save(followBean)) {
                return "success";
            }
            else {
                return "error";
            }
        }
        else {
            return "不能关注自己哦！";
        }
    }

    @RequestMapping("/getFollowing")
    public List<UserBean> getFollowing(@RequestParam Long uid) {
        return followService.getFollowingInfo(uid);
    }

    @RequestMapping("/getFollowers")
    public List<UserBean> getFollowers(@RequestParam Long uid) {
        return followService.getFollowersInfo(uid);
    }

    @RequestMapping("/getFollowingsNum")
    public int getFollowingsNum(@RequestParam Long uid) {
        return followService.getFollowingInfo(uid).size();
    }

    @RequestMapping("/getFollowersNum")
    public int getFollowersNum(@RequestParam Long uid) {
        return followService.getFollowersInfo(uid).size();
    }

    @RequestMapping("/getFollowStatus")
    public int getFollowStatus(@RequestParam Long uid,@RequestParam Long owner) {
        HashMap<String, Object> columnMap = new HashMap<>();
        columnMap.put("follower",uid);
        columnMap.put("followed",owner);
        if (followService.listByMap(columnMap).size()>0) {
            return 1;
        }
        else {
            return 0;
        }
    }

    @RequestMapping("/cancelFollow")
    public String cancelFollow(@RequestParam Long uid,@RequestParam Long owner) {
        HashMap<String, Object> columnMap = new HashMap<>();
        columnMap.put("follower",uid);
        columnMap.put("followed",owner);
        if (followService.removeByMap(columnMap)) {
            return "success";
        }
        else {
            return "error";
        }
    }

}
