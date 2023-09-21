<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CiliCili-全宇宙最大的视频站-登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel='stylesheet' href='/views/css/bootstrap.min.css'>
    <link rel="shortcut icon" href="/views/img/favicon.ico">
    <script src="https://unpkg.com/vue@2.6.14/dist/vue.js"></script>
    <!-- 引入样式 -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <!-- 引入组件库 -->
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
    <style>
        @import url("/views/css/logincss.css");
    </style>

    <script>
        window.console = window.console || function(t) {};
    </script>
    <script>
        if (document.location.search.match(/type=embed/gi)) {
            window.parent.postMessage("resize", "*");
        }
    </script>
</head>
<body translate="no" >
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
                    <p>你现在是我们的会员了！</p>
                    <a href="#" class="profile">点击登录</a>
                </div>
            </div>


            <!-- Form Box -->
            <div class="col-sm-6 form">

                <!-- Login Form -->
                <div class="login form-peice">
                    <form class="login-form" action="/login" method="post">
                        <div class="form-group">
                            <label for="loginemail">用户名</label>
                            <input type="text" name="username" id="loginemail" required>
                        </div>

                        <div class="form-group">
                            <label for="loginPassword">密码</label>
                            <input type="password" name="password" id="loginPassword" required>
                        </div>

                        <div class="form-group">
                            <label for="loginPassword">验证码</label>
                            <input type="text" name="verify" required>
                            <img alt="验证码" onclick="this.src=this.src+'?d='+Math.random();" src="/imageCode" />
                        </div>

                        <div class="CTA">
                            <input type="submit" value="登录">
                            <a href="#" class="switch">新用户</a>
                            <a href="/toAdminLogin" id="toAdmin">管理员登录</a>
                        </div>
                    </form>
                </div><!-- End Login Form -->


                <!-- Signup Form -->
                <div class="signup form-peice switched">
                    <form class="signup-form" action="/signup" method="post">

                        <div class="form-group">
                            <label for="name">用户名</label>
                            <input type="text" name="username" id="name" class="name">
                            <span class="error"></span>
                        </div>

                        <div class="form-group">
                            <label for="password">密码</label>
                            <input type="password" name="password" id="password" class="pass">
                            <span class="error"></span>
                        </div>

                        <div class="form-group">
                            <label for="passwordCon">再次输入密码</label>
                            <input type="password" name="passwordCon" id="passwordCon" class="passConfirm">
                            <span class="error"></span>
                        </div>

                        <div class="form-group">
                            <label for="name">昵称</label>
                            <input type="text" name="nickname" id="nickname" class="name nick">
                            <span class="error"></span>
                        </div>

                        <div class="form-group">
                            <label for="sex" class="active">性别</label>
                            <select name="sex" id="sex" class="email">
                                <option>男</option>
                                <option>女</option>
                                <option>保密</option>
                            </select>
                            <span class="error"></span>
                        </div>

                        <div class="CTA">
                            <input type="submit" value="现在注册" id="submit">
                            <a href="#" class="switch">登录</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</div>
<script src='/views/js/jquery-3.6.0.min.js'></script>
<script src='/views/js/axios.min.js'></script>
<script id="rendered-js" src="/views/js/login.js"></script>
<c:if test="${returninfo=='密码或验证码错误'}">
    <script>
        let vm = new Vue({
            el:"#app",
            mounted() {
                this.$alert('密码或验证码错误！', '提示',{
                    confirmButtonText: '确定',
                    callback: action => {
                    }
                });
            }
        });
    </script>
</c:if>
<c:if test="${returninfo=='找不到账号'}">
    <script>
        let vm = new Vue({
            el:"#app",
            mounted() {
                this.$alert('找不到账号！', '提示',{
                    confirmButtonText: '确定',
                    callback: action => {
                    }
                });
            }
        });
    </script>
</c:if>
</body>
</html>