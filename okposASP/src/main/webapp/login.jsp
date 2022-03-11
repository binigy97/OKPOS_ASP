<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>NetPos Login</title>
<link rel="icon" type="image/x-icon" href="/resources/img/favicon.png">
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/css/login.css">
</head>
<%-- SecurityConfig 클래스에서 loginProcessingUrl() 로 세팅한 url로 반드시 POST! --%>
<body style="margin:0">
    <hr style="margin:0;height:4px;background-color:#7eaf52;">
    
    <div class="loginWrap">
        <!-- logo -->
        <ul class="login-header collapse-list">
            <li><img src="/resources/img/logo.png"></li>
            <li>MOBILE</li>
            <li>ASP</li>
        </ul>
        <hr style="border:thin dashed #e3e3e3;">
        <form name="login" action="/loginOk" method="post">
            <ul class="collapse-list table">
                <li class="table-cell">
                    <input type="text" name="memId" placeholder="아이디">
                    <input type="password" name="memPw" placeholder="패스워드">
                </li>
                <li class="table-cell">
                    <input type="submit" value="로그인">
                </li>
            </ul>
        </form>
        <div class="copyright">&copy; OKPOS Corp.</div>
    </div><!-- ./login -->
</body>
</html>