<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" type="text/css" href="/resources/css/board.css">
<div class="jumbotron">
	<div class="container">
		<h1 class="display-5">게시글 상세</h1>
	</div>
</div>
<div class="container" style="background-color:#D8E9E7; padding:30px;">
    <div class="row">
    	<div class="col">
    		<label class="mr-3">제목</label>
    	 	${board.title }
    	 </div>
    </div>
    <div class="row">
    	<div class="col">
			<label>작성자</label>
			<span class="dropdown">
				<a id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<img src="/resources/images/001_g_bronze.png" style="width:20px; height:20px;"> ${board.writer }
					  <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
						    <button class="dropdown-item" type="button">팔로우추가</button>
					  </div></a></span></div><div>

			<label class="mr-3">등록일</label>
			 <fmt:formatDate value="${board.regDate }" pattern="yyyy-MM-dd hh:mm:ss"/>
		</div>
		<div class="ml-3">
			<img src="/resources/images/siren.png" style="width:20px; height:20px;">
			<label class="mr-3">신고</label>		
		</div>
		
	</div>
</div>
	
<div class="container">			 
	<div class="form-group row">
		<textarea rows="5" cols="50" name="content" id="content" class="form-control"
		  readonly>${board.content }
		</textarea>
	</div>

	<div class="form-group row justify-content-center">
		<div class="col-sm-offset-2 col-sm-10" align="center">
			<button class="btn btn-secondary" data-oper="list">목록</button>
			<!-- 로그인 O -->
			<sec:authentication property="principal" var="p"/>
			<sec:authorize access="isAuthenticated()">
				<!-- 로그인한 사용자가 작성한 글인 경우에만 표시 -->
				<c:if test="${p.username eq board.writer }">
					<button class="btn btn-poka-light" data-oper="modify">수정</button>
				</c:if>
		    </sec:authorize>
		    
		     <!-- 폼 태그 추가 -->	
             <form action="/board/modify">
             	<input type="hidden" name="bno" value="${board.bno }" id="bno">
             	<!-- 넘어온 페이지 번호와 페이지당 표시 게시물 수 파라미터 추가 -->
             	<input type="hidden" name="pageNum" value="${cri.pageNum }">
		    </form>
		</div>
	</div>	
	<!-- 썸네일 이미지 원본 표시 -->
	<div class="bigPicWrapper">
		<div class="bigPic">
		</div>
	</div>	
	<!-- END 썸네일 이미지 원본 표시 -->
      
      <!-- 첨부파일 목록 -->
      <div class="row mb-3">
      	  <div class="col-lg-12">첨부파일</div>
		  <!-- 첨부파일 업로드 결과 표시 -->
	      <div class="uploadResult">
			<ul></ul>                    	
     	  </div><!-- END 첨부파일 업로드 결과 표시 -->
      </div><!-- END 첨부파일 목록 -->				
</div>
<script>
$(function(){
	var bnoValue = '${board.bno}'; 
	var frm = $('form');
	
	//수정 버튼
	$("button[data-oper='modify']").on('click', function(e){
		frm.submit();
	});//END 수정 버튼
	
	//목록 버튼
	$("button[data-oper='list']").on('click', function(e){
		frm.find('#bno').remove();
		frm.attr('action', '/board/list')
		   .submit();
	});//END 목록 버튼
	
});//END $

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
						   "<div><span>" + obj.fileName + "</span><br> " + 
						        "<img src='/resources/img/attach.png'></div></li>";	

			} else {	//그렇지 않으면 썸네일 표시
				var fileCallPath = encodeURIComponent(
										obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName );
			
				tag += "<li data-path='" + obj.uploadPath + "'   data-uuid='" + obj.uuid + "' " +
						  " data-filename='" + obj.fileName + "' data-type='" + obj.fileType + "'>" +
						   "<div><img src='/display?fileName=" + fileCallPath + "'></div></li>";		
			}
		});
		$('.uploadResult ul').html(tag);	
	});
})(); //END 첨부파일 목록  가져오기

//첨부파일 클릭 이벤트 처리
$('.uploadResult').on('click', 'li', function(e){
	var li = $(this);
	
	var fileCallPath = encodeURIComponent(
							li.data('path') + "/" +
							li.data('uuid') + "_" + 
							li.data('filename'));
	
	if(li.data('type')){	//이미지의 경우 화면 표시
		showImage(fileCallPath.replace(new RegExp(/\\/g), "/"));
	} else { //그렇지 않으면 다운로드 
		self.location = "/download?fileName=" + fileCallPath;
		console.log('not img');
	}
	
});//END 첨부파일 클릭 이벤트 처리


//썸네일 이미지 원본 표시
function showImage(fileCallPath){
	$('.bigPicWrapper').css('display', 'flex').show();
	$('.bigPic').html("<img src='/display?fileName=" + fileCallPath + "'>")
				.animate({ width:'100%', height:'100%' }, 1000);		
}//END 썸네일 이미지 원본 표시

//썸네일 이미지 원본 클릭 이벤트 처리
$('.bigPicWrapper').on('click', function(e){
	$(this).hide();
});//END 썸네일 이미지 원본 클릭 이벤트 처리

</script>        
<%@ include file="../include/footer.jsp"%>