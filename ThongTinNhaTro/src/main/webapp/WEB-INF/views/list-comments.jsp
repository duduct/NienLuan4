<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="<c:url value="/resources/js/comment.js" />"></script>

<!-- Get current user -->
<sec:authentication var="user" property="principal" />

<ul class="list-group list-comments" style="display: none;">
	<c:forEach var='comment' items='${comments }'>
		<li class="list-group-item">
			<div class="comment">
				<span class="img-circle avatar">${fn:substring(comment.user.username, 0, 1) }</span>
				<h5 class="user">
					<strong>${comment.user.username }</strong> <small><fmt:formatDate pattern="H:m:sa yyyy-MM-dd" value="${comment.datecomment }" /></small>
				</h5>
				<p>${comment.comment }</p>
			</div>
		</li>
	</c:forEach>
	<li class='list-group-item'>
		<sec:authorize access="isAuthenticated()">
			<div class='comment'>
				<span class='img-circle avatar'>${fn:substring(user.username, 0, 1) }</span>
				<p>
					<textarea class='form-control'
						id='comment${nhatroid }' placeholder='Viết bình luận ...' onkeypress='onTestChange(${nhatroid });'></textarea>
				</p>
			</div>
		</sec:authorize>
		<sec:authorize access="isAnonymous()">
			<a class="btn btn-link btn-block" data-trigger="login">Đăng nhập để bình luận :)</a>
		</sec:authorize>
		<div class='clearfix'></div>
	</li>
</ul>