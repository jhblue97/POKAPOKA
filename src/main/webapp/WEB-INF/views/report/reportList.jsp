<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<div class="jumbotron">
	<div class="container">
		<h1 class="display-5">申告目録</h1>
	</div>
</div>
<div class="container">
	<div class="row justify-content-end mb-2">
		<span class="col-2 text-right">
			<button	class="btn btn-poka-main mb-2" onclick="location.href='/grade/add'">등록</button></span>
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">NO.</th>
				 <th scope="col">BNO</th>
					<!-- <th scope="col">申告者</th>
					<th scope="col">被告人</th> -->
					<th scope="col">CATEGORY</th>
					<th scope="col">状態</th>
				</tr>
			</thead>
			<tbody>
			 <c:forEach items="${list }" var="report">
				<tr class="move">
					<td scope="row">${report.report_no }</td>
<%-- 					<td>${report.active_userid }</td>
					<td>${report.passive_userid }</td> --%> 
					<td>${report.bno} <button id = "view" class='btn btn-outline-warning' data-toggle="modal" data-target="#myModal2" data-num ="${report.bno}">view</button></td>
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
			
      <div class="modal-body">  
    dd		 
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
	

	$(function(){
		var result = '${result}';	
		//모달 창 재출력 막기
		history.replaceState({}, null, null);
		
		//페이지 번호 클릭 이벤트 처리 -----------------------------------
		var actionFrm = $('#actionForm');

	});//END $

	
	
	$('button').on('click', function(e){
		e.preventDefault();	
		
		var operation = $(this).data('bno');

		var bno = $(this).data('bno');
		
		location.href = "/report/process/"+bno;
		
	});
});


$('#myModal2').on('shown.bs.modal', function (event) {
		alert('gg');
	 
});
</script>

<%@ include file="../include/footer.jsp"%>