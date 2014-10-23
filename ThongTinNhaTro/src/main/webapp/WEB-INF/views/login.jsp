<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" pageEncoding="utf8"
	contentType="text/html;charset=UTF-8"%>
<html>
<head>

<title>Nhà trọ Cần Thơ | Đăng nhập</title>
<%@ include file="/WEB-INF/views/head.jsp" %>

<!-- Login CSS -->
<link href="<c:url value="/resources/css/login.css" />" rel="stylesheet" media="screen">

</head>
<body onload='document.loginForm.username.focus();'>
	<div id="scrollBackground" style="background-image: url(<c:url value="/resources/images/cau-cantho.jpg" />);">
		<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 col-sm-offset-3" style="margin-top: 5%;">
			<div class="card">
				<div class="col-md-6">
					<form id="loginForm" action="<c:url value='j_spring_security_check' />" method="POST" role="form">
						<h3>Đăng nhập</h3>
				
						<c:if test="${not empty error}">
							<div class="alert alert-danger" role="alert">${error}</div>
						</c:if>
						<c:if test="${not empty msg}">
							<div class="alert alert-success" role="alert">${msg}</div>
						</c:if>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
								<input type="text" class="form-control" id="username" name='username' placeholder="Tài khoản">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
								<input type="password" class="form-control" name='password' placeholder="Mật khẩu">
							</div>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-primary btn-block">Đăng nhập</button>
						</div>
						<div class="form-group">
							<a href="/nhatro" class="btn btn-default btn-block">Về trang chủ</a>
						</div>
					</form>
				</div>
				<div class="col-md-6">
					<form action="/nhatro/dangkyHandling" method="POST" role="form" id="form-dang-ki">
					      <h3>Chưa có tài khoản ?</h3>
								<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
								
								<div class="form-group">
									<div class="input-group">
									  <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
									  <input type="text" name="username" id="username" class="form-control" required="required" data-bv-message="Tài khoản không được rỗng!" placeholder="Tài khoản">
									</div>
								</div>
								<div class="form-group">
									<div class="input-group">
									  <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span></span>
									  <input type="email" name="email" id="email" class="form-control" required="required" placeholder="Email" data-bv-message="Hãy nhập một email có thực!">
									</div>
								</div>
								<div class="form-group">
									<div class="input-group">
									  <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
									  <input type="password" name="password" class="form-control" required="required" placeholder="Mật khẩu" data-bv-message="Mật khẩu không được rỗng!">
									</div>
								</div>
								<div class="clearfix"></div>
					      
							<div class="form-group">
					        	<button type="submit" class="btn btn-default btn-block">Đăng kí</button>
					        </div>
				     </form>
				</div>
				
			</div>
		</div>
	</div>
</body>
</html>