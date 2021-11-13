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
						<span class="row mb-2">등급 <img class="ml-3 mr-2" src="/resources/images/${grade.grade_img}" style="width:30px; height:30px;"> ${grade.grade_name}</span>
					<div class="row">경험치 
					<div class="progress ml-1 mt-1" style= "width:100px;">
						 <div class="progress-bar bg-success" role="progressbar" style="width: ${user.grade_exp }%" aria-valuenow="${user.grade_exp }" aria-valuemin="0" aria-valuemax="${grade.grade_lv }" ></div>
					</div>
					</div>
				</div>
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
					<input type="button" class="form-control col-sm-2 btn btn-poka-light" id="nikChg" value="닉네임 변경">
					
					<!-- 닉네임 변경 Modal -->
					<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content modal-review"
								style="border: 3px solid #DFA01E !important;">
								<div class="modal-header"
									style="background-color: #113351; color: #fff; border-bottom: 3px solid #DFA01E;">
									<h4 class="modal-title" id="myModalLabel">닉네임 변경</h4>
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
								</div>
								<div class="modal-body">
									<div class="d-flex flex-row">
										<span class="align-middle" style="margin-right: 1rem;">변경할 닉네임</span>
									</div>
			
									<div class="form-group mt-3 row">
										<input type="text" class="form-control col-5 mx-3">
										<input type="button" class="col-2 btn btn-poka-light" value="중복확인">
									</div>
								</div>
			
								<div class="modal-footer"
									style="background-color: #113351; color: #fff; border-top: 3px solid #DFA01E;">
									<button type="button" class="btn btn-poka-warning">취소</button>
									<button type="button" class="btn btn-poka-green">확인</button>
									
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="form-group row mt-4">
					<label class="col-sm-2">비밀번호</label>
					<div class="col-sm-4">
						<input type="button" class="form-control btn-poka-light" id="pwChg" value="비밀번호변경">
					<!-- 비밀번호 변경 Modal -->
					<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content modal-review"
								style="border: 3px solid #DFA01E !important;">
								<div class="modal-header"
									style="background-color: #113351; color: #fff; border-bottom: 3px solid #DFA01E;">
									<h4 class="modal-title" id="myModalLabel">비밀번호 변경</h4>
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
								</div>
								<div class="modal-body">
									<div class="review-form d-flex flex-row">
										<span class="align-middle" style="margin-right: 1rem;">기존비밀번호</span>
									</div>
			
									<div class="form-group mt-3">
										<input type="text" class="form-control" placeholder="기존비밀번호">
									</div>
									<div class="review-form d-flex flex-row">
										<span class="align-middle" style="margin-right: 1rem;">변경할 비밀번호</span>
									</div>
			
									<div class="form-group mt-3">
										<input type="text" class="form-control" placeholder="변경할 비밀번호">
									</div>
									<div class="review-form d-flex flex-row">
										<span class="align-middle" style="margin-right: 1rem;">비밀번호 확인</span>
									</div>
			
									<div class="form-group mt-3">
										<input type="text" class="form-control" placeholder="비밀번호 확인">
									</div>
								</div>
			
								<div class="modal-footer"
									style="background-color: #113351; color: #fff; border-top: 3px solid #DFA01E;">
									<button id="modReview" type="button" class="btn btn-poka-warning">취소</button>
									<button id="regReview" type="button" class="btn btn-poka-green">확인</button>
									
								</div>
							</div>
						</div>
					</div>
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
		</div>
<script>
var modal1 = $('#myModal1');
var modal2 = $('#myModal2');
//닉네임 변경 버튼 클릭 이벤트 처리
$('#nikChg').on('click', function(e) {

	
// 	$.ajax({
// 		type:"GET",
// 		url:"/user/emailChk/" + email,
// 		success:function(data){
// 			 console.log("data : " + data);
//         }
		
// 	});
	modal1.modal('show');
	
	
});//END 닉네임 변경 버튼 클릭 이벤트 처리

//비밀번호 변경 버튼 클릭 이벤트 처리
$('#pwChg').on('click', function(e) {

	
// 	$.ajax({
// 		type:"GET",
// 		url:"/user/emailChk/" + email,
// 		success:function(data){
// 			 console.log("data : " + data);
//         }
		
// 	});
	modal2.modal('show');
	
	
});//END 비밀번호 변경 버튼 클릭 이벤트 처리
</script>		
		
<%@ include file="../include/footer.jsp" %>