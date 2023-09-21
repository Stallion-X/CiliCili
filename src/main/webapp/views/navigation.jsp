<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style type="text/css">
    @import url("/views/css/css.css");
</style>
<body>
<head>

    <meta charset="UTF-8">
    <link rel="shortcut icon" href="/views/img/favicon.ico">
    <link rel="apple-touch-icon" type="image/png" href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png" />
    <meta name="apple-mobile-web-app-title" content="CodePen">
    <link rel="mask-icon" type="image/x-icon" href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111" />
<%--    <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>--%>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/bulma/0.9.1/css/bulma.min.css'>
    <script src='/views/js/jquery-3.6.0.min.js'></script>

    <style>
        .navbar-item.is-mega {
            position: static;
        }
        .navbar-item.is-mega .is-mega-menu-title {
            margin-bottom: 0;
            padding: 0.375rem 1rem;
        }
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

<body style="text-align:center;">
<nav class="navbar " >
    <div class="navbar-brand" >
        <a class="navbar-item" >
            <!-- 图片 -->
            <img src="/views/img/logo.ico" alt="" width="60" height="40">
        </a>

        <a class="navbar-item is-hidden-desktop" href="#" target="_blank">
      <span class="icon" style="color: #333;">
        <i class="fa fa-github"></i>
      </span>
        </a>

        <a class="navbar-item is-hidden-desktop" href="" target="_blank">
      <span class="icon" style="color: #55acee;">
        <i class="fa fa-twitter"></i>
      </span>
        </a>

        <div class="navbar-burger burger" data-target="navMenubd-example">
            <span></span>
            <span></span>
            <span></span>
        </div>
    </div>
    <div id="navMenubd-example" class="navbar-menu">
        <div class="navbar-start">
            <div class="navbar-item has-dropdown is-hoverable">
                <a class="navbar-item  is-active" style="cursor: pointer" target="myframe" onclick="home1()">
                    📺︎主页
                </a>
            </div>
            <div class="navbar-item has-dropdown is-hoverable">
                <a class="navbar-item  is-active" style="cursor: pointer;" target="myframe" onclick="profile()">
                    🧑‍个人空间
                </a>
            </div>
            <div class="navbar-item has-dropdown is-hoverable">
                <a class="navbar-item  is-active" style="cursor: pointer;" target="myframe" onclick="pay1()">
                    💴充值会员
                </a>
            </div>
            <script>
                function pay1() {
                    window.parent.frames.location.href="/toPay";
                }
                function home1() {
                    window.parent.frames.location.href="/";
                }
                function profile() {
                    <c:if test="${cookie.uid.value!=null}">
                    window.parent.frames.location.href="/toUser?uid=${cookie.uid.value}";
                    </c:if>
                    <c:if test="${cookie.uid.value==null}">
                    window.parent.frames.location.href="/toLogin";
                    </c:if>
                }
            </script>
        </div>
        <div class="navbar-end">
            <div class="navbar-item">
                <div class="header-top__user">
                    <div class="login-box">
                        <c:choose>
                            <c:when test="${cookie.username.value!=null}">
                                <c:if test="${cookie.vip.value!='1'}">
                                    <a >欢迎🐭🐭，${cookie.nickname.value}</a>&nbsp;&nbsp;
                                    <a id="exitbtn" href="#">退出</a>
                                </c:if>
                                <c:if test="${cookie.vip.value=='1'}">
                                    <a >欢迎<span style="color: gold">大会员</span>，${cookie.nickname.value}</a>&nbsp;&nbsp;
                                    <a id="exitbtn" href="#">退出</a>
                                </c:if>
                            </c:when>
                            <c:otherwise>
                                <a id="loginbtn" href="#">登录</a>
                            </c:otherwise>
                        </c:choose>

                    </div>
                    <script>
                        function setCookie(c_name, value, expiredays){
                            var exdate=new Date();
                            exdate.setDate(exdate.getDate() + expiredays);
                            window.parent.document.cookie=c_name+ "=" + escape(value) + ((expiredays==null) ? "" : ";expires="+exdate.toGMTString());
                        }
                        $('#loginbtn').click(function(){
                            window.parent.frames.location.href="/toLogin";
                        });
                        $('#exitbtn').click(function() {
                            setCookie('username','',-1);
                            setCookie('uid','',-1);
                            setCookie('avatar','',-1);
                            setCookie('nickname','',-1);
                            window.parent.location.reload();
                        });
                    </script>
            </div>
        </div>
    </div>
</nav>
<%--<script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-1b93190375e9ccc259df3a57c1abc0e64599724ae30d7ea4c6877eb615f89387.js"></script>--%>

<script id="rendered-js" >
    document.addEventListener('DOMContentLoaded', function () {

        // Get all "navbar-burger" elements
        var $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);

        // Check if there are any nav burgers
        if ($navbarBurgers.length > 0) {

            // Add a click event on each of them
            $navbarBurgers.forEach(function ($el) {
                $el.addEventListener('click', function () {

                    // Get the target from the "data-target" attribute
                    var target = $el.dataset.target;
                    var $target = document.getElementById(target);

                    // Toggle the class on both the "navbar-burger" and the "navbar-menu"
                    $el.classList.toggle('is-active');
                    $target.classList.toggle('is-active');

                });
            });
        }

    });
    //# sourceURL=pen.js
</script>
</body>
</html>

