<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>   
<style>
.content{
    outline: 2px dashed #92b0b3 ;
    outline-offset:-10px;  
    text-align: center;
    transition: all .15s ease-in-out;
    width: 300px;
    height: 300px;
    background-color: gray;
}

.content img, .content video{
    width:100%;
    height:100%;
    display:none;
}


    /*  css  로딩중 start */

#link {
  color: #e45635;
  display: block;
  font: 12px "Helvetica Neue", Helvetica, Arial, sans-serif;
  text-align: center;
  text-decoration: none;
}
#link:hover {
  color: #cccccc;
}

#link,
#link:hover {
  -webkit-transition: color 0.5s ease-out;
  -moz-transition: color 0.5s ease-out;
  -ms-transition: color 0.5s ease-out;
  -o-transition: color 0.5s ease-out;
  transition: color 0.5s ease-out;
}

/** BEGIN CSS **/
body {
  background: #333333;
}
@keyframes rotate-loading {
  0% {
    transform: rotate(0deg);
    -ms-transform: rotate(0deg);
    -webkit-transform: rotate(0deg);
    -o-transform: rotate(0deg);
    -moz-transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
    -ms-transform: rotate(360deg);
    -webkit-transform: rotate(360deg);
    -o-transform: rotate(360deg);
    -moz-transform: rotate(360deg);
  }
}

@-moz-keyframes rotate-loading {
  0% {
    transform: rotate(0deg);
    -ms-transform: rotate(0deg);
    -webkit-transform: rotate(0deg);
    -o-transform: rotate(0deg);
    -moz-transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
    -ms-transform: rotate(360deg);
    -webkit-transform: rotate(360deg);
    -o-transform: rotate(360deg);
    -moz-transform: rotate(360deg);
  }
}

@-webkit-keyframes rotate-loading {
  0% {
    transform: rotate(0deg);
    -ms-transform: rotate(0deg);
    -webkit-transform: rotate(0deg);
    -o-transform: rotate(0deg);
    -moz-transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
    -ms-transform: rotate(360deg);
    -webkit-transform: rotate(360deg);
    -o-transform: rotate(360deg);
    -moz-transform: rotate(360deg);
  }
}

@-o-keyframes rotate-loading {
  0% {
    transform: rotate(0deg);
    -ms-transform: rotate(0deg);
    -webkit-transform: rotate(0deg);
    -o-transform: rotate(0deg);
    -moz-transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
    -ms-transform: rotate(360deg);
    -webkit-transform: rotate(360deg);
    -o-transform: rotate(360deg);
    -moz-transform: rotate(360deg);
  }
}

@keyframes rotate-loading {
  0% {
    transform: rotate(0deg);
    -ms-transform: rotate(0deg);
    -webkit-transform: rotate(0deg);
    -o-transform: rotate(0deg);
    -moz-transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
    -ms-transform: rotate(360deg);
    -webkit-transform: rotate(360deg);
    -o-transform: rotate(360deg);
    -moz-transform: rotate(360deg);
  }
}

@-moz-keyframes rotate-loading {
  0% {
    transform: rotate(0deg);
    -ms-transform: rotate(0deg);
    -webkit-transform: rotate(0deg);
    -o-transform: rotate(0deg);
    -moz-transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
    -ms-transform: rotate(360deg);
    -webkit-transform: rotate(360deg);
    -o-transform: rotate(360deg);
    -moz-transform: rotate(360deg);
  }
}

@-webkit-keyframes rotate-loading {
  0% {
    transform: rotate(0deg);
    -ms-transform: rotate(0deg);
    -webkit-transform: rotate(0deg);
    -o-transform: rotate(0deg);
    -moz-transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
    -ms-transform: rotate(360deg);
    -webkit-transform: rotate(360deg);
    -o-transform: rotate(360deg);
    -moz-transform: rotate(360deg);
  }
}

@-o-keyframes rotate-loading {
  0% {
    transform: rotate(0deg);
    -ms-transform: rotate(0deg);
    -webkit-transform: rotate(0deg);
    -o-transform: rotate(0deg);
    -moz-transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
    -ms-transform: rotate(360deg);
    -webkit-transform: rotate(360deg);
    -o-transform: rotate(360deg);
    -moz-transform: rotate(360deg);
  }
}

