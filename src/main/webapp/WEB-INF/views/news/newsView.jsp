<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ include file="../include/header.jsp"%>
<html>
<head>
<style>
</style>
<meta charset="UTF-8">
<title>${news.title }</title>
</head>
<body>
	<div id="wrapper">
		<div id="page-wrapper">
			<div id="news_header" class="row">
				<div id="news_title" class="col-lg-12">
					<h1 class="page-header">
						<strong>${news.title }</strong>
					</h1>
				</div>
				<div id="news_regdate" class="col-lg-12">
					<h5><fmt:formatDate value="${news.regDate}" pattern="yyyy/MM/dd hh:mm"/></h5>
				</div>
			</div>
			<hr>
			<div id="news_body" class="row">
				<div class="col-lg-12">
					<div id="news_content" class="panel panel-default">
						<div class="panel-body" style="">${news.content }</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->

	<!-- 내부 동작 스크립트 -->
	<script>
		$(function() {
			//타이틀 클릭 시 동작.
			//을 펑션으로 할 필요가 있을까?
		});//END Script
	</script>
</body>
</html>
<%@ include file="../include/footer.jsp"%>