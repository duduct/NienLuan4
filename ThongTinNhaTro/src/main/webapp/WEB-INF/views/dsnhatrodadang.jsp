<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form:form action="/nhatro/thanhvien/dangky" method="POST">
		<label>Username</label><br>
		<input type="text" name="username"/><br>
		<label>Password</label><br>
		<input type="password" name="password"/><br>
		<label>Email</label><br>
		<input type="text" name="email"/><br>
		<input type="submit" value="Dang Ky"/>
	</form:form>
</body>
</html>