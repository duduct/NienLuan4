<?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<!-- Bootstrap CSS -->
<link href="<c:url value="/resources/css/bootstrap.css" />"
	rel="stylesheet" media="screen">
<link href="<c:url value="/resources/css/bootstrap-switch.min.css" />"
	rel="stylesheet" media="screen">
<style type="text/css">
html {
	height: 100%
}

body {
	height: 100%;
	margin: 0;
	padding: 0;
	padding-top: 50px;
}

#map-canvas {
	height: 100%
}
</style>
<!-- jQuery -->
<script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap-switch.min.js" />"></script>
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBRijrqPbCijmQLQydo5VA183mOowbr67w">
	
</script>
<script type="text/javascript">
	$(document).ready(function() {
		//$("[name='my-checkbox']").bootstrapSwitch();
		$("#map-switch").change(function() {
			if ($(this).prop('checked') == false) {
				$("#map-canvas").fadeOut();
				queryAjaxLinked();
				$("body").css("padding-top", "70px");
				$("#link-canvas").fadeIn();
			} else {
				$("body").css("padding-top", "50px");
				$("#map-canvas").fadeIn();
				$("#link-canvas").fadeOut();
			}
		});
	});
	var map;
	function initialize() {
		var mapOptions = {
			center : new google.maps.LatLng(10.0341434, 105.7561615),
			zoom : 15,
			disableDefaultUI : true
		};
		map = new google.maps.Map(document.getElementById("map-canvas"),
				mapOptions);
		queryAjax();
	}

	function queryAjax() {
		$.ajax({
			headers : {
				token : "${_csrf.token}",
				header : "${_csrf.headerName}"
			},
			type : 'get',
			url : 'searchMotel',
			data : "loaiid=" + $('#loaiId').val() + "&mucGia="
					+ $('#mucGia').val() + "&mucDienTich="
					+ $('#mucDienTich').val(),
			success : function(data) {
				addMarkers(data);
			},
			error : function() {
				alert('error');
			}
		});
	}

	function addMarkers(data) {
		var count = 0;
		$
				.each(
						data,
						function(i, item) {
							var point = new google.maps.LatLng(item.x, item.y);
							var marker = new google.maps.Marker({
								position : point,
								map : map,
								title : "Nhà trọ"
							});
							var nhatroInfo = "";

							var infowindow = new google.maps.InfoWindow({
								content : "Đang tải dữ liệu ..."
							});
							google.maps.event
									.addListener(
											marker,
											'click',
											function() {
												infowindow.open(map, marker);
												$
														.ajax({
															type : 'GET',
															url : 'loadMotel',
															data : "id="
																	+ item.nhatroId,
															success : function(
																	data) {
																infowindow
																		.setContent(data);
															},
															error : function() {
																infowindow
																		.setContent("Lỗi xảy ra khi truy xuất cơ sở dữ liệu");
															}
														});
											});
						});
	}
	google.maps.event.addDomListener(window, 'load', initialize);
</script>
</head>
<body>
	<div class="row">
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
			<ul class="nav navbar-nav">
				<a class="navbar-brand" href="#">Nhà trọ Cần Thơ</a>
				<form class="navbar-form navbar-left" role="search">
					<div class="form-group">
						<label>Loại nhà trọ</label> <select class="form-control"
							name="loaiId" id="loaiId">
							<option value="0">Tất cả</option>
							<c:forEach var="loai" items="${loais }">
								<option value="${loai.loaiid }">${loai.tenloai }</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label>Giá tiền</label> <select class="form-control" name="mucGia"
							id="mucGia">
							<option value="0">Tất cả</option>
							<option value="1">Dưới 500 ngàn</option>
							<option value="2">500 ngàn - 1 triệu</option>
							<option value="3">1 triệu - 1 triệu 500 ngàn</option>
							<option value="4">1 triệu 500 ngàn - 2 triệu</option>
							<option value="5">Trên 2 triệu</option>
						</select>
					</div>
					<div class="form-group">
						<label>Diện tích</label> <select class="form-control"
							name="mucDienTich" id="mucDienTich">
							<option value="0">Tất cả</option>
							<option value="1">5 - 10 m2</option>
							<option value="2">10 - 15 m2</option>
							<option value="3">15 - 20 m2</option>
							<option value="4">20 - 25 m2</option>
							<option value="5">Trên 25 m2</option>
						</select>
					</div>
					<div class="form-group">
						<label>Đường</label> <select class="form-control" name="duongId"
							id="duongId">
							<option value="0">Tất cả</option>
							<c:forEach var="duong" items="${duongs }">
								<option value="${duong.duongid }">${duong.tenduong }</option>
							</c:forEach>
						</select>
					</div>
				</form>
			</ul>
			<ul class="nav navbar-nav pull-right">
				<li><input type="checkbox" name="my-checkbox" id="map-switch"
					checked></li>
				<li><a href="#"><span class="glyphicon glyphicon-user"></span>
						Đăng nhập</a></li>
			</ul>
		</nav>
	</div>

	<!-- Map version -->
	<div id="map-canvas"></div>

	<!-- Linked version -->
	<div class="container" id="link-canvas" style="display: none;">
		<div class="list-group" id="nhatro-list">
			<a href="#" class="list-group-item active">Item 1</a> <a href="#"
				class="list-group-item">Item 2</a> <a href="#"
				class="list-group-item">Item 3</a>
		</div>
	</div>
	<!-- Bootstrap JavaScript -->
	<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
</body>
</html>