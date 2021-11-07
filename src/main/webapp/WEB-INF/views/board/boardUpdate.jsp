<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>  
<link rel="stylesheet" type="text/css" href="/resources/css/board.css">
<div class="jumbotron">
	<div class="container">
		<h1 class="display-5">게시글 수정</h1>
	</div>
</div>
	<div class="container">
       	<!-- 게시물 등록 폼 -->
       	<form action="/board/modify" method="post" role="form">
       		<input type="hidden" name="${_csrf.parameterName }"
								 value="${_csrf.token }">   
         	<input type="hidden" name="pageNum" value="${cri.pageNum }">
            <input type="hidden" name="amount"  value="${cri.amount }">
       		<!-- 필수 입력 항목 안내 메시지 -->
			<c:set var="subMsg" 	value="제목을 입력해 주세요."/>
			<c:set var="conMsg" 	value="내용을 입력해 주세요."/>
			
        	<div class="form-group row">
        		<div class="col-sm-2">게시글 정보</div>
        		<label style="padding-left: 20px;">No.</label>
				<div class="col-sm-3">
					<input type="text" name="bno" id="bno" class="form-control"
							 readonly value="${board.bno }">
				</div>
				
				<label>작성자</label>
				<div class="col-sm-3">
					<input type="text" name="writer" id="writer" class="form-control"
							 readonly value="${board.writer }"></div>
			</div>	
			 
		<div class="form-group row">
			<label class="col-sm-2">제목</label>
			<div class="col-sm-8">
				<input type="text" name="title" id="title" class="form-control"
 						 required 
						 oninput="setCustomValidity('')"
						 oninvalid="this.setCustomValidity('${subMsg }')" value="${board.title }"></div></div>
						 
		<div class="form-group row">
			<label class="col-sm-2">내용</label>
			<div class="col-sm-8">
				<textarea rows="5" cols="50" name="content" id="content" class="form-control"
 						 required 
						 oninput="setCustomValidity('')"
						 oninvalid="this.setCustomValidity('${conMsg }')">${board.content }</textarea></div></div>
		
		<div class="form-group row ">
			<div class="col-sm-offset-2 col-sm-10" align="right">
				<button class="btn btn-poka-warning" data-oper="list">목록</button>
				<button type="button" class="btn btn-poka-danger" data-oper="remove">삭제</button>
				<button class="btn btn-info" data-oper="modify">수정</button></div></div>		
       	</form>
       	<!-- END 게시물 등록 폼 -->
       	
       	<!-- 첨부파일 -->
    	<div class="row">
			<label class="col-sm-2">파일첨부</label>
			<div class="col-sm-8">
				<div class="form-group uploadDiv">
					<input type="file" name="uploadFile" multiple>
				</div>
			</div>	
       	</div>
     	<!-- 첨부파일 업로드 결과 표시 -->
         <div class="uploadResult">
			<ul></ul>                    	
         </div>
     </div>	
<script>
//첨부파일 목록  가져오기
(function(){
	var bno = '${board.bno}';
	console.log(bno + '번 게시물 첨부파일 목록');
	
	$.getJSON('/board/getAttachList', {bno : bno }, function(result){
		var tag = "";
		console.log(result);
		
		$(result).each(function(i, obj){
			if( !obj.fileType ){		//이미지가 아니면 첨부파일 아이콘과 파일명 표시 
				var fileCallPath = encodeURIComponent(
										obj.uploadPath + "/" +
										obj.uuid + "_" + 
										obj.fileName );
				
				var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");		 
					
				tag += "<li data-path='" + obj.uploadPath + "'   data-uuid='" + obj.uuid + "' " +
						  " data-filename='" + obj.fileName + "' data-type='" + obj.fileType + "'>" +
						   "<div><span>" + obj.fileName + " </span>" +
								"<button type='button' class='btn btn-warning btn-circle' " +  
					               " data-file='" + fileCallPath + "' data-type='file' >" + 
					        	"<i class='fa fa-times'></i></button><br>" +
						        "<img src='/resources/img/attach.png'></div></li>";	

			} else {	//그렇지 않으면 썸네일 표시
				var fileCallPath = encodeURIComponent(
										obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName );
			
				tag += "<li data-path='" + obj.uploadPath + "'   data-uuid='" + obj.uuid + "' " +
						  " data-filename='" + obj.fileName + "' data-type='" + obj.fileType + "'>" +
						   "<div><span>" + obj.fileName + " </span> " + 
					        	"<button type='button' class='btn btn-warning btn-circle' " +  
					                   " data-file='" + fileCallPath + "' data-type='image' >" + 
					        	"<i class='fa fa-times'></i></button><br>" +
						   		"<img src='/display?fileName=" + fileCallPath + "'></div></li>";		
			}
		});
		$('.uploadResult ul').html(tag);	
	});
})(); //END 첨부파일 목록  가져오기

//X 표시 클릭 이벤트 처리
var csrfHeaderName = '${_csrf.headerName}';	//CSRF 토큰 관련 변수
var csrfTokenValue = '${_csrf.token}';
		
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


$(function(){
	var frm = $('form');
	
	$('button').on('click', function(e){
		e.preventDefault();	
		
		var operation = $(this).data('oper');
		
		if(operation === 'remove') { 		//삭제 버튼 눌린 경우
			frm.attr('action', '/board/delete');
			frm.submit();
		} else if(operation === 'list'){	//목록 버튼이 눌린 경우
			//페이지 번호와 게시물 수 복제
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag  = $("input[name='amount']").clone();
			
			frm.attr('action', '/board/list')
			   .attr('method', 'get');
			frm.empty();
			
			//복제해 둔 페이지 번호와 게시물 수를 폼에 추가
			frm.append(pageNumTag);
			frm.append(amountTag);
			
			frm.submit();
		} else if(operation === 'modify'){	//수정 버튼이 눌린 경우
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
			
			frm.append(tag).submit();	//생성된 태그를 폼에 추가한 후 전송
		}
//		
	});//END 버튼 클릭 이벤트 처리
	
	/////////////////////////////////////////////////////////////////////
	
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
						        "<img src='/resources/image/attach.png'></div></li>";	

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
});//END $
</script>     
<%@ include file="../include/footer.jsp"%>     