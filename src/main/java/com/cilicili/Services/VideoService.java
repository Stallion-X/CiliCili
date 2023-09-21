package com.cilicili.Services;

import com.baomidou.mybatisplus.extension.service.IService;
import com.cilicili.Beans.VideoBean;

public interface VideoService extends IService<VideoBean> {
    Long getMaxNum();
    boolean recoverById(Long vid);
}
