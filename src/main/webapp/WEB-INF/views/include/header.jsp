<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- <script src="/resources/js/script.js"></script> -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style>
</style>
<body>
	<nav class="navbar navbar-expand" style="background-color: #113351">
		<a class="navbar-brand" href="/"><img id="logo" src="/resources/images/logo.png"></a>

		<ul class="navbar-nav mr-auto">
			<li class="nav-item mx-3"><a class="nav-link" href="/news/list">ゲームニュース</a>
			</li>
			<li class="nav-item dropdown mx-3"><a
				class="nav-link dropdown-toggle" data-bs-toggle="dropdown">掲示板</a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="/board/list">자유게시판</a></li>
					<li><a class="dropdown-item" href="/niji/list">2차 창작 거래</a></li>
				</ul></li>
			<li class="nav-item dropdown mx-3"><a
				class="nav-link dropdown-toggle" data-bs-toggle="dropdown">カスタマーセンター</a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="/customer/faq">FAQ</a></li>
					<li><a class="dropdown-item" href="/soudan/list">1:1 상담</a></li>
				</ul></li>
			<li class="nav-item dropdown mx-3"><a
				class="nav-link dropdown-toggle" data-bs-toggle="dropdown">管理</a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="/grade/list">등급 관리</a></li>
					<li><a class="dropdown-item" href="/report/list">신고 처리</a></li>
				</ul></li>
		</ul>
		 <!-- 로그인 X - 로그인 표시 -->
		  <sec:authorize access="isAnonymous()">
			<button type="button" class="btn btn-outline-primary mx-2"
				onclick="location.href='/user/login'">LOGIN</button>
			<button type="button" class="btn btn-outline-warning mx-2"
				onclick="location.href='/user/signIn'">SIGNIN</button>
		  </sec:authorize>
		  
		  <!-- 로그민 O - 로그아웃 표시 -->
		   <sec:authorize access="isAuthenticated()">
		   	<sec:authentication property="principal.user"/>
		   		<img src="/resources/images/profile.png" style="width:50px; height:50px;" onclick="location.href='/user/get?user_id='+'<sec:authentication property="principal.username"/>'">
		   		<span class="mr-3" style="color:white;">&nbsp;
		   		<sec:authentication property="principal.user.nickname"/>님</span>
			   <button type="button" class="btn btn-outline-danger mx-2"
					onclick="location.href='/user/logout'">LOGOUT</button>
		   </sec:authorize>
	</nav>
	<hr style="">
	<script>
		
	</script>