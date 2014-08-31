<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<!-- Bootstrap CSS -->
<link href="<c:url value="/resources/css/bootstrap.css" />"
	rel="stylesheet" media="screen">
<style type="text/css">
html {
	height: 100%
}

body {
	height: 100%;
	margin: 0;
	padding: 0;
	padding-top: 50px;
}

#map-canvas {
	height: 100%
}
</style>
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBRijrqPbCijmQLQydo5VA183mOowbr67w">
	
</script>
<script type="text/javascript">
	function initialize() {
		var mapOptions = {
			center : new google.maps.LatLng(0, 0),
			zoom : 1,
			disableDefaultUI: true
		};
		var map = new google.maps.Map(document.getElementById("map-canvas"),
				mapOptions);
	}

	google.maps.event.addDomListener(window, 'load', initialize);
</script>
</head>
<body>
	<div class="row">
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<a class="navbar-brand" href="#">Nhà trọ cần thơ</a>
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">Home</a></li>
				<li><a href="#">Link</a></li>
			</ul>
		</nav>
	</div>
	<div id="map-canvas"></div>
	<!-- jQuery -->
	<script src="/fpt/resources/js/jquery-1.11.1.min.js"></script>
	<!-- Bootstrap JavaScript -->
	<script src="/fpt/resources/js/bootstrap.min.js"></script>
</body>
</html>