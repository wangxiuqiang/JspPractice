<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.test.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="MyUser" class="com.test.Javabeans" scope="request"/>

用户名<jsp:getProperty name="MyUser" property="name"/><br/>
 密码<jsp:getProperty name="MyUser" property="passwd"/>
<br/>
<%-- 用户名 <%=((Javabeans)application.getAttribute("MyUser")).getName() %>
<br/>
密码<%=((Javabeans)application.getAttribute("MyUser")).getPasswd() %>
--%>
<%-- 用户名 <%=((Javabeans)session.getAttribute("MyUser")).getName() %>
<br/>
密码<%=((Javabeans)session.getAttribute("MyUser")).getPasswd() %>
--%>
用户名 <%=((Javabeans)request.getAttribute("MyUser")).getName() %>
<br/>
密码<%=((Javabeans)request.getAttribute("MyUser")).getPasswd() %>
</body>
</html>