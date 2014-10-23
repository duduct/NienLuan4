<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="col-sm-6 col-md-4" id="nt${nhatro.nhatroid }">
	<div class='card'>
		<div class="thumbnail">
			<div class="caption card-header">
				<h3>${nhatro.diachi }</h3>
				<p>
					<span class="glyphicon glyphicon-tag"></span><strong>&nbsp;&nbsp;${gia } VND</strong>
				</p>
				<p style="color: #555">
					<span class="pull-left"><span class="glyphicon glyphicon-earphone"></span>&nbsp;&nbsp;${nhatro.sdt }</span>
					<c:if test="${not empty nhatro.email }">
						<span class="pull-right"><span class="glyphicon glyphicon-envelope"></span>&nbsp;&nbsp;${nhatro.email }</span>
					</c:if>
				</p>
				<div class="clearfix"></div>
			</div>
			<div class="caption">
				<c:if test="${not empty nhatro.motanhatro }">
					<p>${nhatro.motanhatro }</p>
				</c:if>				
				<table class="table table-hover table-stripped">
					<thead>
						<tr>
							<th>Diện tích</th>
							<th>Số người</th>
							<th>Giá</th>
							<th>Số phòng</th>
						</tr>
					</thead>
					<tbody class="listPhong">
						<c:forEach var="loaiphong" items="${nhatro.loaiphongs }">
							<tr>
								<td>${loaiphong.dientich }</td>
								<td>${loaiphong.songuoi }</td>
								<td>${loaiphong.gia }</td>
								<td>${loaiphong.soluong }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<sec:authorize access="isAnonymous()">
					<a class="btn btn-sm btn-like btn-default" role="button" data-trigger="login">
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					
					<a class="btn btn-sm btn-like btn-default ${isLike == true ? 'btn-danger' : ''}" role="button" onclick="javascript:postLike(${nhatro.nhatroid})">
				</sec:authorize>
					<span class="glyphicon glyphicon-heart"></span>
					<span class="number-likes">${fn:length(nhatro.thiches) }</span>
				</a>
				<a class="btn btn-sm btn-link btn-comment" role="button"
					onclick="javascript:showComment(${nhatro.nhatroid})">${fn:length(nhatro.comments) } bình luận</a>
				<div class="clearfix"></div>
			</div>
		</div>
		<ul class="list-group list-comments" style="display: none;">
		</ul>
	</div> <!-- End card -->
</div>