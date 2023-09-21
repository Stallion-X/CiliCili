package com.cilicili.Services;

import com.baomidou.mybatisplus.extension.service.IService;
import com.cilicili.Beans.CollectionBean;

import java.util.List;

public interface CollectionService extends IService<CollectionBean> {
    public List<CollectionBean> getColInfos(Long colu);
}
