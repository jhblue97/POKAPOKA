<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ include file="../include/header.jsp"%>
<html>
<style>
</style>
<head>
<meta charset="UTF-8">
<title>カスタマーセンター</title>
</head>
<body>
	<div class="jumbotron row">
		<div class="wrapper col-lg-12">
			<h1 class="page-header display-5">カスタマーセンター</h1>
			<h3>FAQ</h3>
		</div>
	</div>
	<div id="wrapper">
		<div class="row container">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<table width="100%" class="table table-bordered table-hover">
							<thead class="thead-dark">
								<tr>
									<th class="col-xl-1 text-center">No.</th>
									<th class="col-xl-11 text-center">質問内容</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td id="qno"></td>
									<td id="content"></td>
								</tr>
							</tbody>
						</table>
						<!-- /.table-responsive -->
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