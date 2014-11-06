<%@ page language="java" pageEncoding="utf8"
	contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="" style="height: 100%;">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Nhà trọ Cần Thơ | Quản Lý Yêu Cầu Đăng Tin</title>

<%@ include file="/WEB-INF/views/head.jsp"%>
<!-- Load JQuery UI -->
<script src="<c:url value="/resources/js/jquery-ui.js"/>"></script>

<!-- Load Scrollbar Jquery -->
<script src="<c:url value="/resources/js/perfect-scrollbar.min.js"/>"></script>

<!-- Load Admin Jquery -->
<script src="<c:url value="/resources/js/admin.js"/>"></script>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
			<![endif]-->
			


</head>

<body style="padding-top: 50px; height: 100%; width: 100%">
	<%@ include file="/WEB-INF/views/menu.jsp"%>

	<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 panel-side"
		id="sidebar" style="width: 350px;">
		<div class="row panel-side-header">
			<!-- Nav tabs -->
			<ul class="nav nav-pills" role="tablist" id="tab">
				<li class="active"><a href="#dangtin" role="tab"
					data-toggle="tab">Yêu cầu đăng tin</a></li>
				<li><a href="#thanhvien" role="tab" data-toggle="tab" onclick="chuyenLinkToThanhVien()">Thành
						viên</a></li>
			</ul>
		</div>

		<!-- Tab panes -->
		<div class="tab-content">
			<div class="tab-pane active fade in" id="dangtin">
				<div class="row panel-side-search">
					<input type="search" id="searchYeuCau" name="searchYeuCau" class="form-control" required="required" title="Search" onkeyup="searchYeuCau(this.value)"> 
						<span class="panel-side-search-placeholder"> 
						<span class="glyphicon glyphicon-search"></span> 
						<span class="panel-side-search-placeholder-caption">Search</span>
					</span>
				</div>
				<!--End row-->
				<!-- Hien thi danh sach dang tin -->
				<div class="row" id="Demo" style="posibtion: relative; overflow: hidden;">
				</div>
				<!-- End demo -->
			</div>
			
			<div class="tab-pane fade" id="thanhvien"></div>
		</div>
	</div>
	<!--End col 4-->
	<!-- Load Thong tin nha tro tuong ung khi nguoi dung click vao danh sach lien ket ben tay trai -->
	<div style="width: 100%; padding: 15px; padding-left: 365px; ">
		<form action="xacnhanyeucau" role="form" class="form-horizontal" id="formYeuCau">
			<div id="resultDetail">
				<h1>Chọn một yêu cầu đăng tin để xem chi tiết</h1>		
			</div>
			<!-- End Chi tiet nha tro -->
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<div class="form-group">
					<div id="map-canvas" style="height: 369px; width: 100%;" class="map-canvas">
					
					</div>
				</div>
			</div>
			
		</form>
	</div>
</body>
</html>