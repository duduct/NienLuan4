<%@ page language="java" pageEncoding="utf8" contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!-- Bootstrap JavaScript -->
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>

<!-- Load Sua nha tro Jquery -->
<script src="<c:url value="/resources/js/thanhvien.suanhatro.js" />"></script>

<form action="#" method="post" id="form-sua-nhatro" onsubmit="return thanhVienDanhSo();">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<input type="hidden" name="nhatroid" value="${nhatro.nhatroid }" />
	<input type="hidden" name="trangthai" value="${nhatro.trangthai }" />
	<h1>${nhatro.diachi }</h1>
	<div class="form-group">
		<div class="input-group">
		  <span class="input-group-addon"><span class="glyphicon glyphicon-earphone"></span></span>
		  <input type="soDt" name="soDt" id="soDt" class="form-control" value="${nhatro.sdt }" required="required" data-bv-message="Hãy nhập một số điện thoại có thực !" placeholder="Số điện thoại">
		</div>
	</div>
	<div class="form-group">
		<div class="input-group">
		  <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span></span>
		  <input type="text" class="form-control" id="" placeholder="Email" value="${nhatro.email }" name="email">
		</div>
	</div>
	<div class="form-group">
		<label for="">Loại nhà trọ</label>
		<div class="btn-group" data-toggle="buttons" style="margin-left: 10px;">
			<label class="btn btn-primary ${nhatro.loai.loaiid == 1 ? 'active' : '' }">
				<input type="radio" name="loaiid" id="loaiid" value="1" ${nhatro.loai.loaiid == 1 ? 'checked' : '' }>Nhà trọ
				độc lập
			</label> <label class="btn btn-primary ${nhatro.loai.loaiid == 2 ? 'active' : '' }">
				<input type="radio" name="loaiid" id="loaiid" value="2" ${nhatro.loai.loaiid == 2 ? 'checked' : '' }>Nhà riêng
			</label> <label class="btn btn-primary ${nhatro.loai.loaiid == 3 ? 'active' : '' }">
				<input type="radio" name="loaiid" id="loaiid" value="3" ${nhatro.loai.loaiid == 3 ? 'checked' : '' }>Khu nhà
				trọ
			</label> <label class="btn btn-primary ${nhatro.loai.loaiid == 4 ? 'active' : '' }">
				<input type="radio" name="loaiid" id="loaiid" value="4" ${nhatro.loai.loaiid == 4 ? 'checked' : '' }>Ở cùng chủ
				nhà
			</label>
		</div>
		<div style="clear: both;"></div>
	</div>
	<div class="form-group">
		<label>Mô tả</label>
		<textarea class="form-control" name="mota" placeholder="Vài dòng mô tả nhà trọ của bạn ...">${nhatro.motanhatro }</textarea>
	</div>
	<div class="form-group">
		<h3>Danh sách phòng</h3>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Diện tích</th>
					<th>Số người</th>
					<th>Đơn giá</th>
					<th>Số lượng</th>
				</tr>
			</thead>
			<tbody id="thanhvien-listPhong">
				<c:forEach var="phong" items="${nhatro.loaiphongs }">
					<tr>
						<td><input type="number" class="form-control" value="${phong.dientich }" min="5" required="required"></td>
						<td><input type="number" class="form-control" value="${phong.songuoi }" min="1" required="required"></td>
						<td><input type="number" class="form-control" value="${phong.gia }" min="0" max="5000000" step="100000" required="required"></td>
						<td><input type="number" class="form-control" value="${phong.soluong }" min="1" max="100" required="required"></td>
						<td>
							<a class="btn btn-link remove-button">
								<span class="glyphicon glyphicon-remove"></span>
							</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="form-group">
		<a class="btn btn-link btn-block" onclick="thanhvienThemPhong()">Thêm phòng</a>
	</div>
	<div class="form-group">
		<button type="button" class="btn btn-primary btn-block" onclick="thanhVienSubmitSuaNhaTro()">Lưu thay đổi</button>
	</div>
</form><!-- End form -->