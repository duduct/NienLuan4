<%@ page language="java" pageEncoding="utf8"
	contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	

<html lang="" style="height: 100%;">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Nhà trọ Cần Thơ | Quản Lý Thành Viên</title>
<!-- Load Google Maps Api Jquery -->
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
<script src="<c:url value="/resources/js/jquery.leanModal.min.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.js"/>"></script>
<script src="<c:url value="/resources/js/jquery-ui.js"/>"></script>
<!-- Bootstrap JavaScript -->
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/js/perfect-scrollbar.min.js"/>"></script>
<script src="<c:url value="/resources/js/adminThanhVien.js"/>"></script>



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
	<div style="width: 100%; padding: 15px; padding-left: 365px; ">
		<form action="" role="form" class="form-horizontal">
		<div id="resultDetail">
					<h1>Chọn một thành viên để xem chi tiết</h1>		
		</div>
		</form>
	</div>

</body>
</html>