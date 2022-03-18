<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
    <wrapper>
        <nav class="mainMenu">
            <img src="/resources/img/logo.png" style="width: 110px;">
            <ul class="collapse-list">
                <li class="dropdown">
                	<!-- 기초관리 -->
                	<div class="dropdown-title btn" style="color: red;"><div class="icon_num">1</div>기초관리</div>
	                <div class="dropdown-content">
	                	<div class="dropdown-item dropdown btn">
	                		<div class="dropdown-title btn">
	                			<div class="icon_num">1</div>매장관리
	                			<svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
									<path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
								</svg>
	                		</div>
			                <div class="dropdown-content-right">
			                	<a class="dropdown-item btn"><div class="icon_num">1</div>매장정보관리</a>
			                	<a class="dropdown-item btn"><div class="icon_num">2</div>사람정보관리</a>
			                	<a class="dropdown-item btn"><div class="icon_num">3</div>사람정보조회</a>
			                	<a class="dropdown-item btn"><div class="icon_num">4</div>패스워드변경</a>
			                	<a class="dropdown-item btn"><div class="icon_num">5</div>VAN/코너 정보</a>
			                	<a class="dropdown-item btn"><div class="icon_num">6</div>테이블속성</a>
			                	<a class="dropdown-item btn"><div class="icon_num">7</div>테이블관리</a>
			                	<a class="dropdown-item btn"><div class="icon_num">8</div>포스기능정의</a>
			                </div>
	                	</div>
	                	<div class="dropdown-item dropdown btn">
	                		<div class="dropdown-title btn"><div class="icon_num">2</div>출력물관리</div>
                		</div>
	                	<div class="dropdown-item dropdown btn">
	                		<div class="dropdown-title btn" style="color: red;">
	                			<div class="icon_num">3</div>상품관리
	                			<svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
									<path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
								</svg>
	                		</div>
			                <div class="dropdown-content-right">
			                	<a class="dropdown-item btn"><div class="icon_num">1</div>상품기초정보등록</a>
			                	<a class="dropdown-item btn"><div class="icon_num">2</div>거래처등록</a>
			                	<a class="dropdown-item btn"><div class="icon_num">3</div>상품등록/조회</a>
			                	<a class="dropdown-item btn" onclick="location.href='/base/prod/changeAll'" style="color: red;"><div class="icon_num">4</div>상품정보일괄변경</a>
			                	<a class="dropdown-item btn"><div class="icon_num">5</div>상품등록</a>
			                	<a class="dropdown-item btn"><div class="icon_num">6</div>판매터치키등록</a>
			                	<a class="dropdown-item btn"><div class="icon_num">7</div>주방프린터</a>
			                </div>
	                	</div>
	                	<div class="dropdown-item dropdown btn">
		                	<div class="dropdown-title btn"><div class="icon_num">4</div>가격관리</div>
                		</div>
	                	<div class="dropdown-item dropdown btn">
		                	<div class="dropdown-title btn"><div class="icon_num">5</div>결제수단</div>
                		</div>
	                	<div class="dropdown-item dropdown btn">
		                	<div class="dropdown-title btn"><div class="icon_num">6</div>기타관리</div>
                		</div>
                		<div class="dropdown-item dropdown btn">
	                		<div class="dropdown-title btn">
	                			<div class="icon_num">7</div>키오스크관리
	                			<svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16" style="margin-left: 30px">
									<path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
								</svg>
	                		</div>
			                <div class="dropdown-content-right">
			                	<a class="dropdown-item btn"><div class="icon_num">1</div>이미지관리</a>
			                	<a class="dropdown-item btn"><div class="icon_num">2</div>다국어 관리</a>
			                	<a class="dropdown-item btn"><div class="icon_num">3</div>터치키관리</a>
			                	<a class="dropdown-item btn"><div class="icon_num">4</div>품절 일괄변경</a>
			                </div>
	                	</div>
	                </div>
                </li>
                <!-- 매출관리 -->
                <li class="dropdown">
                	<div class="dropdown-title btn"><div class="icon_num">2</div>매출관리</div>
                </li>
                <!-- 회원관리 -->
                <li class="dropdown">
                	<div class="dropdown-title btn"><div class="icon_num">3</div>회원관리</div>
                </li>
                <!-- 수불관리 -->
                <li class="dropdown">
                	<div class="dropdown-title btn"><div class="icon_num">4</div>수불관리</div>
                </li>
                <!-- 재고관리 -->
                <li class="dropdown">
                	<div class="dropdown-title btn"><div class="icon_num">5</div>재고관리</div>
                </li>
                <!-- 정산관리 -->
                <li class="dropdown">
                	<div class="dropdown-title btn"><div class="icon_num">6</div>정산관리</div>
                </li>
                <!-- 기타관리 -->
                <li class="dropdown">
                	<div class="dropdown-title btn"><div class="icon_num">7</div>기타관리</div>
                </li>
            </ul>
        </nav>
        <nav class="subMenu">
            <ul class="sysInfo collapse-list">
                <li><img class="headericon" src="/resources/img/icon_graph.png"></li>
                <li>시스템 : <span id="systemName">[B001]운영시스템</span></li>
                <li>사용자명 : <span>${memId }</span></li>
                <li>현재시간 : <span id="nowDateTime">03-10 23:27:33</span></li>
            </ul>
            <ul class="sysMenu collapse-list">
                <li class="btn btn-gradient-lightgray" onclick="location.href='/favorite'"><span><img class="headericon" src="/resources/img/icon_star.png"></span>즐겨찾기/열기</li>
                <li class="btn btn-gradient-lightgray" onclick="location.href='/remote'"><span><img class="headericon" src="/resources/img/icon_remote.png"></span>원격접속</li>
                <li class="btn btn-gradient-lightgray" onclick="location.href='/index'"><span><img class="headericon" src="/resources/img/icon_home.png"></span>HOME</li>
                <li class="btn btn-gradient-danger" onclick="location.href='/logout'"><span><img class="headericon" src="/resources/img/icon_logout.png" alt=""></span>LOGOUT</li>
            </ul>
        </nav>
    </wrapper>
</header>