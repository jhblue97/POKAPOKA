<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<div class="jumbotron">
	<div class="container">
		<h1 class="display-5">등급기준</h1>
	</div>
</div>
<sec:authentication property="principal.user"/>
<sec:authentication property="principal.user.authList"/>

<%@ include file="../include/footer.jsp"%>