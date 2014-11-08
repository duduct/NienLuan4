<%@ page language="java" pageEncoding="utf8" contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script>
	function deleteYeuCau(yeuCauId) {
		var isDelete = confirm("Bạn có chắc muốn xóa yêu cầu này không ?");
		if (isDelete == true) {
			document.location ='/nhatro/admin/quanlydangtin/khongdongy/id=' + yeuCauId;
			return true;
		} else {
			return false;
		}
	}
	function dongyYeuCau(yeuCauId) {
		var isDongY = confirm("Bạn có chắc muốn xác nhận yêu cầu này không ?");
		if (isDongY == true) {
			document.location ='/nhatro/admin/quanlydangtin/dongy/id=' + yeuCauId;
			return true;
		} else {
			return false;
		}
	}
</script>

<!-- Danh sach dang tin ngay hom nay -->
<div class="panel panel-info">
	<div class="panel-heading">
		<h3 class="panel-title">Hôm nay <span class='pull-right'>${fn:length(resultToday)} yêu cầu</span></h3>
	</div>
	<div class="list-group">
		<c:if test="${empty resultToday}">
		<a class='list-group-item'>Không có yêu cầu nào</a>
		</c:if>
		<c:forEach var="list" items="${resultToday}">
			<a href="javascript: showDetail(${list.nhatroid})" class="list-group-item" style="clear: both">
				<div class="list-group-item-content pull-left">
					<div class="item-address">
						<strong>${list.diachi}</strong><br>
						${list.user.username}, ${list.sdt}<br>
					</div>
					<div class="item-time">${list.ngayyeucau}</div>
				</div>
				<span class="btn-group btn-group-context">
					<button type="button" class="btn btn-link" onclick="dongyYeuCau(${list.nhatroid})">
						<span class="glyphicon glyphicon-ok"></span>
					</button>

					<button type="button" class="btn btn-link" onclick="deleteYeuCau(${list.nhatroid})">
						<span class="glyphicon glyphicon-remove"></span>
					</button>
				</span>
			</a>
		</c:forEach>
	</div>
</div>
<!-- Ket thuc danh sach dang tin ngay hom nay -->

<!-- Danh sach dang tin hom qua -->
<div class="panel panel-info">
	<div class="panel-heading">
		<h3 class="panel-title">Hôm qua <span class='pull-right'>${fn:length(resultYesterday)} yêu cầu</span></h3>
	</div>

	<div class="list-group">
		<c:if test="${empty resultYesterday}">
			<a class='list-group-item' >Không có yêu cầu nào.</a>
		</c:if>
		<c:forEach var="list" items="${resultYesterday}">
			<a href="javascript:showDetail(${list.nhatroid})"
				class="list-group-item" style="clear: both">
				<div class="list-group-item-content pull-left">
					<div class="item-address">
						<strong>${list.diachi}</strong><br>
						${list.user.username}, ${list.sdt}<br>
					</div>
					<div class="item-time">${list.ngayyeucau}</div>
				</div> <span class="btn-group btn-group-context">
					<button type="button" class="btn btn-link" onclick="dongyYeuCau(${list.nhatroid})">
						<span class="glyphicon glyphicon-ok"></span>
					</button>

					<button type="button" class="btn btn-link" onclick="deleteYeuCau(${list.nhatroid})">
						<span class="glyphicon glyphicon-remove"></span>
					</button>
			</span>
			</a>
		</c:forEach>
	</div>
</div>
<!-- Ket thuc danh sach dang tin hom qua -->

<!-- Cac ngay con lai -->
<div class="panel panel-info">
	<div class="panel-heading">
		<h3 class="panel-title">Ngày khác <span class='pull-right'>${fn:length(resultOver)} yêu cầu</span></h3>
	</div>

	<div class="list-group">
		<c:if test="${empty resultOver}">
			<a class='list-group-item' >Không có yêu cầu nào.</a>
		</c:if>
		<c:forEach var="list" items="${resultOver}">
			<a href="javascript: showDetail(${list.nhatroid})"
				class="list-group-item" style="clear: both">

				<div class="list-group-item-content pull-left">
					<div class="item-address">
						<strong>${list.diachi}</strong><br>
						${list.user.username}, ${list.sdt}<br>
					</div>
					<div class="item-time">${list.ngayyeucau}</div>
				</div> <span class="btn-group btn-group-context">
					<button type="button" class="btn btn-link" onclick="dongyYeuCau(${list.nhatroid})">
						<span class="glyphicon glyphicon-ok"></span>
					</button>

					<button type="button" class="btn btn-link" onclick="deleteYeuCau(${list.nhatroid})">
						<span class="glyphicon glyphicon-remove"></span>
					</button>
			</span>
			</a>
		</c:forEach>
	</div>
</div>
<!-- Ket thuc danh sach dang tin cac ngay khac -->