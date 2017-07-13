<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="entity.Items"%>
<%@ page import="dao.ItemsDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品信息</title>
</head>
<body>
	<h1>商品信息</h1>
	<hr>
	<center>
		<table width="750" height="60" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td>
					<%
						ItemsDao itemsDao = new ItemsDao();
						ArrayList<Items> list = itemsDao.getAllItems();
						if (list != null && list.size() > 0) {
							for (int i = 0; i < list.size(); i++) {
								Items items = list.get(i);
					%>

					<div>
						<dl>
							<dt>
								<a href="detail.jsp?id=<%=items.getId()%>"><img
									src="images/<%=items.getPicture()%>" width="120"
									height="90" /></a>
							</dt>
							<dd><%=items.getName()%></dd>
							<dd>
								产地：<%=items.getCity()%>&nbsp&nbsp 价格：<%=items.getPrice()%></dd>
						</dl>
					</div> <%
 	}
 	}
 %>
				</td>
			</tr>
		</table>
	</center>
</body>
</html>