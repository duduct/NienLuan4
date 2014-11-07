var map;
var marker;

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

// Khởi tạo bản đồ với vị trí của nhà trọ đang xem
function initialize() {
	defaultPosition = new google.maps.LatLng(10.0341434, 105.7561615);
	var mapOptions = {
		center : defaultPosition,
		zoom : 15,
		disableDefaultUI : true
	};
	map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
	marker = new google.maps.Marker({
		position : defaultPosition,
		map : null
	});
	google.maps.event.addListener(map, 'click', function(event) {
		var lat = event.latLng.lat();
		var lng = event.latLng.lng();
		map.panTo(event.latLng);
		marker.setMap(null);
		$('#kinhdo').val(lat);
		$('#vido').val(lng);
		marker = new google.maps.Marker({
			position : new google.maps.LatLng(lat, lng),
			map : map
		});
	});
}

/*Reload marker*/
function reloadMarker() {
	var lat = $('#kinhdo').val();
	var lng = $('#vido').val();
	marker.setMap(null);
	var viTri = new google.maps.LatLng(lat, lng);
	marker = new google.maps.Marker({
		position : viTri,
		map : map
	});
	map.panTo(viTri);
}

//Xem chi tiết nhà trọ với nhà trọ id
function showDetail(nhatroid) {
	$.ajax({
		type: 'get',
		url: 'quanlydangtin/loadYeuCau',
		data: 'id=' + nhatroid,
		success: function(data) {
			$('#resultDetail').html(data);
			reloadMarker();
		}
	});
}

$(function(){
	searchYeuCau("");
});

/*Reload Google Map API*/
function loadScript() {
	  var script = document.createElement('script');
	  script.type = 'text/javascript';
	  script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&'+'callback=initialize';
	  document.body.appendChild(script);
	}

window.onload = loadScript;

/* Tìm kiếm các yêu cầu đăng tin với noidung */
function searchYeuCau(noidung) {
	$("#Demo").html("<div class='panel panel-info'><div class='panel-heading'><h3 class='panel-title'>Đang tải</h3></div></div>");
	$.ajax({
		type: 'get',
		url: 'quanlydangtin/searchYeuCau',
		data: 'searchContent='+noidung,
		success: function(data) {
			$('#Demo').html(data);
		},
		error: function() {
			alert("Lỗi xảy ra do mất kết nối với cơ sở dữ liệu! Vui lòng nhấn F5 để thử lại!");
		}
	});
}

/*Chuyển qua trang quản lý thành viên*/
function chuyenLinkToThanhVien(){
	document.location.href = "/nhatro/admin/quanlythanhvien";
}

/*Dong y xac nhan nha tro*/
function dongy() {
	var isDongY = confirm("Bạn có chắc muốn xóa yêu cầu này không ?");
	if (isDongY == true) {
		$("#formYeuCau").attr("action", "quanlydangtin/dongy");
		$("#formYeuCau").submit();
		return true;
	} else {
		return false;
	}
}

/*Khong dong y xac nhan nha tro*/
function khongdongy() {
	var isDelete = confirm("Bạn có chắc muốn xóa yêu cầu này không ?");
	if (isDelete == true) {
		$("#formYeuCau").attr("action", "quanlydangtin/khongdongy");
		$("#formYeuCau").submit();
		return true;
	} else {
		return false;
	}
}
