<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ page import="entity.Cart"%>
<%@ page import="entity.Items"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>My JSP 'cart.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<script language="javascript">
	function delcfm() {
		if (!confirm("确认要删除？")) {
			window.event.returnValue = false;
		}
	}
</script>
</head>

<body>
	<h1>我的购物车</h1>
	<a href="index.jsp">首页</a> >>
	<a href="index.jsp">商品列表</a>
	<hr>
	<div id="shopping">
		<form action="" method="">
			<table>
				<tr>
					<th>商品名称</th>
					<th>商品单价</th>
					<th>商品价格</th>
					<th>购买数量</th>
					<th>操作</th>
				</tr>
				<%
					if (request.getSession().getAttribute("cart") != null) {
						Cart cart = (Cart) request.getSession().getAttribute("cart");
						HashMap<Items, Integer> goods = cart.getGoods();
						Set<Items> items = goods.keySet();
						Iterator<Items> it = items.iterator();
						while (it.hasNext()) {
							Items i = it.next();
				%>
				<tr name="products" id="product_id_1">
					<td><img src="images/<%=i.getPicture()%>" width="60" height="50"/><a
						href=""><%=i.getName()%></a></td>
					<td ><%=i.getPrice()%></td>
					<td id="price_id_1"><span><%=i.getPrice() * goods.get(i)%></span>
						<input type="hidden" value="" /></td>
					<td ><%=goods.get(i)%></td>
					<td ><a
						href="servlet/CartServlet?action=delete&id=<%=i.getId()%>"
						onclick="delcfm();">删除</a></td>
				</tr>
				<%
					}
				%>
				<!--循环的结束-->

			</table>
			<div class="total">
				<span id="total">总计：<%=cart.getTotalPrice()%>￥
				</span>
			</div>
			<%
				}
			%>
			<div class="button">
				<input type="submit" value="" />
			</div>
		</form>
	</div>
</body>
</html>