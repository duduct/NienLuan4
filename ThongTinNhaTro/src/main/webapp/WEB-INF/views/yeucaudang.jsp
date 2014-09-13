<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<!-- Bootstrap CSS -->
<link href="<c:url value="/resources/css/bootstrap.css" />"
	rel="stylesheet" media="screen">
<!-- jQuery -->
<script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBRijrqPbCijmQLQydo5VA183mOowbr67w">
		</script>
<script type="text/javascript">
		var map;
		var geocoder;
		function initialize() {
			geocoder = new google.maps.Geocoder();
			var mapOptions = {
				center: new google.maps.LatLng(10.0341434, 105.7561615),
				zoom: 15,
				disableDefaultUI : true
			};
			map = new google.maps.Map(document.getElementById("map-canvas"),
				mapOptions);
		}

		function codeAddress() {
			var address = document.getElementById("diaChi").value;
			address += " Cần Thơ";
			geocoder.geocode( { 'address': address}, function(results, status) {
				if (status == google.maps.GeocoderStatus.OK) {
					$("#kinhDo").val(results[0].geometry.location.lat());
					$("#viDo").val(results[0].geometry.location.lng());
					var position = new google.maps.LatLng(results[0].geometry.location.lat(), results[0].geometry.location.lng());
					map.setCenter(results[0].geometry.location);
					var marker = new google.maps.Marker({
						map: map,
						position: position
					});
				} else {
					alert("Geocode was not successful for the following reason: " + status);
				}
			});
		}

		google.maps.event.addDomListener(window, 'load', initialize);
		</script>
</head>
<body>
<body style="padding-top: 70px;">
	<div class="container">
		<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			<form action="yeucauHandling" method="POST" role="form">
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
					<input type="hidden" name="toaDo.x" id="kinhDo" value="">
					<input type="hidden" name="toaDo.y" id="viDo" value="">
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
					<div class="btn-group" data-toggle="buttons"
						style="display: table; margin: 0 auto;">
						<label class="btn btn-primary"> <input type="radio"
							name="loaiid" id="loaiid" value="1" checked>Nhà trọ độc
							lập
						</label> <label class="btn btn-primary"> <input type="radio"
							name="loaiid" id="loaiid" value="2">Nhà riêng
						</label> <label class="btn btn-primary"> <input type="radio"
							name="loaiid" id="loaiid" value="3">Khu nhà trọ
						</label> <label class="btn btn-primary"> <input type="radio"
							name="loaiid" id="loaiid" value="4">Ở cùng chủ nhà
						</label>
					</div>
					<div style="clear: both;"></div>
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
		<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" id="map-canvas"
			style="height: 569px; box-shadow: 0px 0px 4px #888; border-radius: 8px; border: 1px solid white;">
		</div>
	</div>

	<script>
		$(document).ready(function() {
			deleteRow();
		});
		function deleteRow() {
			$(".remove-button").each(function() {
				$(this).click(function() {
					$(this).parent().parent().remove();
					danhSo();
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
			var tr = "<tr><td><input type=\"number\" name=\"\" id=\"input\" class=\"form-control\" value=\"\" min=\"{5\"} max=\"\" step=\"\" required=\"required\" title=\"\"></td>"
					+ "<td><input type=\"number\" name=\"\" id=\"input\" class=\"form-control\" value=\"\" min=\"{5\"} max=\"\" step=\"\" required=\"required\" title=\"\"></td>"
					+ "<td><input type=\"number\" name=\"\" id=\"input\" class=\"form-control\" value=\"\" min=\"{5\"} max=\"\" step=\"100000\" required=\"required\" title=\"\"></td>"
					+ "<td><input type=\"number\" name=\"\" id=\"input\" class=\"form-control\" value=\"\" min=\"{5\"} max=\"\" step=\"\" required=\"required\" title=\"\"></td>"
					+ "<td><a class=\"btn btn-link remove-button\"><span class=\"glyphicon glyphicon-remove\"></span></button></td></tr>";
			listPhong.append(tr);
			deleteRow();
			danhSo();
		}
	</script>
</body>
<!-- Bootstrap JavaScript -->
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
</body>
</html>