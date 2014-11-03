<%@ page language="java" pageEncoding="utf8" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- Đăng nhà trọ modal -->
<sec:authorize access="isAuthenticated()">
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content" style="width: 100%;">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	        <h4 class="modal-title" id="myModalLabel">Đăng nhà trọ</h4>
	      </div>
	      <form action="thanhvien/yeucauHandling" method="POST" onsubmit="return danhSo();" role="form" id="form-yeu-cau" style="width: 100%;">
	      <div class="modal-body" style="width: 100%;">
	      		<div class="alert alert-success">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true" style="line-height: 16px; margin-left: 5px;">&times;</button>
					Nhà trọ của bạn sẽ được xác nhận trong vòng 3 ngày :)
				</div>
				<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
				<div class="form-group" style="width: 100%;">
					<div id="yeucau-map-canvas" style="height: 200px;" class="map-canvas">
					</div>
				</div>
				<div class="form-group">
					<div class="input-group">
					  <span class="input-group-addon"><span class="glyphicon glyphicon-map-marker"></span></span>
					  <input type="text" name="diaChi" id="diaChi" class="form-control" value="" required="required" data-bv-message="Hãy nhập một địa chỉ có thực!"
						placeholder="Số nhà/hẻm, tên đường, quận" onblur="codeAddress()">
					</div>
					<input type="hidden" name="toaDo.x" id="kinhDo" value="10.0341434">
					<input type="hidden" name="toaDo.y" id="viDo" value="105.7561615">
				</div>
				<div class="form-group">
					<div class="input-group">
					  <span class="input-group-addon"><span class="glyphicon glyphicon-earphone"></span></span>
					  <input type="text" name="soDt" id="soDt" class="form-control" value="" required="required" placeholder="Số điện thoại" data-bv-message="Hãy nhập số điện thoại!">
					</div>
				</div>
				<div class="form-group" style="text-align: center;">
					<div class="btn-group" data-toggle="buttons" class="center">
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
				</div>
				<table class="table table-hover table-stripped">
					<thead>
						<tr>
							<th>Diện tích (m<sup>2</sup>)</th>
							<th>Số người</th>
							<th>Giá (VND)</th>
							<th>Số phòng</th>
							<th></th>
						</tr>
					</thead>
					<tbody id="listPhong">
						<tr>
							<td><input type="number" class="form-control" value="5" min="5"	required="required"></td>
							<td><input type="number" class="form-control" value="1" min="1" required="required"></td>
							<td><input type="number" class="form-control" value="0" min="0" max='5000000' step="100000" required="required"></td>
							<td><input type="number" class="form-control" value="1" min="1" max="100" required="required"></td>
							<td>
								<a class="btn btn-link remove-button">
									<span class="glyphicon glyphicon-remove"></span>
								</a>
							</td>
						</tr>
					</tbody>
				</table>
				<a class="btn btn-link btn-block" onclick="themPhong()">Thêm phòng</a>
				<div class="clearfix"></div>
	      </div><!-- End Modal body -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
	        <button type="submit" value='submit' class="btn btn-primary">Đăng</button>
	      </div>
	      </form>
	    </div>
	  </div>
	</div>
</sec:authorize>