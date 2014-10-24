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
<script src="<c:url value="/resources/js/adminThanhVien.js"/>"></script>
<script type="text/javascript">
	function showDetailTV(user) {
		$(".showDetail").css({"display" : "none"});
		$("#"+user).css({"display" : ""});
	}
</script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#input")
								.change(
										function() {
											document.location.href = "/nhatro/admin/quanlythanhvien/searchthanhvien/nd="
													+ $(this).val();
										});

					});
</script>
<script type="text/javascript">
	function chuyenLinkToDangTin(){
		document.location.href = "/nhatro/admin/quanlydangtin";
	}
</script>
</head>
<body style="padding-top: 50px;">
	<%@ include file="/WEB-INF/views/menu.jsp"%>

	<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 panel-side"
		id="sidebar" style="width: 350px;">
		<div class="row panel-side-header">
			<!-- Nav tabs -->
			<ul class="nav nav-pills" role="tablist" id="tab">
				<li><a href="#dangtin" role="tab" data-toggle="tab" onclick="chuyenLinkToDangTin()">Yêu cầu
						đăng tin</a></li>
				<li class="active"><a href="#thanhvien" role="tab"
					data-toggle="tab">Thành viên</a></li>
			</ul>
		</div>

		<!-- Tab panes -->
		<div class="tab-content">
			<div class="tab-pane active fade in" id="thanhvien">
				<div class="row panel-side-search">
					<input type="search" name="" id="input" class="form-control"
						required="required" title="Search"> <span
						class="panel-side-search-placeholder"> <span
						class="glyphicon glyphicon-search"></span> <span
						class="panel-side-search-placeholder-caption">Search</span>
					</span>
				</div>
				<!--End row-->
				<div class="row" id="Demo"
					style="posibtion: relative; overflow: hidden;">
					<div class="panel panel-info">
						<div class="panel-heading">
							<h3 class="panel-title">Các thành viên</h3>
						</div>

						<div class="list-group">
							<span class="text-center">${searchNull}</span>
							<c:forEach var="list" items="${lists}">
								<a href="javascript: showDetailTV('${list.username}')" class="list-group-item"
									style="clear: both">
									<div class="list-group-item-content pull-left">
										<div class="item-address">
											<strong>${list.username}</strong><br>
											${list.email}
											 <br>
										</div>
										
									</div> <span class="btn-group btn-group-context">
										<button type="button" class="btn btn-link">
											<span class="glyphicon glyphicon-ok"></span>
										</button>

										<button type="button" class="btn btn-link">
											<span class="glyphicon glyphicon-remove"></span>
										</button>
								</span>
								</a>
							</c:forEach>
						</div>

						<div class="list-group">
							<c:forEach var="list" items="${listUser}">
								<a href="javascript: showDetailTV('${list.username}')" class="list-group-item"
									style="clear: both">
									<div class="list-group-item-content pull-left">
										<div class="item-address">
											<strong>${list.username}</strong><br>
											${list.email}
											 <br>
										</div>
									</div> 
									<span class="btn-group btn-group-context">
									

										<button type="button" class="btn btn-link">
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

			<div class="tab-pane fade" id="dangtin"></div>
		</div>
	</div>
	<!--End col 4-->
	<c:forEach var="show" items="${showUser}">
		<div style="width: 100%; padding: 15px; padding-left: 365px; display: none;" id="${show.username}" class="showDetail">
			<form action="" method="POST" role="form" class="form-horizontal">
				<legend>${show.username}</legend>

				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
					<div class="form-group">
						<label class="col-sm-4 control-label">Tài khoản:</label>
						<div class="col-sm-8">
							<p class="form-control-static">
								<c:out value="${show.username}" />
							</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">Email:</label>
						<div class="col-sm-8">
							<p class="form-control-static">
								<c:out value="${show.email}" />
							</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">Các quyền:</label>
						<div class="col-sm-8">
							<p class="form-control-static">
							<c:forEach var="list" items="${show.userroles}">
								<p>${list.role}</p>									
							</c:forEach>
							</p>
						</div>
					</div>
					
				</div>
				<!--End col 6-->
				<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8" >
					<!-- Table -->
					<p><b>Các yêu cầu đăng tin</b></p>
					<table class="table table-hover table-stripped table-bordered" >
						<thead>
							<tr>
								<th>Địa chỉ</th>
								<th>Ngày yêu cầu</th>
								<th>Trạng thái</th>
							</tr>
						</thead>
						<tbody id="listPhong">
							<c:forEach var="thongtin" items="${show.nhatros}">
							<c:choose>
								<c:when test="${thongtin.trangthai == 0}">
									<tr onclick="document.location ='/nhatro/admin/quanlydangtin/searchyeucau/searchContent=${thongtin.ngayyeucau}'" style="cursor: hand;">
										<td>${thongtin.diachi}</td>
										<td>${thongtin.ngayyeucau}</td>
										<td class="text-center">
											<span class="glyphicon glyphicon-eye-open"></span>
										</td>
									</tr>
									
								</c:when>
								<c:when test="${thongtin.trangthai != 0}">
									<tr>
										<td>${thongtin.diachi}</td>
										<td>${thongtin.ngayyeucau}</td>
										<td class="text-center">
											<c:choose>
												<c:when test="${thongtin.trangthai == 1}">
													<span class="glyphicon glyphicon-ok"></span>
												</c:when>
												<c:when test="${thongtin.trangthai == 2}">
													<span class="glyphicon glyphicon-remove"></span>
												</c:when>
											</c:choose>
										</td>
									</tr>
								</c:when>
								</c:choose>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >
					<button type="button" class="btn btn-danger btn-block" onclick="document.location ='/nhatro/admin/quanlythanhvien/xoa/user=${show.username}'">
						<span class="glyphicon glyphicon-remove"></span>
					</button>
				
				</div>
			</form>
			<div style="clear: both;"></div>
		</div>
		
	</c:forEach>

</body>
</html>