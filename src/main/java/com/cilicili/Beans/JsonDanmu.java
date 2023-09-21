package com.cilicili.Beans;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class JsonDanmu {
    private String author;
    private String id ;
    private String text;
    private int color;
    private int type;
    private float time;
}
