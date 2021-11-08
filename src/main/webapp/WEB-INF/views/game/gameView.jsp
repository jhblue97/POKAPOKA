<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
		<!-- 댓글 목록 -->
		<div class='row'>
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<i class="fa fa-comments fa-fw"></i>Reply

						<!-- 로그인한 경우에만 댓글 작성 버튼 표시 -->
						<%-- <sec:authorize access="isAthenticated()"/> --%>
						<button id="newReview" class="btn btn-primary btn-xs pull-right">New
							Reply</button>

					</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<ul class="chat">
							<!-- REPLY START -------------------------->
							<li class="left clearfix" data-rno='12'>
								<div>
									<div class="header">
										<strong class="primary-font">user00</strong> <small
											class="pull-right text-muted"> 2021-10-12 17:41 </small>
									</div>
									<p>Good job!</p>
								</div>
							</li>
							<!-- REPLY END ---------------------------->
						</ul>
					</div>

					<!-- 댓글 목록 페이징 -->
					<div class="panel-footer"></div>
					<!-- END 댓글 목록 페이징 -->
				</div>
			</div>
		</div>
		<!-- END 리뷰 목록 -->


		<!-- 댓글 작성 Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">レビュー登録</h4>
					</div>

					<div class="modal-body">
						<div class="review-form d-flex flex-row">
							<span class="align-middle" style="margin-right: 1rem;"> 별점
							</span>
							<div class="review-rating">
								<input type="radio" id="star5" name="review-star" value="5" />
								<label class="full" for="star5"></label> <input type="radio"
									id="star4half" name="review-star" value="4.5" /> <label
									class="half" for="star4half"></label> <input type="radio"
									id="star4" name="review-star" value="4" /> <label class="full"
									for="star4"></label> <input type="radio" id="star3half"
									name="review-star" value="3.5" /> <label class="half"
									for="star3half"></label> <input type="radio" id="star3"
									name="review-star" value="3" /> <label class="full"
									for="star3"></label> <input type="radio" id="star2half"
									name="review-star" value="2.5" /> <label class="half"
									for="star2half"></label> <input type="radio" id="star2"
									name="review-star" value="2" /> <label class="full"
									for="star2"></label> <input type="radio" id="star1half"
									name="review-star" value="1.5" /> <label class="half"
									for="star1half"></label> <input type="radio" id="star1"
									name="review-star" value="1" /> <label class="full"
									for="star1"></label> <input type="radio" id="starhalf"
									name="review-star" value="0.5" /> <label class="half"
									for="starhalf"></label>
							</div>
						</div>
						<div class="form-group">
							<label>内容</label>
							<textarea name="content" class="form-control"></textarea>
						</div>
						<div class="form-group">
							<label>作成者</label> <input name="writer" value="writer"
								class="form-control" readonly>
						</div>
						<div class="form-group">
							<label>登録日</label> <input name="regDate"
								value="2021/10/12 10:41:11" class="form-control">
						</div>
					</div>

					<div class="modal-footer">
						<button id="regReview" type="button" class="btn btn-poka-green">登録</button>
						<button id="modReview" type="button" class="btn btn-poka-warning">
							修正</button>
						<button id="removeReview" type="button"
							class="btn btn-poka-danger">削除</button>
						<button id="closeBtn" type="button" class="btn btn-poka-main"
							data-dismiss="modal">閉じる</button>
					</div>
				</div>
			</div>
		</div>
		<form action=""></form>
	</div>
	<script src="/resources/js/review.js"></script>
	<script>
		$(function() {
			$('#addreview').on('click', function(e) {
				console.log("리뷰 추가");
				/* 모달 초기화 */

				/* 모달 표시 */
				$('.modal').modal('show');
			});

			//댓글 모달 창 ------------------------------------------------------
			var modal = $('.modal');
			var content = modal.find("textarea[name='content']");
			var writer = modal.find("input[name='writer']");
			var regDate = modal.find("input[name='regDate']");

			var regReview = $('#regReview');
			var modReview = $('#modReview');
			var removeReview = $('#removeReview');

			/* var writer = "";
			<sec:authorize access="isAuthenticated()">
			  	writer = '<sec:authentication property="principal.username"/>';
			</sec:authorize> */

			var csrfHeaderName = '${_csrf.headerName}'; //CSRF 토큰 관련 변수
			var csrfTokenValue = '${_csrf.token}';

			//beforeSend 대신 CSRF 토큰 전송
			$(document).ajaxSend(function(e, xhr, options) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			});//END add()

			//신규 댓글 버튼 클릭 이벤트 처리
			$('#newReview').on('click', function(e) {
				//console.log('신규 클릭');
				modal.find("input").val(''); //댓글 모달의 입력값들 지우기
				modal.find("input[name='writer']").val('writer');

				regDate.closest('div').hide(); //regDate에 가까운 div들 숨기기
				modal.find("button[id != 'closeBtn']").hide(); //close 버튼이 아닌 요소들 숨기기
				regReview.show(); //등록 버튼은 표시하기

				modal.modal('show');
			});//END 신규 댓글 버튼 클릭 이벤트 처리

			//별점 등록 이벤트 처리

			// 리뷰 등록 이벤트 처리
			regReview.on('click', function(e) {
				console.log(modal.find('input[name="review-star"]:checked').val());
				//별점 가져오기
				var star = modal.find("input[name='review-star']:checked").val();

				console.log('gno:' + '${game.gno}');
				console.log('content: ' + content.val());
				console.log('writer: ' + writer.val());
				console.log('별점 : ' + star);

				/* reviewService.add({
					gno : '${game.gno}',
					content : content.val(),
					writer : writer.val(),
					score : star
				}, function(result) {
					alert('レビューが登録されました。');
					modal.find("input").val(''); //입력값들 지우기
					modal.modal('hide'); //모달창 숨기기
					//showList(-1);					//목록을 새로 표시
				});//END add() */
			});

			//리뷰 클릭 이벤트 처리
			/* reviewCard.on('click', 'li', function(e){
				console.log('댓글 클릭');
				//END get()		
			});//END 댓글 클릭 이벤트 처리 */

			//댓글 수정 버튼 클릭 이벤트 처리
			modReview.on('click', function(e) {
				console.log('수정 클릭');
				//END modify()
			});//END 댓글 수정 버튼 클릭 이벤트 처리

			//댓글 삭제 버튼 클릭 이벤트 처리
			removeReview.on('click', function(e) {
				console.log('삭제 클릭');
				//END remove();
			});//END 댓글 삭제 버튼 클릭 이벤트 처리 */

			//END 댓글 모달 창 ------------------------------------------------------

		});
	</script>
</body>
<!-- 동적 별점 -->
<!--https://codepen.io/chris22smith/pen/MJzLJN-->
</html>
<%@ include file="../include/footer.jsp"%>