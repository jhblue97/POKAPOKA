<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>    

<div class="jumbotron">
	<div class="container">
		<h1 class="display-5">
			로그인</h1></div></div>
	<div class="row justify-content-md-center mx-5 my-5">
		<div class="col-5">
			<form role="form" method="post" action="/login">
				<fieldset>
					<div class="form-group">
						<input class="form-control" placeholder="아이디" name="username"
							type="text" autofocus>
					</div>
					<div class="form-group">
						<input class="form-control" placeholder="비밀번호"
							name="password" type="password">
					</div>
					<div class="checkbox">
						<label> <input name="remember-me" type="checkbox"
							value="Remember Me"> 자동로그인
						</label>
					</div>
					<input type="submit" class="btn btn-lg btn-success btn-block" value="login">
				</fieldset>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			</form>
		</div>
	</div>
<script>
//Login 버튼 클릭 이벤트 처리
$('.btn-success').on('click', function(e){
	e.preventDefault();
	$('form').submit();
});
//END Login 버튼 클릭 이벤트 처리
</script>

<%@ include file="../include/footer.jsp" %>