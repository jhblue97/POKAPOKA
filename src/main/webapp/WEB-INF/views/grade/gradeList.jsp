<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<div class="jumbotron">
	<div class="container">
		<h1 class="display-5">등급기준</h1>
	</div>
</div>
<div class="container">
	<div class="row justify-content-end mb-2">
		<span class="col-2 text-right">
			<button	class="btn btn-poka-main mb-2" onclick="location.href='/grade/add'">등록</button></span>
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">등급코드</th>
					<th scope="col">등급이름</th>
					<th scope="col">등급기준 [경험치]</th>
					<th scope="col">등급이미지</th>
					<th scope="col" style="text-align:center;">편집</th>
				</tr>
			</thead>
			<tbody>
			 <c:forEach items="${list }" var="grade">
				<tr class="move">
					<td scope="row">${grade.grade_code }</td>
					<td>${grade.grade_name }</td>
					<td>${grade.grade_lv }</td>
					<td><img src="/resources/images/${grade.grade_img }" style="margin-left:20px; width:30px; height:30px; "></td>
					<td style="text-align:center;">
						<button class="btn btn-poka-green" data-oper="modify">수정</button>
						<button class="btn btn-poka-danger" data-oper="remove">삭제</button>
					</td>
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
		
		var operation = $(this).data('oper');
		
		if(operation === 'remove') { 		//삭제 버튼 눌린 경우
			location.href="/grade/delete?grade_code="+ $(this).parent().parent().children().eq(0).text();
		}
		 else if(operation === 'modify'){	//수정 버튼이 눌린 경우
			 location.href="/grade/update?grade_code="+ $(this).parent().parent().children().eq(0).text();	
		}
	});
});
</script>

<%@ include file="../include/footer.jsp"%>