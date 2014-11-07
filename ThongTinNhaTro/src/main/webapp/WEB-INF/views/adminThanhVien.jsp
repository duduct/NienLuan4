<%@ page language="java" pageEncoding="utf8"
	contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	

<html lang="" style="height: 100%; width: 100%;">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Nhà trọ Cần Thơ | Quản Lý Thành Viên</title>
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


<!-- Load Google Maps Api Jquery -->
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBRijrqPbCijmQLQydo5VA183mOowbr67w">
</script>

<script src="<c:url value="/resources/js/adminThanhVien1.js"/>"></script>
</head>
<body style="padding-top: 50px; height: 100%; width: 100%;">
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
					<input type="search" name="" id="input" class="form-control"  title="Search" onkeyup="searchThanhVien(this.value)"> 
					<span
						class="panel-side-search-placeholder"> <span
						class="glyphicon glyphicon-search"></span> <span
						class="panel-side-search-placeholder-caption">Search</span>
					</span>
				</div>
				<!--End row-->
				<!-- Danh sach cac thanh vien  -->
				<div class="row" id="Demo" style="posibtion: relative; overflow: hidden;">
				</div>
			</div>

			<div class="tab-pane fade" id="dangtin"></div>
		</div>
	</div>
	<!--End col 4-->
	<!-- Chi tiet tung thanh vien khi chon thanh vien tuong ung trong danh sach -->
	<div style="width: 100%; padding: 15px; padding-left: 365px;">
		<div id="resultDetail">
					<h1>Chọn một thành viên để xem chi tiết</h1>		
		</div>
	</div>

<!-- Modal -->
	<form action="xacnhanyeucau" role="form" class="form-horizontal"
		id="formYeuCauThanhVien">
		<div class="modal fade bs-example-modal-lg" id="myModalThanhVien"
			tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
			aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">Yêu cầu đăng tin</h4>
					</div>
					<div class="modal-body">
						<div id="resultModal"></div>
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<div class="form-group">
								<div id="admin-thanhvien-map-canvas"
									style="height: 369px; width: 100%;" class="map-canvas"></div>
							</div>
						</div>
						<div class='clearfix'></div>
					</div><!-- End modal body -->

					<div class="modal-footer">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
							<button type="button" class="btn btn-success btn-block"
								onclick="dongy()" style="margin-bottom: 10px;"
								data-dismiss="modal">
								<span class="glyphicon glyphicon-ok"></span>
							</button>
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
							<button type="button" class="btn btn-danger btn-block"
								onclick="khongdongy()" style="margin-bottom: 10px;"
								data-dismiss="modal">
								<span class="glyphicon glyphicon-remove"></span>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>

</body>
</html>