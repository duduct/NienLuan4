$(function() {
	$("[data-trigger='login']").each(function() {
		$(this).click(function(e) {
			e.stopPropagation();
			triggerLogin();
		});
	});
});

function triggerLogin() {
	$('#loginLink').trigger("click");
	$('#showLoginToPostMotel').centerFixed();
	$('#showLoginToPostMotel').fadeIn(100).delay(5000).fadeOut(1000);
	$('#menuLoginForm #username').focus();
}