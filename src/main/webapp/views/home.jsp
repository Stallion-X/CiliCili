<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >

<head>

    <meta charset="UTF-8">
    <link rel="shortcut icon" href="/views/img/favicon.ico">
    <link rel="apple-touch-icon" type="image/png" href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png" />
    <meta name="apple-mobile-web-app-title" content="CodePen">
    <link rel="mask-icon" type="image/x-icon" href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111" />
    <title>CodePen - Internal Video Platform UI</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <script src='/views/js/jquery-3.6.0.min.js'></script>
    <style>
        * {
            box-sizing: border-box;
            outline: none;
        }

        body {
            display: flex;
            align-items: center;
        }

        /*ICONS*/
        body {
            margin: 0;
            justify-content: center;
            flex-direction: column;
            overflow: hidden;
            width: 100%;
            height: 100vh;
            padding: 20px;
            font-family: "DM Sans", sans-serif;
            font-size: 12px;
            background: white;
        }
        @media screen and (max-width: 900px) {
            body {
                padding: 0;
            }
        }

        button {
            border: none;
            cursor: pointer;
            background-color: transparent;
            transition: all 0.2s ease-in;
        }

        a {
            text-decoration: none;
        }

        input[type=text] {
            border: none;
        }

        ::-webkit-scrollbar {
            width: 6px;
            border-radius: 10px;
        }

        ::-webkit-scrollbar-track {
            background: none;
        }

        ::-webkit-scrollbar-thumb {
            background: rgba(216, 216, 216, 0.5);
            border-radius: 10px;
        }

        .app-wrapper {
            width: 100%;
            max-width: 1500px;
            height: 100vh;
            background-color: #fff;
            border-radius: 4px;
            box-shadow: 0 0.3px 2.2px rgba(0, 0, 0, 0.011), 0 0.7px 5.3px rgba(0, 0, 0, 0.016), 0 1.3px 10px rgba(0, 0, 0, 0.02), 0 2.2px 17.9px rgba(0, 0, 0, 0.024), 0 4.2px 33.4px rgba(0, 0, 0, 0.029), 0 10px 80px rgba(0, 0, 0, 0.04);
            overflow: hidden;
            display: flex;
        }
        @media screen and (max-width: 900px) {
            .app-wrapper {
                border-radius: none;
            }
        }

        .left-area {
            max-width: 190px;
            transition: all 0.6s linear;
            border-right: 1px solid #ddd;
            display: flex;
            flex-direction: column;
            height: 100%;
            padding-bottom: 20px;
        }
        .left-area.hide-on-mobile {
            transition: all 0.6s linear;
        }
        @media screen and (max-width: 900px) {
            .left-area.hide-on-mobile {
                left: -100%;
                opacity: 0;
            }
        }
        @media screen and (max-width: 900px) {
            .left-area {
                position: absolute;
                background-color: #fff;
                z-index: 2;
                left: 0;
                opacity: 1;
                box-shadow: 4px 0px 4px 0px rgba(222, 222, 222, 0.3);
                border-right: none;
            }
        }

        .app-header {
            font-size: 20px;
            font-weight: 500;
            color: #232428;
            background-repeat: no-repeat;
            background-size: 24px;
            background-position: center left 20px;
            padding: 20px 20px 20px 44px;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='%23499d77' stroke='%23499d77' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-play'%3E%3Cpolygon points='5 3 19 12 5 21 5 3'/%3E%3C/svg%3E");
            border-bottom: 1px solid #ddd;
            position: relative;
        }
        .app-header .close-menu {
            display: none;
            position: absolute;
            top: 8px;
            right: 0;
        }
        @media screen and (max-width: 900px) {
            .app-header .close-menu {
                display: block;
            }
        }

        .inner-text {
            color: #adadad;
        }

        .profile {
            display: flex;
            align-items: flex-start;
            cursor: pointer;
            padding: 20px;
        }
        .profile img {
            width: 40px;
            height: 40px;
            -o-object-fit: cover;
            object-fit: cover;
            border-radius: 6px;
            margin-right: 12px;
        }
        .profile span {
            display: block;
            line-height: 20px;
        }
        .profile .profile-name {
            color: #232428;
            font-weight: 500;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' fill='none' stroke='%23bebebe' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-chevron-down'%3E%3Cpath d='M6 9l6 6 6-6'/%3E%3C/svg%3E%0A");
            padding-right: 16px;
            background-position: center right;
            background-repeat: no-repeat;
            background-size: 16px;
        }
        .profile .country {
            color: #adadad;
            font-weight: 500;
        }

        .item-link {
            display: block;
            padding: 12px 20px;
            font-size: 14px;
            font-weight: 500;
            text-decoration: none;
            color: #adadad;
            transition: all 0.2s ease-in;
            width: 100%;
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow: hidden;
        }
        .item-link:not(:first-of-type) {
            margin-top: 10px;
        }
        .item-link.active {
            color: #499d77;
            background-color: #e0f1e9;
        }
        .item-link:not(.active):hover {
            color: #a8d7c2;
            background-color: #f5faf8;
        }
        .item-link .link-icon {
            width: 16px;
            display: inline-block;
            vertical-align: sub;
            margin-right: 4px;
        }

        .list-header {
            font-size: 12px;
            color: #adadad;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px 20px;
            margin: 10px 0;
            transition: all 0.2s ease-in;
            cursor: pointer;
            background-color: #fafafa;
        }
        .list-header svg {
            transition: all 0.2s ease-in;
        }
        .list-header span {
            display: block;
            font-weight: 500;
        }
        .list-header:hover svg {
            transition: all 0.2s ease-in;
            fill: #adadad;
        }
        .list-header:hover svg line {
            stroke: #fff;
        }

        .btn-invite {
            background-color: #499d77;
            border: none;
            color: #fff;
            border-radius: 4px;
            padding: 10px;
            font-size: 14px;
            line-height: 20px;
            width: 100%;
            max-width: 160px;
            margin: 0 auto;
            display: block;
            margin-top: auto;
        }
        .btn-invite:hover {
            background-color: #438f6c;
        }

        .left-area-content {
            flex: 1;
            overflow: auto;
        }

        .right-area {
            flex: 1;
            display: flex;
            flex-direction: column;
            width: 100%;
            max-width: calc(100% - 190px);
        }
        @media screen and (max-width: 900px) {
            .right-area {
                max-width: 100%;
            }
        }

        .right-area-upper {
            width: 100%;
            border-bottom: 1px solid #ddd;
            display: flex;
            max-height: 64px;
            padding: 0 20px;
        }
        .right-area-upper .menu-button {
            display: none;
        }
        @media screen and (max-width: 900px) {
            .right-area-upper .menu-button {
                display: block;
            }
        }
        @media screen and (max-width: 520px) {
            .right-area-upper {
                padding: 0 10px;
            }
        }

        .search-input {
            flex: 1;
            width: 100%;
            font-size: 14px;
            line-height: 20px;
            color: #adadad;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='20' height='20' viewBox='0 0 24 24' fill='none' stroke='%23adadad' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-search'%3E%3Ccircle cx='11' cy='11' r='8'/%3E%3Cpath d='M21 21l-4.35-4.35'/%3E%3C/svg%3E%0A");
            background-repeat: no-repeat;
            background-size: 20px;
            background-position: center left 0px;
            padding: 10px 10px 10px 24px;
        }

        .search-part-wrapper {
            position: relative;
            padding: 14px 20px;
            display: flex;
            align-items: center;
            flex: 1;
        }
        .search-part-wrapper a {
            color: #232428;
            font-size: 14px;
            font-weight: 500;
        }
        .search-part-wrapper a + a {
            margin-left: 10px;
        }

        .more-menu-list {
            position: absolute;
            top: 100%;
            right: 0;
            background-color: #fff;
            z-index: 1;
            border-radius: 4px;
            box-shadow: 0px 2px 4px 2px rgba(209, 209, 209, 0.4);
            padding: 10px 0;
            transform-origin: center;
        }
        .more-menu-list.hide {
            display: none;
        }
        .more-menu-list:before {
            content: "";
            position: absolute;
            width: 10px;
            height: 10px;
            background-color: #fff;
            transform: rotate(45deg);
            border-radius: 2px;
            top: -6px;
            right: 32px;
            box-shadow: 0px 0px 4px 0px rgba(209, 209, 209, 0.4);
        }
        .more-menu-list li {
            padding: 8px 20px;
            list-style-type: none;
            cursor: pointer;
        }
        .more-menu-list li:hover {
            background-color: #f3f8f6;
        }

        .btn-notification {
            position: relative;
            display: block;
            border: 1px solid #ddd;
            border-top: 0;
            border-bottom: 0;
            padding: 0 20px;
        }
        .btn-notification span {
            position: absolute;
            background-color: red;
            color: #fff;
            border-radius: 50%;
            padding: 2px;
            width: 14px;
            height: 14px;
            right: 18px;
            top: 18px;
            font-size: 10px;
        }

        .action-buttons {
            border-radius: 2px;
            padding: 10px 24px 10px 40px;
            font-size: 12px;
            color: #51a380;
            background-size: 16px;
            background-repeat: no-repeat;
            background-position: center left 16px;
            max-height: 36px;
        }

        .btn-record {
            color: #51a380;
            background-color: #e6f1ed;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='20' height='20' viewBox='0 0 24 24' fill='none' stroke='%2351a380' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-video'%3E%3Cpath d='M23 7l-7 5 7 5V7z'/%3E%3Crect x='1' y='5' width='15' height='14' rx='2' ry='2'/%3E%3C/svg%3E ");
            margin-right: 20px;
        }
        .btn-record:hover {
            background-color: #d2e6df;
        }

        .btn-upload {
            color: #e6f1ed;
            background-color: #51a380;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='20' height='20' viewBox='0 0 24 24' fill='none' stroke='%23e6f1ed' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-upload-cloud'%3E%3Cpath d='M16 16l-4-4-4 4M12 12v9'/%3E%3Cpath d='M20.39 18.39A5 5 0 0018 9h-1.26A8 8 0 103 16.3'/%3E%3Cpath d='M16 16l-4-4-4 4'/%3E%3C/svg%3E ");
        }
        .btn-upload:hover {
            background-color: #62b18f;
        }

        .action-buttons-wrapper {
            padding: 0 20px;
            align-items: center;
            display: flex;
        }

        .page-right-content {
            flex: 1;
            padding: 20px;
            overflow: auto;
        }

        .content-line {
            width: 100%;
            position: relative;
        }
        .content-line + .content-line {
            margin-top: 24px;
            transition: 0.2s;
        }
        .content-line .header-text {
            display: block;
            line-height: 24px;
            font-weight: 500;
            font-size: 16px;
            color: #232428;
        }

        .line-header {
            position: absolute;
            padding: 0 10px;
        }

        .content-line-hero .owl-dots {
            position: absolute;
            z-index: 12;
            left: 50%;
            transform: translatex(-50%);
            bottom: 24px;
        }
        .content-line-hero .owl-dots .owl-dot {
            width: 10px;
            height: 10px;
            background-color: #fff;
            border-radius: 50%;
            margin: 0 2px;
            opacity: 0.5;
            padding: 0;
        }
        .content-line-hero .owl-dots .owl-dot.active {
            opacity: 1;
        }

        .owl-nav {
            position: absolute;
            top: 0;
            right: 10px;
        }

        .owl-nav button {
            background-color: #51a380;
            border-radius: 50%;
            width: 24px;
            height: 24px;
            background-position: center;
            background-repeat: no-repeat;
            transition: all 0.2s ease-in;
        }
        .owl-nav button span {
            display: none;
        }
        .owl-nav button:hover {
            background-color: #62b18f;
        }

        .owl-prev {
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='14' height='14' viewBox='0 0 24 24' fill='none' stroke='%23e6f1ed' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-chevron-left'%3E%3Cpolyline points='15 18 9 12 15 6'/%3E%3C/svg%3E ");
            margin-right: 6px;
        }
        .owl-prev:hover {
            background-position: center left 2px;
        }

        .owl-next {
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='14' height='14' viewBox='0 0 24 24' fill='none' stroke='%23e6f1ed' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-chevron-right'%3E%3Cpath d='M9 18l6-6-6-6'/%3E%3C/svg%3E ");
        }
        .owl-next:hover {
            background-position: center right 2px;
        }

        .owl-carousel {
            position: relative;
            overflow: hidden;
        }

        .owl-item {
            padding: 6px 10px;
        }

        .owl-stage-outer {
            width: 100%;
        }

        .hero-img-wrapper {
            position: relative;
            overflow: hidden;
            width: 100%;
            height: 100%;
            flex-shrink: 0;
            border-radius: 4px;
        }
        .hero-img-wrapper img {
            width: 100%;
            height: 100%;
            -o-object-fit: cover;
            object-fit: cover;
        }

        .owl-carousel {
            position: relative;
            width: 100%;
            height: 280px;
            display: flex;
            align-items: center;
            padding-top: 32px;
            padding-bottom: 8px;
        }

        .upload-text-wrapper {
            position: absolute;
            top: 24px;
            left: 24px;
        }
        .upload-text-header {
            font-size: 16px;
            line-height: 24px;
            font-weight: 700;
            color: #fff;
            margin: 0;
        }
        .upload-text-info {
            font-size: 12px;
            font-weight: 400;
            color: #fff;
            margin: 0;
            opacity: 0.8;
        }
        .upload-text-info span {
            border-left: 1px solid #fff;
            padding-left: 4px;
        }

        .img-preview {
            flex: 1;
        }

        .video-box-wrapper {
            width: 100%;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: flex-end;
            border-radius: 4px;
            overflow: hidden;
            box-shadow: 0px 2px 4px 0px rgba(209, 209, 209, 0.4);
            margin-right: 10px;
        }
        .video-box-wrapper img {
            width: 100%;
            height: 100%;
            -o-object-fit: cover;
            object-fit: cover;
        }

        .video-description-wrapper {
            background-color: #fff;
            padding: 8px;
            position: relative;
        }
        .video-description-wrapper p {
            width: 100%;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        .video-description-header {
            font-weight: 500;
            margin: 16px 0 4px 0;
            font-size: 14px;
        }
        .video-description-subheader {
            color: #bebfbf;
            margin: 0;
            font-size: 12px;
        }
        .video-description-info {
            font-size: 12px;
            margin: 4px 0;
        }
        .video-description-info span {
            border-left: 1px solid #cdcdcd;
            padding-left: 4px;
        }

        .btn-play {
            position: absolute;
            top: -16px;
            right: 8px;
            background-color: #fff;
            border-radius: 50%;
            width: 32px;
            height: 32px;
            background-size: 14px;
            background-repeat: no-repeat;
            background-position: center;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='%2311a074' stroke='%2311a074' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-play'%3E%3Cpath d='M5 3l14 9-14 9V3z' /%3E%3C/svg%3E");
            box-shadow: 0px 2px 4px 2px rgba(209, 209, 209, 0.4);
        }

        .more-button {
            display: none;
        }

        @media screen and (max-width: 768px) {
            .menu-links {
                display: none;
            }

            .more-button {
                display: block;
            }

            .action-buttons-wrapper {
                display: none;
            }
        }
        #owl-slider-1 .hero-img-wrapper img {
            display: block;
            width: 100%;
        }

        .owl-stage {
            height: 250px;
            display: flex;
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




<body translate="no" >

<img alt="" src="/views/img/indexheader.webp" width="100%" height="20%">
<link href="https://fonts.googleapis.com/css?family=DM+Sans:400,500,700&display=swap" rel="stylesheet">
<div class="app-wrapper">
    <div class="right-area">
        <div class="right-area-upper">
            <button class="menu-button">
                <svg width="24" height="24" fill="none" stroke="#51a380" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
                    <defs />
                    <path d="M3 12h18M3 6h18M3 18h18" />
                </svg>
            </button>
            <div class="search-part-wrapper">
                <input class="search-input" type="text" placeholder="查找...">
                <a class="menu-links" href="#">查找</a>
                <button class="more-button">
                    <svg width="24" height="24" fill="none" stroke="#51a380" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="feather feather-more-vertical">
                        <defs />
                        <circle cx="12" cy="12" r="1" />
                        <circle cx="12" cy="5" r="1" />
                        <circle cx="12" cy="19" r="1" />
                    </svg>
                </button>
                <ul class="more-menu-list hide">
                    <li> <button class="action-buttons btn-record">Record</button></li>
                    <li><button class="action-buttons btn-upload">Upload</button></li>
                </ul>
            </div>
            <button class="btn-notification">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#232428" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bell">
                    <path d="M18 8A6 6 0 006 8c0 7-3 9-3 9h18s-3-2-3-9M13.73 21a2 2 0 01-3.46 0" />
                </svg>
                <%--<span>99</span>--%>
            </button>
            <div class="action-buttons-wrapper">
                <button class="action-buttons btn-upload" id="btnupload">上传</button>
            </div>
            <script>
                $('#btnupload').click(function(){
                    window.parent.frames.location.href="/toUpload";
                });
            </script>
        </div>
        <div class="page-right-content">
            <div class="content-line content-line-list">
                <div class="line-header">
                    <span class="header-text">动画</span>
                </div>
                <div id="owl-slider-1" class="slider-wrapper owl-carousel">

                    <c:forEach items="${animeList}" var="list">
                        <div class="item video-box-wrapper">
                            <div class="img-preview">
                                <img src="/views/img/cover/${list.vimage}" alt="#">
                            </div>
                            <div class="video-description-wrapper">
                                <p class="video-description-header">${list.vtitle }</p>
                                <p class="video-description-subheader">${list.vowner}</p>
                                <p class="video-description-info">播放量：${list.vviews}<span>时间：${list.uptime}</span></p>
                                <a style="cursor: pointer;"  class="btn-play" id="${list.vid}"></a>
                                <script >
                                    $('#${list.vid}').click(function(){
                                        window.parent.frames.location.href="/video/${list.vid}";
                                    });
                                </script>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="content-line content-line-list">
                <div class="line-header">
                    <span class="header-text">番剧</span>
                </div>
                <div id="owl-slider-2" class="slider-wrapper owl-carousel">

                    <c:forEach items="${fanjuList}" var="list">
                        <div class="item video-box-wrapper">
                            <div class="img-preview">
                                <img src="/views/img/cover/${list.vimage}" alt="#">
                            </div>
                            <div class="video-description-wrapper">
                                <p class="video-description-header">${list.vtitle }</p>
                                <p class="video-description-subheader">${list.vowner}</p>
                                <p class="video-description-info">播放量：${list.vviews}<span>时间${list.uptime}</span></p>
                                <a style="cursor: pointer;"  class="btn-play" id="${list.vid}"></a>
                                <script >
                                    $('#${list.vid}').click(function(){
                                        window.parent.frames.location.href="/video/${list.vid}";
                                    });
                                </script>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>

            <div class="content-line content-line-list">
                <div class="line-header">
                    <span class="header-text">音乐</span>
                </div>
                <div id="owl-slider-3" class="slider-wrapper owl-carousel">


                    <c:forEach items="${musicList}" var="list">
                        <div class="item video-box-wrapper">
                            <div class="img-preview">
                                <img src="/views/img/cover/${list.vimage}" alt="#">
                            </div>
                            <div class="video-description-wrapper">
                                <p class="video-description-header">${list.vtitle }</p>
                                <p class="video-description-subheader">${list.vowner}</p>
                                <p class="video-description-info">播放量：${list.vviews}<span>时间${list.uptime}</span></p>
                                <a style="cursor: pointer;"  class="btn-play" id="${list.vid}"></a>
                                <script >
                                    $('#${list.vid}').click(function(){
                                        window.parent.frames.location.href="/video/${list.vid}";
                                    });
                                </script>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>

            <div class="content-line content-line-list">
                <div class="line-header">
                    <span class="header-text">舞蹈</span>
                </div>
                <div id="owl-slider-4" class="slider-wrapper owl-carousel">


                    <c:forEach items="${danceList}" var="list">
                        <div class="item video-box-wrapper">
                            <div class="img-preview">
                                <img src="/views/img/cover/${list.vimage}" alt="#">
                            </div>
                            <div class="video-description-wrapper">
                                <p class="video-description-header">${list.vtitle }</p>
                                <p class="video-description-subheader">${list.vowner}</p>
                                <p class="video-description-info">播放量：${list.vviews}<span>时间${list.uptime}</span></p>
                                <a style="cursor: pointer;"  class="btn-play" id="${list.vid}"></a>
                                <script >
                                    $('#${list.vid}').click(function(){
                                        window.parent.frames.location.href="/video/${list.vid}";
                                    });
                                </script>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>

            <div class="content-line content-line-list">
                <div class="line-header">
                    <span class="header-text">游戏</span>
                </div>
                <div id="owl-slider-5" class="slider-wrapper owl-carousel">


                    <c:forEach items="${gameList}" var="list">
                        <div class="item video-box-wrapper">
                            <div class="img-preview">
                                <img src="/views/img/cover/${list.vimage}" alt="#">
                            </div>
                            <div class="video-description-wrapper">
                                <p class="video-description-header">${list.vtitle }</p>
                                <p class="video-description-subheader">${list.vowner}</p>
                                <p class="video-description-info">播放量：${list.vviews}<span>时间${list.uptime}</span></p>
                                <a style="cursor: pointer;"  class="btn-play" id="${list.vid}"></a>
                                <script >
                                    $('#${list.vid}').click(function(){
                                        window.parent.frames.location.href="/video/${list.vid}";
                                    });
                                </script>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>

            <div class="content-line content-line-list">
                <div class="line-header">
                    <span class="header-text">科技</span>
                </div>
                <div id="owl-slider-6" class="slider-wrapper owl-carousel">


                    <c:forEach items="${sciList}" var="list">
                        <div class="item video-box-wrapper">
                            <div class="img-preview">
                                <img src="/views/img/cover/${list.vimage}" alt="#">
                            </div>
                            <div class="video-description-wrapper">
                                <p class="video-description-header">${list.vtitle }</p>
                                <p class="video-description-subheader">${list.vowner}</p>
                                <p class="video-description-info">播放量：${list.vviews}<span>时间${list.uptime}</span></p>
                                <a style="cursor: pointer;"  class="btn-play" id="${list.vid}"></a>
                                <script >
                                    $('#${list.vid}').click(function(){
                                        window.parent.frames.location.href="/video/${list.vid}";
                                    });
                                </script>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>

            <div class="content-line content-line-list">
                <div class="line-header">
                    <span class="header-text">生活</span>
                </div>
                <div id="owl-slider-7" class="slider-wrapper owl-carousel">


                    <c:forEach items="${lifeList}" var="list">
                        <div class="item video-box-wrapper">
                            <div class="img-preview">
                                <img src="/views/img/cover/${list.vimage}" alt="#">
                            </div>
                            <div class="video-description-wrapper">
                                <p class="video-description-header">${list.vtitle }</p>
                                <p class="video-description-subheader">${list.vowner}</p>
                                <p class="video-description-info">播放量：${list.vviews}<span>时间${list.uptime}</span></p>
                                <a style="cursor: pointer;"  class="btn-play" id="${list.vid}"></a>
                                <script >
                                    $('#${list.vid}').click(function(){
                                        window.parent.frames.location.href="/video/${list.vid}";
                                    });
                                </script>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>

            <div class="content-line content-line-list">
                <div class="line-header">
                    <span class="header-text">鬼畜</span>
                </div>
                <div id="owl-slider-8" class="slider-wrapper owl-carousel">


                    <c:forEach items="${guichuList}" var="list">
                        <div class="item video-box-wrapper">
                            <div class="img-preview">
                                <img src="/views/img/cover/${list.vimage}" alt="#">
                            </div>
                            <div class="video-description-wrapper">
                                <p class="video-description-header">${list.vtitle }</p>
                                <p class="video-description-subheader">${list.vowner}</p>
                                <p class="video-description-info">播放量：${list.vviews}<span>时间${list.uptime}</span></p>
                                <a style="cursor: pointer;"  class="btn-play" id="${list.vid}"></a>
                                <script >
                                    $('#${list.vid}').click(function(){
                                        window.parent.frames.location.href="/video/${list.vid}";
                                    });
                                </script>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>

            <div class="content-line content-line-list">
                <div class="line-header">
                    <span class="header-text">时尚</span>
                </div>
                <div id="owl-slider-9" class="slider-wrapper owl-carousel">


                    <c:forEach items="${fashionList}" var="list">
                        <div class="item video-box-wrapper">
                            <div class="img-preview">
                                <img src="/views/img/cover/${list.vimage}" alt="#">
                            </div>
                            <div class="video-description-wrapper">
                                <p class="video-description-header">${list.vtitle }</p>
                                <p class="video-description-subheader">${list.vowner}</p>
                                <p class="video-description-info">播放量：${list.vviews}<span>时间${list.uptime}</span></p>
                                <a style="cursor: pointer;"  class="btn-play" id="${list.vid}"></a>
                                <script >
                                    $('#${list.vid}').click(function(){
                                        window.parent.frames.location.href="/video/${list.vid}";
                                    });
                                </script>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>

            <div class="content-line content-line-list">
                <div class="line-header">
                    <span class="header-text">娱乐</span>
                </div>
                <div id="owl-slider-10" class="slider-wrapper owl-carousel">


                    <c:forEach items="${entertainmentList}" var="list">
                        <div class="item video-box-wrapper">
                            <div class="img-preview">
                                <img src="/views/img/cover/${list.vimage}" alt="#">
                            </div>
                            <div class="video-description-wrapper">
                                <p class="video-description-header">${list.vtitle }</p>
                                <p class="video-description-subheader">${list.vowner}</p>
                                <p class="video-description-info">播放量：${list.vviews}<span>时间${list.uptime}</span></p>
                                <a style="cursor: pointer;"  class="btn-play" id="${list.vid}"></a>
                                <script >
                                    $('#${list.vid}').click(function(){
                                        window.parent.frames.location.href="/video/${list.vid}";
                                    });
                                </script>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>

            <div class="content-line content-line-list">
                <div class="line-header">
                    <span class="header-text">影视</span>
                </div>
                <div id="owl-slider-11" class="slider-wrapper owl-carousel">


                    <c:forEach items="${moviesList}" var="list">
                        <div class="item video-box-wrapper">
                            <div class="img-preview">
                                <img src="/views/img/cover/${list.vimage}" alt="#">
                            </div>
                            <div class="video-description-wrapper">
                                <p class="video-description-header">${list.vtitle }</p>
                                <p class="video-description-subheader">${list.vowner}</p>
                                <p class="video-description-info">播放量：${list.vviews}<span>时间${list.uptime}</span></p>
                                <a style="cursor: pointer;"  class="btn-play" id="${list.vid}"></a>
                                <script >
                                    $('#${list.vid}').click(function(){
                                        window.parent.frames.location.href="/video/${list.vid}";
                                    });
                                </script>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>
        </div>
<%--    <script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-1b93190375e9ccc259df3a57c1abc0e64599724ae30d7ea4c6877eb615f89387.js"></script>--%>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js'></script>
    <script id="rendered-js" >
        $(document).ready(function () {
            $("a#pageLink").click(function () {
                $("a#pageLink").removeClass("active");
                $(this).addClass("active");
            });

            $(".menu-button").click(function () {
                $(".left-area").removeClass("hide-on-mobile");
            });

            $(".close-menu").click(function () {
                $(".left-area").addClass("hide-on-mobile");
            });

            $(".more-button").click(function () {
                $(".more-menu-list").toggle("hide");
            });

            var owl = $("#owl-slider-1");
            owl.owlCarousel({
                navigation: true,
                slideSpeed: 400,
                paginationSpeed: 400,
                responsive: {
                    0: {
                        items: 1 },

                    600: {
                        items: 2 },

                    1000: {
                        items: 4 } } });

            // Custom Navigation Events
            $(".owl-next").click(function () {
                owl.trigger("owl.next");
            });
            $(".owl-prev").click(function () {});

            $(".play").click(function () {
                owl.trigger("owl.play", 100);
            });
            $(".stop").click(function () {
                owl.trigger("owl.stop");
            });

            var owl = $("#owl-slider-2");
            owl.owlCarousel({
                navigation: true,
                slideSpeed: 400,
                paginationSpeed: 400,
                responsive: {
                    0: {
                        items: 1 },

                    600: {
                        items: 2 },

                    1000: {
                        items: 4 } } });

            var owl = $("#owl-slider-3");
            owl.owlCarousel({
                navigation: true,
                slideSpeed: 400,
                paginationSpeed: 400,
                responsive: {
                    0: {
                        items: 1 },

                    600: {
                        items: 2 },

                    1000: {
                        items: 4 } } });

            var owl = $("#owl-slider-4");
            owl.owlCarousel({
                navigation: true,
                slideSpeed: 400,
                paginationSpeed: 400,
                responsive: {
                    0: {
                        items: 1 },

                    600: {
                        items: 2 },

                    1000: {
                        items: 4 } } });

            var owl = $("#owl-slider-5");
            owl.owlCarousel({
                navigation: true,
                slideSpeed: 400,
                paginationSpeed: 400,
                responsive: {
                    0: {
                        items: 1 },

                    600: {
                        items: 2 },

                    1000: {
                        items: 4 } } });

            var owl = $("#owl-slider-6");
            owl.owlCarousel({
                navigation: true,
                slideSpeed: 400,
                paginationSpeed: 400,
                responsive: {
                    0: {
                        items: 1 },

                    600: {
                        items: 2 },

                    1000: {
                        items: 4 } } });

            var owl = $("#owl-slider-7");
            owl.owlCarousel({
                navigation: true,
                slideSpeed: 400,
                paginationSpeed: 400,
                responsive: {
                    0: {
                        items: 1 },

                    600: {
                        items: 2 },

                    1000: {
                        items: 4 } } });

            var owl = $("#owl-slider-8");
            owl.owlCarousel({
                navigation: true,
                slideSpeed: 400,
                paginationSpeed: 400,
                responsive: {
                    0: {
                        items: 1 },

                    600: {
                        items: 2 },

                    1000: {
                        items: 4 } } });

            var owl = $("#owl-slider-9");
            owl.owlCarousel({
                navigation: true,
                slideSpeed: 400,
                paginationSpeed: 400,
                responsive: {
                    0: {
                        items: 1 },

                    600: {
                        items: 2 },

                    1000: {
                        items: 4 } } });

            var owl = $("#owl-slider-10");
            owl.owlCarousel({
                navigation: true,
                slideSpeed: 400,
                paginationSpeed: 400,
                responsive: {
                    0: {
                        items: 1 },

                    600: {
                        items: 2 },

                    1000: {
                        items: 4 } } });

            var owl = $("#owl-slider-11");
            owl.owlCarousel({
                navigation: true,
                slideSpeed: 400,
                paginationSpeed: 400,
                responsive: {
                    0: {
                        items: 1 },

                    600: {
                        items: 2 },

                    1000: {
                        items: 4 } } });
        });
        //# sourceURL=pen.js
    </script>


</div>
</div>
</body>

</html>

