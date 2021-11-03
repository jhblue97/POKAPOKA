<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
<script src="/resources/js/script.js"></script>    
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
					href="/news/newsList">ゲームニュース</a>
			</li>
			<li class="nav-item dropdown mx-3">
				<a class="dropdown nav-link" data-bs-toggle="dropdown">掲示板</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#"></a>
					<a class="dropdown-item" href="#"></a>
				</div>
				
			</li>
			<li class="nav-item dropdown mx-3">
				<a class="dropdown nav-link" data-bs-toggle="dropdown">カスタマーセンター</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#"></a>
					<a class="dropdown-item" href="#"></a>
				</div>
			</li>
			<li class="nav-item dropdown mx-3">
				<a class="dropdown nav-link" data-bs-toggle="dropdown">管理</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#"></a>
					<a class="dropdown-item" href="#"></a>
				</div>
			</li>
		</ul>
		 <button type="button" class="btn btn-outline-primary mx-2">LOGIN</button>
		 <button type="button" class="btn btn-outline-warning mx-2">SIGNIN</button>
	</nav>
    