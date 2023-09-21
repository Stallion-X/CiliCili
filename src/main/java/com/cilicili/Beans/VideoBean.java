package com.cilicili.Beans;

import com.baomidou.mybatisplus.annotation.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

@Data
@TableName("video")
@AllArgsConstructor
@NoArgsConstructor
public class VideoBean implements Serializable {
    @TableId(type= IdType.AUTO)
    private Long vid;
    private String vtitle;
    private int vpart;
    private String vinfo;
    private Long vowner;
    @TableField(fill= FieldFill.INSERT)
    private Date uptime;
    private Long vviews;
    private String videofile;
    private int vlikes;
    private int vcoins;
    private int vcolnum;
    private String vimage;
    @TableLogic
    @TableField(fill = FieldFill.INSERT)
    private Integer deleted;
    private Integer islocked;
}
