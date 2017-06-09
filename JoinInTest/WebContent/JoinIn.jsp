<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.net.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%  request.setCharacterEncoding("utf-8");
	
		String usename = "";
		String password = "";
		Cookie[] cookie = request.getCookies();
		if (cookie != null && cookie.length > 0) {
			for (Cookie c : cookie) {
				if (c.getName().equals("usename")) {
					usename = URLDecoder.decode(c.getValue(),"utf-8");
				}
				if (c.getName().equals("password")) {
					password =URLDecoder.decode( c.getValue(),"utf-8");
				}
			}
		}
	%>
	<h1>登录页面</h1>
	<form name ="dologin" action="Chuli.jsp" method="post">
		<table>
			<tr>
				<td>用户名</td>
				<td><input type="text" name="usename" value="<%=usename%>"></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input type="password" name="password" value="<%= password%>"></td>
			</tr>
			<tr >
				<td colspan="2" align="center"><input type="submit" name="denglu" value="登录"/></td>	
			</tr>
			<tr >
				<td colspan="2" ><input type="checkbox" name="c" />xuanze</td>	
			</tr>
		</table>
	</form>
</body>
</html>