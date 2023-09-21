package com.cilicili.DAO.Mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.cilicili.Beans.CommentsBean;
import org.apache.ibatis.annotations.CacheNamespace;

@CacheNamespace(implementation= org.mybatis.caches.redis.RedisCache.class,eviction=org.mybatis.caches.redis.RedisCache.class)
public interface CommentsMapper extends BaseMapper<CommentsBean> {
}