@keyframes loading-text-opacity {
  0% {
    opacity: 0;
  }
  20% {
    opacity: 0;
  }
  50% {
    opacity: 1;
  }
  100% {
    opacity: 0;
  }
}

@-moz-keyframes loading-text-opacity {
  0% {
    opacity: 0;
  }
  20% {
    opacity: 0;
  }
  50% {
    opacity: 1;
  }
  100% {
    opacity: 0;
  }
}

@-webkit-keyframes loading-text-opacity {
  0% {
    opacity: 0;
  }
  20% {
    opacity: 0;
  }
  50% {
    opacity: 1;
  }
  100% {
    opacity: 0;
  }
}

@-o-keyframes loading-text-opacity {
  0% {
    opacity: 0;
  }
  20% {
    opacity: 0;
  }
  50% {
    opacity: 1;
  }
  100% {
    opacity: 0;
  }
}
.loading-container,
.loading {
  height: 100px;
  position: relative;
  width: 100px;
  border-radius: 100%;
  padding-top: 80px; 
}

.loading-container {
  margin: 40px auto;
}

.loading {
  border: 2px solid transparent;
  border-color: transparent #fff transparent #fff;
  -moz-animation: rotate-loading 1.5s linear 0s infinite normal;
  -moz-transform-origin: 50% 50%;
  -o-animation: rotate-loading 1.5s linear 0s infinite normal;
  -o-transform-origin: 50% 50%;
  -webkit-animation: rotate-loading 1.5s linear 0s infinite normal;
  -webkit-transform-origin: 50% 50%;
  animation: rotate-loading 1.5s linear 0s infinite normal;
  transform-origin: 50% 50%;
}

.loading-container:hover .loading {
  border-color: transparent #e45635 transparent #e45635;
}
.loading-container:hover .loading,
.loading-container .loading {
  -webkit-transition: all 0.5s ease-in-out;
  -moz-transition: all 0.5s ease-in-out;
  -ms-transition: all 0.5s ease-in-out;
  -o-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out;
}

#loading-text {
  -moz-animation: loading-text-opacity 2s linear 0s infinite normal;
  -o-animation: loading-text-opacity 2s linear 0s infinite normal;
  -webkit-animation: loading-text-opacity 2s linear 0s infinite normal;
  animation: loading-text-opacity 2s linear 0s infinite normal;
  color: #ffffff;
  font-family: "Helvetica Neue, " Helvetica ", " "arial";
  font-size: 10px;
  font-weight: bold;
  margin-top: 45px;
  opacity: 0;
  position: absolute;
  text-align: center;
  text-transform: uppercase;
  top: 0;
  width: 100px;
  padding-top: 80px;
}

	/*  css 로딩중 end  */

