package com.cilicili.Services.Impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cilicili.Beans.VideoBean;
import com.cilicili.DAO.Mapper.VideoMapper;
import com.cilicili.Services.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("videoService")
public class VideoServiceImpl extends ServiceImpl<VideoMapper, VideoBean> implements VideoService {
    @Autowired
    VideoMapper videoMapper;
    public Long getMaxNum() {
        return videoMapper.getMaxNum();
    }
    public boolean recoverById(Long vid) {
        VideoBean tempv = videoMapper.selectById(vid);
        tempv.setDeleted(0);
        if (videoMapper.updateById(tempv)==1) {
            return true;
        }
        else {
            return false;
        }
    }
}
