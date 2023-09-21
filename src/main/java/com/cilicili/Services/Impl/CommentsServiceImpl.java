package com.cilicili.Services.Impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cilicili.Beans.CommentsBean;
import com.cilicili.DAO.Mapper.CommentsMapper;
import com.cilicili.Services.CommentsService;
import org.springframework.stereotype.Service;

@Service("commentsService")
public class CommentsServiceImpl extends ServiceImpl<CommentsMapper, CommentsBean> implements CommentsService {
}
