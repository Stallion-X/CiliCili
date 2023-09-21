package com.cilicili.DAO.Mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.cilicili.Beans.FollowBean;
import com.cilicili.Beans.UserBean;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface FollowMapper extends BaseMapper<FollowBean> {
    List<UserBean> getFollowingInfo(@Param("follower") Long follower);
    List<UserBean> getFollowersInfo(@Param("followed") Long followed);
}
