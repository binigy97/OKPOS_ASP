<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
    <wrapper>
        <nav class="mainMenu">
            <img src="/resources/img/logo.png" style="width: 110px;">
            <ul class="collapse-list">
                <li class="dropdown">
                	<!-- 시스템관리 -->
                	<div class="dropdown-title btn"><div class="icon_num">1</div>시스템관리</div>
	                <div class="dropdown-content">
	                	<a class="dropdown-item btn"><div class="icon_num">1</div>POS버전관리</a>
	                	<div class="dropdown-item dropdown btn">
	                		<div class="dropdown-title btn">
	                			<div class="icon_num">2</div>본사마스터
	                			<svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16" style="margin-left: 30px">
									<path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
								</svg>
	                		</div>
			                <div class="dropdown-content-right">
			                	<a class="dropdown-item btn"><div class="icon_num">1</div>본사정보관리</a>
			                	<a class="dropdown-item btn"><div class="icon_num">2</div>매장정보관리</a>
			                	<a class="dropdown-item btn"><div class="icon_num">3</div>매장정보조회</a>
			                	<a class="dropdown-item btn"><div class="icon_num">4</div>정보변경확인</a>
			                	<a class="dropdown-item btn" href="location.href='/mng/store'"><div class="icon_num">5</div>매장환경설정</a>
			                </div>
	                	</div>
	                </div>
                </li>
                <!-- 시스템관리 -->
                <li class="dropdown">
                	<div class="dropdown-title btn"><div class="icon_num">2</div>기초관리</div>
                </li>
                <!-- 기타관리 -->
                <li class="dropdown">
                	<div class="dropdown-title btn"><div class="icon_num">3</div>기타관리</div>
	                <div class="dropdown-content">
	                	<a class="dropdown-item btn"><div class="icon_num">1</div>SMS관리</a>
	                	<a class="dropdown-item btn"><div class="icon_num">2</div>기타</a>
	                	<a class="dropdown-item btn"><div class="icon_num">3</div>매뉴얼다운로드</a>
	                	<a class="dropdown-item btn"><div class="icon_num">4</div>공지사항</a>
	                	<a class="dropdown-item btn"><div class="icon_num">5</div>게시판</a>
	                	<a class="dropdown-item btn"><div class="icon_num">6</div>시스템전용게시판</a>
	                	<a class="dropdown-item btn"><div class="icon_num">7</div>대리점게시판</a>
	                	<a class="dropdown-item btn"><div class="icon_num">8</div>팝업게시판</a>
	                </div>
                </li>
                <!-- 인트라넷 -->
                <li class="dropdown">
                	<div class="dropdown-title btn"><div class="icon_num">4</div>인트라넷</div>
                </li>
            </ul>
        </nav>
        <nav class="subMenu">
            <ul class="sysInfo collapse-list">
                <li><img class="headericon" src="/resources/img/icon_graph.png"></li>
                <li>시스템 : <span id="systemName">[A001]운영시스템</span></li>
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