<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.ItemsDao"%>
<%@ page import="entity.Items"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品详情</title>
</head>
<body>
	<h1>商品详情</h1>
	<hr>
	<!--  <center>  -->
		<table width="210" height="160">
			<%
				ItemsDao itemsDao = new ItemsDao();
				Items items = itemsDao.getItemsById(Integer.parseInt(request.getParameter("id")));
			%>
			<tr>
				<td><img src="images/<%=items.getPicture()%>" width="200"
					height="120"></td>
			</tr>
			<tr>
				<td>产地：<%=items.getCity()%></td>
			</tr>
			<tr>
				<td>价格:<%=items.getPrice()%></td>
			</tr>
		</table>
	<!--></center><-->
	<%
		String list = "";
		Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length > 0) {
			for (Cookie c : cookies) {
				if (c.getName().equals("ListViewItems")) {
					list = c.getValue();
				}
			}
		}
		list += request.getParameter("id") + ",";
		String[] arr = list.split(",");
		if (arr != null && arr.length > 0) {
			if (arr.length >= 1000) {
				list = "";
			}
		}
		Cookie cookie = new Cookie("ListViewItems", list);
		response.addCookie(cookie);
	%>
	<table left="1000px" top="400px" width="300px">
		<tr>
			<td>浏览过的商品
				<%
					ArrayList<Items> itemList = itemsDao.getListView(list);
					if (itemList != null && itemList.size() > 0) {
						for (Items i : itemList) {
				%>
				<div>
					<dl>
						<dt>
							<a href="detail.jsp?id=<%=i.getId()%>"><img
								src="images/<%=i.getPicture()%>" width="120" height="90" /></a>
						</dt>
						<dd><%=i.getName()%></dd>
						<dd>
							产地：<%=i.getCity()%>&nbsp&nbsp 价格：<%=i.getPrice()%></dd>
					</dl>
				</div> <%
 	           }
 	}
 %>
			</td>
		</tr>
	</table>
</body>
</html>