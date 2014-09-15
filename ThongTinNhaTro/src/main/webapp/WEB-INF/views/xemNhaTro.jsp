<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<!-- Bootstrap CSS -->
<link href="<c:url value="/resources/css/bootstrap.css" />"
	rel="stylesheet" media="screen">
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet"
	media="screen">
<!-- jQuery -->
<script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
<script src="<c:url value="/resources/js/jquery.autosize.min.js" />"></script>
<script>
	$(document).ready(function() {
		$('#comment').autosize();
	});
</script>
</head>
<body>
<body style="padding-top: 70px;">
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-ex1-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Title</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">Link</a></li>
				<li><a href="#">Link</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">Link</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Dropdown <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li><a href="#">Separated link</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</nav>
	<div class="container">
		<div class="col-xs-7 col-sm-7 col-md-7 col-lg-7 card">
			<div class="card-heading row">
				<span class="title">${nhatro.diachi }</span> <span class="money">${gia == 0.0 ? '': gia }
					<span class="donvi">${gia == 0 ? 'Giá chưa cập nhật' : 'VND' }</span>
				</span>
			</div>

			<div class="row" style="background: #ECF4F9;">
				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
					<span class="btn btn-info"><span
						class="glyphicon glyphicon-earphone"></span></span> <span class="contact">${nhatro.sdt }</span>
				</div>
				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
					<span class="btn btn-info"><span
						class="glyphicon glyphicon-envelope"></span></span> <span class="contact">${nhatro.email }</span>
				</div>
				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
					<a href="${nhatro.nhatroid }/like"
						class="btn btn-${isLike == true ? 'danger': 'default' } pull-right">
						<strong>${numberOfLikes }</strong> Like
					</a>
				</div>
			</div>
			<div class="row" style="background: #f7f7f7;">
				<div id="carousel-id" class="carousel slide" data-ride="carousel">
					<ol class="carousel-indicators">
						<c:forEach var="hinh" items='${hinhs }' varStatus="status">
							<li data-target="#carousel-id" data-slide-to="status"
								class="${status.first ? 'active': '' }"></li>
						</c:forEach>
						<li data-target="#carousel-id" data-slide-to="0" class="active"></li>
					</ol>
					<div class="carousel-inner">
						<c:forEach var="hinh" items='${hinhs }' varStatus="status">
							<div class="item ${status.first ? 'active': '' }">
								<img alt="First slide"
									src="<c:url value="/images/${hinh.duongdan }" />"
									class="img-responsive">
							</div>
						</c:forEach>
					</div>
					<a class="left carousel-control" href="#carousel-id"
						data-slide="prev"><span
						class="glyphicon glyphicon-chevron-left"></span></a> <a
						class="right carousel-control" href="#carousel-id"
						data-slide="next"><span
						class="glyphicon glyphicon-chevron-right"></span></a>
				</div>
				<!--End casoruel-->
				<span class="description">${nhatro.motanhatro }</span>

			</div>
			<div class="row">
				<div class="title">Phòng</div>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Diện tích</th>
							<th>Số người</th>
							<th>Đơn giá</th>
							<th>Số lượng</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="loaiphong" items="${loaiPhongs }">
							<tr>
								<td>${loaiphong.dientich }</td>
								<td>${loaiphong.songuoi }</td>
								<td>${loaiphong.gia }</td>
								<td>${loaiphong.soluong }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 card"
			style="margin-left: 10px;">
			<div class="card-heading row">
				<div class="title" style="font-size: 21px;">Bình luận</div>
			</div>
			<div class="row">
				<div class="comment-list">
					<c:forEach var="comment" items="${comments }">
						<div class="comment">
							<div class="avatar">D</div>
							<div class="name">
								<div class="username">${comment.user.username }</div>
								<div class="timestamp">${comment.datecomment }</div>
							</div>
							<div class="content">${comment.comment }</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="row">
				<form action="${nhatro.nhatroid }/comment" method="POST"
					id="addComment" accept-charset="UTF-8">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<textarea class="comment-input"
						placeholder="Viết bình luận ... Nhấn enter để gửi" id="comment"
						name="comment" onkeypress="onTestChange();"></textarea>
					<script>
						function onTestChange() {
							var key = window.event.keyCode;

							// If the user has pressed enter
							if (key == 13) {
								$("#addComment").submit();
								return false;
							} else {
								return true;
							}
						}
					</script>
				</form>
			</div>

		</div>
	</div>
</body>
<!-- Bootstrap JavaScript -->
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
</body>
</html>