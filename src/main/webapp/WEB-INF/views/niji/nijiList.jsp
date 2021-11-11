<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp" %>

<html>
<head>
	<title>二次掲示板</title>
	<style>
	
	
/*search start*/

*, *:before, *:after {
  -webkit-tap-highlight-color: transparent;
  -webkit-tap-highlight-color: rgba(0,0,0,0);
  user-select: none;
  -webkit-user-select: none;
  -khtml-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  -o-user-select: none;
  box-sizing: border-box;
  -webkit-box-sizing: border-box;
  padding: 0;
  margin: 0;
}

.search-box {
  position: relative;
  width: 100%;
  max-width: 250px;
  height: 60px;
  border-radius: 120px;
  margin-top: 30px;
  margin-left: 30px;
}
 .search-icon, .go-icon {
  position: absolute;
  top: 0;
  height: 60px;
  width: 86px;
  line-height: 61px;
  text-align: center;
} 
 .search-icon {
  left: 0;
  pointer-events: none;
  font-size: 1.22em;
  will-change: transform;
  transform: rotate(-45deg);
  -webkit-transform: rotate(-45deg);
  -moz-transform: rotate(-45deg);
  -o-transform: rotate(-45deg);
  transform-origin: center center;
  -webkit-transform-origin: center center;
  -moz-transform-origin: center center;
  -o-transform-origin: center center;
  transition: transform 400ms 220ms cubic-bezier(0.190, 1.000, 0.220, 1.000);
  -webkit-transition: transform 400ms 220ms cubic-bezier(0.190, 1.000, 0.220, 1.000);
  -moz-transition: transform 400ms 220ms cubic-bezier(0.190, 1.000, 0.220, 1.000);
  -o-transition: transform 400ms 220ms cubic-bezier(0.190, 1.000, 0.220, 1.000);
} 
.si-rotate {
  transform: rotate(0deg);
  -webkit-transform: rotate(0deg);
  -moz-transform: rotate(0deg);
  -o-transform: rotate(0deg);
}
/* .go-icon {
  right: 0;
  pointer-events: none;
  font-size: 1.38em;
  will-change: opacity;
  cursor: default;
  opacity: 0;
  transform: rotate(45deg);
  -webkit-transform: rotate(45deg);
  -moz-transform: rotate(45deg);
  -o-transform: rotate(45deg);
  transition: opacity 190ms ease-out, transform 260ms cubic-bezier(0.190, 1.000, 0.220, 1.000);
  -webkit-transition: opacity 190ms ease-out, transform 260ms cubic-bezier(0.190, 1.000, 0.220, 1.000);
  -moz-transition: opacity 190ms ease-out, transform 260ms cubic-bezier(0.190, 1.000, 0.220, 1.000);
  -o-transition: opacity 190ms ease-out, transform 260ms cubic-bezier(0.190, 1.000, 0.220, 1.000);
} */
.go-in {
  opacity: 1;
  pointer-events: all;
  cursor: pointer;
  transform: rotate(0);
  -webkit-transform: rotate(0);
  -moz-transform: rotate(0);
  -o-transform: rotate(0);
  transition: opacity 190ms ease-out, transform 260ms 20ms cubic-bezier(0.190, 1.000, 0.220, 1.000);
  -webkit-transition: opacity 190ms ease-out, transform 260ms 20ms cubic-bezier(0.190, 1.000, 0.220, 1.000);
  -moz-transition: opacity 190ms ease-out, transform 260ms 20ms cubic-bezier(0.190, 1.000, 0.220, 1.000);
  -o-transition: opacity 190ms ease-out, transform 260ms 20ms cubic-bezier(0.190, 1.000, 0.220, 1.000);
}
.search-border {
  display: block;
  width: 100%;
  max-width: 360px;
  height: 60px;
}
.border {
  fill: none;
  stroke: #37867F;
  stroke-width: 5;
  stroke-miterlimit: 10;
}
.border {
  stroke-dasharray: 740;
  stroke-dashoffset: 0;
  transition: stroke-dashoffset 400ms cubic-bezier(0.600, 0.040, 0.735, 0.990);
  -webkit-transition: stroke-dashoffset 400ms cubic-bezier(0.600, 0.040, 0.735, 0.990);
  -moz-transition: stroke-dashoffset 400ms cubic-bezier(0.600, 0.040, 0.735, 0.990);
  -o-transition: stroke-dashoffset 400ms cubic-bezier(0.600, 0.040, 0.735, 0.990);
}
.border-searching .border {
  stroke-dasharray: 740;
  stroke-dashoffset: 459;
  transition: stroke-dashoffset 650ms cubic-bezier(0.755, 0.150, 0.205, 1.000);
  -webkit-transition: stroke-dashoffset 650ms cubic-bezier(0.755, 0.150, 0.205, 1.000);
  -moz-transition: stroke-dashoffset 650ms cubic-bezier(0.755, 0.150, 0.205, 1.000);
  -o-transition: stroke-dashoffset 650ms cubic-bezier(0.755, 0.150, 0.205, 1.000);
}
#search {
  font-family: 'Montserrat Alternates', sans-serif;
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  border-radius: 120px;
  border: none;
  background: rgba(255,255,255,0);
  padding: 0 68px 0 68px;
  color: #37867F;
  font-size: 1.32em;
  font-weight: 400;
  letter-spacing: -0.015em;
  outline: none;
}
#search::-webkit-input-placeholder {color: #37867F;}
#search::-moz-placeholder {color: #37867F;}
#search:-ms-input-placeholder {color: #37867F;}
#search:-moz-placeholder {color: #37867F;}
#search::-moz-selection {color: #37867F; background: rgba(0,0,0,0.25);}
#search::selection {color: #37867F; background: rgba(0,0,0,0.25);}
	
	 
	</style>