</style>
<link rel="stylesheet" type="text/css" href="/resources/css/signIn.css">
<div class="jumbotron">
	<div class="container">
		<h1 class="display-5" id = "jumbo">
			詳細を見る ${niji.category}</h1></div></div>
 
	<div class="container">
	
		
	<c:choose> 
	<c:when test="${niji.category=='S'}">
	
	
	
	            <form role="form" method="post" action="/niji/modify" id ="seller">
					<input name="writer" class="form-control"  value='${niji.writer}' readonly>  		               		   	             		   
				
				<input name="category" type = "hidden" class="form-control"  value='${niji.category}'>  		
				<input name="nno" type = "hidden" class="form-control"  value='${niji.nno}'>  		
				
				<div class="form-group row ">
					<label class="col-sm-2">タイトル</label>
					<div class="col-sm-4">
						<input type="text" name="title" id="title" class="form-control" value="${niji.title}" >
					</div>
				</div>
				
				<div class="form-group row mt-4">
					<label class="col-sm-2">内容</label>
					<div class="col-sm-4">
						<input type="text" name="content" id="content" value = "${niji.content}"
							class="form-control" required >
					</div>
				</div>
				
				<div class="form-group row mt-4">
					<label class="col-sm-2">販売イメージ </label>
					<div class="col-sm-4">
						<p>drag and drop your image!</p>	
						<div class="content" id  = "image_content" style="background-image: URL('../../../../resources/upload/water_${niji.image}') ;">
						
						<!-- 로딩중 이미지 -->
						<div class="loading-container">
						  <div class="loading"></div>	
						  <div id="loading-text">loading</div>
						</div>
	
						</div>				 
						<input type = "hidden" id = "image" name = "image"  value = "${niji.image}">										
					</div>
				</div>
				
				<div class="form-group row mt-4">
					<label class="col-sm-2">tag</label>
					<div class="col-sm-4">
					 <input type="text"  class="form-control"  name="fullTag" id="fullTag" value ="${niji.fullTag}" >
					</div>
				</div>
				
				<div class="form-group row mt-4">
					<label class="col-sm-2">価格</label>
					<div class="col-sm-10">
						<input type="number" name="price" id="price" value = "${niji.price}"> 
					</div>
				</div>
				
			<button class="btn btn-secondary" data-oper="list">目録</button>
			<!-- 로그인 O -->
			<sec:authentication property="principal" var="p"/>
			<sec:authorize access="isAuthenticated()">
				<!-- 로그인한 사용자가 작성한 글인 경우에만 표시 -->
				<c:if test="${p.username eq niji.writer }">
					<button class="btn btn-poka-light" data-oper="modify" id = "modify1">修正</button>
						<button class="btn btn-poka-danger" data-oper="remove" id = "remove">削除</button>　
									<input type="hidden" name="${_csrf.parameterName }"
												 value="${_csrf.token }">      
				</c:if>
		    </sec:authorize>
		    
			</form>
	</c:when>
			                    		                    
		<c:otherwise> 
	
		   <form role="form" method="post" action="/niji/modify" id ="buyer">	   
					
					<input name="writer" class="form-control"  value='${niji.writer}' readonly>
					<input name="category" type = "hidden" class="form-control"  value='${niji.category}'>		
					<input name="nno" type = "hidden" class="form-control"  value='${niji.nno}'>  
					
								 	                     		        
					<div class="form-group row ">
						<label class="col-sm-2">タイトル</label>
						<div class="col-sm-4">
							<input type="text" name="title" id="title" class="form-control" value = "${niji.title}"
								required>
						</div>
					</div>				
					<div class="form-group row mt-4">
						<label class="col-sm-2">内容</label>
						<div class="col-sm-4">
							<input type="text" name="content" id="content" value = "${niji.content}"
								class="form-control" required>
						</div>
					</div>											  
				<button class="btn btn-secondary" data-oper="list">目録</button>
				<!-- 로그인 O -->
				<sec:authentication property="principal" var="p"/>
				<sec:authorize access="isAuthenticated()">
					<!-- 로그인한 사용자가 작성한 글인 경우에만 표시 -->
					<c:if test="${p.username eq niji.writer }">
						<button class="btn btn-poka-light" data-oper="modify" id = "modify2">修正</button>
						<button class="btn btn-poka-danger" data-oper="remove" id = "remove2">削除</button>
						
										<input type="hidden" name="${_csrf.parameterName }"
												 value="${_csrf.token }">     
					</c:if>
			    </sec:authorize>					
			</form>					
		</c:otherwise>
		</c:choose>
					
	


			
		
			<!----------------------------- 판매글 영역 끝  ------------------ -->
			

		</div>
		
		

	<script>
	
	$(".loading-container").hide();
	
    $("#image_content").css({
        
        "outline": "none",
        "background-size": "100% 100%"
    });
	
	
    $(function(){
    	var bnoValue = '${niji.nno}'; 
 
    	//삭제 버튼
    	$("#remove").on('click', function(e){
    		
    	   	var frm = $('#seller'); 	
    	   	
			frm.attr('action', '/niji/delete');
			frm.submit();	
    	});//END 삭제 버튼
    	
    	
    	//삭제 버튼
    	$("#remove2").on('click', function(e){
    		
    	   	var frm = $('#buyer');	   	
    	   	
			frm.attr('action', '/niji/delete');
			frm.submit();

    	});//END 삭제 버튼
    	
    	
    	//수정 버튼
    	$("#modify1").on('click', function(e){
    		
    	   	var frm = $('#seller');
    	   	
    		frm.submit();
    		
    		
    	});//END 수정 버튼
    	
       	//수정 버튼
    	$("#modify2").on('click', function(e){
    		
    	   	var frm = $('#buyer');
    		frm.submit();
    		
    		
    	});//END 수정 버튼
    	
    	//목록 버튼
    	$("button[data-oper='list']").on('click', function(e){
    		frm.find('#nno').remove();
    		frm.attr('action', '/niji/list')
    		   .submit();
    	});//END 목록 버튼
    	
    });//END $

    $('.content')
	  .on("dragover", dragOver)
	  .on("dragleave", dragOver)
	  .on("drop", uploadFiles);
    
	function dragOver(e){
		  e.stopPropagation();
		  e.preventDefault();
		  if (e.type == "dragover") {
		    $(e.target).css({
		      "background-color": "black",
		      "outline-offset": "-20px"
		    });
		  } else {
		      $(e.target).css({
		      "background-color": "gray",
		      "outline-offset": "-10px"
		    });
		    }
		}
    
