<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>    

<div class="jumbotron">
	<div class="container">
		<h1 class="display-5">
			회원가입</h1></div></div>
	<div class="container">
			<form role="form" method="post" action="/login"
				enctype="multipart/form-data">
				<div class="form-group row ">
					<label class="col-sm-2">아이디</label>
					<div class="col-sm-3">
						<input type="text" name="userid" id="userid" class="form-control"
							required>
	
					</div>
					<div class="col-sm-3">
						<span style="color: gray;">중복불가</span>
					</div>
					<div class="col">
						<label>프로필 이미지</label>
						<input name="uploadFile" type="file" multiple>
						<!-- 첨부파일 업로드 결과 표시 -->
                    	<div class="uploadResult">
							<ul></ul>                    	
                    	</div>
					</div>
				</div>
				<div class="form-group row mt-4">
					<label class="col-sm-2">닉네임</label>
					<div class="col-sm-3">
						<input type="text" name="nickname" id="nickname"
							class="form-control" required>
					</div>
				</div>
				<div class="form-group row mt-4">
					<label class="col-sm-2">비밀번호</label>
					<div class="col-sm-3">
						<input type="password" name="passwd" id="passwd"
							class="form-control" required>
					</div>
				</div>
				
				<div class="form-group row mt-4">
					<label class="col-sm-2">비밀번호 확인</label>
					<div class="col-sm-3">
						<input type="password" name="passwd" id="passwd"
							class="form-control" required>
					</div>
				</div>
	
				<div class="form-group row mt-4">
					<label class="col-sm-2">이메일</label>
					<div class="col-sm-10">
						<input type="text" name="mail1" id="mail1"> @ <input
							type="text" name="mail2" id="mail2"> <select
							id="emailSelection" name="emailSelection">
							<option value="direct">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="google.com">google.com</option>
							<option value="yahoo.com">yahoo.com</option>
						</select> <input type="hidden" name="mail" id="mail">
					</div>
				</div>
	
				<div class="form-group row mt-4">
					<label class="col-sm-2">생년월일</label>
					<div class="col-sm-3">
						<input type="date" name="birth" id="birth" class="form-control">
					</div>
				</div>
				
				<div class="form-group row mt-4">
					<label class="col-sm-2">성별</label>
					<div class="col-sm-5">
						<label><input type="radio" name="gender" value="M"> 남성</label>
						<label><input type="radio" name="gender" value="F"> 여성</label>
					</div>
				</div>
	
				<div class="form-group row mt-4">
					<div class="col-sm-offset-2 col-sm-10 text-center">
						<input type="button" class="btn btn-secondary"
							style="width: 100px;" value="취소" onclick="history.back()">
						<input type="submit" class="btn offset-2"
							style="width: 100px; background-color: #37867F; color:white; " value="등록" onclick="addUserChk()">
						<input type="hidden" name="${_csrf.parameterName }"
												 value="${_csrf.token }">     
					</div>
				</div>
			</form>
		</div>
