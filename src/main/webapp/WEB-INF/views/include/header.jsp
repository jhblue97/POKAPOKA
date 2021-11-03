<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
<!-- <script src="/resources/js/script.js"></script> -->    
<link rel="stylesheet" 
	  href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>	  
<link rel="stylesheet" type="text/css"
	  href="/resources/css/common.css">
</head>
<body>
	<nav class="navbar navbar-expand" style="background-color: #113351">
		<a class="navbar-brand" href="/"><img id="logo" src="/resources/images/logo.png"></a>
		
		<ul class="navbar-nav mr-auto">
			<li class="nav-item mx-3">
				<a class="nav-link"
					href="/news/list">ゲームニュース</a>
			</li>
			<li class="nav-item dropdown mx-3">
				<a class="nav-link dropdown-toggle"  data-bs-toggle="dropdown">掲示板</a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="/board/list">자유게시판</a></li>
					<li><a class="dropdown-item" href="/niji/list">2차 창작 거래</a></li>
				</ul>
				
			</li>
			<li class="nav-item dropdown mx-3">
				<a class="nav-link dropdown-toggle"  data-bs-toggle="dropdown">カスタマーセンター</a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="/customer/faq">FAQ</a></li>
					<li><a class="dropdown-item" href="/soudan/list">1:1 상담</a></li>
				</ul>
			</li>
			<li class="nav-item dropdown mx-3">
				<a class="nav-link dropdown-toggle"  data-bs-toggle="dropdown">管理</a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="/grade/list">등급 관리</a></li>
					<li><a class="dropdown-item" href="/report/list">신고 처리</a></li>
				</ul>
			</li>
		</ul>
		 <button type="button" class="btn btn-outline-primary mx-2" onclick="location.href='/user/login'">LOGIN</button>
		 <button type="button" class="btn btn-outline-warning mx-2" onclick="location.href='/user/signIn'">SIGNIN</button>
	</nav>
	<hr style="border: solid 3px #DFA01E; margin: 0px;">
<script>

</script>    