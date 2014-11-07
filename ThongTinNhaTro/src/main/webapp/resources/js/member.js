// Chỉnh chiều cao 100% cho thanh sidebar
$(function() {
	initHeight();
	$("#Demo").css("position", "relative");
	$('#Demo').perfectScrollbar();
});
function initHeight() {
	var documentHeight = $(window).height();
	var height = documentHeight - $("#header").outerHeight();
	$("#sidebar").height(height);
	$("#Demo").height(
			$("#sidebar").outerHeight() - $(".panel-side-header").outerHeight()
					- $("#dangtin .panel-side-search").outerHeight());
}
$(window).resize(function() {
	initHeight();
});

//Xem chi tiết nhà trọ với nhà trọ id
function showDetailNhaTroThanhVien(nhatroid) {
	$('#nhatroDetail').html("<h3>Đang tải ...</h3>");
	$.ajax({
		type: 'get',
		url: '/nhatro/thanhvien/suanhatro/' + nhatroid,
		success: function(data) {
			$('#nhatroDetail').html(data).fadeIn();
		},
		error: function() {
			alert("Lỗi xảy ra do mất kết nối với cơ sở dữ liệu! Vui lòng nhấn F5 để thử lại!");
		}
	});
}

function xoaNhaTro(id) {
	var isDelete = confirm("Bạn có chắc muốn xóa nhà trọ không ?");
	if (isDelete === true) {
		document.location ='/nhatro/thanhvien/xoa/' + id;
	} else {
		return false;
	}
}