<script>
		$(function() {

			$(document).ready(function() {
			//이메일
				$('select[name=emailSelection]').change(function() {

					if ($(this).val() == "direct") {

						$('#mail2').val("");
						$("#mail2").attr("readonly", false);
						$('#mail2').focus();

					} else {

						$('#mail2').val($(this).val());

						$("#mail2").attr("readonly", true);
					}
				});
			});
		});
		
		$(function(e){
			var formObj = $("form[role='form']");
			
			//submit 버튼 클릭 이벤트 처리
			$("button[type='submit']").on('click', function(e){
				console.log('submit');
				e.preventDefault();
				
				//첨부파일 정보 hidden 태그로 추가
				var tag = "";
				$('.uploadResult ul li').each(function(i, obj){
					var o = $(obj);
					
					tag += "<input type='hidden' name='attachList[" + i + "].fileName' " +
					             " value='" +  o.data('filename') + "'>";

					tag += "<input type='hidden' name='attachList[" + i + "].uuid' " +
					             " value='" +  o.data('uuid') + "'>";

					tag += "<input type='hidden' name='attachList[" + i + "].uploadPath' " +
					             " value='" +  o.data('path') + "'>";

					tag += "<input type='hidden' name='attachList[" + i + "].fileType' " +
					             " value='" +  o.data('type') + "'>";			             
				});
				
				formObj.append(tag).submit();	//생성된 태그를 폼에 추가한 후 전송
			});	//END submit 버튼 클릭 이벤트 처리
			
			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");	//확장자 제한 정규표현식
			var maxSize = 5242880;	//최대 업로드 크기 
			
			//확장자 및 업로드 크기 체크 
			function checkExtension(fileName, fileSize){
				if(fileSize >= maxSize) {	//크기 확인
					alert('업로드 불가 - 파일 크기 제한 초과');
					return false;
				}
				
				if(regex.test(fileName)) {	//확장자 확인
					alert('해당 파일은 업로드 하실 수 없습니다.');
					return false;
				}
				
				return true;
			}//END 확장자 및 업로드 크기 체크 
			
			//첨부파일 선택 이벤트 처리 
			var csrfHeaderName = '${_csrf.headerName}';	//CSRF 토큰 관련 변수
			var csrfTokenValue = '${_csrf.token}';
			
			$("input[type='file']").on('change', function(e){
				var formData = new FormData();
				var inputFile = $("input[name='uploadFile']");
				var files = inputFile[0].files;
				
				for(var i=0 ; i<files.length ; i++){
					//확장자 및 파일크기 확인
					if(!checkExtension(files[i].name, files[i].size)){
						return false;
					}
					
					formData.append("uploadFile", files[i]);
				}
				
				$.ajax({
					type	: 'post',
					url 	: '/uploadAjaxAction',
					data	: formData,
					contentType : false,
					processData : false,
					dataType    : 'json',
					beforeSend : function(xhr){
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
					success : function(result){
						console.log(result);
						
						//업로드 결과 출력 함수 호출
						showUploadedFile(result);
						
				//		$('.uploadDiv').html(uploadTag.html());
					}
				});//END ajax()
			});//END 첨부파일 선택 이벤트 처리 
			
			//업로드 결과 출력 
			var uploadResult = $('.uploadResult ul');
			function showUploadedFile(result){
				//업로드 결과가 없으면 중단
				if(!result || result.length == 0){
					return;
				}
				
				var tag = "";
				
				$(result).each(function(i, obj){
					//이미지가 아니면 첨부파일 아이콘과 파일명 표시
					if( !obj.image ){
						//클릭 시 다운로드 처리
						var fileCallPath = encodeURIComponent(
												obj.uploadPath + "/" +
												obj.uuid + "_" + 
												obj.fileName );
						
						var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");		//추가
							
						tag += "<li data-path='" + obj.uploadPath + "'   data-uuid='" + obj.uuid + "' " +
								  " data-filename='" + obj.fileName + "' data-type='" + obj.image + "'>" +
								   "<div><span>" + obj.fileName + "</span> " + 
								        "<button type='button' class='btn btn-warning btn-circle' " +  
								               " data-file='" + fileCallPath + "' data-type='file' >" + 
								        	"<i class='fa fa-times'></i></button><br>" +
								        "<img src='/resources/img/attach.png'></div></li>";	

					} else {	//그렇지 않으면 썸네일 표시
						var fileCallPath = encodeURIComponent(
												obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName );
					
						tag += "<li data-path='" + obj.uploadPath + "'   data-uuid='" + obj.uuid + "' " +
								  " data-filename='" + obj.fileName + "' data-type='" + obj.image + "'>" +
								   "<div><span>" + obj.fileName + "</span> " + 
								        "<button type='button' class='btn btn-warning btn-circle' " +  
								               " data-file='" + fileCallPath + "' data-type='image' >" + 
								        	"<i class='fa fa-times'></i></button><br>" +
								        "<img src='/display?fileName=" + fileCallPath + "'></div></li>";		
					}
				});
				uploadResult.append(tag);	
			}//END 업로드 결과 출력 함수 호출
			
			//X 표시 클릭 이벤트 처리
			$('.uploadResult').on('click', 'button', function(e){
				var targetLi = $(this).closest('li');	//
				
				$.ajax({
					type	: 'post',
					url 	: '/deleteFile',
					data	: { fileName : $(this).data('file'),
						        type     : $(this).data('type') },
					dataType: 'text',
					beforeSend : function(xhr){
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
					success : function(result){
						alert(result);
						targetLi.remove();				//
					}
				});//END ajax()
			});//END X 표시 클릭 이벤트 처리
			
		});//END $
	</script>

<%@ include file="../include/footer.jsp" %>