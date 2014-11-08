/* Khoi tao Map */
var map;
var markers = [];
var resultMotels = [];
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
		map.panTo(event.latLng);
	});
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
			$('#search-result-card').empty();
			resultMotels = data;
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
	/* Reset map */
	map.setZoom(15);
	map.panTo(defaultPosition);
}

/* Thêm kết quả vào danh sách liên kết bên tay trái */
function addListResult(data) {
	var list = '';
	var cnt = 0;
	$.each(data, function(i, item){
		cnt++;
		list += "<a onclick='javascript:showDetail(" + item.nhatroId + "," + cnt + ")' class='list-group-item'>" + item.diaChi + "<span class='showDetail btn-link pull-right'>Xem chi tiết <span class='glyphicon glyphicon-chevron-right'></span></span></a>";
	});
	$('#soLuongNhaTro').html(cnt + " nhà trọ");
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
	result.empty();
	$.each(data, function(i, item){
		cnt++;
		$.ajax({
			type: 'get',
			url: 'loadMotel',
			data : 'nhatroid=' + item.nhatroId,
			async: false,
			success: function(data) {
				result.append(data);
			},
			error: function() {
				result.append("<p>Lỗi xảy ra do mất kết nối với cơ sở dữ liệu! Vui lòng nhấn F5 để thử lại!</p>");
			}
		});
	});
	cnt = 0;
	$('.card').each(function(){
		if (cnt % 3 == 0) {
			var parent = $(this).parent();
			$(parent).addClass('clearfix');
		}
		cnt++;
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
				map.panTo(point);
				infowindow.open(map, marker);
				$.ajax({
					type : 'GET',
					url : 'loadMotelInfowindow',
					data : "nhatroid=" + item.nhatroId,
					success : function(data) {
						infowindow.setContent(data);
					},
					error : function() {
						infowindow.setContent(strError);
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

function showDetail(nhatroid, thutu) {
	openInfowindow(thutu);
	scrollResult(nhatroid);
}

/* Bật infowindow khi click vào các link trong dánh sách kết quả bên tay trái */
function openInfowindow(thutu){
	map.panTo(markers[thutu].getPosition()); // setCenter to marker
    google.maps.event.trigger(markers[thutu], 'click');
}

/* Chuyển sang chế độ hiển thị theo card roi scroll toi card nt + nhatroid*/
function switchAndScrollResult(nhatroid) {
	$("#resultCardType").trigger('click');
	scrollResult(nhatroid);
}

/* Scroll toi vi tri card co id la nh + nhatro id */
function scrollResult(nhatroid) {
	$('html,body').animate({
        scrollTop: $("#nt"+nhatroid).offset().top},
        'slow');
	if ($( "#nt" + nhatroid + " .card").hasClass('highlight')){
		$( "#nt" + nhatroid + " .card").removeClass('highlight');
	}
	$( "#nt" + nhatroid + " .card").addClass('highlight');
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