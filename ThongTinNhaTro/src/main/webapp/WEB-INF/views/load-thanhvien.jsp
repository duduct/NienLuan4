<%@ page language="java" pageEncoding="utf8" contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




				<legend>${show.username}</legend>
				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
					<div class="form-group">
						<label class="col-sm-4 control-label">Tài khoản:</label>
						<div class="col-sm-8">
							<p class="form-control-static">
								${show.username}
							</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">Email:</label>
						<div class="col-sm-8">
							<p class="form-control-static">
								${show.email}
							</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">Các quyền:</label>
						<div class="col-sm-8">
							<p class="form-control-static">
							<c:forEach var="list" items="${show.userroles}">
								<p>${list.role}</p>									
							</c:forEach>
							</p>
						</div>
					</div>
					
				</div>
				<!--End col 6-->
				<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8" >
					<!-- Table -->
					<p><b>Các yêu cầu đăng tin</b></p>
					<table class="table table-hover table-stripped table-bordered" >
						<thead>
							<tr>
								<th>Địa chỉ</th>
								<th>Ngày yêu cầu</th>
								<th>Trạng thái</th>
							</tr>
						</thead>
						<tbody id="listPhong">
							<c:forEach var="thongtin" items="${show.nhatros}">
							<c:choose>
								<c:when test="${thongtin.trangthai == 0}">
									
									<tr onclick="showDetailModal(${thongtin.nhatroid })" data-toggle="modal" data-target="#myModal" style="cursor: hand;" title="Chọn để xem chi tiết" >
										<td>${thongtin.diachi}</td>
										<td>${thongtin.ngayyeucau}</td>
										<td class="text-center">
											<span class="glyphicon glyphicon-eye-open" title="Đang được xem xét"></span>
										</td>
									</tr>
									
								</c:when>
								<c:when test="${thongtin.trangthai != 0}">
									<tr>
										<td>${thongtin.diachi}</td>
										<td>${thongtin.ngayyeucau}</td>
										<td class="text-center">
											<c:choose>
												<c:when test="${thongtin.trangthai == 1}">
													<span class="glyphicon glyphicon-ok" title="Đã được đồng ý"></span>
												</c:when>
												<c:when test="${thongtin.trangthai == 2}">
													<span class="glyphicon glyphicon-remove" title="Không được đồng ý"></span>
												</c:when>
											</c:choose>
										</td>
									</tr>
								</c:when>
								</c:choose>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >
					<button type="button" class="btn btn-danger btn-block" onclick="if (confirm('Xóa thành viên này có thể ảnh hưởng tới các dữ liệu khác. Bạn có muốn xóa không?')){document.location ='/nhatro/admin/quanlythanhvien/xoa/user=${show.username}';}else{return false; }">
						<span class="glyphicon glyphicon-remove"></span>
					</button>
				</div>



<!-- Modal -->
<form action="xacnhanyeucau" role="form" class="form-horizontal" id="formYeuCauThanhVien">
	<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
	    	<div class="modal-content">
	      		<div class="modal-header">
	        		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	        		 <h4 class="modal-title" id="myModalLabel">Yêu cầu đăng tin</h4>
				</div>
				      <div class="modal-body col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<div id="resultModal" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						</div>
					  </div>
	  			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<div class="form-group">
						<div id="map-canvas" style="height: 369px; width: 100%;" class="map-canvas">
						</div>
					</div>
				</div>
				 <div class="modal-footer">
			      	<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
							<button type="button" class="btn btn-success btn-block"  onclick="dongy()" style="margin-bottom: 10px;" data-dismiss="modal">
								<span class="glyphicon glyphicon-ok"></span>
							</button>
					</div>
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						<button type="button" class="btn btn-danger btn-block"  onclick="khongdongy()" style="margin-bottom: 10px;" data-dismiss="modal" >
							<span class="glyphicon glyphicon-remove"></span>
						</button>
					</div>
			      </div>		
				</div>
			</div>
		</div>	
</form>