</head>
<body>


<div class="jumbotron">
	<div class="container">
		<h1 class="display-5">
			二次掲示板</h1></div></div>
			
<div class="cantainer mx-5">
	<div class="row justify-content-end mb-2">
		<form id="searchForm" action="/niji/list">
          	<select name="type" class="custom-select" selected>
              <option value="A" ${pageMaker.cri.type == 'A' ? 'selected' : '' }>전체</option>
              <option value="B" ${pageMaker.cri.type == 'B' ? 'selected' : '' }>구매글</option>
              <option value="S" ${pageMaker.cri.type == 'S' ? 'selected' : '' }>판매글</option>											
           </select>
		<div class="search-box">
			<div class="search-icon"><i class="fa fa-search search-icon"></i></div>
			<input type="text" placeholder="Search" id="search" name = "keyword" autocomplete="off" value="${pageMaker.cri.keyword }" >	
			<svg class="search-border" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:a="http://ns.adobe.com/AdobeSVGViewerExtensions/3.0/" x="0px" y="0px" viewBox="0 0 671 111" style="enable-background:new 0 0 671 111;"
			 xml:space="preserve">
          <path class="border" d="M335.5,108.5h-280c-29.3,0-53-23.7-53-53v0c0-29.3,23.7-53,53-53h280"/>
          <path class="border" d="M335.5,108.5h280c29.3,0,53-23.7,53-53v0c0-29.3-23.7-53-53-53h-280"/>
        </svg>
	</div>	
		</form>
		
			
		<span class="col-2 text-right"><button type="button" id = "regBtn"
				class="btn btn-poka-main">登録</button>			
		</span>
	</div>

<c:if test="${!empty keyword}">
<div class = "row mb-3" style = "background-color : #D8E9E7;">
“${keyword}” の　検索結果
</div>
</c:if>
	

    <!-- 현재 페이지 번호 및 출력 게시물 수 전송 폼 -->
    <form id="actionForm" action="/niji/list">
          <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
          <input type="hidden" name="amount"  value="${pageMaker.cri.amount }">
          <!-- 검색 타입과 키워드 파라미터 추가 -->
          <input type="hidden" name="type" value="${pageMaker.cri.type }" >
          <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }" >
    </form>

	<div class="row mb-3">


	<div class="container">
	<div class="row" id="list" style="padding-left:0; padding-right:0;">
	<c:set var="i" value="0" /> 
	<c:forEach var="obj" items="${list}"> 
	<div class="col-sm-6 col-md-4">  
	<div class="thumbnail" style = "margin-bottom : 30px;">  
		<div style="margin: 10px;">		
			<div class="profileusername">
			&emsp;<strong>${obj.nno}</strong>
			<img class="ml-3 mr-2" src="../../../../resources/images/${obj.user.grade.grade_img}" style="width:30px; height:30px;"> ${obj.writer}
			</div>
			<br/> 
			<div style="border-top-width: 0.1em; border-top-style: dashed; border-top-color: #7b7b7b;"></div><br/>		
			<img class="img-thumbnail" alt="50x50" data-src="holder.js/100x200" src='../../../../resources/upload/water_${obj.image}' style=" width:200px; height : 200px; margin:auto; display: block;" >
			<br/>			
			<div style="border-top-width: 0.1em; border-top-style: dashed; border-top-color: #7b7b7b;"></div><br/>			
			<div class="caption">
				<p>CONTENT :${obj.title}</p>  
				<p>CONTENT :${obj.content}</p>  
			</div>	 
			<div style="text-align: right;"> 
			<!-- <button type="button" class="btn btn-b" name="get" data-param="" onclick = >view</button> -->
			<button id = "view" class='btn btn-outline-warning' data-toggle="modal" data-target="#myModal2" data-num ="1" onclick = "location.href='/niji/get?nno=${obj.nno}'">view</button> 
			</div>		
		</div>  
	</div>
</div>
</c:forEach>
</div> 
</div>



	</div>

</div>



<!-- 20211110 채팅 테스트 -->

<script type="text/javascript">
// 웹소켓
let websocket;
connect()
//입장 버튼을 눌렀을 때 호출되는 함수
function connect() {
	alert('gg');
    // 웹소켓 주소
    var wsUri = "ws://localhost:8091/websocket/echo.do";
    // 소켓 객체 생성
    websocket = new WebSocket(wsUri);
    //웹 소켓에 이벤트가 발생했을 때 호출될 함수 등록
    websocket.onopen = onOpen;
    websocket.onmessage = onMessage;
}

//웹 소켓에 연결되었을 때 호출될 함수
function onOpen() {
}

// * 1 메시지 전송
function sendMessage(message){
}

// * 2 메세지 수신
function onMessage(evt) {
}
</script> 

<!-- 20211110 채팅 테스트 -->


<script>
 


		$(function() {
			$('[data-toggle="popover"]').popover()
		})
		
		
		$(document).ready(function(){
    $("#search").focus(function() {
      $(".search-box").addClass("border-searching");
      $(".search-icon").addClass("si-rotate");
    });
    $("#search").blur(function() {
      $(".search-box").removeClass("border-searching");
      $(".search-icon").removeClass("si-rotate");
    });

});
		
		
		 $("#search").on("keyup",function(key){
			 
		        if(key.keyCode==13) {
		        	//검색을 하면 페이지 번호가 1이 되도록 설정
		        	searchFrm.find("input[name='pageNum']").val('1');
		    		searchFrm.submit();
		        
		        }
		    });
		 
		 $('#regBtn').on('click', function(){
				self.location="/niji/add";
			});//END 등록 버튼 클릭 이벤트 처리
			
	</script>

</body>
</html>