function uploadFiles(event) {
		
		event.stopPropagation();
		event.preventDefault();
	    dragOver(event);
	  
	    event.dataTransfer = event.originalEvent.dataTransfer;
	    var files = event.target.files || event.dataTransfer.files;
	    if (files.length > 1) {
	        alert('하나만 올려라.');
	        return;
	    }
	    if (files[0].type.match(/image.*/)) {
	                $(event.target).css({
	            "background-image": "url(" + window.URL.createObjectURL(files[0]) + ")",
	            "outline": "none",
	            "background-size": "100% 100%"
	        });
	    }else{
	      alert('이미지가 아닙니다.');
	      return;
	    }
	    
	    $(".loading-container").show(); //로딩중 보이게 하기
	    
	    
		var file_real = "";
		var reader = new FileReader(); 	
		var test = files[0];
		var form = new FormData();	
		form.append("image", files[0]);
		
		var csrfHeaderName = '${_csrf.headerName}';	//CSRF 토큰 관련 변수
		var csrfTokenValue = '${_csrf.token}';	
		
	//////////////////파일업로드 ajax 시작 ///////////////////	
		var form2 = new FormData();	
		form2.append("uploadFile", files[0]);

		$.ajax({
			type	: 'post',
			url 	: '/uploadAjaxAction2',
			data	: form2,
			contentType : false,
			processData : false,
			dataType    : 'json',
			beforeSend : function(xhr){	//전송 전 추가 헤더 지정
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success : function(result){
				
				console.log("fileName :::" + result.fileName);
				
				console.log("uploadPath :::" + result.uploadPath);
				$('#image').val(result.fileName);
				
				
				//업로드 결과 출력 함수 호출
				//showUploadedFile(result);
				
		//		$('.uploadDiv').html(uploadTag.html());
			}
		});
	//////////////////파일업로드 ajax 끝 ///////////////////	
		 
	
		  var settings = {
		 	     "url": "https://api.imgbb.com/1/upload?key=dd33b5196e0d8185ce64c99507776fa2",
		 	     "method": "POST",
		 	     "timeout": 0, 	       
		 	     "processData": false,
		 	     "mimeType": "multipart/form-data",
		 	     "contentType": false,
		 	     "data": form
		 	};
 	 
		 	   $.ajax(settings).done(function (response) {
		 	              console.log(response);
		 	             var jx = JSON.parse(response);
		 	            console.log(jx.data.url);
		 	           file_real = jx.data.url;         
		 	           $.ajax(	
			        		{
			        			url : "https://dapi.kakao.com/v2/vision/multitag/generate",
			        			method : "POST", 
			        			data : {
			        				"image_url" : file_real
			        			},
			        			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			        			 beforeSend: function (xhr) {
			        		           xhr.setRequestHeader("Authorization","KakaoAK ba4cb63601508f24d7800dc383e44fa4");
			        		       }, 
			        		    	success : function (data,status){ 
			        		    		console.log('data  :::: '+data);
			        		    		console.log('data.label_kr  :::: '+data.result);
			        		    		console.log('json data.label_kr  :::: '+JSON.stringify(data.result));
			        		    		console.log('json data.label_kr _label  :::: '+JSON.stringify(data.result.label_kr)); //이거다 ㅅㅂ
			        		    	
			        		    		var tag_list = JSON.stringify(data.result.label_kr);
			        		    		var tag_list_parse = JSON.parse(tag_list);
			        					var tag_input_val = '';
			        					for(var i=0; i<tag_list_parse.length; i++){
			        						
			        						console.log(tag_list_parse[i]);
			        						
			        						tag_input_val += tag_list_parse[i]+',';
			        						
			        					}
			        				$('#fullTag').val(tag_input_val.slice(0,-1));
			        			}	        			
			        			,complete:function(){
			        				$(".loading-container").hide();
			        		    }
			        		}); 
		 	           
		 	   }); 
	
	    
	}
	</script>	
		

<%@ include file="../include/footer.jsp" %>