<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="stylesheet" href="/resources/css/index.css">
</head>
<body>
<!-- header -->
<c:import url="header.jsp" />

<!-- 본문 -->
<section class="okposBodyBoundary indexPage">
    <div class="partition-wrapper">
        <!-- 시스템전용게시판 -->
        <article class="partition">
            <div class="partition-header flex justify-content-between">
                <div class="btn btn-gradient-greentea btn-disabled">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
                        <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                        <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                    </svg><span class="boardName">시스템전용게시판</span>
                </div>
                <div class="btn-more">MORE
	                <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
						<path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
					</svg>
                </div>
            </div>
            <div class="partition-body">
                <table id="systemBoard">
                    <colgroup>
                        <col width="1%"/>
                        <col width="80%"/>
                        <col width=""/>
                    </colgroup>
                    <c:forEach var="sb" items="${sysBoard }" >
	                    <tr>
	                        <td class="listmark">
	                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-dot" viewBox="0 0 16 16">
	                                <path d="M8 9.5a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z"/>
	                            </svg>
	                        </td>
	                        <td class="boardTitle">${sb.title }</td>
	                        <c:set var="regdate" value="${sb.regdate }" />
	                        <td class="boradRegdate">${fn:substring(regdate, 0, 10) }</td>
                    	</tr>
                    </c:forEach>
                </table>
            </div>
        </article>
        <!-- 날씨 -->
        <article class="partition">
        	<div class="partition-header flex justify-content-between">
                <div class="btn btn-gradient-greentea btn-disabled">
                	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
                    	<path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                    	<path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                  	</svg><span class="boardName">서울날씨</span>
                </div>
                <div class="btn-more">MORE
	                <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
						<path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
					</svg>
                </div>
            </div>
            <div class="partition-body">
                <div id="weather" class="flex">
                	<c:forEach items="${weatherList }" var="w" begin="0" end="4">
                		<ul>
                			<li class="row-day"><span>${w.dayHangle } </span><span>(${w.month }월 ${w.date }일, ${w.week })</span></li>
                			<li class="row-img"><img src="${w.iconUrl }"></li>
                			<li class="row-temp">최저
                				<span><fmt:formatNumber type="number" maxFractionDigits="1"  value="${w.tempMin }" /></span>&#8451 / 최고
                				<span><fmt:formatNumber type="number" maxFractionDigits="1"  value="${w.tempMax }" /></span>&#8451
                			</li>
                			<li class="row-desc">체감온도 <span>${w.feelTemp }</span>&#8451<br>습도 <span>${w.dgreeHumidity }</span></li>
                		</ul>
                	</c:forEach>
                </div>
            </div>
        </article>
    </div>
    
    <div class="partition-wrapper">
    	<!-- 매출분석 -->
        <article class="partition" id="saleAnalysis">
            <div class="partition-header flex justify-content-between">
                <div class="btn btn-gradient-greentea btn-disabled">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
                        <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                        <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                    </svg><span class="boardName">매출분석</span>
	                <ul>
	                	<li><input type="radio" name="graphType" value="bar" checked><label> 막대</label></li>
	                	<li><input type="radio" name="graphType" value="doughnut"><label> 도우넛 </label></li>
	                	<li><input type="button" class="active" value="일자별(1주)"></li>
	                	<li><input type="button" value="상품별(1주)"></li>
	                	<li><input type="button" value="요일별(4주)"></li>
	                	<li><input type="button" value="월별(1년)"></li>
	                </ul>
                </div>
            </div>
            <div class="partition-body">
            	<div id="saleAnalysisGraph">
            		<canvas></canvas>
            	</div>
            	<div class="saleAnalysisTable-wrapper">
            		<table id="saleAnalysisTable">
                	<colgroup>
                		<col width="50px" />
                		<col width="200px" />
                		<col width="200px" />
                	</colgroup>
                	<tr>
                		<td>No.</td>
                		<td>일자</td>
                		<td>매출액</td>
                	</tr>
                	<!-- 일자별(1주) -->
                    <c:forEach var="sa" items="${saBoardRegdate }" begin="0" end="7" varStatus="status">
	                    <tr class="saBoard saBoardRegdate">
	                    	<td>${status.count }</td>
	                    	<td class="regdate">${sa.regdate } (${sa.week })</td>
	                    	<td class="money"><fmt:formatNumber value="${sa.money }" type="number" /></td>
                    	</tr>
                    </c:forEach>
                    <!-- 상품별(1주) -->
                    <c:forEach var="sa" items="${saBoardCode }" varStatus="status">
	                    <tr class="saBoard saBoardCode">
	                    	<td>${status.count }</td>
	                    	<td class="codeName">${sa.code }</td>
	                    	<td class="money"><fmt:formatNumber value="${sa.money }" type="number" /></td>
                    	</tr>
                    </c:forEach>
                    <!-- 요일별(4주) -->
                    <c:forEach var="sa" items="${saBoardWeek }" varStatus="status">
	                    <tr class="saBoard saBoardWeek">
	                    	<td>${status.count }</td>
	                    	<td class="codeWeek">${sa.week }</td>
	                    	<td class="money"><fmt:formatNumber value="${sa.money }" type="number" /></td>
                    	</tr>
                    </c:forEach>
                    <!-- 월별(1년) -->
                    <c:forEach var="sa" items="${saBoardMonth }" varStatus="status">
	                    <tr class="saBoard saBoardMonth">
	                    	<td>${status.count }</td>
	                    	<td class="month">${sa.month }</td>
	                    	<td class="money"><fmt:formatNumber value="${sa.money }" type="number" /></td>
                    	</tr>
                    </c:forEach>
                </table>
            	</div>
            </div>
        </article>
    </div>
    
    <div class="partition-wrapper">
    	<!-- 기타정보 -->
        <article class="partition">
        	<div class="partition-header flex justify-content-between">
                <div class="btn btn-gradient-greentea btn-disabled">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
                        <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                        <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                    </svg><span class="boardName">기타정보</span>
                </div>
                <div class="btn-more">MORE
	                <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
						<path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
					</svg>
                </div>
            </div>
            <div class="partition-body">
            	<table id="etcInfo">
            		<tr>
            			<td>입고 미확정</td>
            			<td>반품 미확정</td>
            			<td>전체 회원수</td>
            			<td>정보 미입력 회원수</td>
            			<td>관리업체명</td>
            			<td>관리업체전화번호</td>
            		</tr>
            		<c:forEach var="r" items="<%=new int[] {0, 1, 2, 3, 4, 5, 6} %>" >
	           			<tr>
		            		<c:forEach var="c" items="<%=new int[] {0, 1, 2, 3, 4, 5} %>" >
		       					<td>-</td>
			            	</c:forEach>
		            	</tr>
	            	</c:forEach>
            	</table>
            </div>
        </article>
	</div>
</section>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.min.js"></script>
<script src="/resources/js/common.js"></script>
<script src="/resources/js/header.js"></script>
<script src="/resources/js/weather.js"></script>
<script src="/resources/js/saleAnalysisGraph.js"></script>
</html>
