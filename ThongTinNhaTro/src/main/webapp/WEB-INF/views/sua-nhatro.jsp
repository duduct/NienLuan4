<%@ page language="java" pageEncoding="utf8"
	contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<meta name="_csrf" content="${_csrf.token}" />
<!-- default header name is X-CSRF-TOKEN -->
<meta name="_csrf_header" content="${_csrf.headerName}" />
<!-- ... -->
<!-- Bootstrap CSS -->
<link href="<c:url value="/resources/css/bootstrap.css" />"
	rel="stylesheet" media="screen">
<link href="<c:url value="/resources/css/dropzone.css" />"
	rel="stylesheet" media="screen">
<link href="<c:url value="/resources/css/nhatro.css" />" rel="stylesheet"
	media="screen">
<!-- jQuery -->
<script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
<script src="<c:url value="/resources/js/jquery.autosize.min.js" />"></script>
<script src="<c:url value="/resources/js/jquery.1.9.1.min.js" />"></script>
<script src="<c:url value="/resources/js/vendor/jquery.ui.widget.js" />"></script>
<script src="<c:url value="/resources/js/jquery.iframe-transport.js" />"></script>
<script src="<c:url value="/resources/js/jquery.fileupload.js" />"></script>
<script src="<c:url value="/resources/js/themphong.js" />"></script>

<script>
	$(function () {
		$('#fileupload')
				.fileupload(
						{
							dataType : 'json',
							done : function(e, data) {
								$("tr:has(td)").remove();
								$
										.each(
												data.result,
												function(index, file) {

													$("#uploaded-files")
															.append(
																	$('<tr/>')
																			.append(
																					$(
																							'<td/>')
																							.text(
																									file.fileName))
																			.append(
																					$(
																							'<td/>')
																							.text(
																									file.fileSize))
																			.append(
																					$(
																							'<td/>')
																							.text(
																									file.fileType))
																			.append(
																					$(
																							'<td/>')
																							.html(
																									"<a href='rest/controller/get/"+index+"'>Click</a>")))//end $("#uploaded-files").append()
												});
							},

							progressall : function(e, data) {
								var progress = parseInt(data.loaded
										/ data.total * 100, 10);
								$('#progress .bar')
										.css('width', progress + '%');
							},

							dropZone : $('#dropzone'),

							onError : function(files, status, errMsg) {
								alert(files + " " + status + " " + errMsg);
							}
						});
	});
