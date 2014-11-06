<%@ page language="java" pageEncoding="utf8"
	contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="panel panel-info">
	<div class="panel-heading">
		<h3 class="panel-title">Các thành viên</h3>
	</div>

	<div class="list-group">
		<c:if test="${empty lists}">
			<p style="margin-left: 10px;">Không có thành viên nào.</p>
		</c:if>
		<c:forEach var="list" items="${lists}">
			<a href="javascript: showDetailTV('${list.username}')" class="list-group-item" style="clear: both;">
				<div class="list-group-item-content pull-left">
					<div class="item-address">
						<strong>${list.username}</strong><br> ${list.email} <br>
					</div>

				</div> 
				<!-- <span class="btn-group btn-group-context">
					

					<button type="button" class="btn btn-link">
						<span class="glyphicon glyphicon-remove"></span>
					</button>
			</span> -->
			</a>
		</c:forEach>
	</div>
</div>
<!-- End panel-info -->