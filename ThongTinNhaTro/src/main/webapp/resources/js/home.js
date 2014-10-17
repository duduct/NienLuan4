/* Khoi tao Map */
var map;
var markers = [];
var defaultPosition; // Vị trí mặc định của bản đồ
var centerPosition; // Vị trí làm trung tâm để tìm kiếm
var infowindow = null;

function initialize() {
	defaultPosition = new google.maps.LatLng(10.0341434, 105.7561615);
	var mapOptions = {
		center : defaultPosition,
		zoom : 15,
		disableDefaultUI : true
	};
	map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
	google.maps.event.addListener(map, 'click', function(event) {
		var lat = event.latLng.lat();
		var lng = event.latLng.lng();
		/*$("#criteria #kinhDo").val(lat);
		$("#criteria #viDo").val(lng);
		if (centerPosition != null) {
			centerPosition.setMap(null);
		}
		centerPosition = new google.maps.Marker({
			position : new google.maps.LatLng(lat, lng),
			map : map,
			icon : centerMarker
		});*/
		map.panTo(event.latLng);
	});
	/*google.maps.event.addListener(map, 'rightclick', function(event) {
		if (centerPosition != null) {
			centerPosition.setMap(null);
		}
		centerPosition = null;
	});*/
	findMotel();
}

function doQuery(){
	$('#resultDiv').slideToggle(100);
	$('#criteria').slideToggle(100);
	findMotel();
}

/* Tim nha tro theo form #criteria */
function findMotel() {
	$.ajax({
		type : 'get',
		url : 'searchMotel',
		data : $("#criteria").serialize(),
		success : function(data) {
			removeMarker(markers);
			addListResult(data);
			addMarkers(data);
			addListDetailResult(data);
		},
		error : function() {
			alert('Lỗi xảy ra do mất kết nối với cơ sở dữ liệu! Vui lòng nhấn F5 để thử lại!');
		}
	});
}

/* Xoa hết tất cả marker */
function removeMarker(markers) {
	for (var i = 0; i < markers.length; i++) {
		markers[i].setMap(null);
	}
	markers = [];
	map.setZoom(15);
	map.panTo(defaultPosition);
}

/* Thêm kết quả vào danh sách liên kết bên tay trái */
function addListResult(data) {
	var list = '';
	var cnt = 0;
	$.each(data, function(i, item){
		list += "<a onclick='javascript:openInfoWindow(" + cnt + ")' class='list-group-item'>" + item.diaChi + "<span class='showDetail btn-link pull-right'>Xem chi tiết <span class='glyphicon glyphicon-chevron-right'></span></span></a>";
		cnt++;
	});
	if (list == '') {
		$('#resultList').html("<a class='list-group-item'>Không có kết quả nào phù hợp.<br>Hãy thử lại với các điều kiện khác :)</a>");
	} else {
		$('#resultList').html(list);
	}
}

