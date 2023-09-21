package com.cilicili.Beans;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
@Data
@TableName("danmu")
@AllArgsConstructor
@NoArgsConstructor
public class DanmuBean implements Serializable {
    @TableId(type= IdType.AUTO)
    private Long did;
    private Long dvid;
    private Long duid;
    private String dcontent;
    private Integer dsize;
    private Integer color;
    private Float dtime;
    private Integer dposition;
}
