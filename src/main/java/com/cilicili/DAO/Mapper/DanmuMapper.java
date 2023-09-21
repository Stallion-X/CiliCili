package com.cilicili.DAO.Mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.cilicili.Beans.DanmuBean;
import org.apache.ibatis.annotations.CacheNamespace;

@CacheNamespace(implementation= org.mybatis.caches.redis.RedisCache.class,eviction=org.mybatis.caches.redis.RedisCache.class)
public interface DanmuMapper extends BaseMapper<DanmuBean> {
}
