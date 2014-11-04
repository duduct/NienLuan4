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

/* Gán sự kiện cho các nút xóa dòng */
$(document).ready(function() {
	$('#myModal').on('shown.bs.modal', function () {
		initializeYeuCau();
	});
//	Xử lý form trước khi đăng
	$('#form-yeu-cau').bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	diaChi: {
                validators: {
                    notEmpty: {
                        message: 'Hãy nhập một địa chỉ có thực!'
                    }
                }
            },
            soDt: {
                validators: {
                    digits: {
                        message: 'Số điện thoại chỉ được chứa chữ số !'
                    },
                    notEmpty: {
                        message: 'Hãy nhập số điện thoại!'
                    }
                }
            }
        }
    });
	deleteRow();
});

/*Ham xu ly xoa mot dong loai phong */
function deleteRow() {
	$(".remove-button").each(function() {
		$(this).click(function() {
			$(this).parent().parent().remove();
		});
	});
}

/* Danh so lai cho cac name cua cac input */
function danhSo() {
	var count = 0;
	var dienTichOk = true;
	var soNguoiOk = true;
	var giaOK = true;
	var soLuongOK = true;
	$(".remove-button").each(function() {
		var parent = $(this).parent().parent();

		var dienTich = parent.children("td:nth-child(1)").children();
		dienTich.attr("name", "phongs[" + count + "].dientich");
		if ($(dienTich).val() < 5)
			dienTichOk = false;
		
		var soNguoi = parent.children("td:nth-child(2)").children();
		soNguoi.attr("name", "phongs[" + count + "].songuoi");
		if ($(dienTich).val() < 1)
			soNguoiOk = false;
		
		var gia = parent.children("td:nth-child(3)").children();
		gia.attr("name", "phongs[" + count + "].gia");
		if ($(gia).val() < 0 || $(gia).val() > 5000000)
			giaOk = false;
		
		var soluong = parent.children("td:nth-child(4)").children();
		soluong.attr("name", "phongs[" + count + "].soluong");
		if ($(soluong).val() < 1 || $(soluong).val() > 100)
			soLuongOk = false;
		count++;
	});
	if ((dienTichOk & soNguoiOk & giaOk & soLuongOk) === true) return true;
	else {
		var info = "";
		if (!dienTichOk) info += "Diện tích phải lớn hơn 5 m2\n";
		if (!soNguoiOk) info += "Số người phải lớn hơn 1\n";
		if (!giaOk) info += "Giá phải lớn hơn 0 và nhỏ hơn 5,000,000\n";
		if (!soLuongOk) info += "Số lượng phòng phải lớn hơn 1 và nhỏ hơn 100\n";
		info += "Vui lòng kiểm tra lại các số liệu bạn có nhập đúng không !";
		alert(info);
		return false;
	}
}

/* Xu ly them phong */
function themPhong() {
	var listPhong = $('#listPhong');
	var tr = "<tr><td><input type='number' class='form-control' value='5' min='5' required='required'></td>"
			+ "<td><input type='number' class='form-control' value='1' min='1' required='required'></td>"
			+ "<td><input type='number' class='form-control' value='0' min='0' max='5000000' step='100000' required='required'></td>"
			+ "<td><input type='number' class='form-control' value='1' min='1' max='100' required='required'></td>"
			+ "<td><a class='btn btn-link remove-button'><span class='glyphicon glyphicon-remove'></span></button></td></tr>";
	listPhong.append(tr);
	deleteRow();
}