</script>
</head>
<body>
<body>
	<%@ include file="/WEB-INF/views/menu.jsp" %>
	
	<div class="container">
		<div class="col-xs-7 col-sm-7 col-md-7 col-lg-7 card">
			<form action="handling" method="post">

				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
				<div class="card-heading row">
					<span class="title">${nhatro.diachi }</span>
				</div>

				<div class="row" style="background: #ECF4F9;">
					<input type="hidden" name="nhatroid" value="${nhatro.nhatroid }" />
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 form-group">
						<label><span class="btn btn-info"><span
								class="glyphicon glyphicon-earphone"></span></span> Số điện thoại</label> <input
							type="text" name="soDt" class="form-control" id=""
							placeholder="Số điện thoại" value="${nhatro.sdt }">
					</div>
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 form-group">
						<label><span class="btn btn-info"><span
								class="glyphicon glyphicon-envelope"></span></span> Email</label> <input
							type="text" class="form-control" id="" placeholder="Email"
							value="${nhatro.email }" name="email">
					</div>
				</div>
				<div class="row" style="background: #f7f7f7;">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 form-group">
						<div class="form-group">
							<label for="">Loại nhà trọ</label>
							<div class="btn-group" data-toggle="buttons"
								style="display: table; margin: 0 auto;">
								<label
									class="btn btn-primary ${nhatro.loai.loaiid == 1 ? 'active' : '' }">
									<input type="radio" name="loaiid" id="loaiid" value="1"
									${nhatro.loai.loaiid == 1 ? 'checked' : '' }>Nhà trọ
									độc lập
								</label> <label
									class="btn btn-primary ${nhatro.loai.loaiid == 2 ? 'active' : '' }">
									<input type="radio" name="loaiid" id="loaiid" value="2"
									${nhatro.loai.loaiid == 2 ? 'checked' : '' }>Nhà riêng
								</label> <label
									class="btn btn-primary ${nhatro.loai.loaiid == 3 ? 'active' : '' }">
									<input type="radio" name="loaiid" id="loaiid" value="3"
									${nhatro.loai.loaiid == 3 ? 'checked' : '' }>Khu nhà
									trọ
								</label> <label
									class="btn btn-primary ${nhatro.loai.loaiid == 4 ? 'active' : '' }">
									<input type="radio" name="loaiid" id="loaiid" value="4"
									${nhatro.loai.loaiid == 4 ? 'checked' : '' }>Ở cùng chủ
									nhà
								</label>
							</div>
							<div style="clear: both;"></div>
						</div>
					</div>
					<!-- Upload picture -->
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"
						style="margin-top: 10px;">
						<div style="width: 500px; padding: 20px">

							<input id="fileupload" type="file" name="files[]"
								data-url="/nhatro/controller/upload" multiple>

							<div id="dropzone" class="fade well">Drop files here</div>

							<div id="progress" class="progress">
								<div class="bar" style="width: 0%;"></div>
							</div>

							<table id="uploaded-files" class="table">
								<tr>
									<th>File Name</th>
									<th>File Size</th>
									<th>File Type</th>
									<th>Download</th>
								</tr>
							</table>

						</div>

					</div>
					<!--End upload picture-->
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"
						style="margin-top: 10px;">
						<div class="form-group">
							<label>Mô tả</label>
							<textarea class="form-control" id=""
								placeholder="Vài dòng mô tả nhà trọ của bạn ...">${nhatro.motanhatro }</textarea>
						</div>
					</div>

				</div>
				<div class="row">
					<div class="title">Phòng</div>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>Diện tích</th>
								<th>Số người</th>
								<th>Đơn giá</th>
								<th>Số lượng</th>
							</tr>
						</thead>
						<tbody id="listPhong">
							<c:forEach var="loaiphong" items="${loaiPhongs }"
								varStatus="status">
								<tr>

									<td><input type="number"
										name="phongs[${status.index}].dientich"
										id="phongs[0].dientich" class="form-control"
										value="${loaiphong.dientich }" min="0" max="" step=""
										required="required"></td>
									<td><input type="number"
										name="phongs[${status.index}].songuoi" id="phongs[0].songuoi"
										class="form-control" value="${loaiphong.songuoi }" min="0"
										max="" step="" required="required"></td>
									<td><input type="number"
										name="phongs[${status.index}].gia" id="phongs[0].gia"
										class="form-control" value="${loaiphong.gia }" min="5" max=""
										step="100000" required="required"></td>
									<td><input type="number"
										name="phongs[${status.index}].soluong" id="phongs[0].soluong"
										class="form-control" value="${loaiphong.soluong }" min="5"
										max="" step="" required="required"></td>
									<td><a class="btn btn-link remove-button"><span
											class="glyphicon glyphicon-remove"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="form-group">
					<a class="btn btn-link btn-block" onclick="themPhong()">Thêm
						phòng</a>
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-primary btn-block">Lưu
						thay đổi</button>
				</div>
			</form>
		</div>
		<!-- End div 7 -->
	</div>
</body>
<!-- Bootstrap JavaScript -->
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<script>
	$(document).ready(function() {
		deleteRow();
	});
	function deleteRow() {
		$(".remove-button").each(function() {
			$(this).click(function() {
				$(this).parent().parent().remove();
			});
		});
	}

	function danhSo() {
		var count = 0;
		$(".remove-button").each(function() {
			var parent = $(this).parent().parent();

			var dienTich = parent.children("td:nth-child(1)").children();
			dienTich.attr("name", "phongs[" + count + "].dientich");

			var soNguoi = parent.children("td:nth-child(2)").children();
			soNguoi.attr("name", "phongs[" + count + "].songuoi");

			var gia = parent.children("td:nth-child(3)").children();
			gia.attr("name", "phongs[" + count + "].gia");

			var soluong = parent.children("td:nth-child(4)").children();
			soluong.attr("name", "phongs[" + count + "].soluong");
			count++;
		});
	}

	function themPhong() {
		var listPhong = $('#listPhong');
		var tr = "<tr>"
				+ "<td><input type=\"number\" name=\"\" id=\"input\" class=\"form-control\" value=\"\" min=\"{5\"} max=\"\" step=\"\" required=\"required\" title=\"\"></td>"
				+ "<td><input type=\"number\" name=\"\" id=\"input\" class=\"form-control\" value=\"\" min=\"{5\"} max=\"\" step=\"\" required=\"required\" title=\"\"></td>"
				+ "<td><input type=\"number\" name=\"\" id=\"input\" class=\"form-control\" value=\"\" min=\"{5\"} max=\"\" step=\"100000\" required=\"required\" title=\"\"></td>"
				+ "<td><input type=\"number\" name=\"\" id=\"input\" class=\"form-control\" value=\"\" min=\"{5\"} max=\"\" step=\"\" required=\"required\" title=\"\"></td>"
				+ "<td><a class=\"btn btn-link remove-button\"><span class=\"glyphicon glyphicon-remove\"></span></button></td></tr>";
		listPhong.append(tr);
		deleteRow();
	}
</script>
</body>
</html>