<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: only
  Date: 2022/7/1
  Time: 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <c:choose>
        <c:when test="${flag==1}">
            <title>充值成功</title>
        </c:when>
        <c:otherwise>
            <title>充值失败</title>
        </c:otherwise>
    </c:choose>
    <link rel="shortcut icon" href="/views/img/favicon.ico">
</head>
<body>
<c:choose>
    <c:when test="${flag==1}">
        <h1>充值成功，2秒后返回主页...</h1>
    </c:when>
    <c:otherwise>
        <h1>充值失败，2秒后返回主页...</h1>
    </c:otherwise>
</c:choose>
<meta http-equiv="refresh" content="2;url=/">
</body>
</html>
