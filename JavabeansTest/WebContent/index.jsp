<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page  language="java" import="com.test.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Javabeans jb = new Javabeans();
		jb.setName("jack");
		jb.setPasswd("123456");
	%>
	用户名:<%=jb.getName()%>
	密码:<%=jb.getPasswd()%>
</body>
</html>