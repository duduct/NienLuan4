<%@ page language="java" pageEncoding="utf8"
	contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
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
			<form action="handling" method="post">

				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
				<div class="card-heading row">
					<span class="title">${nhatro.diachi }</span>
				</div>

				<div class="row" style="background: #ECF4F9;">
					<input type="hidden" name="nhatroid" value="${nhatro.nhatroid }" />
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 form-group">
						<label><span class="btn btn-info"><span
								class="glyphicon glyphicon-earphone"></span></span> Số điện thoại</label> <input
							type="text" name="soDt" class="form-control" id=""
							placeholder="Số điện thoại" value="${nhatro.sdt }">
					</div>
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 form-group">
						<label><span class="btn btn-info"><span
								class="glyphicon glyphicon-envelope"></span></span> Email</label> <input
							type="text" class="form-control" id="" placeholder="Email"
							value="${nhatro.email }" name="email">
					</div>
				</div>
				<div class="row" style="background: #f7f7f7;">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 form-group">
						<div class="form-group">
							<label for="">Loại nhà trọ</label>
							<div class="btn-group" data-toggle="buttons"
								style="display: table; margin: 0 auto;">
								<label
									class="btn btn-primary ${nhatro.loai.loaiid == 1 ? 'active' : '' }">
									<input type="radio" name="loaiid" id="loaiid" value="1"
									${nhatro.loai.loaiid == 1 ? 'checked' : '' }>Nhà trọ
									độc lập
								</label> <label
									class="btn btn-primary ${nhatro.loai.loaiid == 2 ? 'active' : '' }">
									<input type="radio" name="loaiid" id="loaiid" value="2"
									${nhatro.loai.loaiid == 2 ? 'checked' : '' }>Nhà riêng
								</label> <label
									class="btn btn-primary ${nhatro.loai.loaiid == 3 ? 'active' : '' }">
									<input type="radio" name="loaiid" id="loaiid" value="3"
									${nhatro.loai.loaiid == 3 ? 'checked' : '' }>Khu nhà
									trọ
								</label> <label
									class="btn btn-primary ${nhatro.loai.loaiid == 4 ? 'active' : '' }">
									<input type="radio" name="loaiid" id="loaiid" value="4"
									${nhatro.loai.loaiid == 4 ? 'checked' : '' }>Ở cùng chủ
									nhà
								</label>
							</div>
							<div style="clear: both;"></div>
						</div>
					</div>
					<div id="carousel-id" class="carousel slide" data-ride="carousel"
						style="float: left;">
						<ol class="carousel-indicators">
							<li data-target="#carousel-id" data-slide-to="0" class=""></li>
							<li data-target="#carousel-id" data-slide-to="1" class=""></li>
							<li data-target="#carousel-id" data-slide-to="2" class="active"></li>
						</ol>
						<div class="carousel-inner">
							<div class="item">
								<img
									data-src="holder.js/900x500/auto/#777:#7a7a7a/text:First slide"
									alt="First slide"
									src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI5MDAiIGhlaWdodD0iNTAwIj48cmVjdCB3aWR0aD0iOTAwIiBoZWlnaHQ9IjUwMCIgZmlsbD0iIzc3NyI+PC9yZWN0Pjx0ZXh0IHRleHQtYW5jaG9yPSJtaWRkbGUiIHg9IjQ1MCIgeT0iMjUwIiBzdHlsZT0iZmlsbDojN2E3YTdhO2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1zaXplOjU2cHg7Zm9udC1mYW1pbHk6QXJpYWwsSGVsdmV0aWNhLHNhbnMtc2VyaWY7ZG9taW5hbnQtYmFzZWxpbmU6Y2VudHJhbCI+Rmlyc3Qgc2xpZGU8L3RleHQ+PC9zdmc+">
							</div>
							<div class="item">
								<img
									data-src="holder.js/900x500/auto/#666:#6a6a6a/text:Second slide"
									alt="Second slide"
									src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI5MDAiIGhlaWdodD0iNTAwIj48cmVjdCB3aWR0aD0iOTAwIiBoZWlnaHQ9IjUwMCIgZmlsbD0iIzY2NiI+PC9yZWN0Pjx0ZXh0IHRleHQtYW5jaG9yPSJtaWRkbGUiIHg9IjQ1MCIgeT0iMjUwIiBzdHlsZT0iZmlsbDojNmE2YTZhO2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1zaXplOjU2cHg7Zm9udC1mYW1pbHk6QXJpYWwsSGVsdmV0aWNhLHNhbnMtc2VyaWY7ZG9taW5hbnQtYmFzZWxpbmU6Y2VudHJhbCI+U2Vjb25kIHNsaWRlPC90ZXh0Pjwvc3ZnPg==">
							</div>
							<div class="item active">
								<img
									data-src="holder.js/900x500/auto/#555:#5a5a5a/text:Third slide"
									alt="Third slide"
									src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI5MDAiIGhlaWdodD0iNTAwIj48cmVjdCB3aWR0aD0iOTAwIiBoZWlnaHQ9IjUwMCIgZmlsbD0iIzU1NSI+PC9yZWN0Pjx0ZXh0IHRleHQtYW5jaG9yPSJtaWRkbGUiIHg9IjQ1MCIgeT0iMjUwIiBzdHlsZT0iZmlsbDojNWE1YTVhO2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1zaXplOjU2cHg7Zm9udC1mYW1pbHk6QXJpYWwsSGVsdmV0aWNhLHNhbnMtc2VyaWY7ZG9taW5hbnQtYmFzZWxpbmU6Y2VudHJhbCI+VGhpcmQgc2xpZGU8L3RleHQ+PC9zdmc+">
							</div>
						</div>
						<a class="left carousel-control" href="#carousel-id"
							data-slide="prev"><span
							class="glyphicon glyphicon-chevron-left"></span></a> <a
							class="right carousel-control" href="#carousel-id"
							data-slide="next"><span
							class="glyphicon glyphicon-chevron-right"></span></a>
					</div>
					<!--End casoruel-->
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"
						style="margin-top: 10px;">
						<div class="form-group">
							<label>Mô tả</label>
							<textarea class="form-control" id=""
								placeholder="Vài dòng mô tả nhà trọ của bạn ...">${nhatro.motanhatro }</textarea>
						</div>
					</div>

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
						<tbody id="listPhong">
							<c:forEach var="loaiphong" items="${loaiPhongs }"
								varStatus="status">
								<tr>

									<td><input type="hidden"
										name="phongs[${status.index}].loaiphongid"
										value="${loaiphong.loaiphongid }" /> <input type="number"
										name="phongs[${status.index}].dientich"
										id="phongs[0].dientich" class="form-control"
										value="${loaiphong.dientich }" min="0" max="" step=""
										required="required"></td>
									<td><input type="number"
										name="phongs[${status.index}].songuoi" id="phongs[0].songuoi"
										class="form-control" value="${loaiphong.songuoi }" min="0"
										max="" step="" required="required"></td>
									<td><input type="number"
										name="phongs[${status.index}].gia" id="phongs[0].gia"
										class="form-control" value="${loaiphong.gia }" min="5" max=""
										step="100000" required="required"></td>
									<td><input type="number"
										name="phongs[${status.index}].soluong" id="phongs[0].soluong"
										class="form-control" value="${loaiphong.soluong }" min="5"
										max="" step="" required="required"></td>
									<td><a class="btn btn-link remove-button"><span
											class="glyphicon glyphicon-remove"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="form-group">
					<a class="btn btn-link btn-block" onclick="themPhong()">Thêm
						phòng</a>
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-primary btn-block">Lưu
						thay đổi</button>
				</div>
			</form>
		</div>
		<!-- End div 7 -->
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
					id="addComment">
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
<script>
	$(document).ready(function() {
		deleteRow();
	});
	function deleteRow() {
		$(".remove-button").each(function() {
			$(this).click(function() {
				$(this).parent().parent().remove();
				danhSo();
			});
		});
	}

	function danhSo() {
		var count = 0;
		$(".remove-button")
				.each(
						function() {
							var parent = $(this).parent().parent();

							var loaiPhongId = parent
									.children("td:nth-child(1)").children(
											"input:hidden");
							loaiPhongId.attr("name", "phongs[" + count
									+ "].loaiphongid");

							var dienTich = parent.children("td:nth-child(1)")
									.children("input:nth-child(2)");
							dienTich.attr("name", "phongs[" + count
									+ "].dientich");

							var soNguoi = parent.children("td:nth-child(2)")
									.children();
							soNguoi.attr("name", "phongs[" + count
									+ "].songuoi");

							var gia = parent.children("td:nth-child(3)")
									.children();
							gia.attr("name", "phongs[" + count + "].gia");

							var soluong = parent.children("td:nth-child(4)")
									.children();
							soluong.attr("name", "phongs[" + count
									+ "].soluong");
							count++;
						});
	}

	function themPhong() {
		var listPhong = $('#listPhong');
		var tr = "<tr>"
				+ "<td>"
				+ "<input type=\"hidden\" name=\"\" value=\"${loaiphong.loaiphongid }\" />"
				+ "<input type=\"number\" name=\"\" id=\"input\" class=\"form-control\" value=\"\" min=\"{5\"} max=\"\" step=\"\" required=\"required\" title=\"\"></td>"
				+ "<td><input type=\"number\" name=\"\" id=\"input\" class=\"form-control\" value=\"\" min=\"{5\"} max=\"\" step=\"\" required=\"required\" title=\"\"></td>"
				+ "<td><input type=\"number\" name=\"\" id=\"input\" class=\"form-control\" value=\"\" min=\"{5\"} max=\"\" step=\"100000\" required=\"required\" title=\"\"></td>"
				+ "<td><input type=\"number\" name=\"\" id=\"input\" class=\"form-control\" value=\"\" min=\"{5\"} max=\"\" step=\"\" required=\"required\" title=\"\"></td>"
				+ "<td><a class=\"btn btn-link remove-button\"><span class=\"glyphicon glyphicon-remove\"></span></button></td></tr>";
		listPhong.append(tr);
		deleteRow();
		danhSo();
	}
</script>
</body>
</html>