<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
<%--    <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>--%>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/bulma/0.9.1/css/bulma.min.css'>
    <script src='/views/js/jquery-3.6.0.min.js'></script>
    <script src="/views/js/axios.min.js"></script>
    <style>
        .navbar-item.is-mega {
            position: static;
        }
        .navbar-item.is-mega .is-mega-menu-title {
            margin-bottom: 0;
            padding: 0.375rem 1rem;
        }
        .button5 {
            align-items: center;
            border: 2px solid var(--border-color);
            border-radius: 25px;
            color: var(--body-color);
            padding: 8px 16px;
            font-family: var(--body-font);
            cursor: pointer;
            font-weight: 600;
            font-size: 14px;
        }
        .button5 svg {
            margin-right: 8px;
            width: 20px;
            fill: var(--body-color);
        }
        .div5{
            margin:auto;
            text-align:center;
        }
    </style>
</head>
<body>
<h3 style="display: block;
    font-size: 1.17em;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;margin-left: 20px;">投稿管理</h3>
<section class="section">
    <div class="container">
        <div class="columns">
            <c:forEach items="${conlist}" var="list">
                <div class="column is-4">
                    <div class="notification is-light is-link">
                        ${list.vtitle}
                        <br>
                        ${list.vinfo}
                    </div>
                    <div class="card">
                        <div class="card-image">
                            <figure class="image is-fullwidth">
                                <!-- 视频 -->
                                <a href="" id="tov"><img src="/views/img/cover/${list.vimage}"></a>
                                <script>
                                    $('#tov').click(function(){
                                        window.parent.frames.location.href="/video/${list.vid}";
                                    });
                                </script>
                            </figure>
                        </div>
                        <c:if test="${access==1}">
                            <footer class="card-footer">
                                <a href="toEditUpload/${list.vid}" class="card-footer-item">修改</a>
                            </footer>
                            <footer class="card-footer">
                                <a style="cursor: pointer;" class="card-footer-item" id="remove${list.vid}">删除</a>
                                <script>
                                    $('#remove${list.vid}').click(function() {
                                        axios.get('/removeContribute', {
                                            params: {
                                                vid:${list.vid}
                                            }
                                        }).then(response => {
                                            if (response.data=="success") {
                                                window.parent.postMessage({
                                                    status:'delok'
                                                });
                                                location.reload();
                                            }
                                            else {
                                                window.parent.postMessage({
                                                    status:'delerror'
                                                });
                                            }
                                        }).catch(response => {
                                            window.parent.postMessage({
                                                status:'delcatch'
                                            });
                                        });
                                    });
                                </script>
                            </footer>
                        </c:if>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <br>
    <br>
</section>
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
</script>
</body>
</html>