<%@ page language="java" pageEncoding="utf8"
	contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<html lang="" style="height: 100%;">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Nhà trọ Cần Thơ | Quản Lý</title>
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBRijrqPbCijmQLQydo5VA183mOowbr67w">
	
</script>
<%@ include file="/WEB-INF/views/head.jsp"%>
<!-- Bootstrap CSS -->
<link href="<c:url value="/resources/css/jquery-ui.css"/>"
	rel="stylesheet">
<link href="<c:url value= "/resources/css/perfect-scrollbar.min.css"/>"
	rel="stylesheet">
<!-- jQuery -->
<script src="<c:url value="/resources/js/jquery.js"/>"></script>
<script src="<c:url value="/resources/js/jquery-ui.js"/>"></script>
<!-- Bootstrap JavaScript -->
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/js/perfect-scrollbar.min.js"/>"></script>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
			<![endif]-->

<script src="<c:url value="/resources/js/member.js"/>"></script>

</head>
<body style="padding-top: 50px; height: 100%; width: 100%">
	<%@ include file="/WEB-INF/views/menu.jsp"%>

	<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 panel-side"
		id="sidebar" style="width: 350px;">
		<div class="row panel-side-header">
			<!-- Nav tabs -->
			<ul class="nav nav-pills" role="tablist" id="tab">
				<li class="active"><a href="#dangtin" role="tab"
					data-toggle="tab">Nhà trọ đã đăng</a></li>
				<li><a href="#thanhvien" role="tab" data-toggle="tab"
					onclick="chuyenLinkSuaThongTin()">Sửa thông tin</a></li>
			</ul>
		</div>

		<!-- Tab panes -->
		<div class="tab-content">
			<div class="tab-pane active fade in" id="dangtin">
				<div class="row" id="Demo"
					style="posibtion: relative; overflow: hidden;">
					<div class="panel panel-info">
						<div class="list-group">
							<!-- Load danh sach cac nha tro da dang -->
							<c:forEach var="nhatro" items="${nhatros}">
								<a href="javascript: showDetail(${nhatro.nhatroid})"
									class="list-group-item" style="clear: both">
									<div class="list-group-item-content pull-left">
										<div class="item-address">
											<strong>${nhatro.diachi}</strong><br>
											${nhatro.user.username}, ${nhatro.sdt}<br>
										</div>
										<div class="item-time">${nhatro.ngayyeucau}</div>
									</div> <span class="btn-group btn-group-context">
										

										<button type="button" class="btn btn-link"
											onclick="document.location ='/nhatro/thanhvien/xoa/${nhatro.nhatroid}'">
											<span class="glyphicon glyphicon-remove"></span>
										</button>
								</span>
								</a>
							</c:forEach>
						</div>
					</div>
					<!-- End panel-info -->
				</div>
			</div>
			<div class="tab-pane fade" id="thanhvien">
			<form method="post" action="suathongtin">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<div class="form-group">
					  
					  <input type="password" name="oldpass" id="oldPassword" class="form-control" required="required" data-bv-message="Tài khoản không được rỗng!" placeholder="Mật khẩu cũ">
					</div>
					<div class="form-group">
					  <input type="password" name="newpass1" id="newPassword1" class="form-control"  placeholder="Mật khẩu mới">
					</div>
					<div class="form-group">
					  <input type="password" name="newpass2" id="newPassword2" class="form-control" placeholder="Nhập lại mật khẩu mới">
					</div>
					<button type="submit" class="btn btn-primary">Cập nhật</button>
			</form>
			</div>
			
		</div>
	</div>
	<!--End col 4-->
</body>
</html>