/* Thêm kết quả chi tiết vào danh sách liên kết bên tay phải */
function addListDetailResult(data) {
	var list = '';
	var cnt = 0;
	var result = $('#search-result-card');
	//result.empty();
	$.each(data, function(i, item){
		cnt++;
		var nhaTro = document.createElement('div');
		$(nhaTro).addClass('col-sm-6 col-md-4 card');
		$(nhaTro).attr('id', 'nt' + cnt);
		/* Create new thumbnail */
		var thongTinNhaTro = document.createElement('div');
		$(thongTinNhaTro).addClass('thumbnail');
		var thongTinChiTiet = document.createElement('div');
		$(thongTinNhaTro).append(
				"<div class='caption card-header'>"
				+"<h3>" + item.diaChi + "</h3>"
				+"<p><span class='glyphicon glyphicon-tag'></span><strong>&nbsp;&nbsp;" + tachTien(item.minGia) + " VND</strong></p>"
				+"<p style='color: #555'>"
				+"<span class='pull-left'>"
				+"<span class='glyphicon glyphicon-earphone'></span>&nbsp;&nbsp;" + item.soDt
				+"</span>"
				+"<span class='pull-right'>"
				+(item.email != null ? "<span class='glyphicon glyphicon-envelope'></span>&nbsp;&nbsp;" + item.email : "")
				+"</span>"
				+"</p>"
				+"<div class='clearfix'></div>"
				+"</div>"
		);
		var listLoaiPhong = "<p>Lỗi xảy ra do mất kết nối với cơ sở dữ liệu! Vui lòng nhấn F5 để thử lại!</p>";
		$.ajax({
			type : 'get',
			url : 'loadDanhSachLoaiPhong',
			data : 'nhaTroId=' + item.nhatroId,
			success : function(data) {
				listLoaiPhong = "<table class='table table-hover table-stripped'><thead><tr><th>Diện tích</th><th>Số người</th><th>Giá</th><th>Số phòng</th></tr></thead>";
				listLoaiPhong += "<tbody class='listPhong'>";
				$each(data, function(i, item){
					listLoaiPhong += "<tr>";
					listLoaiPhong += "<td>" + item.dientich + "</td>";
					listLoaiPhong += "<td>" + item.songuoi + "</td>";
					listLoaiPhong += "<td>" + item.gia + "</td>";
					listLoaiPhong += "<td>" + item.soluong + "</td>";
					listLoaiPhong += "</tr>";
				});
				listLoaiPhong +="</tbody></table>";
			},
			error : function() {
				listLoaiPhong = "<p>Lỗi xảy ra do mất kết nối với cơ sở dữ liệu! Vui lòng nhấn F5 để thử lại!</p>";
			}
		});
		$(thongTinNhaTro).append(
				"<div class='caption'>"
				+(item.moTa != null ? "<p>" + item.moTa + "</p>" : "")
				+listLoaiPhong
				+"<a class='btn btn-sm " + (item.isLike == true ? "btn-danger" : "btn-default") + "' role='button'><span class='glyphicon glyphicon-heart'></span> " + item.luotThich + "</a>"
				+"<a class='btn btn-link' role='button'>" + item.luotBinhLuan + " bình luận</a>"
				+"<div class='clearfix'></div>"
				+"</div>"
		);
		$(nhaTro).append($(thongTinNhaTro));
		result.append($(nhaTro));
	});
}

/* Them marker len ban do*/
function addMarkers(data) {
	var cnt = 0;
	var sumLat = 0;
	var sumLng = 0;
	$.each(data , function(i, item) {
			cnt++;
			var point = new google.maps.LatLng(item.x, item.y);
			sumLat += item.x;
			sumLng += item.y;
			var marker = new google.maps.Marker({
				position : point,
				map : map,
				icon: image
			});
			var nhatroInfo = "";
			if (infowindow) {
		        infowindow.close();
		    }
			infowindow = new google.maps.InfoWindow({
				content : "Đang tải dữ liệu ..."
			});
			google.maps.event.addListener(marker,'click', function() {
				infowindow.open(map, marker);
				$.ajax({
					type : 'GET',
					url : 'loadMotel',
					data : "id=" + item.nhatroId,
					success : function(data) {
						var content = "";
						content += "<div style='min-width: 250px;'>";
						content += "<div class='title'>";
						content += data.diaChi;
						content += "<span class='pull-right' style='color: #39B568;'>";
						content += "<small style='color:#999;'>từ </small>" + tachTien(data.minGia) + " VND";
						content += "</span>";
						content += "</div>";
						
						content += "<div class='contact'>";
						content += "<div class='phone'> <span class='glyphicon glyphicon-earphone'></span> ";
						content += data.soDt;
						content += "</div>";
						if (data.email != null) {
							content += "<div class='email'> <span class='glyphicon glyphicon-envelope'></span> ";
							content += data.email;
							content += "</div>";
						}
						content += "</div>";
						content += "<div class='more'>";
						content += "<span class='pull-left'>";
						content += data.luotThich + " thích   " + data.luotBinhLuan + " bình luận";
						content += "</span>";
						content += "<a class='pull-right' href='javascript:showDetail(" + cnt + ")'>Xem chi tiết</a>";
						content += "<div class='clearfix'></div>";
						content += "</div>";
						content += "</div>";
						infowindow.setContent(content);
					},
					error : function() {
						infowindow.setContent("Lỗi xảy ra khi truy xuất cơ sở dữ liệu");
					}
				});
			});
			markers.push(marker);
	});
	if (cnt != 0) {
		sumLat /= cnt;
		sumLng /= cnt;
		map.panTo(new google.maps.LatLng(sumLat, sumLng));
	} else {
		map.panTo(defaultPosition);
	}
}

