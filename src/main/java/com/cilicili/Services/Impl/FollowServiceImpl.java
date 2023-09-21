package com.cilicili.Services.Impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cilicili.Beans.FollowBean;
import com.cilicili.Beans.UserBean;
import com.cilicili.DAO.Mapper.FollowMapper;
import com.cilicili.Services.FollowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("followService")
public class FollowServiceImpl extends ServiceImpl<FollowMapper, FollowBean> implements FollowService {
    @Autowired
    FollowMapper followMapper;
    public List<UserBean> getFollowingInfo(Long follower) {
        return followMapper.getFollowingInfo(follower);
    }
    @Transactional
    public List<UserBean> getFollowersInfo(Long followed) {
        return followMapper.getFollowersInfo(followed);
    }
}
