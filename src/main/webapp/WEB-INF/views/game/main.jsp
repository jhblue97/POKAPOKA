<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/resources/css/game.css">
<meta charset="UTF-8">
<title>みんなのレビューコミュニティ！ぽかぽかゲーム！</title>
</head>
<body>
	<div class="game-wrapper">
		<div class="liv-streaming-subtitle d-flex justify-content-start">
			<p>人気の生放送</p>
		</div>
		<div class="d-flex justify-content-center">
			<div class="live-streaming"></div>
		</div>
		<div class="search-box">
			<div class="input-group md-form form-sm poka-form pl-0">
				<input class="form-control my-0 py-1 poka-border" type="text"
					placeholder="Search" aria-label="Search">
				<div class="input-group-append">
					<button class="input-group-text red lighten-3" id="search-icon">
						<i class="fas fa-search" aria-hidden="true"></i>
					</button>
				</div>
			</div>
		</div>
		<div class="search-keyword">
			<span class="badge poka-main text-white"> test text <span
				class="xbtn badge badge-pill badge-danger">x</span>
			</span> <span class="badge poka-main text-white"> 키워드 <span
				class="xbtn badge badge-pill badge-danger">x</span>
			</span> <span class="badge poka-main text-white"> キーワード <span
				class="xbtn badge badge-pill badge-danger">x</span>
			</span>
		</div>
		<div class="d-flex game-list justify-content-between">
			<c:forEach var="i" begin="0" end="7">
				<div class="card game-item" style="width: 8rem;">
					<img class="card-img-top" src="/resources/images/profile.png"
						alt="Card image cap">
					<div class="card-body">
						<p class="card-text">content</p>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>
<%@ include file="../include/footer.jsp"%>