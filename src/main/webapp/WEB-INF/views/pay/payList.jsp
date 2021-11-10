<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>

<div class="jumbotron">
	<div class="container">
		<h1 class="display-5">決済目録</h1>
	</div>
</div>
<div class="cantainer mx-5">
	<div class="row justify-content-end mb-2">
		<div class="dropdown">
			<button class="btn btn-secondary dropdown-toggle" type="button"
				id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false">글 정렬 갯수</button>
			<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
				<a class="dropdown-item" href="#">20개 씩</a> <a class="dropdown-item"
					href="#">30개 씩</a> <a class="dropdown-item" href="#">50개 씩</a>
			</div>
		</div>
	</div>
	<div class="row mb-3">
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">No.</th>
					<th scope="col">SELLER</th>
					<th scope="col">STATUS</th>
					<th scope="col">TITLE</th>
					<th scope="col">PRICE</th>
					<th scope="col">REGDATE</th>
					<th scope="col">詳細</th>
					
				</tr>
			</thead>
			<tbody>
			 <c:forEach items="${list}" var="pay">
				<tr class="move">
					<td scope="row">${pay.pno}</td>
					<td>${pay.seller}</td>
					<td>${pay.pay_status}</td>
					<td>${pay.title}</td>
					<td>${pay.price}</td>
					<td><fmt:formatDate value="${pay.payDate}" pattern="yyyy-MM-dd"/></td>
					<td><button id = "view" class='btn btn-outline-warning' data-toggle="modal" data-target="#myModal2" data-num ="${pay.pno}">view</button> </td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		</div>
		  <!-- 페이지 번호 표시 영역 -->
          <div aria-label="Page navigation example">
           		<ul class="pagination justify-content-center">
	               	<!-- 이전 표시 -->	
	               	<c:if test="${pageMaker.prev }">
						<li class="page-item">
							<a class="page-link" href="${pageMaker.startPage - 1 }" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
       						 	<span class="sr-only">Previous</span></a>
						</li>
					</c:if>
		
	              	<!-- 페이지 번호 -->
	              	<c:forEach begin="${pageMaker.startPage }"
 	              			   end="${pageMaker.endPage }" 
 	              			   var="num"> 
 	                 		<%-- 현재 페이지 번호가 pageNum과 같으면 active 표시  --%>
 							<li class="page-item 
								   ${pageMaker.cri.pageNum == num ? 'active' : '' }">		
							<a class="page-link" href="${num }">${num }</a>
							</li></c:forEach> 
	                 	
	               	<!-- 다음 표시	 -->
	               	<c:if test="${pageMaker.next }"> 
					<li class="page-item">
						<a class="page-link" href="${pageMaker.endPage + 1 }" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
	      					<span class="sr-only">Next</span>
						</a>
					</li></c:if>
              	</ul> 
              </div> 
              <!-- END 페이지 번호 표시 영역 -->
              
               <!-- 현재 페이지 번호 및 출력 게시물 수 전송 폼 -->
               <form id="actionForm" action="/board/list">
	               	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
	               	<input type="hidden" name="amount"  value="${pageMaker.cri.amount }">
               </form>
				
				  <!-- 게시물 등록 결과 표시 Modal -->
                   <div class="modal fade" id="myModal" tabindex="-1" 
                   	 role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                       <div class="modal-dialog">
                           <div class="modal-content">
                               <div class="modal-header">
                                   <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                               </div>
                               <div class="modal-body">
                               	글이 등록되었습니다.
                               </div>
                               <div class="modal-footer">
                                   <button type="button" 
                                   		class="btn btn-primary" data-dismiss="modal">
                                   		Close</button>
                               </div>
                           </div>	
                       </div>	 
                   </div><!-- END 게시물 등록 결과 표시 modal -->
	
</div>

<!-- view modal  -->		 
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
        <h4 class="modal-title" id="myModalLabel">決済詳細</h4> <br>
      </div>
      <form action="/Board/boardUpdate.do" method="post" enctype="multipart/form-data" class="form-horizontal"  id = "boardUpdate">
         <input type="hidden" class="form-control" id="view_userid" value="" name = "view_userid"><br/>
 	 
 	    <input type="hidden" class="form-control" id="view_num" value="" name = "view_num"><br/>
 	   <input type="hidden" class="form-control" id="view_img_bak" value="" name = "view_img_bak"><br/>
					
      <div class="modal-body">  
      <img class="img-thumbnail" id = "view_img" alt="50x50"  data-src="holder.js/100x200" src='/resources/images/' style=" width:200px; height : 200px; margin:auto; display: block;" >
      
      
       			<label for="txt-user-text" class="col-form-label">title</label><br/> 
       			   <input type="text" class="form-control" id="view_title" value="" name="view_subject" readonly><br/>
 				
       			<label for="txt-user-text" class="col-form-label">Content</label> <br/> 				 	
 				<textarea rows="5" cols="50" name="view_content" id="view_content" class="form-control" readonly>
				</textarea>
		
				<label for="txt-user-text" class="col-form-label">buyer_email</label> <br/> 
 				   <input type="text" class="form-control" id="view_email" value=""  name="view_email" readonly> <br/>	
 				
 				  <label for="txt-user-text" class="col-form-label">buyer_price</label> <br/> 
 				   <input type="text" class="form-control" id="view_price" value=""name="view_price" readonly> <br/>	
 				
 				
 				
 			
 				 
      </div> 
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
      </div> 
      </form>
    </div>
  </div></div>	
	<!-- view modal  END-->	


<script>
$(function(){
	var result = '${result}';

	
	//모달 창 재출력 막기
	history.replaceState({}, null, null);
	
	//페이지 번호 클릭 이벤트 처리 -----------------------------------
	var actionFrm = $('#actionForm');
	
	$('.paginate_button a').on('click', function(e){
		e.preventDefault();
		
		//actionForm의 pageNum의 값을 클릭된 a 태그의 href 값으로 변경
		actionFrm.find("input[name='pageNum']")
				 .val($(this).attr('href'));
		actionFrm.submit();
	});	//END 페이지 번호 클릭 이벤트 처리
	
	
});//END $


	$('#myModal2').on('shown.bs.modal', function (event) {
		

 		
		  var button = $(event.relatedTarget); // Button that triggered the modal
		  var recipient = button.data('num'); // Extract info from data-* attributes
		  var board_id;
		  $.ajax ({
			        "url" : "/niji/pay/get?pno="+recipient,
			        cache : false,
			        type:"get", 
			        dataType: "json",
			        success : function (data) 
			        
			        {	 
			        	console.log(data);
			        	$('#view_title').val(data.title);
			        	$('#view_content').text(data.content);
			        	$('#view_price').val(data.price);
			        	$('#view_email').val(data.buyer_email);
			        	
			        	$('#view_img').attr('src',data.img);  
			     		
			        
			        	
			        }
		   	 });	 
	});  

</script> 

<%@ include file="../include/footer.jsp"%>