package com.cilicili.Controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cilicili.Beans.CommentsBean;
import com.cilicili.Services.Impl.CommentsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;

@RestController
public class CommentsController {
    @Autowired
    CommentsServiceImpl commentsService;
    @RequestMapping("/insertReply")
    public List<CommentsBean> reply(@RequestParam Long vid, @RequestParam String message, @RequestParam Long uid) {
        System.out.println(vid+" "+message+" "+uid);
        CommentsBean com = new CommentsBean();
        com.setComvid(vid);
        com.setComcontent(message);
        com.setComown(uid);
        commentsService.save(com);
        HashMap<String, Object> columnMap = new HashMap<>();
        columnMap.put("comvid",vid);
        return commentsService.listByMap(columnMap);
    }

    @RequestMapping("/pageReply")
    public List<CommentsBean> replyPage(@RequestParam Long vid,@RequestParam int pageNum,@RequestParam int pageSize) {
        QueryWrapper<CommentsBean> wrapper = new QueryWrapper<>();
        wrapper.eq("comvid",vid);
        Page<CommentsBean> page = commentsService.page(new Page<>(pageNum, pageSize),wrapper);
        System.out.println(page.getRecords());
        return page.getRecords();
    }
}
