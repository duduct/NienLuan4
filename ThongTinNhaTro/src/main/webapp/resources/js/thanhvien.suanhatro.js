$(document).ready(function() {
	deleteRow();
});
function thanhVienDeleteRow() {
	$("#form-sua-nhatro .remove-button").each(function() {
		$(this).click(function() {
			$(this).parent().parent().remove();
			thanhVienDanhSo();
		});
	});
}

/* Danh so lai cho cac name cua cac input */
function thanhVienDanhSo() {
	var count = 0;
	var dienTichOk = true;
	var soNguoiOk = true;
	var giaOk = true;
	var soLuongOk = true;
	$("#form-sua-nhatro .remove-button").each(function() {
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
	if (dienTichOk === true && soNguoiOk === true && giaOk === true && soLuongOk === true) return true;
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
function thanhvienThemPhong() {
	var listPhong = $('#thanhvien-listPhong');
	var tr = "<tr><td><input type='number' class='form-control' value='5' min='5' required='required'></td>"
			+ "<td><input type='number' class='form-control' value='1' min='1' required='required'></td>"
			+ "<td><input type='number' class='form-control' value='0' min='0' max='5000000' step='100000' required='required'></td>"
			+ "<td><input type='number' class='form-control' value='1' min='1' max='100' required='required'></td>"
			+ "<td><a class='btn btn-link remove-button'><span class='glyphicon glyphicon-remove'></span></button></td></tr>";
	listPhong.append(tr);
	thanhVienDeleteRow();
	thanhVienDanhSo();
}

function thanhVienSubmitSuaNhaTro() {
	$.ajax({
		type: 'post',
		url: '/nhatro/thanhvien/suanhatro/handling',
		data: $("#form-sua-nhatro").serialize(),
		success: function(data) {
			var alert = "<div class='alert alert-success alert-dismissible' style='margin-top: 10px' role='alert'><button type='button' class='close' data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button><strong>Nhà trọ</strong> đã sửa thành công!</div>";
			$('#nhatroDetail').html(alert + data);
		},
		error: function() {
			$('#nhatroDetail').html("<h1 class='text-danger'>Có lỗi xảy ra khi cập nhật dữ liệu. Hãy thử lại!</h1>");
		}
	});
}