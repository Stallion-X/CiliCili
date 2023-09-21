<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>关注</title>
    <link rel="stylesheet" href="/views/css/1.css">
    <script src='/views/js/jquery-3.6.0.min.js'></script>
    <script src='/views/js/axios.min.js'></script>
    <script src="https://unpkg.com/vue@2.6.14/dist/vue.js"></script>
    <!-- 引入样式 -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <!-- 引入组件库 -->
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
    <style>
        .btn-panel {
            clear: both;
            display: -ms-flexbox;
            display: flex;
            margin-left: 63px;
            white-space: nowrap;
        }
        .btn-panel .following {
            color: #999;
            border: 1px solid #e7e7e7;
            background: #e7e7e7;
            width: 123px;
        }
        .btn-panel .not-follow:hover {
            background: #00b5e5;
            border-color: #00b5e5;
        }
        .btn-panel .not-follow {
            background: #00a1d6;
            color: #fff;
            width: 156px;
        }
        .btn-panel .follow-btn {
            transition: .25s;
        }
        .btn-panel .default-btn {
            box-sizing: border-box;
            padding: 0;
            line-height: 32px;
            height: 32px;
            border-radius: 2px;
            font-size: 14px;
            display: -ms-flexbox;
            display: flex;
            -ms-flex-align: center;
            align-items: center;
            -ms-flex-pack: center;
            justify-content: center;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div id="app"></div>
<h3>全部关注</h3>
<c:forEach items="${list}" var="list" varStatus="i">
    <div>
        <table>
            <tr>
                <td><img class="cir" alt="Skytsunami" src="/views/img/avatar/${list.avatar}">
                </td>
                <td>&emsp;&emsp;&emsp;</td>
                <td><div>
                    <a style="cursor: pointer;" class="" id="${list.uid}">
                        <span class="" style="color:rgb(251,114,153);">${list.nickname}</span>
                    </a>
                    <script>
                        $('#${list.uid}').click(function(){
                            window.parent.frames.location.href="/toUser?uid=${list.uid}";
                        });
                    </script>
                    <p title="cilicili知名UP主" class="">${list.signature}</p></div>
                </td>
                <c:if test="${access==1}">
                <div  style="float:right;">
                    <c:if test="${statusList[i.index]==0}">
                        <div class="btn-panel"><!---->
                            <div class="default-btn follow-btn b-gz not-follow" id="followbtn${list.uid}"><span>关注</span><!----><!---->
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${statusList[i.index]==1}">
                        <div class="btn-panel"><!---->
                            <div class="default-btn follow-btn b-gz following" id="cancelbtn${list.uid}"><span>已关注</span><!----><!---->
                            </div>
                        </div>
                    </c:if>

                </div>
                </c:if>
                </td>
            </tr>
        </table>
    </div>
    <script>
        let followData = new FormData();
        followData.append("follower","${cookie.uid.value}");
        followData.append("followed","${list.uid}");
        $('#followbtn${list.uid}').click(function() {
            axios.post(
                '/follow',
                followData,
                {
                    headers:{'Content-Type':'multipart/form-data'}
                }
            ).then(function(res) {
                if (res.data == 'success') {
                    $('#followbtn${list.uid}').attr("class","default-btn follow-btn b-gz following");
                    $('#follownum').html("已关注");
                    let vm = new Vue({
                        el:"#app",
                        mounted() {
                            this.$notify({
                                title: '感谢',
                                message: '感谢小伙伴的关注哦！',
                                type: 'success',
                                duration: 2000
                            });
                        }
                    });
                    $('#followbtn${list.uid}').attr("id","cancelbtn${list.uid}");
                    $('#cancelbtn${list.uid}').unbind();
                    $('#cancelbtn${list.uid}').attr("class","default-btn follow-btn b-gz following");
                    $('#cancelbtn${list.uid}').html("已关注");
                    $('#cancelbtn${list.uid}').click(function() {
                        let cancelData = new FormData();
                        cancelData.append("uid","${cookie.uid.value}");
                        cancelData.append("owner","${list.uid}");
                        axios.post(
                            '/cancelFollow',
                            cancelData,
                            {
                                headers:{'Content-Type':'multipart/form-data'}
                            }
                        ).then(function(res) {
                            if (res.data == 'success') {
                                $('#cancelbtn${list.uid}').attr("class","default-btn follow-btn b-gz not-follow");
                                $('#cancelbtn${list.uid}').html("关注");
                                let vm = new Vue({
                                    el:"#app",
                                    mounted() {
                                        this.$notify({
                                            title: '已取消关注',
                                            message: '山高水长，有缘再会哦',
                                            type: 'success',
                                            duration: 2000
                                        });
                                    }
                                });
                                $('#cancelbtn${list.uid}').attr("id","followbtn${list.uid}");
                                $('#followbtn${list.uid}').unbind();
                                $('#followbtn${list.uid}').attr("class","default-btn follow-btn b-gz not-follow");
                                $('#followbtn${list.uid}').html("关注");
                            }
                            else {
                                console.log(res.data);
                                let vm = new Vue({
                                    el:"#app",
                                    mounted() {
                                        this.$notify({
                                            title: '错误',
                                            message: res.data,
                                            type: 'error',
                                            duration: 2000
                                        });
                                    }
                                });
                            }
                        }).catch(response => {
                            let vm = new Vue({
                                el:"#app",
                                mounted() {
                                    this.$message.error('未登录或网络错误！');
                                }
                            });
                        });
                    });
                }
                else {
                    console.log(res.data);
                    let vm = new Vue({
                        el:"#app",
                        mounted() {
                            this.$notify({
                                title: '错误',
                                message: res.data,
                                type: 'error',
                                duration: 2000
                            });
                        }
                    });
                }
            }).catch(response => {
                let vm = new Vue({
                    el:"#app",
                    mounted() {
                        this.$message.error('未登录或网络错误！');
                    }
                });
            });

        });
        $('#cancelbtn${list.uid}').click(function() {
            let cancelData = new FormData();
            cancelData.append("uid","${cookie.uid.value}");
            cancelData.append("owner","${list.uid}");
            axios.post(
                '/cancelFollow',
                cancelData,
                {
                    headers:{'Content-Type':'multipart/form-data'}
                }
            ).then(function(res) {
                if (res.data == 'success') {
                    $('#cancelbtn${list.uid}').attr("class","default-btn follow-btn b-gz not-follow");
                    $('#cancelbtn${list.uid}').html("关注");
                    let vm = new Vue({
                        el:"#app",
                        mounted() {
                            this.$notify({
                                title: '已取消关注',
                                message: '山高水长，有缘再会哦',
                                type: 'success',
                                duration: 2000
                            });
                        }
                    });
                }
                else {
                    console.log(res.data);
                    let vm = new Vue({
                        el:"#app",
                        mounted() {
                            this.$notify({
                                title: '错误',
                                message: res.data,
                                type: 'error',
                                duration: 2000
                            });
                        }
                    });
                }
            }).catch(response => {
                let vm = new Vue({
                    el:"#app",
                    mounted() {
                        this.$message.error('未登录或网络错误！');
                    }
                });
            });
            $('#cancelbtn${list.uid}').attr("id","followbtn${list.uid}");
            $('#followbtn${list.uid}').unbind();
            $('#followbtn${list.uid}').attr("class","default-btn follow-btn b-gz not-follow");
            $('#followbtn${list.uid}').html("关注");
        });
    </script>
</c:forEach>
</body>
</html>