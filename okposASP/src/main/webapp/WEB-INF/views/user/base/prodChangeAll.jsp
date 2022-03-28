<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>OKPOS WebPOS</title>
	<link rel="icon" href="/resources/img/favicon.png">
	<link rel="stylesheet" href="/resources/css/common.css">
	<link rel="stylesheet" href="/resources/css/header.css">
	<link rel="stylesheet" href="/resources/css/okposBodyBoundary.css">
	<link rel="stylesheet" href="/resources/css/sub.css">
	<link rel="stylesheet" href="/resources/css/prodChangeAll.css">
</head>
<body id="prodChangeAll">
<!-- header -->
<c:import url="../header.jsp" />

<!-- 본문 -->
<section class="okposBodyBoundary-sub">
	<!-- topQuick -->
	<nav class="topQuick-header">
		<ul class="collapse-list">
			<li>
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
	            	<path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
		            <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
		        </svg>
			</li>
			<li class="MenuName">상품정보일괄변경</li>
			<li class="MenuLocation float-right">기초관리 > 상품관리 > 상품정보일괄변경</li>
		</ul>
	</nav>
	
	<nav class="pill">
		<ul class="collapse-list">
			<li class="">상품정보</li>
			<li class="">안전재고</li>
			<li class="active">추가금액</li>
			<li class="">포인트</li>
			<li class="">스탬프</li>
			<li class="">상품명</li>
		</ul>
	</nav>
	
	<div class="topQuick-body">
		<ul class="collapse-list">
			<li>코드 <input type="text" class="code" name="prod-code"></li>
			<li>상품명 <input type="text" class="name" name="prod-name"></li>		
			<li>바코드 <input type="text" class="barcode" name="prod-barcode"></li>		
			<li>검색줄수 <input type="number" value="500" name="limit-row"></li>
			<li><input type="submit" value="조회" class="btn btn-gradient-black"></li>
		</ul>
		<ul class="collapse-list">
			<li>분류조회 <input type="text" value="오케이포스" disabled></li>
			<li>거래처
				<select>
					<option>-전체-</option>
				</select>
			</li>
		</ul>
		<ul class="collapse-list">
			<li>포장시 할인요금 <input type="number">원</li>
			<li><input type="button" class="btn btn-gradient-orange" value="적용"></li>
			<li class="float-right"><input type="button" class="btn btn-gradient-black" value="저장"></li>
		</ul>
	</div>
	
	<!-- table -->
	<div class="mainMenu-wrap">
		<div class="mainMenu-body">
			<div class="table-wrap">
				<div class="tableY-scroll">
					<table class="table">
						<colgroup>
							<col width="4%">
							<col width="10%">
							<col width="35%">
							<col width="">
							<col width="">
							<col width="8%">
							<col width="10%">
							<col width="10%">
						</colgroup>
						<tr>
							<td><input type="checkbox"></td>
							<td>상품코드</td>
							<td>상품명</td>
							<td>대분류</td>
							<td>브랜드</td>
							<td>판매상품여부</td>
							<td>판매금액</td>
							<td>포장시 할인요금</td>
						</tr>
						<c:forEach begin="0" end="100">
							<tr>
								<td><input type="checkbox"></td>
								<td>7000006</td>
								<td>초코라떼</td>
								<td>오케이포스</td>
								<td>기본</td>
								<td>Yes</td>
								<td>2,500</td>
								<td>0</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<!-- ./table-wrap -->
		</div>
		<!-- ./mainMenu-body -->
	</div>
	<!-- ./mainMenu-wrap -->		
</section>

</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/resources/js/common.js"></script>
<script src="/resources/js/header.js"></script>
</html>