<%@ page language="java" pageEncoding="utf8"
	contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Load yeucaudang.js -->
<script src="<c:url value="/resources/js/themphong.js" />"></script>
<script src="<c:url value="/resources/js/center.js" />"></script>
<script src="<c:url value="/resources/js/menu.js" />"></script>

<!-- Load trigger login jquery de xu ly cac truong hop can dang nhap -->
<script src="<c:url value="/resources/js/trigger-login.js" />"></script>

<!-- Load validator jquery -->
<script src="<c:url value="/resources/js/bootstrapValidator.min.js" />"></script>
<link href="<c:url value="/resources/css/bootstrapValidator.min.css" />" rel="stylesheet">
<style>
#menuLoginForm .form-control-feedback {
    top: 0px;
}
</style>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<c:if test="${!empty sessionScope.isPosted}">
		<script>
			$(function(){
				$('#alertSuccess').centerFixed();
				$('#alertSuccess').delay(5000).fadeOut(1000);
			});
		</script>
		
		<div class="alert alert-success top-alert" id="alertSuccess">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true" style="line-height: 16px; margin-left: 5px;">&times;</button>
			Yêu cầu đăng nhà trọ của bạn đã được gửi đi :)
		</div>
		<%  
			request.getSession().removeAttribute("isPosted");  
		%>
	</c:if>
	<sec:authorize access="isAnonymous()">
		<div id="showLoginToPostMotel" style="display:none" class="alert alert-success top-alert" style="position: fixed; top: 5px; z-index: 1031; left: 30%; padding: 10px;" id="alertSuccess">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true" style="line-height: 16px; margin-left: 5px;">&times;</button>
				<strong>Hãy đăng nhập</strong> để đăng nhà trọ và sử dụng các tiện ích khác :)
		</div>
	</sec:authorize>
	
	<!-- Brand and toggle get grouped for better mobile display -->
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-ex1-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="/nhatro" style="width: 50px; padding: 10px;"><img
			src="<c:url value="/resources/images/logo.png" />"
			class="img-responsive" alt="Responsive image"></a> <a
			class="navbar-brand" href="/nhatro" style="padding-left: 0px">Nhà trọ
			Cần Thơ</a>
	</div>

	<!-- Collect the nav links, forms, and other content for toggling -->
	<div class="collapse navbar-collapse navbar-ex1-collapse">
		<ul class="nav navbar-nav navbar-right">
			<li>
				<sec:authorize access="isAuthenticated()">
					<a data-toggle="modal" href="#myModal"><span class="glyphicon glyphicon-bullhorn"></span> Đăng nhà trọ</a>
				</sec:authorize>
				<sec:authorize access="isAnonymous()">
					<a data-trigger='login' href="javascript:void(0)"><span class="glyphicon glyphicon-bullhorn"></span> Đăng nhà trọ</a>
				</sec:authorize>
			</li>
			<sec:authorize access="isAnonymous()">
				<li class="dropdown">
					<a href="#" id='loginLink' class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-log-in"></span> Đăng nhập</a>
					<ul id="dropdown-form" class="dropdown-menu" style="right: 15px; width: 200px;">
						<form id="menuLoginForm" action="<c:url value='j_spring_security_check' />" method="POST" role="form" style="padding: 10px;">
							<div class="form-group">
								<input type="text" id="username" class="form-control" name='username' placeholder="Tên tài khoản">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" name='password' placeholder="Mật khẩu">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							</div>
							<button type="submit" class="btn btn-primary btn-block">Đăng
								nhập</button>
							<a class="btn btn-link btn-block" data-toggle="modal" href="#regModal">Chưa có tài khoản ?</a>
						</form>
					</ul>
				</li>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<li>
					<sec:authentication var="username" property="principal.username" /></a>
					<a href="${username == 'admin' ? '/nhatro/admin/quanlydangtin' : '/nhatro/thanhvien/' }"><span class="glyphicon glyphicon-user"></span> <sec:authentication property="principal.username" /></a>
				</li>
				<li>
					<c:url value="/j_spring_security_logout" var="logoutUrl" />
						<!-- csrt support -->
						<form action="${logoutUrl}" method="post" id="logoutForm" style="display:none">
							<input type="hidden" 
								name="${_csrf.parameterName}"
								value="${_csrf.token}" />
						</form>
						  
						<script>
							function formSubmit() {
								document.getElementById("logoutForm").submit();
							}
						</script>
						<a href="javascript:formSubmit()"><span class="glyphicon glyphicon-log-out"></span> Đăng xuất</a>
				</li>
			</sec:authorize>
		</ul>
	</div>
	<!-- /.navbar-collapse -->
	
</nav>

<%@ include file="/WEB-INF/views/dang-nhatro.jsp" %>

<%@ include file="/WEB-INF/views/dangky-popup.jsp" %>