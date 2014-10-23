<meta charset="utf-8">
<meta name="_csrf" content="${_csrf.token}" />

<!-- default header name is X-CSRF-TOKEN -->
<meta name="_csrf_header" content="${_csrf.headerName}" />



<link rel="shortcut icon" href="<c:url value="/resources/images/favicon.png" />" >

<!-- Bootstrap CSS -->
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet" media="screen">
<!-- Nhatro CSS -->
<link href="<c:url value="/resources/css/nhatro.css" />" rel="stylesheet" media="screen">

<!-- jQuery -->
<script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>

<!-- Bootstrap JavaScript -->
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>

<!-- Init variables for JS -->
<script src="<c:url value="/resources/js/variables.js" />"></script>

<!-- Include crsf token for all ajax request -->

<script type="text/javascript">
	$(function() {
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(header, token);
		});
	});
</script>

<script>
	/* Init icon for marker */
	var image = {
		url : '<c:url value="/resources/images/marker-icon.png" />',
	};
	/* Init center query marker */
	var centerMarker = new google.maps.MarkerImage('<c:url value="/resources/images/center-marker-icon.png" />',
                new google.maps.Size(67, 67),
                new google.maps.Point(0, 0),
                new google.maps.Point(33, 33));
</script>