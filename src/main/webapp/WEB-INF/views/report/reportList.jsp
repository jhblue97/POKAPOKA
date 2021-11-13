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
					<th scope="col">申告者</th>
					<th scope="col">被告人</th>
					<th scope="col">BNO</th>
					<th scope="col">CATEGORY</th>
					<th scope="col">日</th>
					<th scope="col">状態</th>
				</tr>
			</thead>
			<tbody>
			 <c:forEach items="${list }" var="report">
				<tr class="move">
					<td scope="row">${report.report_no }</td>
					<td>${report.active_userid }</td>
					<td>${report.passive_userid }</td>
					<td>${report.bno }</td>
					<td>${report.category }</td>
					<td><fmt:formatDate value="${report.regDate}" pattern="yyyy-MM-dd"/></td>					
					<c:if test="${report.status==1}">
					    <td><button type="button" id = "regBtn" class="btn btn-poka-main" data-param = "1" data-bno ="${report.bno }">処理中 </button></td>
					</c:if>
					<c:if test="${report.status==2}">
					    <td><button type="button" id = "regBtn" class="btn btn-poka-main" data-param = "2" data-bno ="${report.bno }">処理完了</button></td>
					</c:if>	
				</tr>
			</c:forEach>
			</tbody>
		</table>
		</div>
	
</div>
<script>
$(function(){
	$('button').on('click', function(e){
		e.preventDefault();	
		
		var operation = $(this).data('bno');

		var bno = $(this).data('bno');
		
		location.href = "/report/process/"+bno;
		
		
		
		
	});
});
</script>

<%@ include file="../include/footer.jsp"%>