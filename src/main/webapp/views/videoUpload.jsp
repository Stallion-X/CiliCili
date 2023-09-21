<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>CiliCili-视频投稿</title>
    <script src="https://unpkg.com/vue@2.6.14/dist/vue.js"></script>
    <!-- 引入样式 -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <!-- 引入组件库 -->
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
    <script src='/views/js/jquery-3.6.0.min.js'></script>
    <link rel="stylesheet" href="/views/css/upLoad.css"/>
    <link rel="shortcut icon" href="/views/img/favicon.ico">
</head>
<body>
<div id="app"></div>
<div id='stars'></div>
<div id='stars2'></div>
<div id='stars3'></div>
<div class="container">
    <video autoplay muted loop plays-inline class="back-video">
        <source src="/videos/video.mp4" type="video/mp4">
    </video>
    <nav>
        <a href="#"><img src="/views/img/logo.ico" class="logo"></a>
        <ul>
            <li><a href="">首页</a></li>
            <li><a href="/toUser?uid=${cookie.uid.value}">个人中心</a></li>
            <li><a href="">联系我们</a></li>
        </ul>
    </nav>

    <div class="login-box">
        <div class="content">
            <h1>视 频 投 稿</h1><br>
        </div>
        <form id="upload_form" class="signin-form">
            <input type="hidden" name="uid" value="${cookie.uid.value}"/>
            <div class="user-box">
                <!--<div><label for="image_file" style="color: wheat;">请输入视频标题</label></div>-->
                <input type="text" name="title" id="biaoti" required=""/>
                <label>请输入视频标题</label>
            </div>

            <div class="user-box">
                <textarea type = "text" name="info" id="miaoshu" required=""></textarea>
                <label>请输入视频描述</label>
            </div>

            <div class="user-box">
                <input type="file" name="video" id="video"/>
                <a id="vid" onclick="clickFile()" style="cursor: pointer">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    上传视频
                </a>
                <label>请选择上传视频</label>
            </div>

            <br>
            <div class="user-box">
                <input type="file" name="image" id="img"/>
                <a id="image" onclick="clickImg()" style="cursor: pointer">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    上传封面
                </a>
                <label>请选择视频封面</label>
            </div>
            <br>

            <div class="user-box">
                <div class="select-style">
                    <select  name="vpart" class="control-styling control-focus" style="cursor: pointer">
                        <option name="vpart" class = "op" value="" selected disabled>请选择投放区域</option>
                        <option name="vpart" class = "op" value="1">动画</option>
                        <option name="vpart" class = "op" value="2">番剧</option>
                        <option name="vpart" class = "op" value="3">音乐</option>
                        <option name="vpart" class = "op" value="4">舞蹈</option>
                        <option name="vpart" class = "op" value="5">游戏</option>
                        <option name="vpart" class = "op" value="6">科技</option>
                        <option name="vpart" class = "op" value="7">生活</option>
                        <option name="vpart" class = "op" value="8">鬼畜</option>
                        <option name="vpart" class = "op" value="9">时尚</option>
                        <option name="vpart" class = "op" value="10">娱乐</option>
                        <option name="vpart" class = "op" value="11">影视</option>
                    </select>
                </div>
            </div>
            <!--
            <div class="form-input">
                <input type="button" value="立即投稿" id="tougao"/>
            </div>-->
            <a id = "tougao" style="cursor: pointer">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                立即投稿
            </a>
        </form>
    </div>
    <div style="display: none;" id="daxiaobuneng"><b style="color: red;">总大小不能超过16g</b></div>
</div>
<script type="text/javascript">
    $("#fanhui").click(function () {
        location.href = "/";
    })

</script>

