<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Quản lý yêu cầu đăng tin</title>
<link href="<c:url value="/resources/css/bootstrap.css" />"
	rel="stylesheet" media="screen">
<link href="<c:url value="/resources/js/jquery-1.11.1.min.js" />">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<style type="text/css">
body {
	padding-top: 70px;
}
</style>

<script type="text/javascript">
		function searchYeuCau(value){
			$("#hrefSearch").attr("href", "/nhatro/admin/quanlydangtin/searchyeucau/nd="+value);
		}
</script>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<nav class="navbar navbar-default navbar-fixed-top " role="navigation">
			
				<div class="navbar-header col-md-12" >
					<ul style="list-style: none;">
						<li><a class="navbar-brand" href="home">Trang chủ</a></li>
						<li style="margin-top: 15px;" class="pull-right"><a href="#"><span class="glyphicon glyphicon-user pull-right" ></span>
							Đăng nhập</a>
						</li>
					</ul>
				</div>
				<!-- End class navbar-header -->
			 </nav>
			<!-- End class navbar -->
		</div>
		

		<div class="col-md-12">
			<div class="panel panel-primary modify">
				<div class="panel-heading" style="height: 54px;">
					<div class="col-md-3">
					<h3 class="panel-title" style="margin-top: 10px;">Quản lý yêu cầu đăng tin</h3>
					</div>
					<form class="form-inline pull-right" role="search">
						<div class="form-group">
							<input type="text" id="searchYC" name="searchYC" onblur="searchYeuCau(this.value)" class="form-control" placeholder="Search">
						</div>
							<a href="" id="hrefSearch" class="btn btn-default"><span id="search" class="glyphicon glyphicon-search"></span></a>
					</form>
				</div>
				
				<div class="panel-body">
							<!-- khi khong co yeu cau dang tin va search ket qua khong co -->
							<p class="text-center">${searchNull}</p>
							<p class="text-center">${showNull}</p>
							
							<!-- danh sach cac yeu cau dang tin cua thanh vien -->
							<table class="table table-hover">
								<tr>
									<td class="text-center">Thành viên</td>
									<td class="text-center">Ngày yêu cầu</td>
									<td class="text-center">Địa chỉ</td>
									<td class="text-center">Số điện thoại</td>
									<td class="text-center">Tên loại</td>
									<td class="text-center">Tùy chọn</td>
								</tr>
									
									
									<c:forEach var="list" items="${lists}">
											
										<tr>
											<td class="text-center">${list[0]}</td>
											<td class="text-center">${list[1]}</td>
											<td class="text-center">${list[2]}</td>
											<td class="text-center">${list[3]}</td>
											<td class="text-center">${list[4]}</td>
											<td class="text-center">
												<a href="quanlydangtin/dongy/id=${list[5]}" class="btn btn-default">
													Đồng ý
												</a> 
												<a href="quanlydangtin/khongdongy/id=${list[5]}" class="btn btn-default">
													Không đồng ý
												</a>
											</td>
										</tr>
									</c:forEach>
								
									<c:forEach var="list" items="${listUser}">
										<tr>
											<td class="text-center">${list.user.username}</td>
											<td class="text-center">${list.ngayyeucau}</td>
											<td class="text-center">${list.diachi}</td>
											<td class="text-center">${list.sdt}</td>
											<td class="text-center">${list.loai.tenloai}</td>
											<td class="text-center">
												<a href="<c:url value='quanlydangtin/dongy/id=${list.nhatroid}'/>" class="btn btn-default">
													Đồng ý
												</a> 
												<a href="quanlydangtin/khongdongy/id=${list.nhatroid}" class="btn btn-default">
													Không đồng ý
												</a>
											</td>
										</tr>
									</c:forEach>
								</table>
				</div>
				<!-- End class panel-body -->
			</div>
			<!-- End class panel -->
		</div>
		<!-- End class row -->
		</div>
	</div><!-- End class container -->
</body>
</html>