<%@ page language="java" pageEncoding="utf8"
	contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Load yeucaudang.js -->
<script src="<c:url value="/resources/js/yeucaudang.js" />"></script>
<script src="<c:url value="/resources/js/center.js" />"></script>
<script src="<c:url value="/resources/js/menu.js" />"></script>

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
		<a class="navbar-brand" href="#" style="width: 50px; padding: 10px;"><img
			src="<c:url value="/resources/images/logo.png" />"
			class="img-responsive" alt="Responsive image"></a> <a
			class="navbar-brand" href="#" style="padding-left: 0px">Nhà trọ
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
					<a data-toggle="modal" href="javascript:void(0)" id="dangNhaTroLink"><span class="glyphicon glyphicon-bullhorn"></span> Đăng nhà trọ</a>
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
					<a href="#"><span class="glyphicon glyphicon-user"></span> <sec:authentication property="principal.username" /></a>
				</li>
				<li>
					<c:url value="/j_spring_security_logout" var="logoutUrl" />
						<!-- csrt support -->
						<form action="${logoutUrl}" method="post" id="logoutForm">
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

<!-- Đăng nhà trọ modal -->
<sec:authorize access="isAuthenticated()">
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content" style="width: 100%;">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	        <h4 class="modal-title" id="myModalLabel">Đăng nhà trọ</h4>
	      </div>
	      <form action="thanhvien/yeucauHandling" method="POST" role="form" id="form-yeu-cau" style="width: 100%;" onsubmit="danhSo()">
	      <div class="modal-body" style="width: 100%;">
	      		<div class="alert alert-success">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true" style="line-height: 16px; margin-left: 5px;">&times;</button>
					Nhà trọ của bạn sẽ được xác nhận trong vòng 3 ngày :)
				</div>
				<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
				<div class="form-group" style="width: 100%;">
					<div id="yeucau-map-canvas" style="height: 200px;" class="map-canvas">
					</div>
				</div>
				<div class="form-group">
					<div class="input-group">
					  <span class="input-group-addon"><span class="glyphicon glyphicon-map-marker"></span></span>
					  <input type="text" name="diaChi" id="diaChi" class="form-control" value="" required="required" data-bv-message="Hãy nhập một địa chỉ có thực!"
						placeholder="Số nhà/hẻm, tên đường, quận" onblur="codeAddress()">
					</div>
					<input type="hidden" name="toaDo.x" id="kinhDo" value="10.0341434">
					<input type="hidden" name="toaDo.y" id="viDo" value="105.7561615">
				</div>
				<div class="form-group">
					<div class="input-group">
					  <span class="input-group-addon"><span class="glyphicon glyphicon-earphone"></span></span>
					  <input type="text" name="soDt" id="soDt" class="form-control" value="" required="required" placeholder="Số điện thoại" data-bv-message="Hãy nhập số điện thoại!">
					</div>
				</div>
				<div class="form-group" style="text-align: center;">
					<div class="btn-group" data-toggle="buttons" class="center">
						<label class="btn btn-default active">
							<input type="radio" name="loaiid" id="loaiid" value="1" checked>
							Nhà trọ độc lập
						</label>
						<label class="btn btn-default">
							<input type="radio" name="loaiid" id="loaiid" value="2">
							Nhà riêng
						</label>
						<label class="btn btn-default">
							<input type="radio" name="loaiid" id="loaiid" value="3">
							Khu nhà trọ
						</label>
						<label class="btn btn-default">
							<input type="radio" name="loaiid" id="loaiid" value="4">
							Ở cùng chủ nhà
						</label>
					</div>
				</div>
				<table class="table table-hover table-stripped">
					<thead>
						<tr>
							<th>Diện tích (m<sup>2</sup>)</th>
							<th>Số người</th>
							<th>Giá (VND)</th>
							<th>Số phòng</th>
							<th></th>
						</tr>
					</thead>
					<tbody id="listPhong">
						<tr>
							<td><input type="number" class="form-control" value="5" min="5"	required="required"></td>
							<td><input type="number" class="form-control" value="1" min="1" required="required"></td>
							<td><input type="number" class="form-control" value="0" min="0" max='5000000' step="100000" required="required"></td>
							<td><input type="number" class="form-control" value="1" min="1" max="100" required="required"></td>
							<td>
								<a class="btn btn-link remove-button">
									<span class="glyphicon glyphicon-remove"></span>
								</a>
							</td>
						</tr>
					</tbody>
				</table>
				<a class="btn btn-link btn-block" onclick="themPhong()">Thêm phòng</a>
				<div class="clearfix"></div>
	      </div><!-- End Modal body -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
	        <button type="submit" class="btn btn-primary">Đăng</button>
	      </div>
	      </form>
	    </div>
	  </div>
	</div>
</sec:authorize>
<!-- Reg Modal -->
<div class="modal fade bs-example-modal-sm" id="regModal" tabindex="-1" role="dialog" aria-labelledby="regModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog modal-sm">
    <div class="modal-content" style="width: 100%;">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="regModalLabel">Đăng kí</h4>
      </div>
      <form action="/nhatro/dangkyHandling" method="POST" role="form" id="form-dang-ki">
      <div class="modal-body">
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
      </div><!-- End Modal body -->
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
        <button type="submit" class="btn btn-primary">Đăng kí</button>
      </div>
      </form>
    </div>
  </div>
</div>