<script>
    $("#tougao").click(function () {
        //判断视频
        var video = $("#video").val();
        if (video == "") {
            let vm = new Vue({
                el:"#app",
                mounted() {
                    this.$alert('请上传投稿的视频！', '提醒',{
                        confirmButtonText: '确定',
                        callback: action => {
                        }
                    });
                }
            });
            return false;
        } else {
            if (!/\.(mp4)$/.test(video)) {
                let vm = new Vue({
                    el:"#app",
                    mounted() {
                        this.$alert('视频格式必须为.MP4格式！', '提醒',{
                            confirmButtonText: '确定',
                            callback: action => {
                            }
                        });
                    }
                });
                return false;
            }
            //判断图片
            var img = $("#img").val();
            if (img != "") {
                if (!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(img)) {
                    let vm = new Vue({
                        el:"#app",
                        mounted() {
                            this.$alert('图片类型必须是.gif,jpeg,jpg,png中的一种！', '提醒',{
                                confirmButtonText: '确定',
                                callback: action => {
                                }
                            });
                        }
                    });
                    return false;
                }
            }
            //开始判断输入的内容
            var biaoti = $("#ibiaoti").val();
            var miaoshu = $("#miaoshu").val();
            if (biaoti == "" || miaoshu == "" || miaoshu == "null" || biaoti == "null") {
                let vm = new Vue({
                    el:"#app",
                    mounted() {
                        this.$alert('请正确输入标题和描述！', '提醒',{
                            confirmButtonText: '确定',
                            callback: action => {
                            }
                        });
                    }
                });
                return false;
            }
            //判断文件总大小 不能超16g
            //用户上传的视频
            var addImags = $("#video").prop('files');
            var fileSize = 0;
            for (var i = 0; i < addImags.length; i++) {
                fileSize = $(addImags)[i].size;
            }
            //用户上传的图片
            var addImags2 = $("#img").prop('files');
            var fileSize2 = 0;
            for (var i = 0; i < addImags2.length; i++) {
                fileSize2 = $(addImags2)[i].size;
            }

            var zonggongdaxiao = fileSize + fileSize2;
            var Maxzong = 17179869184;
            if (zonggongdaxiao > Maxzong) {
                $("#daxiaobuneng").show();
                let vm = new Vue({
                    el:"#app",
                    mounted() {
                        this.$alert('对不起，文件过大，无法上传！', '提醒',{
                            confirmButtonText: '确定',
                            callback: action => {
                            }
                        });
                    }
                });
                return false;
            }

        }
        //判断结束
        $("#tougao").attr('disabled', true); //将button变成不可点击
        var formData = new FormData($("#upload_form")[0]);
        $.ajax({
            url: '/upload',
            type: 'POST',
            data: formData,
            async: true,  //设置为同步
            cache: false,
            contentType: false,
            processData: false,
            success: function () {
                let vm = new Vue({
                    el:"#app",
                    mounted() {
                        this.$alert('投稿成功！', '恭喜',{
                            confirmButtonText: '确定',
                            callback: action => {
                                location.reload();
                            }
                        });
                    }
                });
                //$("#tougao").attr('disabled',false); //将button变成可点击
            },
            error: function () {
                let vm = new Vue({
                    el:"#app",
                    mounted() {
                        this.$alert('投稿失败！', '错误',{
                            confirmButtonText: '确定',
                            callback: action => {
                                location.reload();
                            }
                        });
                    }
                });
            }
        });
        $(function () {
            //iCount获取setInterval句柄
            var iCount = setInterval(GetBack, 100);

            function GetBack() {
                var html = "";
                $.post("baifenbiAJAX", function (r) {
                    //把json字符串转换为json对象
                    var obj = eval("(" + r + ")");
                    //alert(obj.test);
                    var a = obj.baifenbi;
                    a += 1;
                    /* <div id="none" style="width: 100%;height: 60px;background-color: blue;">
                 <h1>啊开始的空间爱仕达空间</h1>
                 </div> */
                    //得到DIV
                    html += "<div id='none2' style='width: " + a + "%;height: 60px;background-color: blue;'>";
                    html += "<h1>" + a + "%</h1>";
                    html += "</div>";
                    //alert(html);
                    $("#none").html(html);
                    html = "";
                    //如果标记不为 0  表示上传完成
                    if (obj.tag != 0) {
                        //alert("进入");
                        //清除setInterval
                        clearInterval(iCount);
                    }
                });
            }
        });
    });
    function clickFile(){
        const input = document.querySelector('#video')
        input.click()
    }
    function clickImg(){
        const input = document.querySelector('#img')
        input.click()
    }

</script>
<c:choose>
    <c:when test="${cookie.uid.value==''||cookie.uid.value==null}">
        <script>
            let vm = new Vue({
                el:"#app",
                mounted() {
                    this.$alert('未登录，请先登录！', '提示',{
                        confirmButtonText: '确定',
                        callback: action => {
                            location.href = "/toLogin";
                        }
                    });
                }
            });
        </script>
    </c:when>
    <c:otherwise>
    </c:otherwise>
</c:choose>
</body>
</html>