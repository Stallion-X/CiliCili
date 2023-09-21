package com.cilicili.Beans;

import com.baomidou.mybatisplus.annotation.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

@Data
@TableName("users")
@AllArgsConstructor
@NoArgsConstructor
public class UserBean implements Serializable {
    @TableId(type= IdType.AUTO)
    private Long uid;
    private String username;
    private String pwd;
    private String nickname;
    private String sex;
    private String email;
    private String phone;
    private String signature;
    private int coins;
    @TableField(fill= FieldFill.INSERT)
    private Date regtime;
    private Date birth;
    private int roles;
    private int islocked;
    private String avatar;
    @TableLogic
    @TableField(fill = FieldFill.INSERT)
    private Integer deleted;
}