/* Bật infowindow khi click vào các link trong dánh sách kết quả bên tay trái */
function openInfoWindow(id){
	map.panTo(markers[id].getPosition()); // setCenter to marker
    google.maps.event.trigger(markers[id], 'click');
}

google.maps.event.addDomListener(window, 'load', initialize);

/* Tach tien thanh nhung dau phay cho dễ đọc */
function tachTien(input) {
	var result = "";
	input = input + "";
	var cnt = 0;
	for (var i = input.length - 1; i >= 0; i--) {
		result = input.charAt(i) + result;
		cnt ++;
		if (cnt % 3 == 0 && i > 0) {
			result = "," + result;
		}
	}
	return result;
}

/* Khoi tao slider cho Muc gia va Dien tich */
$(function() {
	$( "#slider-mucgia" ).slider({
		range: true,
		min: 0,
		max: 5000000,
		step: 500000,
		values: [ 0, 5000000 ],
		slide: function( event, ui ) {
			$( "#mucgia" ).html(tachTien(ui.values[ 0 ]) + " - " + tachTien(ui.values[ 1 ]) + " VND");
			$("#mucgia-min").val(ui.values[ 0 ]);
			$("#mucgia-max").val(ui.values[ 1 ]);
		}
	});
	$( "#mucgia" ).html(tachTien($( "#slider-mucgia" ).slider( "values", 0 )) +
		" - " + tachTien($( "#slider-mucgia" ).slider( "values", 1 )) + " VND");
	$("#mucgia-min").val($( "#slider-mucgia" ).slider( "values", 0 ));
	$("#mucgia-max").val($( "#slider-mucgia" ).slider( "values", 1 ));
	
	$( "#slider-dientich" ).slider({
		range: true,
		min: 5,
		max: 60,
		step: 5,
		values: [ 5 , 60 ],
		slide: function( event, ui ) {
			$( "#dientich" ).html( ui.values[ 0 ] + " m<sup>2</sup> - " + ui.values[ 1 ] + " m<sup>2</sup>");
			$("#dientich-min").val(ui.values[ 0 ]);
			$("#dientich-max").val(ui.values[ 1 ]);
		}
	});
	$( "#dientich" ).html( $( "#slider-dientich" ).slider( "values", 0 ) +
		" m<sup>2</sup> - " + $( "#slider-dientich" ).slider( "values", 1 ) + " m<sup>2</sup>");
	$("#dientich-min").val($( "#slider-dientich" ).slider( "values", 0 ));
	$("#dientich-max").val($( "#slider-dientich" ).slider( "values", 1 ));
});

function slideSearch() {
	$('#criteria').slideToggle(100);
}

$(function(){
	$('input[name=show-type]').change(function(){
		if (this.value == 2){
			$("#search-result-card").fadeIn();
		} else {
			$("#search-result-card").fadeOut();
		}
	});
	$("#loai-nhatro .list-group-item").each(function(){
		$(this).click(function(){
			var input = $(this).find("input");
			input.prop("checked", true);
		});
	});
});