<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>    
<link rel="stylesheet" type="text/css" href="/resources/css/signIn.css">
<div class="jumbotron">
	<div class="container">
		<h1 class="display-5">
			회원가입</h1></div></div>
	<div class="container">
			<div style="display:block; float:right;">
					<div class="col-sm-10">
						<label>프로필 이미지</label>
 						<div class="uploadDiv">
							<img class="img-thumbnail" id = "view_img" alt="50x50" src="/resources/images/profile.png" style=" width:200px; height : 200px; margin:auto; display: block;" ><br>
							<input type="file"
							multiple class="form-control" id="img" name="img" onchange="setThumbnail(event);">
						</div>
					</div>
				</div>
			<form role="form" method="post" action="/user/signIn?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
				<div class="form-group row ">
					<label class="col-sm-2">아이디</label>
					<div class="col-sm-4">
						<input type="text" name="user_id" id="user_id" class="form-control"
							required oninput="chkId(this.value)" />
					</div>
					<div class="col-sm-3">
						<span class="id_ok">사용 가능</span>
						<span class="id_already">사용 불가</span>
					</div>
				</div>
				
				<div class="form-group row mt-4">
					<label class="col-sm-2">닉네임</label>
					<div class="col-sm-4">
						<input type="text" name="nickname" id="nickname"
							class="form-control" required oninput="chkNik(this.value)">
					</div>
					<div class="col-sm-3">
						<span class="nik_ok">사용 가능</span>
						<span class="nik_already">사용 불가</span>
					</div>
					
				</div>
				<div class="form-group row mt-4">
					<label class="col-sm-2">비밀번호</label>
					<div class="col-sm-4">
						<input type="password" name="user_pw" id="user_pw"
							class="form-control" required>
					</div>
				</div>
				
				<div class="form-group row mt-4">
					<label class="col-sm-2">비밀번호확인</label>
					<div class="col-sm-4">
						<input type="password" class="form-control" id="user_pw_re" required oninput="chkPw()">
					</div>
					<div class="col-sm-3">
						<span class="pw_ok">일치</span>
						<span class="pw_no">불일치</span>
					</div>
				</div>
	
				<div class="form-group row mt-4">
					<label class="col-sm-2">이메일</label>
					<div class="col-sm-8">
						<input type="text" name="mail1" id="mail1" required> @ <input
							type="text" name="mail2" id="mail2" required>&nbsp;
							 <select id="emailSelection" name="emailSelection">
							<option value="direct">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="yahoo.com">yahoo.com</option>
						</select> 
						<input type="hidden" name="email" id="email">
						<!-- 이메일 인증 버튼 -->
						<span id="emailAuth" class="btn btn-poka-main mt-2">이메일 인증</span>
					</div>
				</div>
				
				<div class="form-group row mt-4">
					<label class="col-sm-1 mr-5">생년월일</label>
					<div class="col-sm-3 ">
						<input type="date" name="birth" id="birth" class="form-control" required>
					</div>
				</div>
				
				<div class="form-group row mt-4 ml-3">
					<label class="col-sm-1 mr-3">성별</label>
					<div class="col-sm-5">
						<label><input type="radio" name="gender" value="M" required> 남성</label>
						<label><input type="radio" name="gender" value="F" required> 여성</label>
						
					</div>
				</div>
				
				<!-- 첨부파일 정보 hidden에 전달 -->
				<input type="hidden" name="img" value="/resources/images/profile.png">
				
				<div class="form-group row mt-4">
					<div class="col-sm-offset-2 col-sm-12 text-center">
						<input type="button" class="btn btn-secondary"
							style="width: 100px;" value="취소" onclick="history.back()">
						<input type="submit" class="btn offset-2" id="uploadBtn"
							style="width: 100px; background-color: #37867F; color:white; " value="등록">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">     
					</div>
				</div>
			</form>
			
		<!-- 이메일 인증 Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content modal-review"
					style="border: 3px solid #DFA01E !important;">
					<div class="modal-header"
						style="background-color: #113351; color: #fff; border-bottom: 3px solid #DFA01E;">
						<h4 class="modal-title" id="myModalLabel">이메일 본인인증</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="review-form d-flex flex-row">
							<span class="align-middle" style="margin-right: 1rem;">등록된 이메일로 인증코드를 전송했습니다.</span>
						</div>

						<div class="form-group mt-3">
							<input type="text" class="form-control" required id="email_ck" placeholder="인증코드 6자리 입력">
						</div>
					</div>

					<div class="modal-footer"
						style="background-color: #113351; color: #fff; border-top: 3px solid #DFA01E;">
						<button type="button" class="btn btn-poka-warning">이메일 재전송</button>
						<button type="button" class="btn btn-poka-green">확인</button>
						
					</div>
				</div>
			</div>
		</div>
			
		</div>
<script type="text/javascript" src="/resources/js/signIn.js"></script>
<%@ include file="../include/footer.jsp" %>