<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.net.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
	String usename = "";
	String password = "";
	Cookie[] cookies = request.getCookies();
	if (cookies != null && cookies.length > 0) {
		for (Cookie c : cookies) {
			if (c.getName().equals("usename")) {
				usename = URLDecoder.decode(c.getValue(),"utf-8");
			}
			if (c.getName().equals("password")) {
				password = URLDecoder.decode(c.getValue(),"utf-8");
			}
		}
	}
%>
用户名:<%=usename %>
密码<%=password %>
</body>
</html>