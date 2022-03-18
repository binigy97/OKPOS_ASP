<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>OKPOS WebPO</title>
<link rel="icon" href="/resources/img/favicon.png">
<link rel="stylesheet" href="/resources/css/common.css">
<style type="text/css">
body {
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 0;
	height: 60vh;
}
input {
	width: 150px;
	height: 35px;
	color: #555;
	font-size: midium;
	font-weight: bold;
	border-color: darkgray;
	border-radius: 3px;
	background-color: #e2e2e2;
}
input:hover {
	color: white;
	background-color: #a2a2a2;
}
</style>
</head>
<body style="text-align:center;">
	<div>
		<h1 style="color:gray;">존재하지 않는 페이지입니다.</h1>
		<h3 style="color:darkgray;">잘못된 주소로 접속했거나 요청하신 페이지가 삭제되었습니다.</h3>
		<input type="button" value="이전으로" onclick="history.back()">
	</div>
</body>
</html>