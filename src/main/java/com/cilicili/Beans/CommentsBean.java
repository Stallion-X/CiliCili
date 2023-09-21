package com.cilicili.Beans;

import com.baomidou.mybatisplus.annotation.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

@Data
@TableName("comments")
@AllArgsConstructor
@NoArgsConstructor
public class CommentsBean implements Serializable {
    @TableId(type= IdType.AUTO)
    private Long comid;
    private Long comvid;
    private Long comown;
    private String comcontent;
    @TableField(fill= FieldFill.INSERT)
    private Date comtime;
    private int comlikes;
    @TableLogic
    @TableField(fill = FieldFill.INSERT)
    private Integer deleted;
}
