package com.cilicili.DAO.Mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.cilicili.Beans.CollectionBean;
import org.apache.ibatis.annotations.CacheNamespace;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
@CacheNamespace(implementation= org.mybatis.caches.redis.RedisCache.class,eviction=org.mybatis.caches.redis.RedisCache.class)
public interface CollectionMapper extends BaseMapper<CollectionBean> {
    List<CollectionBean> getColInfos(@Param("colu") Long colu);
}
