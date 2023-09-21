<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CiliCili-全宇宙最大的视频站-管理员登录</title>
  <script src='/views/js/jquery-3.6.0.min.js'></script>
  <link rel="shortcut icon" href="/views/img/favicon.ico">
  <link rel="stylesheet" type="text/css" href="/views/css/adminlogin.css">
  <meta name="apple-mobile-web-app-title" content="CodePen">
  <link rel="apple-touch-icon" type="image/png"
        href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png"/>
  <link rel="mask-icon" type="image/x-icon"
        href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg"/>
<%--  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">--%>
<%--  <link rel="stylesheet" href="/views/css/fontawesome-free-6.4.0-web/css/all.css">--%>
  <link rel="stylesheet" href="/views/css/font-awesome-4.7.0/css/font-awesome.min.css" type="text/css"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
</head>
<body translate="no" >
  <div class="wrapper">
  <form class="login" action="/adminLogin" method="post">
    <p class="title">Log in</p>
    <input type="text" name="acc" placeholder="请输入管理员用户名" id="inacc" autofocus/>
    <i class="fa fa-user" id="i1"></i>
    <input type="password" name="pwd" placeholder="请输入管理员密码" id="inpwd" />
    <i class="fa fa-key"></i>
    <a href="#">Forgot your password?</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <button id="btn">
      <i class="spinner"></i>
      <span class="state">Log in</span>
    </button>
  </form>

  <footer id="foot">沈阳大街专案组-CiliCili视频站-管理员登录</footer>
</div>
  <script>
  window.console = window.console || function(t) {};
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
<script>
  if (document.location.search.match(/type=embed/gi)) {
    window.parent.postMessage("resize", "*");
  }
</script>
<%--<script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-1b93190375e9ccc259df3a57c1abc0e64599724ae30d7ea4c6877eb615f89387.js"></script>--%>
<script id="rendered-js" >
/** 
 * @author Stallion_X
 */
function getQueryVariable(variable)
{
       var query = window.location.search.substring(1);
       var vars = query.split("&");
       for (var i=0;i<vars.length;i++) {
               var pair = vars[i].split("=");
               if(pair[0] == variable){return pair[1];}
       }
       return null;
}
$(window).on("load",function() {
	var isSuc = getQueryVariable("isSuc");
	if (isSuc!=null&&isSuc==0) {
		$('#btn').before($('<span style="color:red;font-size:10px;">登录失败！请检查用户名密码是否正确</span>'));
	}
	
});
var working = false;
var tempa = $('#inacc');
var tempi = $('#i1');
$('#btn').on('click', function (e) {
  setTimeout("$('.login').submit()","4000");
  e.preventDefault();
  if (working) return;
  working = true;
  var $this = $('.login'),
  $state = $this.find('button > .state');
  $this.addClass('loading');
  $state.html('Authenticating');
  setTimeout(function () {
    $this.addClass('ok');
    $state.html('Welcome back!');
    setTimeout(function () {
      $state.html('Log in');
      $this.removeClass('ok loading');
      working = false;
    }, 2000);
  }, 2000);
});
</script>
</body>
</html>