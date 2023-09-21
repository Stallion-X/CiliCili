package com.cilicili.DAO.Mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.cilicili.Beans.VideoBean;
import org.apache.ibatis.annotations.CacheNamespace;
import org.apache.ibatis.annotations.Mapper;

@Mapper
@CacheNamespace(implementation= org.mybatis.caches.redis.RedisCache.class,eviction=org.mybatis.caches.redis.RedisCache.class)
public interface VideoMapper extends BaseMapper<VideoBean>  {
    Long getMaxNum();
}
