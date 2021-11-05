<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>    
<div class="jumbotron">
	<div class="container">
		<h1 class="display-5">
			회원정보수정</h1></div></div>
<div class="container p-5 mb-5" style="border: solid 1px;">
				<div class="ml-5" style="display:block; float:left;">
					<div class="mr-5">
						<p style="text-align:center;">프로필 이미지</p>
 						<div class="uploadDiv">
							<img class="img-thumbnail" id = "view_img" alt="50x50" src="${user.img }" style=" width:200px; height : 200px; margin:auto; display: block;" ><br>
						</div>
					</div>
						<span class="row mb-2">등급 <img class="ml-3 mr-2" src="/resources/images/001_g_bronze.png" style="width:30px; height:30px;"> 브론즈</span>
					<div class="row">경험치 
					<div class="progress ml-1 mt-1" style= "width:100px;">
						 <div class="progress-bar" style= "width:20px;"></div>
					</div>
					</div>
				</div>
				<form role="form" method="post" action="/user/signIn?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
				<div class="form-group row">
					<label class="col-sm-2">아이디</label>
					<div class="col-sm-4">
						<input type="text" name="user_id" id="user_id" class="form-control"
							 value="${user.user_id }" readonly>
					</div>
				</div>
			
				<div class="form-group row mt-4">
					<label class="col-sm-2">닉네임</label>
					<div class="col-sm-4">
						<input type="text" name="nickname" id="nickname"
							class="form-control" value="${user.nickname }" readonly>
					</div>
					<button class="col-sm-2 btn btn-poka-light">닉네임 변경</button>
				</div>
				
				<div class="form-group row mt-4">
					<label class="col-sm-2">비밀번호</label>
					<div class="col-sm-4">
						<input type="button" class="form-control btn-poka-light" value="비밀번호변경">
					</div>
				</div>
				
				<div class="form-group row mt-4">
					<label class="col-sm-2">이메일</label>
					<div class="col-sm-4">
						<input type="text" name="email" id="email" class="form-control" value="${user.email }" readonly>
					</div>
				</div>
	
				<div class="form-group row mt-4">
					<label class="col-sm-2 ">생년월일</label>
					<div class="col-sm-4 ">
						<input type="text" name="birth" id="birth" class="form-control" value="${user.birth }" readonly>
					</div>
				</div>
				
				<div class="form-group row mt-4 ml-2">
					<label class="col-sm-2">성별</label>
					<div class="col-sm-4 ">
						<input type="text" name="gender" id="gender" class="form-control" value="${user.gender }" readonly>
					</div>
				</div>
			
				<!-- 첨부파일 정보 hidden에 전달 -->
				<input type="hidden" name="img" value="/resources/images/profile.png">
				
				<div class="form-group row mt-4">
					<div class="col-sm-offset-2 col-sm-12 text-center">
						<input type="button" class="btn btn-secondary"
							style="width: 100px; font-weight:bold;" value="취소" onclick="history.back()">
						
						<input type="button" class="btn btn-poka-danger"
							style="width: 100px;" value="탈퇴" onclick="location.href='/user/delete?userid='+'${user.user_id}'">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">     
					</div>
				</div>
			</form>
		</div>
<%@ include file="../include/footer.jsp" %>