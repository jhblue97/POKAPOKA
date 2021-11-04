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
			<form role="form" method="post" action="/user/signIn">
				<div class="form-group row ">
					<label class="col-sm-2">아이디</label>
					<div class="col-sm-4">
						<input type="text" name="user_id" id="user_id" class="form-control"
							required>
					</div>
					<div class="col-sm-3">
						<span class="id_input_re_1" style="color: gray;">사용 가능한 아이디입니다.</span>
						<span class="id_input_re_2" style="color: gray;">아이디가 이미 존재합니다.</span>
					</div>
				</div>
				
				<div class="form-group row mt-4">
					<label class="col-sm-2">닉네임</label>
					<div class="col-sm-4">
						<input type="text" name="nickname" id="nickname"
							class="form-control" required>
					</div>
					<div class="col-sm-3">
						<span style="color: gray;">중복불가</span>
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
						<input type="password" class="form-control" required>
					</div>
					<div class="col-sm-3">
						<span style="color: gray;">비밀번호가 일치하지 않습니다.</span>
					</div>
				</div>
	
				<div class="form-group row mt-4">
					<label class="col-sm-2">이메일</label>
					<div class="col-sm-10">
						<input type="text" name="mail1" id="mail1"> @ <input
							type="text" name="mail2" id="mail2">&nbsp;
							 <select id="emailSelection" name="emailSelection">
							<option value="direct">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="google.com">google.com</option>
							<option value="yahoo.com">yahoo.com</option>
						</select> 
						<input type="hidden" name="email" id="email">
					</div>
				</div>
	
				<div class="form-group row mt-4">
					<label class="col-sm-1 mr-5">생년월일</label>
					<div class="col-sm-3 ">
						<input type="date" name="birth" id="birth" class="form-control">
					</div>
				</div>
				
				<div class="form-group row mt-4 ml-3">
					<label class="col-sm-1 mr-3">성별</label>
					<div class="col-sm-5">
						<label><input type="radio" name="gender" value="M"> 남성</label>
						<label><input type="radio" name="gender" value="F"> 여성</label>
						
					</div>
				</div>
				
				<!-- 첨부파일 정보 hidden에 전달 -->
				<input type="hidden" name="img" value="resouces/images/default.png">
				
				<div class="form-group row mt-4">
					<div class="col-sm-offset-2 col-sm-12 text-center">
						<input type="button" class="btn btn-secondary"
							style="width: 100px;" value="취소" onclick="history.back()">
						<input type="submit" class="btn offset-2" id="uploadBtn"
							style="width: 100px; background-color: #37867F; color:white; " value="등록">
						<input type="hidden" name="${_csrf.parameterName }"
												 value="${_csrf.token }">     
					</div>
				</div>
			</form>
		</div>
<script type="text/javascript" src="/resources/js/signIn.js"></script>

<%@ include file="../include/footer.jsp" %>