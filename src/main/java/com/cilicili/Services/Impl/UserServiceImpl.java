package com.cilicili.Services.Impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cilicili.Beans.UserBean;
import com.cilicili.DAO.Mapper.UserMapper;
import com.cilicili.Services.UserService;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl extends ServiceImpl<UserMapper, UserBean> implements UserService {
}
