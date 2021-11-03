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
			<h3>Q&ampA</h3>
		</div>
	</div>
	<div id="wrapper">
		<div class="row container">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="d-flex justify-content-end">
							<label>回答なし<input type="checkbox" name="isReplied" value="1"></label>
						</div>
						<table width="100%" class="table table-bordered table-hover">
							<thead class="poka-warning">
								<tr>
									<th class="col-xl-1 text-center">No.</th>
									<th class="col-xl-5 text-center">質問内容</th>
									<th class="col-xl-2 text-center">進行状況</th>
									<th class="col-xl-2 text-center">質問者</th>
									<th class="col-xl-2 text-center">質問日時</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list }" var="qna">
									<tr>
										<td id="qno" class="text-center">${qna.qno}</td>
										<td id="content" class="text-center"><a
											href="get/${qna.qno}" style="color: black">${qna.q_content}</a></td>
										<td id="isAnswer" class="text-center"><c:choose>
												<c:when test="${not empty qna.a_regDate }">
														回答完了
													</c:when>
												<c:when test="${empty qna.a_regDate }">回答なし</c:when>
											</c:choose></td>
										<td id="questioner" class="text-center">${qna.questioner}</td>
										<td id="q_regDate" class="text-center"><fmt:formatDate
												value="${qna.q_regDate}" pattern="yyyy/MM/dd" /></td>
									</tr>
								</c:forEach>
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