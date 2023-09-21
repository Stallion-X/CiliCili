package com.cilicili.Controller;

import com.cilicili.Beans.CollectionBean;
import com.cilicili.Services.CollectionService;
import com.cilicili.Services.Impl.CollectionServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
public class CollectionController {
    @Autowired
    CollectionServiceImpl collectionService;
    @RequestMapping("/toCollection")
    public String toCollection(@RequestParam Long uid, Model model, @RequestParam int access){
        model.addAttribute("list",collectionService.getColInfos(uid));
        model.addAttribute("access",access);
        return "collection";
    }
    @RequestMapping("/getRichCol")
    @ResponseBody
    public List<CollectionBean> getRichCol(@RequestParam Long uid) {
        List<CollectionBean> col= collectionService.getColInfos(uid);
        System.out.println("ok");
        if(col.size()>0){
            return col;
        }else {
            return null;
        }
    }
    @RequestMapping("/removeCollection")
    @ResponseBody
    public String removeCollection(@RequestParam("vid") Long vid) {
        HashMap<String, Object> columnMap = new HashMap<>();
        columnMap.put("colv",vid);
        if (collectionService.removeByMap(columnMap)) {
            return "success";
        }
        else {
            return "error";
        }
    }
}
