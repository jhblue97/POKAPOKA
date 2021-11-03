<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<%@ include file="../include/header.jsp"%>
<html>
<head>
<style>
</style>
<meta charset="UTF-8">
<title></title>
</head>
<hr style="border: solid 3px #DFA01E; margin-top: 0px;">
<body>

	${news.newsNo}
	${news.title }
	<br> ${news.content }
	<br> ${news.regDate }
	<br>
</body>
<hr style="border: solid 3px #DFA01E; margin-bottom: 0px;">
</html>
<%@ include file="../include/footer.jsp"%>