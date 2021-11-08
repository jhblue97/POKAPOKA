<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<div class="jumbotron">
	<div class="container">
		<h1 class="display-5">등급수정</h1>
	</div>
</div>
<div class="container">
	<form action="/grade/update" method="post" role="form">
       	
       	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">     
       	
       	<div class="form-group row">
			<label class="col-sm-2">등급코드</label>
			<div class="col-sm-3">
				<input type="text" name="grade_code" id="grade_code" class="form-control" value="${grade.grade_code}"></div></div>
				
		<div class="form-group row">
			<label class="col-sm-2">등급이름</label>
			<div class="col-sm-3">
				<input type="text" name="grade_name" id="grade_name" class="form-control" value="${grade.grade_name}"></div></div>
		
		<div class="form-group row">
			<label class="col-sm-2">등급기준</label>
			<div class="col-sm-3">
				<input type="text" name="grade_lv" id="grade_lv" class="form-control" value="${grade.grade_lv}"></div></div>	
			
		<!-- 첨부파일 정보 -->	
		<input type = "hidden" id = "grade_img" name = "grade_img" value="profile.png">	
		<div class="d-flex flex-column-reverse">
					<div class="form-group row p-2">
						<div class="col-sm-offset-2 col-sm-10" align="right" onclick="history.back()">
						<button class="btn btn-secondary" type="reset">취소</button>
						<button class="btn btn-poka-main" type="submit">수정</button></div></div>		
			</form>
			<div class="row mb-3 p-2">
				<label class="col-sm-2">등급이미지</label>
					<div class="uploadDiv col-sm-3">
					<img class="img-thumbnail" id = "view_img" alt="50x50" style=" width:200px; height : 200px; display: block;" ><br>
					<div id="uploadfile">
						<!-- 단일 파일 업로드 -->
						<input type="file" class="form-control" id="img" name="img" onchange="setThumbnail(event);">
					</div>
				</div>
			</div>
		</div>
</div>
<script>
$(function() {
	$(document).ready(function() {
		//파일의 확장자나 크기의 사전 처리
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 1048576;	//1MB
		
		function checkExtension(fileName, fileSize){
			if(fileSize >= maxSize){
				alert("파일 사이즈 초과");
				return false;
			}
			
			if(regex.test(fileName)){
				alert("해당 종류의 파일은 업로드 할 수 없습니다.");
				return false;
			}
			return true;
		}//END 파일의 확장자나 크기의 사전 처리
		
		//파일 업로드 처리
		
		$("input[name='img']").on("change", function uploadFiles(event){
			event.stopPropagation();
			event.preventDefault();
		  
		    event.dataTransfer = event.originalEvent.dataTransfer;
		    var files = event.target.files || event.dataTransfer.files;
		    
			var csrfHeaderName = '${_csrf.headerName}';	//CSRF 토큰 관련 변수
			var csrfTokenValue = '${_csrf.token}';	
			
			//파일 업로드 ajax 처리
			var formData = new FormData();
			var inputFile = $("input[name='img']");
			var files = inputFile[0].files;
			var upFile =  $("input[type='file']");
			var cut = upFile.detach();
			
			for(var i=0 ; i<files.length ; i++){
				//확장자 및 파일크기 확인
				if(!checkExtension(files[i].name, files[i].size)){
					return false;
				}
				 if (!(files[i].type.match(/image.*/))) {
			    	 alert('이미지가 아닙니다.');
			    	 upFile.detach();
			    	 $('#uploadfile').html("<input type='file' class='form-control' id='img' name='img' onchange='setThumbnail(event);'>");
				     return;
			    } 
			}
			
			$.ajax({
				url: '/uploadAjaxAction2',
				processData: false,
				contentType: false,
				data:formData,
				type:'POST',
				dataType:'json',
				beforeSend : function(xhr){	//전송 전 추가 헤더 지정
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				success:function(result){
					console.log("fileName :::" + result.fileName);
					console.log("uploadPath :::" + result.uploadPath);
					$('#grade_img').val(result.fileName);
				}
			}); //END $.ajax
		});//END 파일 업로드 처리
	});
});

//이미지 미리보기
function setThumbnail(event) { 
   var reader = new FileReader();
   	reader.onload = function(event) { 
	   var img = document.getElementById("view_img"); 
	 
	   img.setAttribute("src", event.target.result); 
   }; 
   reader.readAsDataURL(event.target.files[0]); 
}
</script>
<%@ include file="../include/footer.jsp"%>