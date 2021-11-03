<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ include file="../include/header.jsp" %>    

<div class="jumbotron">
	<div class="container">
		<h1 class="display-5">
			자유 게시판</h1></div></div>
	<div class="cantainer mx-5">
		<div class="row justify-content-end mb-2">
			<div class="dropdown">
			  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			    글 정렬 갯수
			  </button>
			  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
			    <a class="dropdown-item" href="#">20개 씩</a>
			    <a class="dropdown-item" href="#">30개 씩</a>
			    <a class="dropdown-item" href="#">50개 씩</a>
			  </div>
			</div>
			<span class="col-2 text-right"><button type="button" class="btn btn-primary">글쓰기</button></span>
		</div>
		<div class="row mb-3">
			<table class="table table-hover">
			  <thead>
				    <tr>
				      <th scope="col">No.</th>
				      <th scope="col">제목</th>
				      <th scope="col">등급</th>
				      <th scope="col">작성자</th>
				      <th scope="col">작성일</th>
				      <th scope="col">조회수</th>
				    </tr>
			  </thead>
			  <tbody>
				    <tr>
				      <th scope="row">3</th>
				      <td>Mark</td>
				      <td>Otto</td>
				      <td>@mdo</td>
				      <td>Otto</td>
				      <td>@mdo</td>
				    </tr>
				    <tr>
				      <th scope="row">2</th>
				      <td>Jacob</td>
				      <td>Thornton</td>
				      <td>@fat</td>
				      <td>Otto</td>
				      <td>@mdo</td>
				    </tr>
				    <tr>
				      <th scope="row">1</th>
				      <td>Larry the Bird</td>
				      <td>@twitter</td>
				      <td>Otto</td>
				      <td>Otto</td>
				      <td>@mdo</td>
				    </tr>
			  </tbody>
			</table>
		</div>
	</div>


<%@ include file="../include/footer.jsp" %>