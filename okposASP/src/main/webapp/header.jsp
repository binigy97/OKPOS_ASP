<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
    <wrapper>
        <nav class="mainMenu">
            <img src="/resources/img/logo.png" style="width: 110px;">
            <ul class="collapse-list">
                <li class="btn btn-hover"><div>1</div>시스템관리</li>
                <li class="btn btn-hover"><div>2</div>기초관리</li>
                <li class="btn btn-hover"><div>3</div>기타관리</li>
                <li class="btn btn-hover"><div>4</div>인트라넷</li>
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
                <li class="btn btn-hover btn-gradient-lightgray"><span><img class="headericon" src="/resources/img/icon_star.png"></span>즐겨찾기/열기</li>
                <li class="btn btn-hover btn-gradient-lightgray"><span><img class="headericon" src="/resources/img/icon_remote.png"></span>원격접속</li>
                <li class="btn btn-hover btn-gradient-lightgray" onclick="location.href='/index'"><span><img class="headericon" src="/resources/img/icon_home.png"></span>HOME</li>
                <li class="btn btn-hover btn-gradient-danger" onclick="location.href='/logout'"><span><img class="headericon" src="/resources/img/icon_logout.png" alt=""></span>LOGOUT</li>
            </ul>
        </nav>
    </wrapper>
</header>