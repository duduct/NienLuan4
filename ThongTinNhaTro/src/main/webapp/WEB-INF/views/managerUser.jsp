<%@ page contentType="text/html; charset=UTF-8"%>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Quản lý thành viên</title>
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
		function searchThanhVien(value){
			$("#hrefSearch").attr("href", "/nhatro/admin/quanlydangtin/searchthanhvien/nd="+value);
		}
</script>


</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
			  	
			    <!-- Brand and toggle get grouped for better mobile display -->
				    <div class="navbar-header col-md-12" >
					<ul style="list-style: none;">
						<li><a class="navbar-brand" href="home">Trang chủ</a></li>
						<li style="margin-top: 15px;" class="pull-right"><a href="#"><span class="glyphicon glyphicon-user pull-right" ></span>
							Đăng nhập</a>
						</li>
					</ul>
				</div><!-- End navbar-header  -->
				
			</nav>
		</div>
		<div class="col-md-12">
			<div class="panel panel-primary">
 				 <div class="panel-heading" style="height: 54px;">
					<div class="col-md-3">
					<h3 class="panel-title" style="margin-top: 10px;">Quản lý thành viên</h3>
					</div>
					<form class="form-inline pull-right" role="search">
						<div class="form-group">
							<input type="text" id="searchTV" name="searchTV" onkeyup="searchThanhVien(this.value)" class="form-control" placeholder="Search">
						</div>
							<a href="" id="hrefSearch" class="btn btn-default"><span id="search" class="glyphicon glyphicon-search"></span></a>
					</form>
				</div>
					
 				 <p class="text-center">${showNull}</p>
 				 <p class="text-center">${searchNull}</p>
 				 
 				 <table class="table table-hover">
 				 	<tr>
	   					<td class="text-center">Tài khoản</td>
	   					<td class="text-center">Phân quyền</td>
	   					<td class="text-center">Email</td>
	   					<td class="text-center">Tùy chọn</td>
	   				</tr>
	   				
		   			<c:forEach var="list" items="${listUser}">
		   				
			    		<tr>
					      	<td class="text-center">${list.username}</td>
					        <td class="text-center">${list.userroles}</td>
					        <td class="text-center">${list.email}</td>
					        <td class="text-center">
					        	<a href="<c:url value='quanlythanhvien/xoa/user=${list.username}' />">
												<button type="button" class="btn btn-default">Xóa</button></a> 
					        </td>
						 </tr>
   				 	</c:forEach>
   				 	
   				 	<c:forEach var="list" items="${lists}">
		   				
			    		<tr>
					      	<td class="text-center">${list.username}</td>
					      	<td class="text-center">${list.userroles}</td>
					        <td class="text-center">${list.email}</td>
					       	<td class="text-center">
					        	<a href="<c:url value='quanlythanhvien/xoa/user=${list.username}' />">
												<button type="button" class="btn btn-default">Xóa</button></a> 
					        </td>
						 </tr>
   				 	</c:forEach>
 				 </table>
			</div>
		</div>
	</div>
</body>
</html>