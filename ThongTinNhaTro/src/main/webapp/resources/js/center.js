$.fn.centerFixed = function() {
    var parent = $(this).parent();
	var leftWidth = (parent.width() - $(this).outerWidth()) / 2;
	$(this).css('left', leftWidth);
};