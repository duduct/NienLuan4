$("[data-trigger='login']").each(function(){
	$(this).click(function(e) {
		e.stopPropagation();
		triggerLogin();
	});
});

function triggerLogin() {
	$('#loginLink').trigger("click");
	$('#showLoginToPostMotel').centerFixed();
	$('#showLoginToPostMotel').fadeIn(100).delay(5000).fadeOut(1000);
	$('#menuLoginForm #username').focus();
}

function showComment(nhatroId) {
	if ($('#nt' + nhatroId + ' .list-comments').css('display') == 'none') {
		loadComments(nhatroId);
		$('#nt' + nhatroId + ' .list-comments').slideDown(200);
	} else {
		$('#nt' + nhatroId + ' .list-comments').slideUp(200);
	}
}

function loadComments(nhatroId) {
	$('#nt' + nhatroId + ' .list-comments').fadeOut();
	$.ajax({
		type: 'get',
		url: 'loadComments',
		data: 'nhatroid=' + nhatroId,
		async: false,
		success: function(data) {
			$('#nt' + nhatroId + ' .list-comments').html(data);
		},
		error: function() {
			$('#nt' + nhatroId + ' .list-comments').html("<p>" + strError + "</p>");
		}
	});
	$('#nt' + nhatroId + ' .list-comments').fadeIn();
}

function onTestChange(nhatroId) {
	var key = window.event.keyCode;
	// If the user has pressed enter
	if (key == 13) {
		$.ajax({
			type: 'post',
			url: "nhatro/" + nhatroId + "/comment",
			data: "comment=" + $('#comment' + nhatroId).val(),
			async: false,
			success: function(data) {
				loadComments(nhatroId);
			},
			error: function() {
				alert(strError);
			}
		});		
		return false;
	} else {
		return true;
	}
}