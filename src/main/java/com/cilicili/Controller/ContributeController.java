package com.cilicili.Controller;

import com.cilicili.Beans.VideoBean;
import com.cilicili.Services.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Objects;

@Controller
public class ContributeController {
    @Autowired
    VideoService videoService;
    @RequestMapping("/toUpload")
    public String toUpload() {
        return "videoUpload";
    }
    @PostMapping("/upload")
    @ResponseBody
    public String upload(@RequestParam MultipartFile video,
                         @RequestParam(required = false) MultipartFile image,
                         @RequestParam String title,
                         @RequestParam String info,
                         @RequestParam Long uid,
                         @RequestParam int vpart) throws IOException {
        Long maxnum = null;
        if (videoService.getMaxNum()!=null) {
            maxnum = videoService.getMaxNum();
        }
        else {
            maxnum = (long)0;
        }
        Long vid = maxnum+1;
        VideoBean newVideo = new VideoBean();
        newVideo.setVid(vid);
        newVideo.setVowner(uid);
        newVideo.setVtitle(title);
        newVideo.setVpart(vpart);
        newVideo.setVinfo(info);
        String vsuffix = video.getOriginalFilename().substring(video.getOriginalFilename().lastIndexOf("."));
        String isuffix = "";
        if (!image.isEmpty()) {
            isuffix = image.getOriginalFilename().substring(image.getOriginalFilename().lastIndexOf("."));
        }
        String vname = vid+vsuffix;
        String iname = vid+isuffix;
        newVideo.setVideofile(vname);
        if (!image.isEmpty()) {
            newVideo.setVimage(iname);
        }
        videoService.save(newVideo);
        String vpath = new File("./src/main/webapp/videos").getAbsolutePath();
        String ipath = new File("./src/main/webapp/views/img/cover").getAbsolutePath();
        try {
            video.transferTo(new File(vpath+"/"+vname));
            if (!image.isEmpty()) {
                image.transferTo(new File(ipath+"/"+iname));
            }
        }catch(IOException e) {
            return "error";
        }
        return "success";
    }

//    @RequestMapping("/toEditUpload")
//    public String toEditUpload(@RequestParam Long vid, Model model) {
    @RequestMapping("/toEditUpload/{vid}")
    public String toEditUpload(@PathVariable Long vid, Model model) {
        model.addAttribute("videoEntity",videoService.getById(vid));
        return "editUpload";
    }

    @RequestMapping("/editUploadInfo")
    @ResponseBody
    public String editUploadInfo(@RequestParam Long vid,
                                 @RequestParam String vtitle,
                                 @RequestParam String vinfo,
                                 @RequestParam int vpart) {
        VideoBean tempv = videoService.getById(vid);
        tempv.setVtitle(vtitle);
        tempv.setVinfo(vinfo);
        tempv.setVpart(vpart);
        if (videoService.updateById(tempv)) {
            return "success";
        }
        else {
            return "error";
        }
    }

    @RequestMapping("/editUploadFile")
    @ResponseBody
    public String editUploadFile(@RequestParam Long vid,
                                 @RequestParam(required = false) MultipartFile video,
                                 @RequestParam(required = false) MultipartFile image) {
        VideoBean tempv = videoService.getById(vid);
        String vsuffix = "";
        if (!video.isEmpty()) {
            vsuffix = video.getOriginalFilename().substring(video.getOriginalFilename().lastIndexOf("."));
        }
        String isuffix = "";
        if (!image.isEmpty()) {
            isuffix = image.getOriginalFilename().substring(image.getOriginalFilename().lastIndexOf("."));
        }
        String vname = vid+vsuffix;
        String iname = vid+isuffix;
        if (!video.isEmpty()) {
            tempv.setVideofile(vname);
        }
        if (!image.isEmpty()) {
            tempv.setVimage(iname);
        }
        videoService.updateById(tempv);
        String vpath = new File("./src/main/webapp/videos").getAbsolutePath();
        String ipath = new File("./src/main/webapp/views/img/cover").getAbsolutePath();
        try {
            if (!video.isEmpty()) {
                video.transferTo(new File(vpath+"/"+vname));
            }
            if (!image.isEmpty()) {
                image.transferTo(new File(ipath+"/"+iname));
            }
        }catch(IOException e) {
            return "error";
        }
        return "success";
    }

    @RequestMapping("/removeContribute")
    @ResponseBody
    public String removeContribute(@RequestParam Long vid) {
        if (videoService.removeById(vid)) {
            return "success";
        }
        else {
            return "error";
        }
    }

}
