<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CiliCili-全宇宙最大的视频站-视频投稿管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel='stylesheet' href='/views/css/bootstrap.min.css'>
    <link rel="shortcut icon" href="/views/img/favicon.ico">
    <script src="https://unpkg.com/vue@2.6.14/dist/vue.js"></script>
    <!-- 引入样式 -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <!-- 引入组件库 -->
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
    <style>
        @import url("/views/css/editcss.css");
    </style>

    <script>
        window.console = window.console || function(t) {};
    </script>
    <script>
        if (document.location.search.match(/type=embed/gi)) {
            window.parent.postMessage("resize", "*");
        }
    </script>
    <script src='/views/js/jquery-3.6.0.min.js'></script>
    <script src='/views/js/axios.min.js'></script>
</head>

<body>
<div id="header">
    <div id="clouds">
        <div class="cloud-1" data-speed="35000"></div>
        <div class="cloud-2" data-speed="45000" data-delay="15000"></div>
        <div class="cloud-3" data-speed="40000"></div>
        <div class="cloud-4" data-speed="38000" data-delay="20000"></div>
    </div>
</div><!-- / #header -->

<div class="container">
    <section id="formHolder">

        <div class="row">

            <!-- Brand Box -->
            <div class="col-sm-6 brand">
                <a href="#" class="logo">CiLi <span>.</span></a>

                <div class="heading">
                    <h2>稀里哗啦</h2>
                    <p>视频界里的美食家</p>
                </div>

                <div class="success-msg">
                    <p>修改成功！</p>
                    <a href="#" class="profile">点击返回</a>
                </div>
            </div>


            <!-- Form Box -->
            <div class="col-sm-6 form">

                <!-- Login Form -->
                <div class="login form-peice">
                    <form class="login-form" method="post" id="frmvinfo">
                        <label class="active">视频vid： ${videoEntity.vid}</label>
                        <input type="hidden" name="vid" id="vid" value="${videoEntity.vid}">
                        <div class="form-group">
                            <label for="vtitle" class="active">视频标题</label>
                            <input type="text" name="vtitle" id="vtitle" value="${videoEntity.vtitle}">
                        </div>

                        <div class="form-group">
                            <label for="vinfo" class="active">视频详情</label>
                            <textarea type="text" name="vinfo" id="vinfo">${videoEntity.vinfo}</textarea>
                        </div>

                        <div class="form-group">
                            <label for="vpart" class="active">分区</label>
                            <select name="vpart" id="vpart" class="email" >
                                <c:choose>
                                    <c:when test="${videoEntity.vpart==1}">
                                        <option selected value="1">动画</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="1">动画</option>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${videoEntity.vpart==2}">
                                        <option selected value="2">番剧</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="2">番剧</option>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${videoEntity.vpart==3}">
                                        <option selected value="3">音乐</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="3">音乐</option>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${videoEntity.vpart==4}">
                                        <option selected value="4">舞蹈</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="4">舞蹈</option>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${videoEntity.vpart==5}">
                                        <option selected value="5">游戏</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="5">游戏</option>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${videoEntity.vpart==6}">
                                        <option selected value="6">科技</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="6">科技</option>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${videoEntity.vpart==7}">
                                        <option selected value="7">生活</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="7">生活</option>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${videoEntity.vpart==8}">
                                        <option selected value="8">鬼畜</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="8">鬼畜</option>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${videoEntity.vpart==9}">
                                        <option selected value="9">时尚</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="9">时尚</option>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${videoEntity.vpart==10}">
                                        <option selected value="10">娱乐</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="10">娱乐</option>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${videoEntity.vpart==11}">
                                        <option selected value="11">影视</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="11">影视</option>
                                    </c:otherwise>
                                </c:choose>
                            </select>
                            <span class="error"></span>
                        </div>

                        <div class="CTA">
                            <input type="button" value="修改投稿信息" id="vinfobtn">
                            <a href="#" class="switch">修改投稿文件</a>
                        </div>
                    </form>
                </div><!-- End Login Form -->


                <!-- Signup Form -->
                <div class="signup form-peice switched">
                    <form class="signup-form" method="post" id="frmfile">
                        <input type="hidden" name="vid" value="${videoEntity.vid}">
                        <div class="form-group">
                            <label for="videofile" class="active">更新视频</label>
                            <input type="file" name="video" value="" id="videofile">
                            <span class="error"></span>
                        </div>

                        <div class="form-group">
                            <label for="imgfile" class="active">更新封面</label>
                            <img src="/views/img/cover/${videoEntity.vimage}" width="160px" height="100px">
                            <input type="file" name="image" value="" id="imgfile">
                            <span class="error"></span>
                        </div>

                        <div class="CTA">
                            <input type="button" value="修改投稿文件" id="vfilebtn">
                            <a href="#" class="switch">修改投稿信息</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</div>

<script id="rendered-js" src="/views/js/login.js"></script>

</body>
</html>
