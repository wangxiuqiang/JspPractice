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
	   String[] str=request.getParameterValues("c"); 
	     if(str!=null && str.length >0){
		String usename =URLEncoder.encode(request.getParameter("usename"),"utf-8") ;
		String password =URLEncoder.encode( request.getParameter("password"),"utf-8");
		Cookie usenameCookie = new Cookie("usename", usename);
		Cookie passwordCookie = new Cookie("password",password);
		usenameCookie.setMaxAge(8640);
		passwordCookie.setMaxAge(8640);
		response.addCookie(usenameCookie);
		response.addCookie(passwordCookie);	
	}
	else{
	     Cookie[] cookie=request.getCookies();
	     if(cookie!=null&&cookie.length>0){
	    	 for(Cookie c: cookie){
	    		 if(c.getName().equals("usename")||c.getName().equals("password")){
	    			 c.setMaxAge(0);
	    			 response.addCookie(c);
	    	 }
	     }
	    }
	}

%>
<h1>登陆成功</h1>
	
<a href="ShuChu.jsp">  yonhuxinxi</a>
</body>
</html>