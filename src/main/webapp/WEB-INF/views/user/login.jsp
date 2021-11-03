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
						<input class="form-control" placeholder="Userid" name="username"
							type="text" autofocus>
					</div>
					<div class="form-group">
						<input class="form-control" placeholder="Password"
							name="password" type="password">
					</div>
					<div class="checkbox">
						<label> <input name="remember-me" type="checkbox"
							value="Remember Me"> Remember Me
						</label>
					</div>
					<!-- Change this to a button or input when using this as a form -->
					<a href="index.html" class="btn btn-lg btn-success btn-block">Login</a>
				</fieldset>
			</form>
		</div>
	</div>


<%@ include file="../include/footer.jsp" %>