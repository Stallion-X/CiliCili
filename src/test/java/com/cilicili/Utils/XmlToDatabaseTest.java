package com.cilicili.Utils;

import com.cilicili.Beans.DanmuBean;
import com.cilicili.Main;
import com.cilicili.Services.Impl.DanmuServiceImpl;
import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = Main.class)
public class XmlToDatabaseTest {
    @Autowired
    DanmuServiceImpl danmuService;
    private final long uid = 1;
    private final long vid = 1;

    @Test
    public void test() throws IOException {
        // 解析books.xml文件
        // 创建SAXReader的对象reader
        SAXReader reader = new SAXReader();
        //new File("1.xml").createNewFile();
        try {
            // 通过reader对象的read方法加载books.xml文件,获取docuemnt对象。
            Document document = reader.read(new File("1.xml"));
            // 通过document对象获取根节点bookstore
            Element bookStore = document.getRootElement();
            // 通过element对象的elementIterator方法获取迭代器
            Iterator it = bookStore.elementIterator();
            // 遍历迭代器，获取根节点中的信息（书籍）
            while(it.hasNext()){
                Element e = (Element)it.next();
                Attribute attr = e.attribute("p");
                if (attr != null) {
                    System.out.println("==========开始遍历某一条弹幕==========");
                    System.out.println("属性："+attr.getName()+"---值："+attr.getValue());
                    String target = attr.getValue();
                    System.out.println("出现时间："+target.split(",")[0]);
                    System.out.println("位置："+target.split(",")[1]);
                    System.out.println("大小："+target.split(",")[2]);
                    System.out.println("颜色："+target.split(",")[3]);
                    System.out.println("文字："+e.getText());

                    DanmuBean danmu=new DanmuBean();
                    danmu.setDsize(0);
                    danmu.setDposition(parseTypeToPos(Integer.parseInt(target.split(",")[1])));
                    danmu.setDtime(Float.parseFloat(target.split(",")[0]));
                    String tempColor = target.split(",")[3];
                    if (!tempColor.equals("undefined")) {
                        danmu.setColor(Integer.parseInt(tempColor));
                    }
                    else {
                        danmu.setColor(16777215);
                    }
                    danmu.setDvid(vid);
                    danmu.setDuid(uid);
                    danmu.setDcontent(e.getText().replaceAll("\"","&quot;").replaceAll("\\\\","\\\\\\\\").replaceAll("\\r|\\n","").trim());
                    //danmuService.save(danmu);
                    System.out.println("==========结束遍历某一条弹幕==========");
                }
                Iterator itt = e.elementIterator();
                while(itt.hasNext()){
                    Element node = (Element)itt.next();
                    System.out.println("节点：" + node.getName() + "---值：" + node.getStringValue());
                }
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    private int parseTypeToPos(int type) {
        if (type == 1 || type == 2 || type == 3) {
            //滚动
            return 0;
        }
        if (type == 4) {
            //底部
            return 2;
        }
        if (type == 5) {
            //顶部
            return 1;
        }
        return 0;
    }
}
