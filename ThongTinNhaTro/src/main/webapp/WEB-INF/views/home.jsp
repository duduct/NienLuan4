<%@ page language="java" pageEncoding="utf8" contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<title>Nhà trọ Cần Thơ</title>

<!-- Load Google Maps Api Jquery -->
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBRijrqPbCijmQLQydo5VA183mOowbr67w">
</script>

<%@ include file="/WEB-INF/views/head.jsp" %>

<!-- Load Perfect scrollbar CSS -->
<link href="<c:url value="/resources/css/perfect-scrollbar.min.css" />"
	rel="stylesheet">

<!-- Load Jquery UI CSS and JS -->

<link href="<c:url value="/resources/css/jquery-ui.css" />" rel="stylesheet">
	
<script src="<c:url value="/resources/js/jquery-ui.js" />"></script>

<!-- Load like jquery -->
<script src="<c:url value="/resources/js/like.js" />"></script>
<!-- Load comment jquery -->
<script src="<c:url value="/resources/js/comment.js" />"></script>

<!-- Load home jquery -->
<script src="<c:url value="/resources/js/home.js" />"></script>

</head>
<body>
 	<%@ include file="/WEB-INF/views/menu.jsp" %>
	
	<div class="panel-side pull-left" id="search-panel">
		<form id="criteria">
			<div class="panel panel-success">
				<div class="panel-heading">
					<h3 class="panel-title">Loại nhà trọ</h3>
				</div>
				<div class="list-group" id="loai-nhatro">
					<a class="list-group-item">Tất cả<span class="pull-right"><input type="radio" name="loainhatro" value="0" checked><span class="tick">✔</span></span></a>
					<c:forEach var="loai" items="${loais }">
						<a class="list-group-item">${loai.tenloai }<span class="pull-right"><input type="radio" name="loainhatro" value="${loai.loaiid }" ><span class="tick">✔</span></span></a>
					</c:forEach>
				</div>
			</div>
			<div class="panel panel-success">
				<div class="panel-heading">
					<h3 class="panel-title">Mức giá <span type="text" class="slider-value" id="mucgia" style="border:0; "></span></h3>
				</div>
				<div class="panel-body">
					<input type="hidden" id="mucgia-min" name="mucgia-min">
					<input type="hidden" id="mucgia-max" name="mucgia-max">
					<div id="slider-mucgia"></div>
				</div>
			</div>
			<div class="panel panel-success">
				<div class="panel-heading">
					<h3 class="panel-title">Diện tích phòng<span type="text" class="slider-value" id="dientich" readonly style="border:0; "></span></h3>
				</div>
				<div class="panel-body">
					<input type="hidden" id="dientich-min" name="dientich-min">
					<input type="hidden" id="dientich-max" name="dientich-max">
					<div id="slider-dientich"></div>
				</div>
			</div>
			<input type="hidden" id="kinhDo" name="kinhDo" value="0">
			<input type="hidden" id="viDo" name="viDo" value="0">
		</form><!--End criteria-->
		<a class="btn btn-slide btn-block" onclick="doQuery()" id="slideUp"><span class="glyphicon glyphicon-search"></span></a>
		<div id="resultDiv" class="panel panel-info" style="display: none;">
			<div class="panel-heading">
				<h3 class="panel-title">Kết quả<span id="soLuongNhaTro" class='pull-right'></span></h3>
			</div>
			<div id="resultList" class="list-group">
			</div>
		</div>
		
		
	</div>
	<div id="search-result-card" style="display: none">
	</div>
	<div id="map-canvas" style="height: 100%; width: 100%; position: fixed;">
	</div>			
	<div class="btn-group" data-toggle="buttons" id="result-type">
		<label class="btn btn-default active">
			<input type="radio" name="show-type" checked value="1"> <span class="glyphicon glyphicon-map-marker"></span>
		</label>
		<label class="btn btn-default">
			<input type="radio" name="show-type" value="2" id="resultCardType"><span class="glyphicon glyphicon-th-list"></span>
		</label>
	</div>
</body>
</html>