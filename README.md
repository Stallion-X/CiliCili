<https://jvav.my.to:17310/>
# CiliCili
A basic PUGC video website that imitates bilibili.

Coded as a Spring exercise project.

一个参照bilibili设计的，实现了PUGC视频网站基本功能的项目。

后端框架：SpringBoot+SpringMVC+Mybatis

前端：Vue/jQuery+JSP混合

在视频站基础功能之上加入了Redis +Mybatis二级缓存，接入支付宝，实现了弹幕后端，支持将B站弹幕转换并持久化等。

# Plans
|  功能   | 是否完成  |
|  :----  | :----:  |
| 用户个人界面展示  | ✅ |
| 修改投稿信息  | ✅ |
| 收藏夹用多表查询  | ✅ |
| 密码加密  | ✅ |
| 登录验证码  | ✅ |
| Redis缓存  | ✅ |
| 逻辑删除 **改数据库，用mp插件**  | ✅ |
| 投稿审核 **加数据库或加video标识符**  | ✅ |
| 弹幕 **重点**  | ✅ |
| 支付宝api  | ✅ |
| 点击提示全改elementui美化  | ✅ |
| 支付回调  | ✅ |
| 排行榜和热度推荐  | ✅ |
| 关注和粉丝 **加数据库**  | ✅ |
| 搜索引擎（Elasticsearch等）  | ➖ |
| 视频喜好推送算法  | ➖ |
| 历史记录 **加数据库**  | ➖ |
| B站弹幕持久化  | ✅ |
| 充会员时间限制  | ➖ |
| 手机验证码  | ❌ |
| 回复 简单消息推送  | ➖ |
| 重构登录校验机制为JWT单点登录  | ➖ |
| 支付异步回调  | ➖ |
| 消息推送（MQ队列）  | ➖ |
| 完整的后台管理  | ➖ |
| 即时私信聊天(ws) **加数据库**  | ➖ |
| 放映厅  | ➖ |
| 推流直播  | ➖ |
| 切换清晰度  | ➖ |
| 分片上传，断点续传  | ➖ |
| 视频切片，防盗链，m3u8等  | ➖ |
| 前后端分离重构  | ➖ |
| 分库分表中间件  | ➖ |
| 采用OSS图床、CDN等  | ➖ |
