<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>
<%
	String name ="";
	String passwd = "";
	String email = "";
	if (request.getParameter("usename") != null) {
		name = request.getParameter("usename");
	}
	if (request.getParameter("password") != null) {
		passwd = request.getParameter("password");
	}
	if (request.getParameter("email") != null) {
		email = request.getParameter("email");
	}
%>
用户名 <%=name %>
<hr>
 密码<%=passwd %>
 <hr>
 电子邮箱<%=email %>
</body>
</html>