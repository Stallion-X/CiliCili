<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name=”viewport” content=”width=device-width, initial-scale=1″ />
    <title>${userEntity.nickname}的个人空间_CiliCili</title>
    <link rel="shortcut icon" href="/views/img/favicon.ico">
    <script src='/views/js/jquery-3.6.0.min.js'></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link rel="apple-touch-icon" type="image/png" href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png" />
    <meta name="apple-mobile-web-app-title" content="CodePen">
    <link rel="mask-icon" type="image/x-icon" href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111" />
    <link rel="stylesheet" href="/views/css/usercss.css">
    <script src="https://unpkg.com/vue@2.6.14/dist/vue.js"></script>
    <!-- 引入样式 -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <!-- 引入组件库 -->
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
    <style type="text/css">
        body{
            height:100% ;
            width:100% ;
        }
        table{
            height: 990px;
            width: 100%;
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
<body >
<div id="app"></div>
<table >
    <tr style="height:5%;">
        <td colspan="2" style="height: 50px;">
            <iframe scrolling="no" style="border: medium none; margin:0; padding:0;" src="/views/navigation.jsp" width="100%" height="100%" name="topframe"></iframe>
        </td>
    </tr>
    <tr style="height:95%;">
        <td style="width:15%;color: green">
            <%--<iframe style="border: medium none; margin:0; padding:0;"src="/views/menu.jsp" width="100%" height="100%" name="leftframe"></iframe>--%>
                <div class="sidebar-overlay"></div>

                <!-- Material sidebar -->
                <aside id="sidebar" class="sidebar sidebar-default open" role="navigation">
                    <!-- Sidebar header -->
                    <div class="sidebar-header header-cover">
                        <!-- Top bar -->
                        <div class="top-bar"></div>
                        <!-- Sidebar toggle button -->
                        <!-- Sidebar brand image -->
                        <div class="sidebar-image">
                            <table style="height:auto;">
                                <td>
                                    <img src="/views/img/avatar/${userEntity.avatar}">
                                </td>
                                <td>
                                    ${userEntity.nickname}
                                </td>
                            </table>
                        </div>
                        <!-- Sidebar brand name -->
                    </div>

                    <!-- Sidebar navigation -->
                    <ul class="nav sidebar-nav">
                        <li>
                            <a href="/toFollowingList?uid=${userEntity.uid}&access=${access}" target="thframe">
                                关注
                            </a>
                        </li>
                        <li>
                            <a href="/toFanList?uid=${userEntity.uid}&access=${access}" target="thframe">
                                粉丝
                            </a>
                        </li>
                        <li>
                            <a href="/toContributeList?uid=${userEntity.uid}&access=${access}" target="thframe">
                                投稿管理
                            </a>
                        </li>
                        <li>
                            <a href="/toCollection?uid=${userEntity.uid}&access=${access}" target="thframe">
                                收藏夹⭐️
                            </a>
                        </li>
                        <c:if test="${access==1}">
                            <li>
                                <a style="cursor: pointer;" id="toupload">
                                    视频上传
                                </a>
                            </li>
                            <script>
                                $('#toupload').click(function(){
                                    location.href="/toUpload";
                                });
                            </script>
                        </c:if>
                        <li class="divider" ></li>
                        <c:if test="${access==1}">
                            <li>
                                <a href="/toEdit" target="thframe">
                                    ⚙︎修改信息
                                </a>
                            </li>
                        </c:if>

                    </ul>
                    <!-- Sidebar divider -->
                    <!-- <div class="sidebar-divider"></div> -->

                    <!-- Sidebar text -->
                    <!--  <div class="sidebar-text">Text</div> -->
                </aside>
                <script src='/views/js/bootstrap.min.js'></script>
        </td>
        <td style="width: 85%">
            <%--<iframe style="border: medium none; margin:0; padding:0;" src="http://localhost:8080/toFollowingList?uid=${userEntity.uid}" width="100%" height="100%" name="thframe"></iframe>--%>
                <iframe style="border: medium none; margin:0; padding:0;" src="" width="100%" height="100%" name="thframe" id="cont"></iframe>
        </td>
    </tr>
</table>
<script>
    $('#cont')[0].contentWindow.location.href = "/toFollowingList?uid=${userEntity.uid}&access=${access}";
    window.addEventListener('message', function(e){
        if (e.data.status === 'delok') {
            let vm = new Vue({
                el:"#app",
                mounted() {
                    this.$message.success("删除成功");
                }
            });
        }
        else if (e.data.status === 'delerror') {
            let vm = new Vue({
                el:"#app",
                mounted() {
                    this.$message.error('数据库错误');
                }
            });
        }
        else if (e.data.status === 'delcatch') {
            let vm = new Vue({
                el:"#app",
                mounted() {
                    this.$message.error('网络错误');
                }
            });
        }
    });
</script>
</body>
</html>