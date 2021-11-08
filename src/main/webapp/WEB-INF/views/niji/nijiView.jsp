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
			<form role="form" method="get" action="/niji/modify" id ="seller">
					   	<input type="hidden" name="nno" value="${niji.nno }" id="nno">      				
						<input name="writer" class="form-control" 
	                    		       value='${niji.writer}' readonly> 	                    		       
			</form>
	<c:choose> 
	<c:when test="${niji.category=='S'}">
         		   
				<div class="form-group row ">
					<label class="col-sm-2">タイトル</label>
					<div class="col-sm-4">
						<input type="text" name="title" id="title" class="form-control" value="${niji.title}"						
							 readonly>
					</div>
				</div>
				
				<div class="form-group row mt-4">
					<label class="col-sm-2">内容</label>
					<div class="col-sm-4">
						<input type="text" name="content" id="content" value = "${niji.content}"
							class="form-control" required readonly>
					</div>
				</div>
				<div class="form-group row mt-4">
					<label class="col-sm-2">販売イメージ </label>
					<div class="col-sm-4">
						<div class="content" id  = "image_content" style="background-image: URL('../../../../resources/upload/water_${niji.image}') ;">
						</div>					
						<input type = "hidden" id = "image" name = "image">												
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
						<input type="number" name="price" id="price" value = "${niji.price}" readonly> 
					</div>
				</div>
	</c:when>
		                    
	<c:otherwise>                 		       
				<div class="form-group row ">
					<label class="col-sm-2">タイトル</label>
					<div class="col-sm-4">
						<input type="text" name="title" id="title" class="form-control" value = "${niji.title}"
							required readonly>
					</div>
				</div>			
				<div class="form-group row mt-4">
					<label class="col-sm-2">内容</label>
					<div class="col-sm-4">
						<input type="text" name="content" id="content" value = "${niji.content}"
							class="form-control" required readonly>
					</div>
				</div>				
		</c:otherwise>
		</c:choose>
			<button class="btn btn-secondary" data-oper="list">목록</button>
			<!-- 로그인 O -->
			<sec:authentication property="principal" var="p"/>
			<sec:authorize access="isAuthenticated()">
				<!-- 로그인한 사용자가 작성한 글인 경우에만 표시 -->
				<c:if test="${p.username eq niji.writer }">
					<button class="btn btn-poka-light" data-oper="modify">수정</button>
				</c:if>
				<c:if test="${p.username ne niji.writer }">
					<button class="btn btn-poka-light" data-oper="pay"  id="kakaopay" onclick = "location.href='/niji/pay_before?nno=${niji.nno}'">KAKAO PAY</button>
				</c:if>
		    </sec:authorize>
			<!----------------------------- 판매글 영역 끝  ------------------ -->
			 

		</div>
		
		

	<script>
	


	
	
    $("#image_content").css({
        
        "outline": "none",
        "background-size": "100% 100%"
    });
	
	
    $(function(){
    	var bnoValue = '${niji.nno}'; 
    	var frm = $('form');
    	
    	//수정 버튼
    	$("button[data-oper='modify']").on('click', function(e){
    		frm.submit();
    	});//END 수정 버튼
    	
    	//목록 버튼
    	$("button[data-oper='list']").on('click', function(e){
    		frm.find('#nno').remove();
    		frm.attr('action', '/niji/list')
    		   .submit();
    	});//END 목록 버튼
    	
    });//END $

    
    
	</script>	
		

<%@ include file="../include/footer.jsp" %>