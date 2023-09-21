package com.cilicili.Services.Impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cilicili.Beans.CollectionBean;
import com.cilicili.DAO.Mapper.CollectionMapper;
import com.cilicili.DAO.Mapper.CommentsMapper;
import com.cilicili.Services.CollectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("collectionService")
public class CollectionServiceImpl extends ServiceImpl<CollectionMapper, CollectionBean> implements CollectionService {
    @Autowired
    CollectionMapper collectionMapper;
    public List<CollectionBean> getColInfos(Long colu) {
        return collectionMapper.getColInfos(colu);
    }
}
