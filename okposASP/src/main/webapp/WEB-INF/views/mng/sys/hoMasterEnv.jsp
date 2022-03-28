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
	<link rel="stylesheet" href="/resources/css/hoMasterEnv.css">
</head>
<body>
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
			<li class="MenuName">매장환경설정</li>
			<li class="MenuLocation float-right">시스템관리 > 본사마스터 > 매장환경설정</li>
		</ul>
	</nav>
	<div class="topQuick-body">
		<ul class="collapse-list">
			<li>본사코드/명 <input type="text" class="code" name="HO-code"> <input type="text" name="HO-name"></li>
			<li>매장코드/명 <input type="text" value="T012453" class="code" name="store-code"> <input type="text" name="store-name"></li>		
			<li>용도
				<select>
					<option>-전체-</option>
				</select>
			</li>
			<li>상태
				<select>
					<option>-전체-</option>
				</select>
			</li>
			<li>검색줄수 <input type="number" value="100" name="limit-row"></li>
			<li><input type="submit" value="조회" class="btn btn-gradient-black"></li>
		</ul>
		<ul class="collapse-list">
			<li><a href="#">포스 대수 추가 매뉴얼</a></li>
		</ul>
	</div>
	
	<!-- 메인 -->
	<div class="mainMenu-wrap flex">
		<!--  메인L -->
		<article class="mainMenu-left">
			<div class="mainMenu-body">
				<div class="tableY-scroll" style="max-height: 720px;">
					<table class="table">
						<tr>
							<td>메장명</td>
							<td>용도</td>
							<td>형태</td>
						</tr>
						<tr>
							<td>전체</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>&nbsp;ㄴ[0000000] 단독매장</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;ㄴ[T012453] 쥬시(가산하이앤드점)</td>
							<td>외식</td>
							<td>오픈</td>
						</tr>
					</table>
				</div>
			</div>
		</article>
		<!--  메인R -->
		<article class="mainMenu-right">
			<nav class="mainMenu-header">
				<ul class="collapse-list">
					<li>
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
			            	<path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
				            <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
				        </svg>
					</li>
					<li id="store-code">[T012453]</li>
					<li id="store-name">쥬시(가산하이앤드점)</li>
				</ul>
			</nav>
			<nav class="pill">
				<ul class="collapse-list">
					<li class="">외식환경</li>
					<li class="">매장환경</li>
					<li class="">포스</li>
					<li class="active">포스기능</li>
					<li class="">주방프린터</li>
					<li class="">주방프린터-상품연결</li>
				</ul>
			</nav>
			<nav class="pill">
				<ul class="collapse-list">
					<li class="active">포스기능 사용관리</li>
					<li class="">포스기능 인증관리</li>
				</ul>
			</nav>
			<div class="mainMenu-body flex">
				<div class="table-wrap">
					<table>
						<tr>
							<td>
								<svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" fill="#66b613" class="bi bi-record-circle-fill" viewBox="0 0 16 16">
									<path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-8 3a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
								</svg>
								포스
							</td>
							<td>
								<button class="btn btn-gradient-orange">포스기능 일괄세팅</button>
								<button class="btn btn-gradient-orange">포스기능 복사</button>
							</td>
						</tr>
						<tr>
							<td></td>
							<td>
								<select>
									<option>[01] 01</option>
								</select>
								<span>→</span>
								<select>
									<option>[01] 01</option>
								</select>
							</td>
						</tr>
					</table>
				</div>
				<!-- ./table-wrap -->
				<div class="table-wrap">
					<table>
						<tr>
							<td>
								<svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" fill="#66b613" class="bi bi-record-circle-fill" viewBox="0 0 16 16">
									<path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-8 3a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
								</svg>
								기능
							</td>
							<td class="float-right">
								<button class="btn btn-gradient-orange">저장</button>
								<button class="btn btn-gradient-orange">Up</button>
								<button class="btn btn-gradient-orange">Dn</button>
							</td>
						</tr>
						<tr>
							<td colspan="2">POS01 결제+주문 후불제 - 일반-판매처리</td>
						</tr>
					</table>
				</div>
				<!-- ./table-wrap -->
			</div>
			<!-- ./mainMenu-body -->
			
			<div class="mainMenu-body flex">
				<div class="table-wrap">
					<div class="tableY-scroll">
						<table class="table" id="posTable">
							<tr>
								<td>포스번호</td>
								<td>기능구분</td>
								<td>배열구분</td>
								<td>기능건수</td>
								<td>기록건수</td>
							</tr>
							<tr>
								<td rowspan="4">POS01 결제+주문 후불제</td>
								<td>영업관리</td>
								<td></td>
								<td>15</td>
								<td>10</td>
							</tr>
							<tr>
								<td>테이블-일반</td>
								<td></td>
								<td>22</td>
								<td>12</td>
							</tr>
							<tr>
								<td>테이블-배달</td>
								<td></td>
								<td>14</td>
								<td>11</td>
							</tr>
							<tr>
								<td>주문취소관리</td>
								<td></td>
								<td>5</td>
								<td>5</td>
							</tr>
						</table>
					</div>
				</div>
				<!-- ./table-wrap -->
				<div class="table-wrap">
					<div class="tableY-scroll">
						<table class="table" id="sectorTable">
							<tr>
								<td>No.</td>
								<td>기능번호</td>
								<td>기능명</td>
								<td>사용</td>
							</tr>
							<tr>
								<td>1</td>
								<td>274</td>
								<td>품절</td>
								<td><input type="checkbox" checked></td>
							</tr>
						</table>
					</div>
				</div>
				<!-- ./table-wrap -->
			</div>
			<!-- ./mainMenu-body -->
		</article>
	</div>
</section>

</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/resources/js/common.js"></script>
<script src="/resources/js/header.js"></script>
<script>
	/* posTable 포스번호 rowspan에 따른 css */
	const POS_TABLE = $('#posTable');
	var posTable_row2 = POS_TABLE.find("tr").eq(2);
	var posTable_row2_col_size = posTable_row2.find('td').get().length;
	
	if (posTable_row2_col_size == 4) { /* irregular */
		var posTable_row2_over = POS_TABLE.find('tr:nth-child(n+3)');
	
		posTable_row2_over.find("td:first-child").css({"text-align":"left", "color":"blue"});
		posTable_row2_over.find("td:nth-child(2)").css({"text-align":"center", "color":"black"});
	}
</script>
</html>