<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>

<div class="jumbotron">
	<div class="container">
		<h1 class="display-5">決済目録</h1>
	</div>
</div>
<div class="cantainer mx-5">

	<div class="row mb-3">
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">bno</th>
					<th scope="col">CATEGORY</th>
					<th scope="col">状態</th>
					
				</tr>
			</thead>
			<tbody>
		 <c:forEach items="${list}" var="report">
				<tr class="move">
<%-- 					<td>${report.active_userid }</td>
					<td>${report.passive_userid }</td> --%> 
					<td>${report.bno} <button id = "view" class='btn btn-outline-warning' data-toggle="modal" data-target="#myModal2" data-bno ="${report.bno}">view</button></td>
					<td>${report.category }</td> 
			<%-- 		<td><fmt:formatDate value="${report.regDate}" pattern="yyyy-MM-dd"/></td>		 --%>			
					<c:if test="${report.status==1}">
					    <td><button type="button" id = "regBtn" class="btn btn-poka-main" data-param = "1" data-bno ="${report.bno }">処理中 </button></td>
					</c:if>
					<c:if test="${report.status==3}"> 
					    <td>処理完了</td>
					</c:if>	
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
<div class="modal fade modal-dialog-scrollable" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
        <h4 class="modal-title" id="myModalLabel">申告者 詳細</h4> <br>
      </div>
       <div class="modal-body">  
		      <table class="table table-hover">
		     		 <thead>
						<tr>
							<th scope="col">No.</th>
							<th scope="col">申告者</th>
							<th scope="col">被告人</th>
							<th scope="col">bno</th>
							<th scope="col">分流</th>
							<th scope="col">登録日</th>							
						</tr>
					</thead>
		      	<tbody id = "modal_tbody">	
				</tbody>
		    </table>
      </div> 
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
      </div> 

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
		  var recipient = button.data('bno');
		  
		
		$.ajax({
			type	: 'get',
			url 	: '/report/list/'+recipient,
			dataType: "json",
			success : function(result){
				console.log(result);		
				var str = "";
				for(var i = 0; i<result.length; i++){
					str += "<tr class='move'> <td scope='row'>"+result[i].report_no+"</td>"  + 
					"<td>"+result[i].active_userid+"</td>"+
					"<td>"+result[i].passive_userid+"</td>"+
					"<td>"+result[i].bno+"</td>"+
					"<td>"+result[i].category+"</td>"+
					"<td>dd</td> </tr>"; 	
				} 
				$('#modal_tbody').html(str);
			}
		});//END ajax()
		

	});  

</script> 

<%@ include file="../include/footer.jsp"%>