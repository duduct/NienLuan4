var mapAdminThanhVien;
var markerAdminThanhVien;

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
					- $("#thanhvien .panel-side-search").outerHeight());
}
$(window).resize(function() {
	initHeight();
});


//Khởi tạo bản đồ với vị trí của nhà trọ đang xem
function initializeThanhVien() {
	defaultPosition = new google.maps.LatLng(10.0341434, 105.7561615);
	var mapOptions = {
		center : defaultPosition,
		zoom : 15,
		disableDefaultUI : true
	};
	mapAdminThanhVien = new google.maps.Map(document.getElementById("admin-thanhvien-map-canvas"), mapOptions);
	markerAdminThanhVien = new google.maps.Marker({
		position : defaultPosition,
		map : null
	});
	google.maps.event.addListener(mapAdminThanhVien, 'click', function(event) {
		var lat = event.latLng.lat();
		var lng = event.latLng.lng();
		mapAdminThanhVien.panTo(event.latLng);
		markerAdminThanhVien.setMap(null);
		$('#kinhdo').val(lat);
		$('#vido').val(lng);
		markerAdminThanhVien = new google.maps.Marker({
			position : new google.maps.LatLng(lat, lng),
			map : mapAdminThanhVien
		});
	});
}

/*Reload marker*/
function reloadMarkerThanhVien() {
	var lat = $('#kinhdo').val();
	var lng = $('#vido').val();
	markerAdminThanhVien.setMap(null);
	var viTri = new google.maps.LatLng(lat, lng);
	markerAdminThanhVien = new google.maps.Marker({
		position : viTri,
		map : mapAdminThanhVien
	});
	mapAdminThanhVien.panTo(viTri);
}

$(function(){
	searchThanhVien("");
	$('#myModalThanhVien').on('shown.bs.modal', function () {
		initializeThanhVien();
		reloadMarkerThanhVien();
	});
});

/* Tìm kiếm các yêu cầu đăng tin với noidung */
function searchThanhVien(noidung) {
	$("#Demo").html("<div class='panel panel-info'><div class='panel-heading'><h3 class='panel-title'>Đang tải</h3></div></div>");
	$.ajax({
		type: 'get',
		url: 'quanlythanhvien/searchThanhVien',
		data: 'searchContent='+noidung,
		success: function(data) {
			$('#Demo').html(data);
		},
		error: function() {
			alert("Lỗi xảy ra do mất kết nối với cơ sở dữ liệu! Vui lòng nhấn F5 để thử lại!");
		}
	});
}
function showDetailTV(user) {
	$("#resultDetail").html("<div class='panel panel-info'><div class='panel-heading'><h3 class='panel-title'>Đang tải</h3></div></div>");
	$.ajax({
		type: 'get',
		url: 'quanlythanhvien/loadThanhVien',
		data: 'user=' + user,
		success: function(data) {
			$('#resultDetail').html(data);
		},
		error: function() {
			alert("Lỗi xảy ra do mất kết nối với cơ sở dữ liệu! Vui lòng nhấn F5 để thử lại!");
		}
	});
}


function chuyenLinkToDangTin(){
	document.location.href = "/nhatro/admin/quanlydangtin";
}


function showDetailModal(nhatroid) {
	$("#resultModal").html("<div class='panel panel-info'><div class='panel-heading'><h3 class='panel-title'>Đang tải</h3></div></div>");
	$.ajax({
		type: 'get',
		url: 'quanlythanhvien/loadYeuCauThanhVien',
		data: 'id=' + nhatroid,
		success: function(data) {
			$('#resultModal').html(data);
			
			
		},
		error: function() {
			alert("Lỗi xảy ra do mất kết nối với cơ sở dữ liệu! Vui lòng nhấn F5 để thử lại!");
		}
	});
}


/*Dong y xac nhan nha tro*/
function dongy() {
	var isDongY = confirm("Bạn có chắc muốn xóa yêu cầu này không ?");
	if (isDongY == true) {
		$("#formYeuCauThanhVien").attr("action", "quanlythanhvien/dongy");
		$("#formYeuCauThanhVien").submit();
		return true;
	} else {
		return false;
	}
}

/*Khong dong y xac nhan nha tro*/
function khongdongy() {
	var isDelete = confirm("Bạn có chắc muốn xóa yêu cầu này không ?");
	if (isDelete == true) {
		$("#formYeuCauThanhVien").attr("action", "quanlythanhvien/khongdongy");
		$("#formYeuCauThanhVien").submit();
		return true;
	} else {
		return false;
	}
}


