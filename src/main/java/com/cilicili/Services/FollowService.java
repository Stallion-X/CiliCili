package com.cilicili.Services;

import com.baomidou.mybatisplus.extension.service.IService;
import com.cilicili.Beans.FollowBean;
import com.cilicili.Beans.UserBean;

import java.util.List;

public interface FollowService extends IService<FollowBean> {
    List<UserBean> getFollowingInfo(Long follower);
    List<UserBean> getFollowersInfo(Long followed);
}
