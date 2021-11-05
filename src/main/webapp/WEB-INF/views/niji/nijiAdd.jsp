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

</style>
<link rel="stylesheet" type="text/css" href="/resources/css/signIn.css">
<div class="jumbotron">
	<div class="container">
		<h1 class="display-5" id = "jumbo">
			販売 登録</h1></div></div>
	
	
	
	<div class="container">
	
	
	<!----------------------------- 판매글 영역 시작------------------ --> 
	
			<form role="form" method="post" action="/niji/add" id ="seller">
				
				<div class="col-sm-5">
						<label><input type="radio" name="category" value="S" checked> 販売</label>
						<label><input type="radio" name="category" value="B"> 購買</label>
						
					</div>
				
						<input name="writer" class="form-control" 
	                    		       value='<sec:authentication property="principal.username"/>'
	                    		       readonly> </div>
	                    		       
				<div class="form-group row ">
					<label class="col-sm-2">タイトル</label>
					<div class="col-sm-4">
						<input type="text" name="title" id="title" class="form-control"
							required>
					</div>
				</div>
				
				<div class="form-group row mt-4">
					<label class="col-sm-2">内容</label>
					<div class="col-sm-4">
						<input type="text" name="content" id="content"
							class="form-control" required>
					</div>
				</div>
				<div class="form-group row mt-4">
					<label class="col-sm-2">販売イメージ</label>
					<div class="col-sm-4">
						<p>drag and drop your image!</p>
						<div class="content">
						</div>
						
						<input type = "hidden" id = "image" name = "image">	
												
				</div>
				</div>
				<div class="form-group row mt-4">
					<label class="col-sm-2">tag</label>
					<div class="col-sm-4">
						<input type="text" name="fullTag" id="fullTag"
							class="form-control" readonly>
					</div>
				</div>
	
				<div class="form-group row mt-4">
					<label class="col-sm-2">価格</label>
					<div class="col-sm-10">
						<input type="number" name="price" id="price"> 
					</div>
				</div>
	
			
				<div class="form-group row mt-4">
					<div class="col-sm-offset-2 col-sm-12 text-center">
						<input type="button" class="btn btn-secondary"
							style="width: 100px;" value="취소" onclick="history.back()">
						<input type="submit" class="btn offset-2"
							style="width: 100px; background-color: #37867F; color:white; " value="등록">
						<input type="hidden" name="${_csrf.parameterName }"
												 value="${_csrf.token }">     
					</div>
				</div>
			</form>
			<!----------------------------- 판매글 영역 끝  ------------------ -->
			
			<!----------------------------- 구매글 영역 시작 ------------------ -->
			<form role="form" method="post" action="/niji/add" id = "buyer" style = "display:none">
				
				<div class="col-sm-5">
						<label><input type="radio" name="category" value="S"> 販売</label>
						<label><input type="radio" name="category" value="B"> 購買</label>
						
					</div>
						<input name="writer" class="form-control" 
	                    		       value='<sec:authentication property="principal.username"/>'
	                    		       readonly> </div>
				<div class="form-group row ">
					<label class="col-sm-2">タイトル</label>
					<div class="col-sm-4">
						<input type="text" name="title" id="title" class="form-control"
							required>
					</div>
				</div>
				
				<div class="form-group row mt-4">
					<label class="col-sm-2">内容</label>
					<div class="col-sm-4">
						<input type="text" name="content" id="content"
							class="form-control" required>
					</div>
				</div>
				
			
				<div class="form-group row mt-4">
					<div class="col-sm-offset-2 col-sm-12 text-center">
						<input type="button" class="btn btn-secondary"
							style="width: 100px;" value="취소" onclick="history.back()">
						<input type="submit" class="btn offset-2"
							style="width: 100px; background-color: #37867F; color:white; " value="등록">
						<input type="hidden" name="${_csrf.parameterName }"
												 value="${_csrf.token }">     
					</div>
				</div>
			</form>
			
			
		</div>
		
	<script>
	
	$("input:radio[name=category]").click(function(){
        
	
		
		if($(this).val()=='B'){

			
			$("input:radio[name='category']:radio[value='B']").prop('checked', true); // 선택하기
			$('#jumbo').text('購買登録');
			$('#seller').hide();
			$('#buyer').show();

			
		}else{
			$("input:radio[name='category']:radio[value='S']").prop('checked', true); // 선택하기
			$('#jumbo').text('販売登録');
			$('#buyer').hide();
			$('#seller').show();
		}
	});

	function setThumbnail(event) { 
		var file_real = "";
		var reader = new FileReader(); 
		reader.onload = function(event) { 
		var img = document.getElementById("view_img"); 
		img.setAttribute("src", event.target.result); 	

		}; 		
		reader.readAsDataURL(event.target.files[0]); 

		var test = event.target.files[0];

		 	        var form = new FormData();
		 	        form.append("image", event.target.files[0]);
		 	 
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
			        		           xhr.setRequestHeader("Authorization","KakaoAK f2d4b274f442d865b7cb423d1cc1d182");
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
			        				$('#tag').val(tag_input_val.slice(0,-1));
			        			}	        			
			        			,complete:function(){
			        		        $('.wrap-loading').addClass('display-none'); //로딩중 이미지 감추기
			        		    }
			        		}); 
		 	           
		 	   }); 
		 	   
		/*  	   
		   $.ajax(	
	        		{
	        			url : "https://dapi.kakao.com/v2/vision/multitag/generate",
	        			method : "POST", 
	        			data : {
	        				"image_url" : file_real
	        			},
	        			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        			 beforeSend: function (xhr) {
	        		           xhr.setRequestHeader("Authorization","KakaoAK f2d4b274f442d865b7cb423d1cc1d182");
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
	        				$('#tag').val(tag_input_val.slice(0,-1));
	        			}	        			
	        			,complete:function(){
	        		        $('.wrap-loading').addClass('display-none'); //로딩중 이미지 감추기
	        		    }
	        		});  */
		 
		
	}

/* 
	$(function(){
		var file = document.getElementById('file');
		var image = document.getElementById('image');

		file.onchange = function (event) {
			 var target = event.currentTarget;
			 alert(event.target.result);
			   $.ajax(	
		        		{
		        			url : "https://dapi.kakao.com/v2/vision/multitag/generate",
		        			method : "POST", 
		        			data : {
		        				"image_url" : event.target.result
		        			},
		        			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		        			 beforeSend: function (xhr) {
		        		           xhr.setRequestHeader("Authorization","KakaoAK f2d4b274f442d865b7cb423d1cc1d182");
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
		        				$('#tag').val(tag_input_val.slice(0,-1));
		        			}	        			
		        			,complete:function(){
		        		        $('.wrap-loading').addClass('display-none'); //로딩중 이미지 감추기
		        		    }
		        		}); 
		};//(event)function 끝
		 
	});
	 */
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
			        		        $('.wrap-loading').addClass('display-none'); //로딩중 이미지 감추기
			        		    }
			        		}); 
		 	           
		 	   }); 
	
	    
	}
	</script>	
		

<%@ include file="../include/footer.jsp" %>