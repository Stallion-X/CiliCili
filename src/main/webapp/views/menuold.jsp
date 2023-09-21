<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="apple-touch-icon" type="image/png" href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png" />
    <meta name="apple-mobile-web-app-title" content="CodePen">
    <link rel="mask-icon" type="image/x-icon" href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111" />
    <title>Sidebar (Profile menu)</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <script src='/views/js/jquery-3.6.0.min.js'></script>

    <style>
        /* -- import Roboto Font ---------------------------- */
        @font-face {
            font-family: 'Roboto';
            font-style: italic;
            font-weight: 100;
            src: url(https://fonts.gstatic.com/s/roboto/v30/KFOiCnqEu92Fr1Mu51QrEzQdKg.ttf) format('truetype');
        }
        @font-face {
            font-family: 'Roboto';
            font-style: italic;
            font-weight: 300;
            src: url(https://fonts.gstatic.com/s/roboto/v30/KFOjCnqEu92Fr1Mu51TjASc-CsE.ttf) format('truetype');
        }
        @font-face {
            font-family: 'Roboto';
            font-style: italic;
            font-weight: 400;
            src: url(https://fonts.gstatic.com/s/roboto/v30/KFOkCnqEu92Fr1Mu51xMIzc.ttf) format('truetype');
        }
        @font-face {
            font-family: 'Roboto';
            font-style: italic;
            font-weight: 500;
            src: url(https://fonts.gstatic.com/s/roboto/v30/KFOjCnqEu92Fr1Mu51S7ACc-CsE.ttf) format('truetype');
        }
        @font-face {
            font-family: 'Roboto';
            font-style: italic;
            font-weight: 700;
            src: url(https://fonts.gstatic.com/s/roboto/v30/KFOjCnqEu92Fr1Mu51TzBic-CsE.ttf) format('truetype');
        }
        @font-face {
            font-family: 'Roboto';
            font-style: italic;
            font-weight: 900;
            src: url(https://fonts.gstatic.com/s/roboto/v30/KFOjCnqEu92Fr1Mu51TLBCc-CsE.ttf) format('truetype');
        }
        @font-face {
            font-family: 'Roboto';
            font-style: normal;
            font-weight: 100;
            src: url(https://fonts.gstatic.com/s/roboto/v30/KFOkCnqEu92Fr1MmgVxMIzc.ttf) format('truetype');
        }
        @font-face {
            font-family: 'Roboto';
            font-style: normal;
            font-weight: 300;
            src: url(https://fonts.gstatic.com/s/roboto/v30/KFOlCnqEu92Fr1MmSU5fABc9.ttf) format('truetype');
        }
        @font-face {
            font-family: 'Roboto';
            font-style: normal;
            font-weight: 400;
            src: url(https://fonts.gstatic.com/s/roboto/v30/KFOmCnqEu92Fr1Mu5mxP.ttf) format('truetype');
        }
        @font-face {
            font-family: 'Roboto';
            font-style: normal;
            font-weight: 500;
            src: url(https://fonts.gstatic.com/s/roboto/v30/KFOlCnqEu92Fr1MmEU9fABc9.ttf) format('truetype');
        }
        @font-face {
            font-family: 'Roboto';
            font-style: normal;
            font-weight: 700;
            src: url(https://fonts.gstatic.com/s/roboto/v30/KFOlCnqEu92Fr1MmWUlfABc9.ttf) format('truetype');
        }
        @font-face {
            font-family: 'Roboto';
            font-style: normal;
            font-weight: 900;
            src: url(https://fonts.gstatic.com/s/roboto/v30/KFOlCnqEu92Fr1MmYUtfABc9.ttf) format('truetype');
        }
        /* -- import Material Icons Font -------------------- */
        @font-face {
            font-family: 'Material Design Iconic Font';
            src: url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/53474/Material-Design-Iconic-Font.eot?v=1.0');
            src: url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/53474/Material-Design-Iconic-Font.eot?#iefix&v=1.0') format('embedded-opentype'), url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/53474/Material-Design-Iconic-Font.woff?v=1.0') format('woff'), url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/53474/Material-Design-Iconic-Font.ttf?v=1.0') format('truetype'), url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/53474/Material-Design-Iconic-Font.svg?v=1.0#Material-Design-Iconic-Font') format('svg');
            font-weight: normal;
            font-style: normal;
        }
        [class^="md-"],
        [class*=" md-"] {
            display: inline-block;
            font: normal normal normal 14px/1 'Material Design Iconic Font';
            font-size: inherit;
            speak: none;
            text-rendering: auto;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }
        .md {
            line-height: inherit;
            vertical-align: bottom;
        }
        .md-inbox:before {
            content: "\f10c";
        }
        .md-star:before {
            content: "\f2e5";
        }
        .md-send:before {
            content: "\f119";
        }
        .md-drafts:before {
            content: "\f107";
        }
        .md-arrow-back:before {
            content: "\f297";
        }
        .md-arrow-forward:before {
            content: "\f298";
        }
        /* -- You can use this sidebar in Bootstrap (v3) projects. HTML-markup like Navbar bootstrap component will make your work easier. -- */
        /* -- Box model ------------------------------- */
        *,
        *:after,
        *:before {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }
        /* -- Demo style ------------------------------- */
        html,
        body {
            position: relative;
            min-height: 100%;
            height: 100%;
        }
        body {
            font-family: 'RobotoDraft', 'Roboto', 'Helvetica Neue, Helvetica, Arial', sans-serif;
            font-style: normal;
            font-weight: 300;
            font-size: 14px;
            line-height: 1.4;
            color: #212121;
            background-color: #f5f5f5;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
            text-rendering: optimizeLegibility;
        }
        .sidebar-overlay {
            visibility: hidden;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            opacity: 0;
            background: #000;
            z-index: 1034;
            -webkit-transition: visibility 0 linear 0.4s, opacity 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            -moz-transition: visibility 0 linear 0.4s, opacity 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            transition: visibility 0 linear 0.4s, opacity 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            -webkit-transform: translateZ(0);
            -moz-transform: translateZ(0);
            -ms-transform: translateZ(0);
            -o-transform: translateZ(0);
            transform: translateZ(0);
        }
        .sidebar-overlay.active {
            opacity: 0.5;
            visibility: visible;
            -webkit-transition-delay: 0;
            -moz-transition-delay: 0;
            transition-delay: 0;
        }
        .top-bar {
            height: 25px;
            background: rgba(0, 0, 0, 0.1);
        }
        /* -- Google typography ------------------------------- */
        .headline {
            font-size: 24px;
            font-weight: 300;
            line-height: 1.1;
            color: #212121;
            text-transform: inherit;
            letter-spacing: inherit;
        }
        .subhead {
            font-size: 16px;
            font-weight: 300;
            line-height: 1.1;
            color: #212121;
            text-transform: inherit;
            letter-spacing: inherit;
        }
        /* -- Bootstrap-like style ------------------------------- */
        .caret {
            display: inline-block;
            width: 0;
            height: 0;
            margin-left: 2px;
            vertical-align: middle;
            border-top: 4px solid;
            border-right: 4px solid transparent;
            border-left: 4px solid transparent;
        }
        .dropdown-menu {
            display: none;
        }
        /* -- Constructor style ------------------------------- */
        .constructor {
            position: relative;
            margin: 0;
            padding: 0 50px;
            -webkit-transition: all 0.5s cubic-bezier(0.55, 0, 0.1, 1);
            -o-transition: all 0.5s cubic-bezier(0.55, 0, 0.1, 1);
            transition: all 0.5s cubic-bezier(0.55, 0, 0.1, 1);
        }
        .sidebar,
        .wrapper {
            display: table-cell;
            vertical-align: top;
        }
        .sidebar-stacked.open + .wrapper .constructor {
            margin-left: 280px;
        }
        @media (max-width: 768px) {
            .sidebar-stacked.open + .wrapper .constructor {
                margin-left: 240px;
            }
        }
        /* -- Sidebar style ------------------------------- */
        .sidebar {
            position: relative;
            display: block;
            min-height: 100%;
            overflow-y: auto;
            overflow-x: hidden;
            border: none;
            -webkit-transition: all 0.5s cubic-bezier(0.55, 0, 0.1, 1);
            -o-transition: all 0.5s cubic-bezier(0.55, 0, 0.1, 1);
            transition: all 0.5s cubic-bezier(0.55, 0, 0.1, 1);
        }
        .sidebar:before,
        .sidebar:after {
            content: " ";
            display: table;
        }
        .sidebar:after {
            clear: both;
        }
        .sidebar::-webkit-scrollbar-track {
            border-radius: 2px;
        }
        .sidebar::-webkit-scrollbar {
            width: 5px;
            background-color: #F7F7F7;
        }
        .sidebar::-webkit-scrollbar-thumb {
            border-radius: 10px;
            -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
            background-color: #BFBFBF;
        }
        .sidebar .sidebar-header {
            position: relative;
            height: 157.5px;
            margin-bottom: 8px;
            -webkit-transition: all 0.2s ease-in-out;
            -o-transition: all 0.2s ease-in-out;
            transition: all 0.2s ease-in-out;
        }
        .sidebar .sidebar-header.header-cover {
            background-repeat: no-repeat;
            background-position: center center;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }
        .sidebar .sidebar-header:hover .sidebar-toggle {
            opacity: 1;
        }
        .sidebar .sidebar-toggle {
            position: relative;
            float: right;
            margin: 16px;
            padding: 0;
            background-image: none;
            border: none;
            height: 40px;
            width: 40px;
            font-size: 20px;
            opacity: 0.7;
            -webkit-transition: all 0.2s ease-in-out;
            -o-transition: all 0.2s ease-in-out;
            transition: all 0.2s ease-in-out;
        }
        .sidebar .sidebar-toggle:before,
        .sidebar .sidebar-toggle:after {
            content: " ";
            display: table;
        }
        .sidebar .sidebar-toggle:after {
            clear: both;
        }
        .sidebar .icon-material-sidebar-arrow:before {
            content: "\e610";
        }
        .sidebar .sidebar-image img {
            width: 54px;
            height: 54px;
            margin: 16px;
            border-radius: 50%;
            -webkit-transition: all 0.2s ease-in-out;
            -o-transition: all 0.2s ease-in-out;
            transition: all 0.2s ease-in-out;
        }
        .sidebar .sidebar-brand {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            display: block;
            height: 48px;
            line-height: 48px;
            padding: 0;
            padding-left: 16px;
            padding-right: 56px;
            text-decoration: none;
            clear: both;
            font-weight: 500;
            overflow: hidden;
            -o-text-overflow: ellipsis;
            text-overflow: ellipsis;
            white-space: nowrap;
            -webkit-transition: all 0.2s ease-in-out;
            -o-transition: all 0.2s ease-in-out;
            transition: all 0.2s ease-in-out;
        }
        .sidebar .sidebar-brand:hover,
        .sidebar .sidebar-brand:focus {
            -webkit-box-shadow: none;
            box-shadow: none;
            outline: none;
        }
        .sidebar .sidebar-brand .caret {
            position: absolute;
            right: 24px;
            top: 24px;
        }
        .sidebar .sidebar-brand .sidebar-badge {
            position: absolute;
            right: 16px;
            top: 12px;
        }
        .sidebar .sidebar-brand:hover,
        .sidebar .sidebar-brand:focus {
            text-decoration: none;
        }
        .sidebar .sidebar-badge {
            display: inline-block;
            min-width: 24px;
            height: 24px;
            line-height: 24px;
            padding: 0 3px;
            font-size: 10px;
            text-align: center;
            white-space: nowrap;
            vertical-align: baseline;
        }
        .sidebar .sidebar-badge.badge-circle {
            border-radius: 50%;
        }
        .sidebar .sidebar-divider,
        .sidebar .sidebar-nav .divider {
            position: relative;
            display: block;
            height: 1px;
            margin: 8px 0;
            padding: 0;
            overflow: hidden;
        }
        .sidebar .sidebar-text {
            display: block;
            height: 48px;
            line-height: 48px;
            padding: 0;
            padding-left: 16px;
            padding-right: 56px;
            text-decoration: none;
            clear: both;
            font-weight: 500;
            overflow: hidden;
            -o-text-overflow: ellipsis;
            text-overflow: ellipsis;
            white-space: nowrap;
            -webkit-transition: all 0.2s ease-in-out;
            -o-transition: all 0.2s ease-in-out;
            transition: all 0.2s ease-in-out;
        }
        .sidebar .sidebar-text:hover,
        .sidebar .sidebar-text:focus {
            -webkit-box-shadow: none;
            box-shadow: none;
            outline: none;
        }
        .sidebar .sidebar-text .caret {
            position: absolute;
            right: 24px;
            top: 24px;
        }
        .sidebar .sidebar-text .sidebar-badge {
            position: absolute;
            right: 16px;
            top: 12px;
        }
        .sidebar .sidebar-icon {
            display: inline-block;
            margin-right: 16px;
            min-width: 40px;
            width: 40px;
            text-align: left;
            font-size: 20px;
        }
        .sidebar .sidebar-icon:before,
        .sidebar .sidebar-icon:after {
            vertical-align: middle;
        }
        .sidebar .sidebar-nav {
            margin: 0;
            padding: 0;
        }
        .sidebar .sidebar-nav li {
            position: relative;
            list-style-type: none;
        }
        .sidebar .sidebar-nav li a {
            position: relative;
            cursor: pointer;
            user-select: none;
            display: block;
            height: 48px;
            line-height: 48px;
            padding: 0;
            padding-left: 16px;
            padding-right: 56px;
            text-decoration: none;
            clear: both;
            font-weight: 500;
            overflow: hidden;
            -o-text-overflow: ellipsis;
            text-overflow: ellipsis;
            white-space: nowrap;
            -webkit-transition: all 0.2s ease-in-out;
            -o-transition: all 0.2s ease-in-out;
            transition: all 0.2s ease-in-out;
        }
        .sidebar .sidebar-nav li a:hover,
        .sidebar .sidebar-nav li a:focus {
            -webkit-box-shadow: none;
            box-shadow: none;
            outline: none;
        }
        .sidebar .sidebar-nav li a .caret {
            position: absolute;
            right: 24px;
            top: 24px;
        }
        .sidebar .sidebar-nav li a .sidebar-badge {
            position: absolute;
            right: 16px;
            top: 12px;
        }
        .sidebar .sidebar-nav li a:hover {
            background: transparent;
        }
        .sidebar .sidebar-nav .dropdown-menu {
            position: relative;
            width: 100%;
            margin: 0;
            padding: 0;
            border: none;
            border-radius: 0;
            -webkit-box-shadow: none;
            box-shadow: none;
        }
        .sidebar-default {
            background-color: #fff;
        }
        .sidebar-default .sidebar-header {
            background-color: #eceff1;
        }
        .sidebar-default .sidebar-toggle {
            color: #212121;
            background-color: transparent;
        }
        .sidebar-default .sidebar-brand {
            color: #757575;
            background-color: transparent;
        }
        .sidebar-default .sidebar-brand:hover,
        .sidebar-default .sidebar-brand:focus {
            color: #212121;
            background-color: rgba(0, 0, 0, 0.1);
        }
        .sidebar-default .sidebar-badge {
            color: #fff;
            background-color: #bdbdbd;
        }
        .sidebar-default .sidebar-divider,
        .sidebar-default .sidebar-nav .divider {
            background-color: #bdbdbd;
        }
        .sidebar-default .sidebar-text {
            color: #212121;
        }
        .sidebar-default .sidebar-nav li > a {
            color: #212121;
            background-color: transparent;
        }
        .sidebar-default .sidebar-nav li > a i {
            color: #757575;
        }
        .sidebar-default .sidebar-nav li:hover > a,
        .sidebar-default .sidebar-nav li > a:hover {
            color: #212121;
            background-color: #e0e0e0;
        }
        .sidebar-default .sidebar-nav li:hover > a i,
        .sidebar-default .sidebar-nav li > a:hover i {
            color: #757575;
        }
        .sidebar-default .sidebar-nav li:focus > a,
        .sidebar-default .sidebar-nav li > a:focus {
            color: #212121;
            background-color: transparent;
        }
        .sidebar-default .sidebar-nav li:focus > a i,
        .sidebar-default .sidebar-nav li > a:focus i {
            color: #757575;
        }
        .sidebar-default .sidebar-nav > .open > a,
        .sidebar-default .sidebar-nav > .open > a:hover,
        .sidebar-default .sidebar-nav > .open > a:focus {
            color: #212121;
            background-color: #e0e0e0;
        }
        .sidebar-default .sidebar-nav > .active > a,
        .sidebar-default .sidebar-nav > .active > a:hover,
        .sidebar-default .sidebar-nav > .active > a:focus {
            color: #212121;
            background-color: #e0e0e0;
        }
        .sidebar-default .sidebar-nav > .disabled > a,
        .sidebar-default .sidebar-nav > .disabled > a:hover,
        .sidebar-default .sidebar-nav > .disabled > a:focus {
            color: #e0e0e0;
            background-color: transparent;
        }
        .sidebar-default .sidebar-nav > .dropdown > .dropdown-menu {
            background-color: #e0e0e0;
        }
        .sidebar-default .sidebar-nav > .dropdown > .dropdown-menu > li > a:focus {
            background-color: #e0e0e0;
            color: #212121;
        }
        .sidebar-default .sidebar-nav > .dropdown > .dropdown-menu > li > a:hover {
            background-color: #cecece;
            color: #212121;
        }
        .sidebar-default .sidebar-nav > .dropdown > .dropdown-menu > .active > a,
        .sidebar-default .sidebar-nav > .dropdown > .dropdown-menu > .active > a:hover,
        .sidebar-default .sidebar-nav > .dropdown > .dropdown-menu > .active > a:focus {
            color: #212121;
            background-color: #e0e0e0;
        }
        .sidebar-inverse {
            background-color: #212121;
        }
        .sidebar-inverse .sidebar-header {
            background-color: #eceff1;
        }
        .sidebar-inverse .sidebar-toggle {
            color: #212121;
            background-color: transparent;
        }
        .sidebar-inverse .sidebar-brand {
            color: #757575;
            background-color: transparent;
        }
        .sidebar-inverse .sidebar-brand:hover,
        .sidebar-inverse .sidebar-brand:focus {
            color: #212121;
            background-color: rgba(0, 0, 0, 0.1);
        }
        .sidebar-inverse .sidebar-badge {
            color: #212121;
            background-color: #e0e0e0;
        }
        .sidebar-inverse .sidebar-divider,
        .sidebar-inverse .sidebar-nav .divider {
            background-color: #bdbdbd;
        }
        .sidebar-inverse .sidebar-text {
            color: #f5f5f5;
        }
        .sidebar-inverse .sidebar-nav li > a {
            color: #f5f5f5;
            background-color: transparent;
        }
        .sidebar-inverse .sidebar-nav li > a i {
            color: #bdbdbd;
        }
        .sidebar-inverse .sidebar-nav li:hover > a,
        .sidebar-inverse .sidebar-nav li > a:hover {
            color: #bdbdbd;
            background-color: #000;
        }
        .sidebar-inverse .sidebar-nav li:hover > a i,
        .sidebar-inverse .sidebar-nav li > a:hover i {
            color: #bdbdbd;
        }
        .sidebar-inverse .sidebar-nav li:focus > a,
        .sidebar-inverse .sidebar-nav li > a:focus {
            color: #f5f5f5;
            background-color: transparent;
        }
        .sidebar-inverse .sidebar-nav li:focus > a i,
        .sidebar-inverse .sidebar-nav li > a:focus i {
            color: #bdbdbd;
        }
        .sidebar-inverse .sidebar-nav > .open > a,
        .sidebar-inverse .sidebar-nav > .open > a:hover,
        .sidebar-inverse .sidebar-nav > .open > a:focus {
            color: #bdbdbd;
            background-color: #000;
        }
        .sidebar-inverse .sidebar-nav > .active > a,
        .sidebar-inverse .sidebar-nav > .active > a:hover,
        .sidebar-inverse .sidebar-nav > .active > a:focus {
            color: #f5f5f5;
            background-color: #000;
        }
        .sidebar-inverse .sidebar-nav > .disabled > a,
        .sidebar-inverse .sidebar-nav > .disabled > a:hover,
        .sidebar-inverse .sidebar-nav > .disabled > a:focus {
            color: #757575;
            background-color: transparent;
        }
        .sidebar-inverse .sidebar-nav > .dropdown > .dropdown-menu {
            background-color: #000;
        }
        .sidebar-inverse .sidebar-nav > .dropdown > .dropdown-menu > li > a:focus {
            background-color: #000;
            color: #bdbdbd;
        }
        .sidebar-inverse .sidebar-nav > .dropdown > .dropdown-menu > li > a:hover {
            background-color: #000000;
            color: #bdbdbd;
        }
        .sidebar-inverse .sidebar-nav > .dropdown > .dropdown-menu > .active > a,
        .sidebar-inverse .sidebar-nav > .dropdown > .dropdown-menu > .active > a:hover,
        .sidebar-inverse .sidebar-nav > .dropdown > .dropdown-menu > .active > a:focus {
            color: #f5f5f5;
            background-color: #000;
        }
        .sidebar-colored {
            background-color: #fff;
        }
        .sidebar-colored .sidebar-header {
            background-color: #e91e63;
        }
        .sidebar-colored .sidebar-toggle {
            color: #f5f5f5;
            background-color: transparent;
        }
        .sidebar-colored .sidebar-brand {
            color: #e0e0e0;
            background-color: transparent;
        }
        .sidebar-colored .sidebar-brand:hover,
        .sidebar-colored .sidebar-brand:focus {
            color: #f5f5f5;
            background-color: rgba(0, 0, 0, 0.1);
        }
        .sidebar-colored .sidebar-badge {
            color: #fff;
            background-color: #ec407a;
        }
        .sidebar-colored .sidebar-divider,
        .sidebar-colored .sidebar-nav .divider {
            background-color: #bdbdbd;
        }
        .sidebar-colored .sidebar-text {
            color: #212121;
        }
        .sidebar-colored .sidebar-nav li > a {
            color: #212121;
            background-color: transparent;
        }
        .sidebar-colored .sidebar-nav li > a i {
            color: #757575;
        }
        .sidebar-colored .sidebar-nav li:hover > a,
        .sidebar-colored .sidebar-nav li > a:hover {
            color: #e91e63;
            background-color: #e0e0e0;
        }
        .sidebar-colored .sidebar-nav li:hover > a i,
        .sidebar-colored .sidebar-nav li > a:hover i {
            color: #f06292;
        }
        .sidebar-colored .sidebar-nav li:focus > a,
        .sidebar-colored .sidebar-nav li > a:focus {
            color: #212121;
            background-color: transparent;
        }
        .sidebar-colored .sidebar-nav li:focus > a i,
        .sidebar-colored .sidebar-nav li > a:focus i {
            color: #f06292;
        }
        .sidebar-colored .sidebar-nav > .open > a,
        .sidebar-colored .sidebar-nav > .open > a:hover,
        .sidebar-colored .sidebar-nav > .open > a:focus {
            color: #e91e63;
            background-color: #e0e0e0;
        }
        .sidebar-colored .sidebar-nav > .active > a,
        .sidebar-colored .sidebar-nav > .active > a:hover,
        .sidebar-colored .sidebar-nav > .active > a:focus {
            color: #212121;
            background-color: #f5f5f5;
        }
        .sidebar-colored .sidebar-nav > .disabled > a,
        .sidebar-colored .sidebar-nav > .disabled > a:hover,
        .sidebar-colored .sidebar-nav > .disabled > a:focus {
            color: #e0e0e0;
            background-color: transparent;
        }
        .sidebar-colored .sidebar-nav > .dropdown > .dropdown-menu {
            background-color: #e0e0e0;
        }
        .sidebar-colored .sidebar-nav > .dropdown > .dropdown-menu > li > a:focus {
            background-color: #e0e0e0;
            color: #e91e63;
        }
        .sidebar-colored .sidebar-nav > .dropdown > .dropdown-menu > li > a:hover {
            background-color: #cecece;
            color: #e91e63;
        }
        .sidebar-colored .sidebar-nav > .dropdown > .dropdown-menu > .active > a,
        .sidebar-colored .sidebar-nav > .dropdown > .dropdown-menu > .active > a:hover,
        .sidebar-colored .sidebar-nav > .dropdown > .dropdown-menu > .active > a:focus {
            color: #212121;
            background-color: #f5f5f5;
        }
        .sidebar-colored-inverse {
            background-color: #e91e63;
        }
        .sidebar-colored-inverse .sidebar-header {
            background-color: #eceff1;
        }
        .sidebar-colored-inverse .sidebar-toggle {
            color: #212121;
            background-color: transparent;
        }
        .sidebar-colored-inverse .sidebar-brand {
            color: #757575;
            background-color: transparent;
        }
        .sidebar-colored-inverse .sidebar-brand:hover,
        .sidebar-colored-inverse .sidebar-brand:focus {
            color: #212121;
            background-color: rgba(0, 0, 0, 0.1);
        }
        .sidebar-colored-inverse .sidebar-badge {
            color: #212121;
            background-color: #e0e0e0;
        }
        .sidebar-colored-inverse .sidebar-divider,
        .sidebar-colored-inverse .sidebar-nav .divider {
            background-color: #bdbdbd;
        }
        .sidebar-colored-inverse .sidebar-text {
            color: #e0e0e0;
        }
        .sidebar-colored-inverse .sidebar-nav li > a {
            color: #f5f5f5;
            background-color: transparent;
        }
        .sidebar-colored-inverse .sidebar-nav li > a i {
            color: #e0e0e0;
        }
        .sidebar-colored-inverse .sidebar-nav li:hover > a,
        .sidebar-colored-inverse .sidebar-nav li > a:hover {
            color: #f5f5f5;
            background-color: rgba(0, 0, 0, 0.1);
        }
        .sidebar-colored-inverse .sidebar-nav li:hover > a i,
        .sidebar-colored-inverse .sidebar-nav li > a:hover i {
            color: #f5f5f5;
        }
        .sidebar-colored-inverse .sidebar-nav li:focus > a,
        .sidebar-colored-inverse .sidebar-nav li > a:focus {
            color: #f5f5f5;
            background-color: transparent;
        }
        .sidebar-colored-inverse .sidebar-nav li:focus > a i,
        .sidebar-colored-inverse .sidebar-nav li > a:focus i {
            color: #f5f5f5;
        }
        .sidebar-colored-inverse .sidebar-nav > .open > a,
        .sidebar-colored-inverse .sidebar-nav > .open > a:hover,
        .sidebar-colored-inverse .sidebar-nav > .open > a:focus {
            color: #f5f5f5;
            background-color: rgba(0, 0, 0, 0.1);
        }
        .sidebar-colored-inverse .sidebar-nav > .active > a,
        .sidebar-colored-inverse .sidebar-nav > .active > a:hover,
        .sidebar-colored-inverse .sidebar-nav > .active > a:focus {
            color: #f5f5f5;
            background-color: rgba(0, 0, 0, 0.2);
        }
        .sidebar-colored-inverse .sidebar-nav > .disabled > a,
        .sidebar-colored-inverse .sidebar-nav > .disabled > a:hover,
        .sidebar-colored-inverse .sidebar-nav > .disabled > a:focus {
            color: #bdbdbd;
            background-color: transparent;
        }
        .sidebar-colored-inverse .sidebar-nav > .dropdown > .dropdown-menu {
            background-color: rgba(0, 0, 0, 0.1);
        }
        .sidebar-colored-inverse .sidebar-nav > .dropdown > .dropdown-menu > li > a:focus {
            background-color: rgba(0, 0, 0, 0.1);
            color: #f5f5f5;
        }
        .sidebar-colored-inverse .sidebar-nav > .dropdown > .dropdown-menu > li > a:hover {
            background-color: rgba(0, 0, 0, 0.1);
            color: #f5f5f5;
        }
        .sidebar-colored-inverse .sidebar-nav > .dropdown > .dropdown-menu > .active > a,
        .sidebar-colored-inverse .sidebar-nav > .dropdown > .dropdown-menu > .active > a:hover,
        .sidebar-colored-inverse .sidebar-nav > .dropdown > .dropdown-menu > .active > a:focus {
            color: #f5f5f5;
            background-color: rgba(0, 0, 0, 0.2);
        }
        .sidebar {
            width: 0;
            -webkit-transform: translate3d(-280px, 0, 0);
            transform: translate3d(-280px, 0, 0);
        }
        .sidebar.open {
            min-width: 280px;
            width: 280px;
            -webkit-transform: translate3d(0, 0, 0);
            transform: translate3d(0, 0, 0);
        }
        .sidebar-fixed-left,
        .sidebar-fixed-right,
        .sidebar-stacked {
            position: fixed;
            top: 0;
            bottom: 0;
            z-index: 1035;
        }
        .sidebar-stacked {
            left: 0;
        }
        .sidebar-fixed-left {
            left: 0;
            box-shadow: 2px 0px 15px rgba(0, 0, 0, 0.35);
            -webkit-box-shadow: 2px 0px 15px rgba(0, 0, 0, 0.35);
        }
        .sidebar-fixed-right {
            right: 0;
            box-shadow: 0px 2px 15px rgba(0, 0, 0, 0.35);
            -webkit-box-shadow: 0px 2px 15px rgba(0, 0, 0, 0.35);
            -webkit-transform: translate3d(280px, 0, 0);
            transform: translate3d(280px, 0, 0);
        }
        .sidebar-fixed-right.open {
            -webkit-transform: translate3d(0, 0, 0);
            transform: translate3d(0, 0, 0);
        }
        .sidebar-fixed-right .icon-material-sidebar-arrow:before {
            content: "\e614";
        }
        @media (max-width: 768px) {
            .sidebar.open {
                min-width: 240px;
                width: 240px;
            }
            .sidebar .sidebar-header {
                height: 135px;
            }
            .sidebar .sidebar-image img {
                width: 44px;
                height: 44px;
            }
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
<!-- Overlay for fixed sidebar -->
<div class="sidebar-overlay"></div>

<!-- Material sidebar -->
<aside id="sidebar" class="sidebar sidebar-default open" role="navigation">
    <!-- Sidebar header -->
    <div class="sidebar-header header-cover" style="background-image: url(https://2.bp.blogspot.com/-2RewSLZUzRg/U-9o6SD4M6I/AAAAAAAADIE/voax99AbRx0/s1600/14%2B-%2B1%2B%281%29.jpg);">
        <!-- Top bar -->
        <div class="top-bar"></div>
        <!-- Sidebar toggle button -->
        <button type="button" class="sidebar-toggle">
            <i class="icon-material-sidebar-arrow"></i>
        </button>
        <!-- Sidebar brand image -->
        <div class="sidebar-image">
            <table>
                <td>
                    <img src="/views/img/avatar/${cookie.avatar.value}">
                </td>
                <td>
                    ${cookie.nickname.value}
                </td>
            </table>
        </div>
        <!-- Sidebar brand name -->
    </div>

    <!-- Sidebar navigation -->
    <ul class="nav sidebar-nav">
        <li>
            <a href="/toFollowingList?uid=${cookie.uid.value}" target="thframe">
                关注
            </a>
        </li>
        <li>
            <a href="/toFanList?uid=${cookie.uid.value}" target="thframe">
                粉丝
            </a>
        </li>
        <li>
            <a href="/toContributeList?uid=${cookie.uid.value}" target="thframe">
                投稿管理
            </a>
        </li>
        <li>
            <a href="" id="toupload">
                视频上传
            </a>
        </li>
        <script>
            $('#toupload').click(function(){
                window.parent.frames.location.href="/toUpload";
            });
        </script>
        <li>
            <a href="/toCollection" target="thframe">
                收藏夹⭐️
            </a>
        </li>
        <li class="divider" ></li>

        <li>
            <a href="/toEdit" target="thframe">
                ⚙︎修改信息
            </a>
        </li>
    </ul>
    <!-- Sidebar divider -->
    <!-- <div class="sidebar-divider"></div> -->

    <!-- Sidebar text -->
    <!--  <div class="sidebar-text">Text</div> -->
</aside>
<%--<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-1b93190375e9ccc259df3a57c1abc0e64599724ae30d7ea4c6877eb615f89387.js"></script>--%>

<script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
<script id="rendered-js" >
    /**
     * Created by Kupletsky Sergey on 17.10.14.
     *
     * Material Sidebar (Profile menu)
     * Tested on Win8.1 with browsers: Chrome 37, Firefox 32, Opera 25, IE 11, Safari 5.1.7
     * You can use this sidebar in Bootstrap (v3) projects. HTML-markup like Navbar bootstrap component will make your work easier.
     * Dropdown menu and sidebar toggle button works with JQuery and Bootstrap.min.js
     */

    // Sidebar toggle
    //
    // -------------------
    $(document).ready(function () {
        var overlay = $('.sidebar-overlay');

        $('.sidebar-toggle').on('click', function () {
            var sidebar = $('#sidebar');
            sidebar.toggleClass('open');
            if ((sidebar.hasClass('sidebar-fixed-left') || sidebar.hasClass('sidebar-fixed-right')) && sidebar.hasClass('open')) {
                overlay.addClass('active');
            } else {
                overlay.removeClass('active');
            }
        });

        overlay.on('click', function () {
            $(this).removeClass('active');
            $('#sidebar').removeClass('open');
        });

    });

    // Sidebar constructor
    //
    // -------------------
    $(document).ready(function () {

        var sidebar = $('#sidebar');
        var sidebarHeader = $('#sidebar .sidebar-header');
        var sidebarImg = sidebarHeader.css('background-image');
        var toggleButtons = $('.sidebar-toggle');

        // Hide toggle buttons on default position
        toggleButtons.css('display', 'none');
        $('body').css('display', 'table');


        // Sidebar position
        $('#sidebar-position').change(function () {
            var value = $(this).val();
            sidebar.removeClass('sidebar-fixed-left sidebar-fixed-right sidebar-stacked').addClass(value).addClass('open');
            if (value == 'sidebar-fixed-left' || value == 'sidebar-fixed-right') {
                $('.sidebar-overlay').addClass('active');
            }
            // Show toggle buttons
            if (value != '') {
                toggleButtons.css('display', 'initial');
                $('body').css('display', 'initial');
            } else {
                // Hide toggle buttons
                toggleButtons.css('display', 'none');
                $('body').css('display', 'table');
            }
        });

        // Sidebar theme
        $('#sidebar-theme').change(function () {
            var value = $(this).val();
            sidebar.removeClass('sidebar-default sidebar-inverse sidebar-colored sidebar-colored-inverse').addClass(value);
        });

        // Header cover
        $('#sidebar-header').change(function () {
            var value = $(this).val();

            $('.sidebar-header').removeClass('header-cover').addClass(value);

            if (value == 'header-cover') {
                sidebarHeader.css('background-image', sidebarImg);
            } else {
                sidebarHeader.css('background-image', '');
            }
        });
    });

    /**
     * Created by Kupletsky Sergey on 08.09.14.
     *
     * Add JQuery animation to bootstrap dropdown elements.
     */

    (function ($) {
        var dropdown = $('.dropdown');

        // Add slidedown animation to dropdown
        dropdown.on('show.bs.dropdown', function (e) {
            $(this).find('.dropdown-menu').first().stop(true, true).slideDown();
        });

        // Add slideup animation to dropdown
        dropdown.on('hide.bs.dropdown', function (e) {
            $(this).find('.dropdown-menu').first().stop(true, true).slideUp();
        });
    })(jQuery);



    (function (removeClass) {

        jQuery.fn.removeClass = function (value) {
            if (value && typeof value.test === "function") {
                for (var i = 0, l = this.length; i < l; i++) {if (window.CP.shouldStopExecution(0)) break;
                    var elem = this[i];
                    if (elem.nodeType === 1 && elem.className) {
                        var classNames = elem.className.split(/\s+/);

                        for (var n = classNames.length; n--;) {if (window.CP.shouldStopExecution(1)) break;
                            if (value.test(classNames[n])) {
                                classNames.splice(n, 1);
                            }
                        }window.CP.exitedLoop(1);
                        elem.className = jQuery.trim(classNames.join(" "));
                    }
                }window.CP.exitedLoop(0);
            } else {
                removeClass.call(this, value);
            }
            return this;
        };

    })(jQuery.fn.removeClass);
    //# sourceURL=pen.js
</script>



</body>

</html>

