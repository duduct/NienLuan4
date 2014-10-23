<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div style='min-width: 250px;'>
	<div class='title'>
		${nhatro.diachi }
		<span class='pull-right' style='color: #39B568;'>
			<small style='color:#999;'>từ </small> ${gia } VND
		</span>
	</div>
	<div class='contact'>
		<div class='phone'> <span class='glyphicon glyphicon-earphone'></span> ${nhatro.sdt } </div>
		<c:if test="${not empty nhatro.email }">
			<div class='email'> <span class='glyphicon glyphicon-envelope'></span> ${nhatro.email }</div> 
		</c:if>
	</div>
	<div class='more'>
		<span class='pull-left'>${fn:length(nhatro.thiches) }  thích   ${fn:length(nhatro.comments) } bình luận </span>
		<a class='pull-right' href='javascript:switchAndScrollResult(${nhatro.nhatroid })'>Xem chi tiết</a>
		<div class='clearfix'></div>
	</div>
</div>