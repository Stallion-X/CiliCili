package com.cilicili.Beans;

import com.baomidou.mybatisplus.annotation.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

@Data
@TableName("collection")
@AllArgsConstructor
@NoArgsConstructor
public class CollectionBean implements Serializable {
    @TableId(type= IdType.AUTO)
    private Long colid;
    private Long colu;
    private Long colv;
    @TableField(fill= FieldFill.INSERT)
    private Date coltime;
    @TableLogic
    @TableField(fill = FieldFill.INSERT)
    private Integer deleted;

    @TableField(exist = false)
    private String nickname;
    @TableField(exist = false)
    private String vtitle;
    @TableField(exist = false)
    private String vimage;
    @TableField(exist = false)
    private String vinfo;
}
