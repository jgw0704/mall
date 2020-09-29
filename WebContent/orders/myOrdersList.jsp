<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myOrdersList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"crossorigin="anonymous">
</head>
<body>
<div class ="container">
		<jsp:include page="/inc/menu.jsp"></jsp:include>
</div>
	<%
		String memberEmail = request.getParameter("memberEmail");
		OrdersDao ordersDao = new OrdersDao();
		ArrayList<Orders> list = ordersDao.selectOrdersListByEmail(memberEmail);
	%>
		<h1 class="text-center"><%=session.getAttribute("loginMemberEmail") %>님의 주문현황</h1>
		<form method="post" action="/mall/orders/myOrdersList.jsp">
		<table class="container table table-basic table-secondary text-dark">
			<thead>
				<tr>
					<td>orders_id</td>
					<td>product_id</td>
					<td>orders_amount</td>
					<td>orders_price</td>
					<td>member_email</td>
					<td>orders_addr</td>
					<td>orders_state</td>
					<td>orders_date</td>
				</tr>
			</thead>
			<tbody>
				<%
					for(Orders o : list) {
				%>
					<tr>
						<td>ㅇ<%=o.getOrdersId()%></td>
						<td><%=o.getProductId()%></td>
						<td><%=o.getOrdersAmount()%></td>
						<td><%=o.getOrdersPrice()%></td>
						<td><%=o.getMemberEmail()%></td>
						<td><%=o.getOrdersAddr()%></td>
						<td><%=o.getOrdersState()%></td>
						<td><%=o.getOrdersDate()%></td>
					</tr>
				<%		
					}
				%>
			</tbody>
		</table>
		</form>
	</div>
</body>
</html>