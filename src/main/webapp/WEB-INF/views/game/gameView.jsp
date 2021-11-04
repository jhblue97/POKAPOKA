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
	<div class="game-trailer d-flex justify-content-center">
		<c:choose>
			<c:when test="not empty game_vid">
				<iframe src=${game.game_vid } frameborder="0"></iframe>
			</c:when>
			<c:otherwise>
				<iframe src="https://www.youtube.com/embed/E3Huy2cdih0"
					frameborder="0"></iframe>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="game-wrapper">
		<div class="game-info">
			<div class="game-title">${game.gameNm }</div>
			<div class="game-regdate">
				출시일 :
				<fmt:formatDate value="${game.regDate }" pattern="yyyy/MM/dd" />
			</div>
			<div class="game-company">개발사 : ${game.game_company }</div>
			<!-- 태그 연동할 때 가져올 것 -->
			<div class="game-tag">태그 :</div>
			<div class="game-score">
				평균 별점
				<div class="tool-box d-flex flex-row justify-content-between">
					<div class="score-box d-flex flex-row">
						<p class="score-text">${game.avg_score }&nbsp;</p>
						<div class="rating">
							<c:forEach var="i" begin="0" end="${game.avg_score - 1 }">
								<label class="full"><input type="radio" value="${i }"
									checked style="display: none;" /> </label>
							</c:forEach>
							<c:if test="${(game.avg_score mod 1) < 1 }">
								<label class="half">
									<input type="radio" id="star4half" checked style="display: none;" />
								</label>
							</c:if>
						</div>
					</div>
					<div class="add-review d-flex flex-row">
						<p>리뷰 추가</p>
						<button class="btn btn-poka-main btn-review"></button>
					</div>
					<div class="go-to-store">
						<button onclick="location.href='https://store.steampowered.com/app/${game.gameId}'" class="btn btn-block btn-poka-green">상점 페이지로</button>
					</div>
				</div>
			</div>
		</div>
		<div class="game-des">
			<div class="game-des-subtitle">게임 정보</div>
			<div class="game-des-content">${game.game_des }</div>
		</div>
		<div class="game-review">
			<div class="game-review-subtitle">게임 리뷰</div>
			<div class="game-review-content"> </div>
		</div>
	</div>
</body>
<!-- 동적 별점 -->
<!--https://codepen.io/chris22smith/pen/MJzLJN-->
</html>
<%@ include file="../include/footer.jsp"%>