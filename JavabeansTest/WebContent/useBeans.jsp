<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="MyUser" class="com.test.Javabeans" scope="request"/>

<!-- 匹配form和Java类中共同字段的所有值 -->
<jsp:setProperty name="MyUser" property="*"/>

<!--  匹配某个指定的字段
<jsp:setProperty name="MyUser" property="name"/>
-->
<!--  给某个指定的字段赋值,不依赖表单 
<%-- <jsp:setProperty name="MyUser" property="name" value ="sdf" />--%>
-->
<!-- 获取某个指定元素的值 -->
<jsp:getProperty name="MyUser" property="name"/>
<jsp:getProperty name="MyUser" property="passwd"/>
  <!-- 使用表达式获取值 
     用户名:<%=MyUser.getName()%>
	 密码:<%=MyUser.getPasswd()%>
	 -->  
	 <hr/>
	 <a href="ScopeTest.jsp">Test</a>
	 <!-- 服务器内部转发,不显示这个jsp文件,直接跳到ScopeTest.jsp -->
	 
	 <%
	   request.getRequestDispatcher("ScopeTest.jsp").forward(request, response);
	 %>
</body>
</html>