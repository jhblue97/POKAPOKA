<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<script type="text/javascript" src="/resources/js/report.js"></script>


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
				<a id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onclick="chkFollow('${board.writer}')">
					 ${board.writer }
					  <!-- 로그인 O -->
					  <sec:authorize access="isAuthenticated()">
					  <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
					  <c:choose>
					  	<c:when test="true">
					  		<button class="dropdown-item" type="button" id="followAdd">팔로우추가</button>
					  	</c:when>
					  	<c:otherwise>
					  		<button class="dropdown-item" type="button">팔로우삭제</button>
					  	</c:otherwise>
					  </c:choose>
						    
					  </div></sec:authorize>
					  </a></span></div><div>

			<label class="mr-3">등록일</label>
			 <fmt:formatDate value="${board.regDate }" pattern="yyyy-MM-dd hh:mm:ss"/>
		</div>
		<div class="ml-3">
			<img src="/resources/images/siren.png" style="width:20px; height:20px;">
			<label class="mr-3"><button id = "view" class='btn btn-outline-warning' data-toggle="modal" data-target="#myModal2" data-num ="${pay.pno}">신고</button> </label>		
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
             <form action="/board/modify" id = "form1">
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



<!-- view modal  -->		 
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
        <h4 class="modal-title" id="myModalLabel">申告</h4> <br>
      </div>
      <form action="/report/add" method="post" enctype="multipart/form-data" class="form-horizontal"  id = "form2"> 	
      

       
       	<input name="writer"  id = "writer" type = "hidden" class="form-control"  value='${board.writer}'> 
          
          
	<input name="reporter"  id = "reporter" type = "hidden" class="form-control"  value='<sec:authentication property="principal.username"/>'> 
            		
      <div class="modal-body">  
       		 <select class="form-control" id="select">
		      <option value = "1">わいせつ物</option>
		      <option value = "2">広告</option>
		      <option value = "3" >悪口</option>
		    </select>	 
      </div> 
      
      
      <div class="modal-footer">
      
        <button type="button" id = "report_add" class="btn btn-poka-main" >登録</button>			                              		
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
      </div> 
      </form>
    </div>
  </div></div>	
	<!-- view modal  END-->	


<script>
$(function(){
	var bnoValue = '${board.bno}'; 
	var frm = $('#form1');
	
	var frm2 = $('#form2');
	
	var followValue = '${board.writer}';
	
	var followerValue = '<sec:authentication property="principal.user.user_id"/>';
	
	var csrfHeaderName = '${_csrf.headerName}';	//CSRF 토큰 관련 변수
	var csrfTokenValue = '${_csrf.token}';	
	
	
	$("#report_add").on('click', function(e){
	
		//alert('gg');
		var bno = $('#bno').val();
		var select = $('#select').val();
		var reporter = $('#reporter').val();
		var writer = $('#writer').val();
		var category = 'B';
		
		 
		$.get('/report/add/'+bno+"/"+reporter+"/"+select+"/"+writer+"/"+category,
				  function(result){
			console.log(result);
			
			if(result=="success"){
				alert('申告されました。');
			}
			
			}
		).fail(function(xhr, status, er){
					if(error){
						error(er);
					}
		});		
	});
	
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
	
	$('#followAdd').on('click', function(e){
		followService.add(
			{ follow : followValue,
				  follower : followerValue },
				function(result){
					  console.log("follow : " + followValue);
					  console.log("follower : " + followerValue);
					  alert("팔로우가 추가되었습니다.");
			});
	});
	
	//팔로우 추가
	var followService = (function() {

	function add(follow, callback, error){
		$.ajax({
			type : 'GET',
			url : '/follow/new',
			data : JSON.stringify(follow),
		    contentType: "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	return {add : add};

	})();
	
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

//팔로우 체크
function chkFollow(follow, callback, error){
    $.get("/follow/chkFollow/" + follow,
            function(result){
        if(result == "already"){
        	console.log("팔로우 상태임");
            result = true;
            
        } else{
        	console.log("팔로우 상태 아님");
        	result = false;
        }
        console.log(result);
    }
        ).fail(function(xhr, status, er){
            if(error){
                error(er);
        }
    });
}



</script>        
<%@ include file="../include/footer.jsp"%>