<%@ page language="java" pageEncoding="utf8"
	contentType="text/html;charset=UTF-8"%>
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
				<h3 class="panel-title">Kết quả</h3>
			</div>
			<div id="resultList" class="list-group">
				<a class="list-group-item">Số 1, Lý Tự Trọng <span class="showDetail btn-link pull-right">Xem chi tiết <span class="glyphicon glyphicon-chevron-right"></span></span></a>
				<a class="list-group-item">Hẻm 51<span class="showDetail btn-link pull-right">Xem chi tiết <span class="glyphicon glyphicon-chevron-right"></span></span></a>
				<a class="list-group-item">Trần Ngọc Quế<span class="showDetail btn-link pull-right">Xem chi tiết <span class="glyphicon glyphicon-chevron-right"></span></span></a>
			</div>
		</div>
		
		
	</div>
	<div id="search-result-card" style="display: none">
		<div class="col-sm-6 col-md-4">
			<div class="card">
				<div class="thumbnail">
					<div class="caption" style="border-bottom: 1px solid #ddd;">
						<h3>Số 1, Lý Tự Trọng</h3>
						<p><span class="glyphicon glyphicon-tag"></span><strong>&nbsp;&nbsp;2 000 000 VND</strong></p>
						<p style="color: #555">
							<span class="pull-left">
								<span class="glyphicon glyphicon-earphone"></span>&nbsp;&nbsp;0251654785
							</span>
							<span class="pull-right">
								<span class="glyphicon glyphicon-envelope"></span>&nbsp;&nbsp;mail1@gmail.com
							</span>
						</p>
						<div class="clearfix"></div>
					</div>
					<div class="caption">
						<p>Phòng nhìn ra bến Ninh Kiều</p>
						<table class="table table-hover table-stripped">
							<thead>
								<tr>
									<th>Diện tích</th>
									<th>Số người</th>
									<th>Giá</th>
									<th>Số phòng</th>
								</tr>
							</thead>
							<tbody id="listPhong">
								<tr>
									<td>2</td>
									<td>4</td>
									<td>5000000</td>
									<td>6</td>
								</tr>
								<tr>
									<td>2</td>
									<td>4</td>
									<td>5</td>
									<td>6</td>
								</tr>
								<tr>
									<td>2</td>
									<td>4</td>
									<td>5</td>
									<td>6</td>
								</tr>
							</tbody>
						</table>
						
						<a class="btn btn-danger" role="button"><span class="glyphicon glyphicon-heart"></span> 249</a>
						<a class="btn btn-link" role="button">2 bình luận</a>
					</div>
				</div><!--End thumbnail-->
				<ul class="list-group">
					<li class="list-group-item">

						<div class="comment">
							<span class="img-circle avatar">
								D
							</span>
							<h5 class="user"><strong>DuDu</strong> <small>10/07/2014</small></h5>
							<p>Lorem ipsum dolor sit amet, consectetur</p>
						</div>
						<div class="clearfix">

						</div>
					</li>
					<li class="list-group-item">

						<div class="comment">
							<span class="img-circle avatar">
								D
							</span>
							<h5 class="user"><strong>DuDu</strong> <small>10/07/2014</small></h5>
							<p>Lorem ipsum dolor sit amet, consectetur</p>
						</div>
						<div class="clearfix">

						</div>
					</li>
					<li class="list-group-item">

						<div class="comment">
							<span class="img-circle avatar">
								D
							</span>
							<p><textarea class="form-control" placeholder="Viết bình luận ..."></textarea></p>
						</div>
						<div class="clearfix">

						</div>
					</li>
					<div class="clearfix">

					</div>
				</ul>
			</div><!!--End card-->
		</div>
		<div class="col-sm-6 col-md-4">
			<div class="card">
				<div class="thumbnail">
					<div class="caption">
						<h3>Số 1, Lý Tự Trọng</h3>
						<p><span class="glyphicon glyphicon-tag"></span><strong>&nbsp;&nbsp;2 000 000 VND</strong></p>
						<p style="color: #555">
							<span class="pull-left">
								<span class="glyphicon glyphicon-earphone"></span>&nbsp;&nbsp;0251654785
							</span>
							<span class="pull-right">
								<span class="glyphicon glyphicon-envelope"></span>&nbsp;&nbsp;mail1@gmail.com
							</span>
						</p>
						<div class="clearfix"></div>
					</div>
					<div class="caption">
						<p>Phòng nhìn ra bến Ninh Kiều</p>
						<table class="table table-hover table-stripped">
							<thead>
								<tr>
									<th>Diện tích</th>
									<th>Số người</th>
									<th>Giá</th>
									<th>Số phòng</th>
								</tr>
							</thead>
							<tbody id="listPhong">
								<tr>
									<td>2</td>
									<td>4</td>
									<td>5000000</td>
									<td>6</td>
								</tr>
								<tr>
									<td>2</td>
									<td>4</td>
									<td>5</td>
									<td>6</td>
								</tr>
								<tr>
									<td>2</td>
									<td>4</td>
									<td>5</td>
									<td>6</td>
								</tr>
							</tbody>
						</table>
						
						<a class="btn btn-danger" role="button"><span class="glyphicon glyphicon-heart"></span> 249</a>
						<a class="btn btn-link" role="button">2 bình luận</a>
					</div>
				</div><!--End thumbnail-->
				<ul class="list-group">
					<li class="list-group-item">

						<div class="comment">
							<span class="img-circle avatar">
								D
							</span>
							<h5 class="user"><strong>DuDu</strong> <small>10/07/2014</small></h5>
							<p>Lorem ipsum dolor sit amet, consectetur</p>
						</div>
						<div class="clearfix">

						</div>
					</li>
					<li class="list-group-item">

						<div class="comment">
							<span class="img-circle avatar">
								D
							</span>
							<h5 class="user"><strong>DuDu</strong> <small>10/07/2014</small></h5>
							<p>Lorem ipsum dolor sit amet, consectetur</p>
						</div>
						<div class="clearfix">

						</div>
					</li>
					<li class="list-group-item">

						<div class="comment">
							<span class="img-circle avatar">
								D
							</span>
							<p><textarea class="form-control" placeholder="Viết bình luận ..."></textarea></p>
						</div>
						<div class="clearfix">

						</div>
					</li>
					<div class="clearfix">

					</div>
				</ul>
			</div><!!--End card-->
		</div>
	</div>
	<div id="map-canvas" style="height: 100%; width: 100%; position: fixed;">
	</div>			
	<div class="btn-group" data-toggle="buttons" id="result-type">
		<label class="btn btn-default active">
			<input type="radio" name="show-type" checked value="1"> <span class="glyphicon glyphicon-map-marker"></span>
		</label>
		<label class="btn btn-default">
			<input type="radio" name="show-type" value="2"><span class="glyphicon glyphicon-th-list"></span>
		</label>
	</div>
</body>
</html>