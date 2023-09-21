package com.cilicili.Utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class GeneratePayNum {
    /**
     * 全局自增数
     */

    private static int count = 0;

    /**
     *     每毫秒秒最多生成多少订单（最好是像9999这种准备进位的值）
     */
    private static final int total = 99;

    /**
     * 格式化的时间字符串
     */
    private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

    /**
     * 获取当前时间年月日时分秒毫秒字符串
     * @return
     */
    private static String getNowDateStr() {
        return sdf.format(new Date());
    }

    /**
     * 记录上一次的时间，用来判断是否需要递增全局数
     */
    private static String now = null;

    /**
     *生成一个订单号
     */
    public static String generateOrder() {
        String dataStr = getNowDateStr();
        if (dataStr.equals(now)) {
            count++;// 自增
        } else {
            count = 1;
            now = dataStr;
        }
        // 算补位
        int countInteger = String.valueOf(total).length() - String.valueOf(count).length();
        //// 补字符串
        String bu = "";
        for (int i = 0; i < countInteger; i++) {
            bu += "0";
        }

        bu += String.valueOf(count);
        if (count >= total) {
            count = 0;
        }
        return dataStr + bu;
    }

}
