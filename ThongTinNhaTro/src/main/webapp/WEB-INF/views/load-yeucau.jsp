<%@ page language="java" pageEncoding="utf8" contentType="text/html;charset=UTF-8"%>
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBRijrqPbCijmQLQydo5VA183mOowbr67w">
</script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<input type="hidden" value="${nhatro.nhatroid}" name="showYeuCauID">
<legend>${nhatro.diachi}</legend>
<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
	<div class="form-group">
		<label class="col-sm-4 control-label">Người đăng:</label>
		<div class="col-sm-8">
			<p class="form-control-static">
				${nhatro.user.username}
			</p>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-4 control-label">Số điện thoại</label>
		<div class="col-sm-8">
			<p class="form-control-static">
				${nhatro.sdt}
			</p>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-4 control-label">Loại nhà trọ:</label>
		<div class="col-sm-8">
			<p class="form-control-static">${nhatro.loai.tenloai}</p>
		</div>
	</div>
</div>
<!--End col6-->
<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
	<!-- Table -->
	<table class="table table-hover table-stripped table-bordered" >
		<thead>
			<tr>
				<th>Diện tích</th>
				<th>Số người</th>
				<th>Giá</th>
				<th>Số phòng</th>
			</tr>
		</thead>
		<tbody id="listPhong">
			<c:forEach var="loaiphong" items="${nhatro.loaiphongs}">
				<tr>
					<td>${loaiphong.dientich}</td>
					<td>${loaiphong.songuoi}</td>
					<td>${loaiphong.gia}</td>
					<td>${loaiphong.soluong}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<input type="hidden" id="kinhdo" name='kinhdo' value="${nhatro.toado.x}">
	<input type="hidden" id="vido" name='vido' value="${nhatro.toado.y}">
</div>