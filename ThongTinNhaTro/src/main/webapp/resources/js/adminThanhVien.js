$(function() {
	$("#slider-mucgia").slider({
		range : true,
		min : 0,
		max : 1500000,
		step : 500000,
		values : [ 0, 500000 ],
		slide : function(event, ui) {
			$("#mucgia").val("$" + ui.values[0] + " - $" + ui.values[1]);
		}
	});
	$("#mucgia").val(
			"$" + $("#slider-mucgia").slider("values", 0) + " - $"
					+ $("#slider-mucgia").slider("values", 1));

	$("#slider-dientich").slider({
		range : true,
		min : 0,
		max : 20,
		step : 5,
		values : [ 0, 5 ],
		slide : function(event, ui) {
			$("#dientich").val(ui.values[0] + "m2 - " + ui.values[1] + "m2");
		}
	});
	$("#dientich").val(
			$("#slider-dientich").slider("values", 0) + "m2 - "
					+ $("#slider-dientich").slider("values", 1) + "m2");
});

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