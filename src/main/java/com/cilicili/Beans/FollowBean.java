package com.cilicili.Beans;

import com.baomidou.mybatisplus.annotation.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

@Data
@TableName("follow")
@AllArgsConstructor
@NoArgsConstructor
public class FollowBean implements Serializable {
    @TableId(type= IdType.AUTO)
    private Long fid;
    private Long follower;
    private Long followed;
    @TableField(fill= FieldFill.INSERT)
    private Date followtime;
    @TableLogic
    @TableField(fill = FieldFill.INSERT)
    private int deleted;
}
