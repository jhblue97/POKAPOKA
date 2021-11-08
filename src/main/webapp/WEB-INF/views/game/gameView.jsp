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

	<div
		class="game-trailer d-flex justify-content-center embed-responsive-16by9">
		<c:choose>
			<c:when test="${game.game_vid != null}">
				<iframe id="game-vid embed-responsive-item"
					src="${game.game_vid }?autoplay=1&mute=1" frameborder="0"
					allowfullscreen></iframe>
			</c:when>
			<c:otherwise>
				<iframe id="no-vid" src="#" frameborder="0" allow="autoplay"></iframe>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="game-wrapper">
		<div class="game-info">
			<div class="game-title">${game.gameNm }</div>
			<div class="game-regdate">
				リリース :
				<fmt:formatDate value="${game.regDate }" pattern="yyyy/MM/dd" />
			</div>
			<div class="game-company">開発社 : ${game.game_company }</div>
			<!-- 태그 연동할 때 가져올 것 -->
			<div class="game-tag">タグ :</div>
			<div class="game-score">
				評価
				<div class="tool-box d-flex flex-row justify-content-between">
					<div class="score-box d-flex flex-row">
						<p class="score-text">${game.avg_score }&nbsp;</p>
						<div class="rating">
							<c:forEach var="i" begin="0" end="${game.avg_score - 1 }">
								<label class="full"><input type="radio" value="${i }"
									checked style="display: none;" /> </label>
							</c:forEach>
							<c:if test="${(game.avg_score mod 1) < 1 }">
								<label class="half"> <input type="radio" id="star4half"
									checked style="display: none;" />
								</label>
							</c:if>
						</div>
					</div>
					<div class="add-review d-flex flex-row">
						<p class="write-review">
							レビュー作成 <span id="addreview" class="btn btn-poka-main"><i
								class="fa fa-plus plusbtn"></i></span>
						</p>
					</div>
					<div class="go-to-store">
						<button
							onclick="location.href='https://store.steampowered.com/app/${game.gameId}'"
							class="btn btn-block btn-poka-green2">ストアページへ</button>
					</div>
				</div>
			</div>
		</div>
		<div class="game-des">
			<div class="game-des-subtitle">ゲーム情報</div>
			<div class="game-des-content">${game.game_des }</div>
		</div>
		<div class="game-review">
			<div class="game-review-subtitle">レビュー</div>
			<div class="game-review-content"></div>
		</div>

		<!-- 리뷰 모달 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="modalTitle">REPLY MODAL</h4>
					</div>

					<div class="modal-body">
						<div class="form-group">
							<label>Review</label> <input name="review" value="New Review!!"
								class="form-control">
						</div>
						<div class="form-group">
							<label>Writer</label> <input name="writer" value="writer"
								class="form-control" readonly>
						</div>
						<div class="form-group">
							<label>Review Date</label> <input name="regDate"
								value="2021/10/12 10:41:11" class="form-control">
						</div>
					</div>
					<!-- END modal-body -->

					<div class="modal-footer">
						<button id="modalModBtn" type="button"
							class="btn btn-poka-warning">修正</button>
						<button id="modalRemoveBtn" type="button"
							class="btn btn-poka-danger">削除</button>
						<button id="modalRegisterBtn" type="button"
							class="btn btn-primary">作成者</button>
						<button id="modalCloseBtn" type="button" class="btn btn-poka-main"
							data-dismiss="modal">キャンセル</button>
					</div>
				</div>
			</div>
		</div>
		<!-- /END -->

	</div>
	<script>
		$(function() {
			$('#addreview').on('click', function(e) {
				console.log("리뷰 추가");
				/* 모달 초기화 */
				
				/* 모달 표시 */
				$('.modal').modal('show');
			});

		});
	</script>
</body>
<!-- 동적 별점 -->
<!--https://codepen.io/chris22smith/pen/MJzLJN-->
</html>
<%@ include file="../include/footer.jsp"%>