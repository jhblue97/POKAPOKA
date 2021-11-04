<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/resources/css/game.css">
<meta charset="UTF-8">
<title>${game.gameNm }-ぽかぽかゲーム</title>
</head>
<body>
	<div class="game-trailer">
		<c:choose>
			<c:when test="not empty game_vid">
				
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="game-wrapper"></div>
</body>
</html>
<%@ include file="../include/footer.jsp"%>