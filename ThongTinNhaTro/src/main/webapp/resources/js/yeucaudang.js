/* Khoi tao ban do */
var mapYeuCau;
var geocoderYeuCau;
var yeuCauMarker;

function initializeYeuCau() {
	geocoderYeuCau = new google.maps.Geocoder();
	var mapOptions = {
		center: new google.maps.LatLng(10.0341434, 105.7561615),
		zoom: 14,
		disableDefaultUI : true
	};
	mapYeuCau = new google.maps.Map(document.getElementById("yeucau-map-canvas"), mapOptions);
}

function codeAddress() {
	var address = document.getElementById("diaChi").value;
	address += " Cần Thơ";
	geocoderYeuCau.geocode( { 'address': address}, function(results, status) {
		if (status == google.maps.GeocoderStatus.OK) {
			$("#form-yeu-cau #kinhDo").val(results[0].geometry.location.lat());
			$("#form-yeu-cau #viDo").val(results[0].geometry.location.lng());
			var position = new google.maps.LatLng(results[0].geometry.location.lat(), results[0].geometry.location.lng());
			if (yeuCauMarker != null) {
				yeuCauMarker.setMap(null);
			}
			mapYeuCau.setCenter(results[0].geometry.location);
			yeCauMarker = new google.maps.Marker({
				map: mapYeuCau,
				position: position
			});
		} else {
			alert("Geocode was not successful for the following reason: " + status);
		}
	});
}

/* Kiem tra dia chi bi trung so voi trong he thong */
function kiemTraDiaChiTrung() {
	var result = false;
	$.ajax({
		type: 'get',
		url: 'kiemTraDiaChi',
		data: 'kinhdo=' + $("#form-yeu-cau #kinhDo").val() + "&vido=" + $("#form-yeu-cau #viDo").val(),
		async: false,
		success: function(data) {
			if (data == "yes") {
				alert("Nhà trọ của bạn đã có người đăng! Hãy kiểm tra chắc chắc rằng địa chỉ của bạn không nhập sai hoặc thử lại với một địa chỉ khác !");
				result = true;
			} else {
				result = false;
			}
		},
		error: function() {
			alert("Ồ! Chúng tôi không thể kiểm tra địa chỉ của bạn! Hãy thử lại hoặc nhấn F5 để tải lại trang !");
			result = false;
		}
	});
	return result;
}

/* Gán sự kiện cho các nút xóa dòng */
$(document).ready(function() {
	$('#myModal').on('shown.bs.modal', function () {
		initializeYeuCau();
	});
	deleteRow();
});