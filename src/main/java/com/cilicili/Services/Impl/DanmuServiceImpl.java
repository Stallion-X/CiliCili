package com.cilicili.Services.Impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cilicili.Beans.DanmuBean;
import com.cilicili.DAO.Mapper.DanmuMapper;
import com.cilicili.Services.DanmuService;
import org.springframework.stereotype.Service;

@Service("danmuService")
public class DanmuServiceImpl extends ServiceImpl<DanmuMapper, DanmuBean> implements DanmuService {
}
