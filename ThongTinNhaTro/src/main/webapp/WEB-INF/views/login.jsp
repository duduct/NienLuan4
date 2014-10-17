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
	<%@ include file="/WEB-INF/views/menu.jsp" %>
	<div id="scrollBackground" style="background-image: url(<c:url value="/resources/images/cau-cantho.jpg" />);">
		<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 col-sm-offset-4" style="margin-top: 5%;">
			<div class="card">
				<form id="loginForm" action="<c:url value='j_spring_security_check' />" method="POST" role="form">
					<h3>Đăng nhập</h3>
			
					<c:if test="${not empty error}">
						<div class="alert alert-danger" role="alert">${error}</div>
					</c:if>
					<c:if test="${not empty msg}">
						<div class="alert alert-success" role="alert">${msg}</div>
					</c:if>
					<div class="form-group">
						<input type="text" class="form-control" id="username" name='username' placeholder="Tên tài khoản">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" name='password' placeholder="Mật khẩu">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					</div>
					<button type="submit" class="btn btn-primary btn-block">Đăng
						nhập</button>
					<a class="btn btn-link btn-block" data-toggle="modal" href="#regModal">Đăng kí</a>
				</form>
			</div>
		</div>
	</div>
</body>
</html>