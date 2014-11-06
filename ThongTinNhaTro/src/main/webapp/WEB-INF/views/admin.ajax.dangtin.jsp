<%@ page language="java" pageEncoding="utf8" contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Danh sach dang tin ngay hom nay -->
<div class="panel panel-info">
	<div class="panel-heading">
		<h3 class="panel-title">Hôm nay</h3>
	</div>
	<div class="list-group">
		<c:if test="${empty resultToday}">
			<p style="margin-left: 10px;">Không có yêu cầu nào.</p>
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
					<button type="button" class="btn btn-link" onclick="document.location ='/nhatro/admin/quanlydangtin/dongy/id=${list.nhatroid}'">
						<span class="glyphicon glyphicon-ok"></span>
					</button>

					<button type="button" class="btn btn-link" onclick="document.location ='/nhatro/admin/quanlydangtin/khongdongy/id=${list.nhatroid}'">
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
		<h3 class="panel-title">Hôm qua</h3>
	</div>

	<div class="list-group">
		<c:if test="${empty resultYesterday}">
			<p style="margin-left: 10px;">Không có yêu cầu nào.</p>
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
					<button type="button" class="btn btn-link" onclick="document.location ='/nhatro/admin/quanlydangtin/dongy/id=${list.nhatroid}'">
						<span class="glyphicon glyphicon-ok"></span>
					</button>

					<button type="button" class="btn btn-link" onclick="document.location ='/nhatro/admin/quanlydangtin/khongdongy/id=${list.nhatroid}'">
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
		<h3 class="panel-title">Ngày khác</h3>
	</div>

	<div class="list-group">
		<c:if test="${empty resultOver}">
			<p style="margin-left: 10px;">Không có yêu cầu nào.</p>
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
					<button type="button" class="btn btn-link" onclick="document.location ='/nhatro/admin/quanlydangtin/dongy/id=${list.nhatroid}'">
						<span class="glyphicon glyphicon-ok"></span>
					</button>

					<button type="button" class="btn btn-link" onclick="document.location ='/nhatro/admin/quanlydangtin/khongdongy/id=${list.nhatroid}'">
						<span class="glyphicon glyphicon-remove"></span>
					</button>
			</span>
			</a>
		</c:forEach>
	</div>
</div>
<!-- Ket thuc danh sach dang tin cac ngay khac -->