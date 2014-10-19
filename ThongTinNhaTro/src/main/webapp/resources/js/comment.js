function loadComments(nhatroId) {
	var listComments = "";
	$.ajax({
		type : 'get',
		url : 'loadComments',
		async: false,
		data : 'nhaTroId=' + nhatroId,
		success : function(data) {
			var cnt = 0;
			listComments = "";
			$.each(data, function(i, item){
				cnt ++;
				listComments += "<li class='list-group-item'>";
				listComments += "<div class='comment'><span class='img-circle avatar'>" + item.userName.charAt(0).toUpperCase() +"</span>"; 
				listComments += "<h5 class='user'><strong>" + item.userName + " </strong> <small>" + item.dateComment + "</small></h5>";
				listComments += "<p>" + item.comment + "</p>";
				listComments += "</div><div class='clearfix'></div></li>";
			});
			listComments += "<li class='list-group-item'><div class='comment'>";
			listComments += "<span class='img-circle avatar'>" + "D" + "</span>";
			listComments += "<p><textarea class='form-control' id='comment" + nhatroId + "' placeholder='Viết bình luận ...' onkeypress='onTestChange(" + nhatroId + ");'></textarea></p>";
			listComments += "</div><div class='clearfix'></div></li>";
			$('#nt' + nhatroId + ' .btn-comment').html(cnt + " bình luận");
		},
		error : function() {
			listComments = "<li class='list-group-item'>Lỗi xảy ra do mất kết nối với cơ sở dữ liệu! Vui lòng nhấn F5 để thử lại!</li>";
		}
	});
	return listComments;
}


function showComment(nhatroId) {
	
	$('#nt' + nhatroId + ' .list-comments').slideToggle(200);
}

function onTestChange(nhatroId) {
	var key = window.event.keyCode;

	// If the user has pressed enter
	if (key == 13) {
		$.ajax({
			type: 'post',
			url: "nhatro/" + nhatroId + "/comment",
			data: 'comment=' + $('#comment' + nhatroId).val(),
			success: function() {
				$('#nt' + nhatroId + ' .list-comments').fadeOut();
				$('#nt' + nhatroId + ' .list-comments').html(loadComments(nhatroId));
				$('#nt' + nhatroId + ' .list-comments').fadeIn();
			},
			error: function() {
				$('#nt' + nhatroId + ' .list-comments').html("<li class='list-group-item'>Lỗi xảy ra do mất kết nối với cơ sở dữ liệu! Vui lòng nhấn F5 để thử lại!</li>");
			}
		});
		return false;
	} else {
		return true;
	}
}