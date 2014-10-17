<link rel="shortcut icon" href="<c:url value="/resources/images/favicon.png" />" >

<!-- Bootstrap CSS -->
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet" media="screen">
<!-- Nhatro CSS -->
<link href="<c:url value="/resources/css/nhatro.css" />" rel="stylesheet" media="screen">

<!-- jQuery -->
<script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>

<!-- Bootstrap JavaScript -->
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>

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