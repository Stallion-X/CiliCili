<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CiliCili-全宇宙最大的视频站-个人信息管理</title>
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
                    <form class="login-form" method="post" id="infomation1frm">
                        <label class="active">登录成功，欢迎用户 ${user.nickname}</label>
                        <input type="hidden" id="uid" value="${user.uid}" name="uid">
                        <div class="form-group">
                            <label for="nickname1" class="active">昵称</label>
                            <input type="text" id="nickname1" value="${user.nickname}" name="nickname">
                        </div>

                        <div class="form-group">
                            <label for="phone1" class="active">电话</label>
                            <input type="text" id="phone1" value="${user.phone}" name="phone">
                        </div>

                        <div class="form-group">
                            <label for="sex1" class="active">性别</label>
                            <select name="sex" id="sex1" class="email" name="sex" >
                                <c:choose>
                                    <c:when test="${user.sex=='男'}">
                                        <option selected>男</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option>男</option>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${user.sex=='女'}">
                                        <option selected>女</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option>女</option>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${user.sex=='保密'}">
                                        <option selected>保密</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option>保密</option>
                                    </c:otherwise>
                                </c:choose>
                            </select>
                            <span class="error"></span>
                        </div>

                        <div class="form-group">
                            <label for="birth1" class="active">生日</label>
                            <input type="date" id="birth1" name="birth" value="<fmt:formatDate pattern='yyyy-MM-dd' type='date' value='${user.birth}'/>">
                            <span class="error"></span>
                        </div>

                        <div class="form-group">
                            <label for="email" class="active">邮箱</label>
                            <input type="text" id="email" value="${user.email}" class="email" name="email">
                            <span class="error"></span>
                        </div>

                        <div class="form-group">
                            <label for="avatar" class="active">头像</label>
                            <input type="file" id="avatar" name="avatar">
                            <img src="/views/img/avatar/${user.avatar}" height="25px" width="25px">
                        </div>

                        <div class="form-group">
                            <label for="signature" class="active">个性签名</label>
                            <input type="text" id="signature" value="${user.signature}" name="signature">
                            <span class="error"></span>
                        </div>

                        <div class="CTA">
                            <input type="button" value="修改信息" id="information-1">
                            <a href="#" class="switch">修改密码</a>
                        </div>
                    </form>
                </div><!-- End Login Form -->


                <!-- Signup Form -->
                <div class="signup form-peice switched">
                    <form class="signup-form" method="post" id="frm">
                        <input type="hidden" name="uid" value="${user.uid}">
                        <input type="hidden" id="oldpwd" value="${user.pwd}">
                        <div class="form-group">
                            <label for="pwd">旧密码</label>
                            <input type="password" name="pwd" value="" class="pass" id="pwd">
                            <span class="error"></span>
                        </div>

                        <div class="form-group">
                            <label for="password">新密码</label>
                            <input type="password" name="pwd1" value="" id="password" class="pass">
                            <span class="error"></span>
                        </div>

                        <div class="form-group">
                            <label for="passwordCon">再次输入密码</label>
                            <input type="password" name="pwd2" value="" id="passwordCon" class="passConfirm">
                            <span class="error"></span>
                        </div>

                        <div class="CTA">
                            <input type="button" value="修改密码" id="information-2">
                            <a href="#" class="switch">修改信息</a>
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
