function postLike(nhatroId) {
	$('#nt' + nhatroId + ' .btn-like').toggleClass("btn-danger");
	$.ajax({
		type: 'post',
		url: "nhatro/" + nhatroId + "/like",
		success: function(data) {
			$('#nt' + nhatroId + ' .number-likes').html(" " + data);
		},
		error: function() {
			alert("Lỗi xảy ra khi truy xuất cơ sở dữ liệu. Nhấn F5 để tải lại trang !");
		}
	});
}