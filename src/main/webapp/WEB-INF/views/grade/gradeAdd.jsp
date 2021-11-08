<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<div class="jumbotron">
	<div class="container">
		<h1 class="display-5">등급등록</h1>
	</div>
</div>
<div class="container">
	<form action="/grade/add" method="post" role="form">
       	
       	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">     
		
		<div class="form-group row">
			<label class="col-sm-2">등급코드</label>
			<div class="col-sm-3">
				<input type="text" name="grade_code" id="grade_code" class="form-control"></div></div>
		
		<div class="form-group row">
			<label class="col-sm-2">등급이름</label>
			<div class="col-sm-3">
				<input type="text" name="grade_name" id="grade_name" class="form-control"></div></div>
		
		<div class="form-group row">
			<label class="col-sm-2">등급기준</label>
			<div class="col-sm-3">
				<input type="text" name="grade_lv" id="grade_lv" class="form-control"></div></div>		
	</form>
	<div class="row mb-3">
		<label class="col-sm-2">등급이미지</label>
			<div class="uploadDiv col-sm-3">
			<img class="img-thumbnail" id = "view_img" alt="50x50" style=" width:200px; height : 200px; display: block;" ><br>
			<input type="file"
			multiple class="form-control" id="img" name="img" onchange="setThumbnail(event);">
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>