package com.cilicili.Beans;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class MyDataObjectHandler implements MetaObjectHandler {
    @Override
    public void insertFill(MetaObject metaObject) {
        this.setFieldValByName("regtime",new Date(),metaObject);
        this.setFieldValByName("comtime",new Date(),metaObject);
        this.setFieldValByName("uptime",new Date(),metaObject);
        this.setFieldValByName("coltime",new Date(),metaObject);
        this.setFieldValByName("followtime",new Date(),metaObject);
        this.setFieldValByName("deleted",0,metaObject);
    }

    @Override
    public void updateFill(MetaObject metaObject) {

    }
}
