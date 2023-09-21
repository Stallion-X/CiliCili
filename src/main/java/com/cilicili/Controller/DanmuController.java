package com.cilicili.Controller;

import com.cilicili.Beans.DanmuBean;
import com.cilicili.Beans.JsonDanmu;
import com.cilicili.Services.Impl.DanmuServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/v3")
@CrossOrigin
public class DanmuController {
    @Autowired
    DanmuServiceImpl danmuService;
    @GetMapping
    public String getDanmu(@RequestParam(required = false,value = "id") String id){
        int vid;
        try {
            vid = Integer.parseInt(id.split("-")[0]);
        } catch (Exception e) {
            return "{\"code\":0 ,\"data\":[] }";
        }
        HashMap<String, Object> columnMap = new HashMap<>();
        columnMap.put("dvid",vid);
        List<DanmuBean> danmuList=danmuService.listByMap(columnMap);
        if (danmuList.size()>0) {
//            Map<String, Object> map = new HashMap<>();
//            map.put("code",0);
            String pre="{\"code\":0 ,\"data\":";
            StringBuilder last= new StringBuilder("[");
            //时间 位置 颜色 作者 内容
            int i=0;
            do{
                if(i==0) {
                    last.append("[").append(danmuList.get(i).getDtime()).append(", ").append(danmuList.get(i).getDposition()).append(", ").append(danmuList.get(i).getColor()).append(", \"用户\", \"").append(danmuList.get(i).getDcontent()).append("\"]");
                }else {
                    last.append(", [").append(danmuList.get(i).getDtime()).append(", ").append(danmuList.get(i).getDposition()).append(", ").append(danmuList.get(i).getColor()).append(", \"用户\", \"").append(danmuList.get(i).getDcontent()).append("\"]");
                }
                i++;
            }while (i<danmuList.size());
            last.append("]}");
            return pre+last;
        }
        else {
            return "{\"code\":0 ,\"data\":[] }";
        }
    }

    @PostMapping
    public Map<String,Object> insertDanmu(@RequestBody JsonDanmu jsonDanmu) {
        System.out.println("接收到请求");

        System.out.println(jsonDanmu.getText());
        System.out.println(jsonDanmu.getColor());
        System.out.println(jsonDanmu.getTime());
        DanmuBean danmu=new DanmuBean();
        danmu.setDsize(0);
        danmu.setDposition(jsonDanmu.getType());
        danmu.setDtime(jsonDanmu.getTime());
        danmu.setColor(jsonDanmu.getColor());
        danmu.setDvid(Long.parseLong(jsonDanmu.getId().split("-")[0]));
        danmu.setDuid(Long.parseLong(jsonDanmu.getId().split("-")[1]));
        danmu.setDcontent(jsonDanmu.getText());
        Map<String, Object> map = new HashMap<>();

        if(danmuService.save(danmu)){
            map.put("code",0);
            return map;
        }
        map.put("code",1);
        return map;
    }
}
