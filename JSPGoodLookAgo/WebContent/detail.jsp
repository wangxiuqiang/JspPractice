<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.ItemsDao"%>
<%@ page import="entity.Items"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品详情</title>
<script type="text/javascript">
function selflog_show(id)
{ 
   var num =  document.getElementById("number").value; 
   J.dialog.get({id: 'haoyue_creat',title: '购物成功',width: 600,height:400, link: 
	   '  <%=path %>/servlet/CartServlet?id= ' 
		   + id + 
		   '&num='
		   + num+ 
		   '&action=add',   
		   cover : true});
	}
	function add() {
		var num = parseInt(document.getElementById("number").value);
		if (num < 100) {
			document.getElementById("number").value = ++num;
		}
	}
	function sub() {
		var num = parseInt(document.getElementById("number").value);
		if (num > 1) {
			document.getElementById("number").value = --num;
		}
	}
</script>
</head>
<body>
	<h1>商品详情</h1>
	<hr>
	<!--  <center>  -->
	<table width="210" height="160">
		<%
			ItemsDao itemsDao = new ItemsDao();
			Items item = itemsDao.getItemsById(Integer.parseInt(request.getParameter("id")));
			if (item != null) {
		%>
		<td width="70%" valign="top">
			<table>
				<tr>
					<td rowspan="5"><img src="images/<%=item.getPicture()%>"
						width="200" height="160" /></td>
				</tr>
				<tr>
					<td><B><%=item.getName()%></B></td>
				</tr>
				<tr>
					<td>产地：<%=item.getCity()%></td>
				</tr>
				<tr>
					<td>价格：<%=item.getPrice()%>￥
					</td>
				</tr>
				<tr>
					<td>购买数量：<span id="sub" onclick="sub();">-</span><input
						type="text" id="number" name="number" value="1" size="2" /><span
						id="add" onclick="add();">+</span></td>
				</tr>
			</table>
			<div id="cart">
				<img src="images/buy_now.jpg"> 
			<!--	<a href="javascript:selflog_show(<%=item.getId()%>)"><img src="images/in_cart.jpg"></a>
			 	 --><a
					href="<%=path%>/servlet/CartServlet?action=add&id=<%=item.getId()%>&num=1"><img
					src="images/in_cart.jpg"></a> <a
					href="servlet/CartServlet?action=show"><img
					src="images/view_cart.jpg" /></a>
			</div>
		</td>
		<%
			}
		%>
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


		<td>浏览过的商品 <%
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