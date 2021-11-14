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
<body style="width: 940px; background-color: #D8E9E7; margin: 0 auto;">
	<div
		class="game-trailer d-flex justify-content-center embed-responsive-16by9">
		<c:choose>
			<c:when test="${game.game_vid != null}">
				<iframe id="game-vid embed-responsive-item"
					src="${game.game_vid }?autoplay=1&mute=1" frameborder="0"
					allowfullscreen></iframe>
			</c:when>
			<c:otherwise>
				<img id="no-vid" src="${game.game_img }" style="width: 620px">
			</c:otherwise>
		</c:choose>
	</div>
	<div class="game-wrapper">
		<div class="game-info">
			<div class="game-title">${game.gameNm }</div>
			<div class="game-regdate">
				リリース : ${game.regDate }
				<!-- Date 타입일 경우에는 아래로 받아올 것 -->
				<%-- <fmt:formatDate value="${game.regDate }" pattern="yyyy/MM/dd" /> --%>
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
							<c:if test="${game.avg_score > 0 }">
								<c:forEach var="i" begin="0" end="${game.avg_score - 1 }">
									<label class="full"><input type="radio" value="${i }"
										checked style="display: none;" /> </label>
								</c:forEach>
								<c:if test="${(game.avg_score mod 1) < 1 }">
									<label class="half"> <input type="radio" id="star4half"
										checked style="display: none;" />
									</label>
								</c:if>
							</c:if>
						</div>
					</div>
					<div class="add-review d-flex flex-row">
						<!-- 로그인한 경우에만 작성 버튼 표시 -->
						<sec:authorize access="isAuthenticated()">
							<p class="write-review">
								レビュー作成 <span id="addreview" class="btn btn-poka-main"> <i
									class="fa fa-plus plusbtn"></i>
								</span>
							</p>
						</sec:authorize>
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
			<div class="game-review-content row">
				<div class="col-lg-11 reviewPage" style="margin: 1rem">
					<div class="panel panel-default">
						<div class="panel-body">
							<ul class="reviewBox">
								<!-- REPLY TEST DATA -------------------------->
								<li class="left clearfix">
									<div>
										<div class="header">
											<strong class="primary-font">user00</strong> <small
												class="pull-right text-muted"> 2021-10-12 17:41 </small>
										</div>
										<p>Test Code</p>
									</div>
								</li>
								<!-- REPLY END ---------------------------->
							</ul>
						</div>
						<!-- 리뷰 목록 페이징 -->
						<div class="panel-footer"></div>
						<!-- END 리뷰 목록 페이징 -->
					</div>
				</div>
			</div>
		</div>
		<!-- 리뷰 목록 -->
		<div></div>
		<!-- END 리뷰 목록 -->

		<!-- 리뷰 작성 Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content modal-review"
					style="border: 3px solid #DFA01E !important;">
					<div class="modal-header"
						style="background-color: #113351; color: #fff; border-bottom: 3px solid #DFA01E;">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">レビュー登録</h4>
					</div>
					<div class="modal-body">
						<div class="review-form d-flex flex-row">
							<span class="align-middle" style="margin-right: 1rem;">評価
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
							<textarea name="content" class="form-control" maxlength="1000"></textarea>
						</div>
						<div class="form-group">
							<label>作成者</label> <input name="writer" class="form-control"
								readonly>
						</div>
						<div class="form-group">
							<label>登録日</label> <input name="regDate" class="form-control">
						</div>
					</div>

					<div class="modal-footer"
						style="background-color: #113351; color: #fff; border-top: 3px solid #DFA01E;">
						<button id="regReview" type="button" class="btn btn-poka-green">登録</button>
						<button id="modReview" type="button" class="btn btn-poka-warning">修正</button>
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
			//모달 초기값 메소드
			//reviewService.modalInit();
			
			//변수들 -----------------------------------------------------------
			var gnoVal = '${game.gno}'; 
			var reviewBox = $('.reviewBox');
			
			var modal = $('.modal');
			var content = modal.find("textarea[name='content']");
			var writer = modal.find("input[name='writer']");
			var regDate = modal.find("input[name='regDate']");
			var starScore = modal.find("input[name='review-star']");
			
			var regReview = $('#regReview');
			var modReview = $('#modReview');
			var removeReview = $('#removeReview');
			
			
			//----------------------------------------------------------------
			
			showList(1);
			
			//보안 세션 불러오기 -------------------------------------------------
			var csrfHeaderName = '${_csrf.headerName}'; //CSRF 토큰 관련 변수
			var csrfTokenValue = '${_csrf.token}';

			//beforeSend 대신 CSRF 토큰 전송
			$(document).ajaxSend(function(e, xhr, options) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			}); 
			
			//보안 세션 END --------------------------------------------------

			//리뷰 목록 --------------------------------------------------------
			function showList(page){
				console.log('List loaded');
				
				//리뷰 목록 가져오기
				reviewService.getList(
					{ page:page || 1, gno:gnoVal }, 	
					function(/* replyCnt, */list){
						console.log("list.length : " + list.length);
						
						//리뷰을 추가한 경우 -1을 파라미터로 전송하여 마지막 페이지 표시
						if(page == -1){
							pageNum = Math.ceil(replyCnt/5.0); //마지막 페이지 계산
							showList(pageNum);
							return;
						}
						
						//리뷰 목록이 없으면 ul의 내용을 비우고 중단
						if(list == null || list.length == 0){
							reviewBox.html('등록된 리뷰가 없습니다.');
							return;					
						}
						
						//리뷰 목록이 있으면 ul에 li 추가
						var str="";
						for(var i=0 ; i<list.length ; i++){
							str += "<li class='left clearfix' data-rno='" + list[i].rno + "'>" +
								   "<div>" +
								   "   <div class='header'>" +
								   "      <strong class='primary-font'>" + 
								  				 list[i].writer + "</strong>"+
								   "      <small class='pull-right text-muted'>"+
								   				reviewService.reviewDate(list[i].regDate) +
								   "      </small>"+
								   "   </div>"+
								   "   <p>" + list[i].content +"</p>"+
								   "</div></li>";
						}
						reviewBox.html(str);
						//showReplyPage(replyCnt);
					}
				);//END getList();
			}
			
			//리뷰 클릭 이벤트 처리
			reviewBox.on('click', 'li', function(e){
				//console.log('리뷰 클릭');　//END get()
				
				reviewService.get($(this).data('rno'),function(result){
							//console.log(result);
							starScore.find([value = $('result.score')]).attr('checked');
							content.val(result.content).attr('readonly', 'readonly');		//리뷰 표시
							writer.val(result.writer);	//작성자 표시 	
							regDate.val(reviewService.reviewDate(result.regDate))
											 .attr('readonly', 'readonly');	//작성일자 표시 - 읽기 전용		
							
							regDate.closest('div').show();	//!!!!!
							modal.find("button[id != 'modalCloseBtn']").hide(); //close 버튼이 아닌 요소들 숨기기
							//로그인 되어 있고, 작성자가 리뷰 작성자와 같은 경우
							<sec:authorize access="isAuthenticated()">
								<c:if test="${p.username == result.writer }">
									modReview.show();		 //수정, 삭제 버튼 표시하기
									removeReview.show();	
								</c:if>
							</sec:authorize>
								
							modal.data('rno', result.rno);
							modal.modal('show');	//모달창 보이기
						}
					);//END get()
				
			});//END 리뷰 클릭 이벤트 처리

			//리뷰 목록 END-----------------------------------------------------
			
			//리뷰 모달 창 ------------------------------------------------------
			var writerVal = "";
			<sec:authorize access="isAuthenticated()">
			  	writerVal = '<sec:authentication property="principal.username"/>';
			</sec:authorize>
			
			//신규 리뷰 버튼 클릭 이벤트 처리
			$('#addreview').on('click', function(e) {
				//console.log('신규 클릭');
				//reviewInit();
								
				modal.find("input[name !='review-star']").val(''); //리뷰 모달의 입력값들 지우기
				writer.closest('div').hide();// writer 숨기기
				regDate.closest('div').hide(); //regDate 숨기기
				modal.find("button[id != 'closeBtn']").hide(); //close 버튼이 아닌 요소들 숨기기
				regReview.show(); //등록 버튼은 표시하기

				modal.modal('show');
			});//END 신규 리뷰 버튼 클릭 이벤트 처리
			
			// 리뷰 등록 이벤트 처리
			regReview.on('click', function(e) {
				console.log("값 체크 : " + modal.find("input[name='review-star']").val());
				// 별점 가져오기
				var star = modal.find("input[name='review-star']:checked").val() != null
				? modal.find("input[name='review-star']:checked").val() : 0;
			
				// 값 체크
				console.log('gno:' + '${game.gno}');
				console.log('content: ' + content.val());
				console.log('writer: ' + writerVal);
				console.log('별점 : ' + star);
				
				reviewService.add({
					gno : '${game.gno}',
					content : content.val(),
					writer : writerVal,
					score : star
				}, function(result) {
					modal.find("input").val(''); //입력값들 지우기
					modal.modal('hide'); //모달창 숨기기
					alert('レビューが登録されました。');
					//showList(-1);		//목록을 새로 표시
				});//END add()
			});

			//리뷰 수정 버튼 클릭 이벤트 처리
			modReview.on('click', function(e) {
				console.log('수정 클릭');　//END modify()
				
				reviewService.modify(
					{ rno   : modal.data('rno'), 
					  gno   : gnoVal, 
					  content : content.val(),
					  writer :  writer.val() },
					function(result){
						alert('리뷰가 수정되었습니다.');
						modal.modal('hide');			//모달창 숨기기
						showList(pageNum);				//목록을 새로 표시
					}
				);//END modify()
			});//END 리뷰 수정 버튼 클릭 이벤트 처리

			//리뷰 삭제 버튼 클릭 이벤트 처리
			removeReview.on('click', function(e) {
				console.log('삭제 클릭');　//END remove();
				reviewService.remove(
					modal.data('rno'), writer.val(),
					function(result){
						alert('리뷰가 삭제되었습니다');
						modal.modal('hide');			//모달창 숨기기
						showList(pageNum);				//목록을 새로 표시
					},
					function(er){
						alert('remove fail');
					}
				);//END remove();
			});//END 리뷰 삭제 버튼 클릭 이벤트 처리

			//END 리뷰 모달 창 ------------------------------------------------------
		});
	</script>
</body>
<!-- 동적 별점 -->
<!--https://codepen.io/chris22smith/pen/MJzLJN-->
</html>
<%@ include file="../include/footer.jsp"%>