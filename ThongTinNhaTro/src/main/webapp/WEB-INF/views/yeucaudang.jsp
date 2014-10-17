<%@ page language="java" pageEncoding="utf8"
	contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<title>Nhà trọ Cần Thơ | Đăng nhà trọ</title>
<%@ include file="/WEB-INF/views/head.jsp" %>

<!-- Google Maps Api -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBRijrqPbCijmQLQydo5VA183mOowbr67w"></script>

<!-- Load yeucaudang.js -->
<script src="<c:url value="/resources/js/yeucaudang.js" />"></script>

</head>
<body style="padding-top: 70px;">
	<%@ include file="/WEB-INF/views/menu.jsp" %>
	<div class="container">
		<form action="yeucauHandling" method="POST" role="form" class="col-xs-6 col-sm-6 col-md-6 col-lg-6 col-md-offset-6 card" id="form-yeu-cau" onsubmit="danhSo()">
				<h2>Đăng nhà trọ</h2>
				<div class="form-group">
					<legend>Thông tin liên lạc</legend>
				</div>
				<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
				<div class="form-group">
					<label for="">Địa chỉ</label>
					<input type="text" name="diaChi"
						id="diaChi" class="form-control" value="" required="required"
						placeholder="Số nhà/hẻm, tên đường, quận" onblur="codeAddress()">
					<input type="hidden" name="toaDo.x" id="kinhDo" value="10.0341434">
					<input type="hidden" name="toaDo.y" id="viDo" value="105.7561615">
				</div>
				
				<div class="form-group">
					<label for="">Số điện thoại</label> <input type="text" name="soDt"
						id="soDt" class="form-control" value="" required="required"
						placeholder="Số điện thoại">
				</div>
				<div class="form-group">
					<legend>Thông tin nhà trọ</legend>
				</div>
				<div class="form-group">
					<label for="">Loại nhà trọ</label>
					<div class="btn-group" data-toggle="buttons" style="display: table; margin: 0 auto;">
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
					<div class="clearfix"></div>
				</div>
				<div class="form-group">
					<label for="">Danh sách phòng trọ</label>
				</div>
				<table class="table table-hover table-stripped">
					<thead>
						<tr>
							<th>Diện tích</th>
							<th>Số người</th>
							<th>Giá</th>
							<th>Số phòng</th>
							<th></th>
						</tr>
					</thead>
					<tbody id="listPhong">
						<tr>
							<td><input type="number" name="phongs[0].dientich"
								id="phongs[0].dientich" class="form-control" value="" min="0"
								max="" step="" required="required"></td>
							<td><input type="number" name="phongs[0].songuoi"
								id="phongs[0].songuoi" class="form-control" value="" min="0"
								max="" step="" required="required"></td>
							<td><input type="number" name="phongs[0].gia"
								id="phongs[0].gia" class="form-control" value="" min="5" max=""
								step="100000" required="required"></td>
							<td><input type="number" name="phongs[0].soluong"
								id="phongs[0].soluong" class="form-control" value="" min="5"
								max="" step="" required="required"></td>
							<td><a class="btn btn-link remove-button"><span
									class="glyphicon glyphicon-remove"></span></a></td>
						</tr>
					</tbody>
				</table>
				<div class="form-group">
					<a class="btn btn-link btn-block" onclick="themPhong()">Thêm
						phòng</a>
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-primary btn-block">Gửi
						yêu cầu</button>
				</div>
		</form>
	</div>
</body>
</html>