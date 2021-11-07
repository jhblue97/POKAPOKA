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
	<div class="game-trailer d-flex justify-content-center embed-responsive-16by9">
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
						<button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">New
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
		<!-- END 댓글 목록 -->


		<!-- 댓글 작성 Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
					</div>
					<!-- END modal-header -->

					<div class="modal-body">
						<div class="form-group">
							<label>Reply</label> <input name="reply" value="New Reply!!"
								class="form-control">
						</div>
						<div class="form-group">
							<label>Replyer</label> <input name="replyer" value="replyer"
								class="form-control" readonly>
						</div>
						<div class="form-group">
							<label>Reply Date</label> <input name="regDate"
								value="2021/10/12 10:41:11" class="form-control">
						</div>
					</div>
					<!-- END modal-body -->

					<div class="modal-footer">
						<button id="modalModBtn" type="button" class="btn btn-warning">
							Modify</button>
						<button id="modalRemoveBtn" type="button" class="btn btn-danger">
							Remove</button>
						<button id="modalRegisterBtn" type="button"
							class="btn btn-primary">Register</button>
						<button id="modalCloseBtn" type="button" class="btn btn-default"
							data-dismiss="modal">Close</button>
					</div>
					<!-- END modal-footer -->

				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
		<!-- END 댓글 작성 Modal -->

	</div>
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
			var modalInputReply   = modal.find("input[name='reply']"); 
			var modalInputReplyer = modal.find("input[name='replyer']");
			var modalInputRegDate = modal.find("input[name='regDate']");
			
			var modalModBtn      = $('#modalModBtn'); 
			var modalRemoveBtn   = $('#modalRemoveBtn'); 
			var modalRegisterBtn = $('#modalRegisterBtn'); 
			
			var replyer = "";
			<sec:authorize access="isAuthenticated()">
			  	replyer = '<sec:authentication property="principal.username"/>';
			</sec:authorize>
			
			var csrfHeaderName = '${_csrf.headerName}';	//CSRF 토큰 관련 변수
			var csrfTokenValue = '${_csrf.token}';		
			
			//신규 댓글 버튼 클릭 이벤트 처리
			$('#addReplyBtn').on('click', function(e){
				console.log('신규 클릭');
				
				
				modal.find("input").val('');  //댓글 모달의 입력값들 지우기
				modal.find("input[name='replyer']").val(replyer);
				
				modalInputRegDate.closest('div').hide(); //regDate에 가까운 div들 숨기기
				modal.find("button[id != 'modalCloseBtn']").hide(); //close 버튼이 아닌 요소들 숨기기
				modalRegisterBtn.show();				 //등록 버튼은 표시하기
				
				modal.modal('show');
			});//END 신규 댓글 버튼 클릭 이벤트 처리
			
			/* //beforeSend 대신 CSRF 토큰 전송
			$(document).ajaxSend(function(e, xhr, options){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			});//END add()
			
			//댓글 클릭 이벤트 처리
			replyUL.on('click', 'li', function(e){
				console.log('댓글 클릭');
				//END get()		
			});//END 댓글 클릭 이벤트 처리
			
			//댓글 수정 버튼 클릭 이벤트 처리
			modalModBtn.on('click', function(e){
				console.log('수정 클릭');
				//END modify()
			});//END 댓글 수정 버튼 클릭 이벤트 처리
			
			//댓글 삭제 버튼 클릭 이벤트 처리
			modalRemoveBtn.on('click', function(e){
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