package com.cilicili.Utils;

import org.junit.Test;

public class ReplaceTest {
    @Test
    public void test() {
        System.out.println("\"她在最初就已背负苦难的十字\"".replaceAll("\"","&quot;"));
        System.out.println("\\爱莉/\\爱莉/\\爱莉/\\爱莉/\\爱莉/\\爱莉/\\爱莉/".replaceAll("\\\\","\\\\\\\\"));
        System.out.println("\"她在最初就已背负苦难的十字\"\\爱莉/\\爱莉/\\爱莉/\\爱莉/\\爱莉/\\爱莉/\\爱莉/ \n".replaceAll("\"","&quot;").replaceAll("\\\\","\\\\\\\\").replaceAll("\\r|\\n","").trim());
    }
}
