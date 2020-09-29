<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<!-- 최상단 검색바 -->
	<div class="col"><h1>Goodee Shop</h1></div>
	<div class="col">
		<form style="text-align:center">
			<input type="text">
			<button class = "btn btn-dark" type="submit">검색</button>
		</form>
		<div class="col" style="text-align:right">
			<i class='fas fa-user-alt' style='font-size: 26px'><a class = "text-dark" href="">회원 정보</a></i>
			<i class='fas fa-shopping-cart' style='font-size: 26px'>
			<a class = "text-dark" href="orders/myOrdersList.jsp?memberEmail=<%=session.getAttribute("loginMemberEmail")%>">내 주문현황</a></i>
		</div>
	</div>
<div>
	<!-- 로그인/회원가입 메뉴바 -->
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<%
		if(session.getAttribute("loginMemberEmail") ==null) {
		%>
		<!-- 로그아웃상태 -->
		<ul class="navbar-nav mr-auto"></ul>
		<ul class="navbar-nav mr-right">
			<li class="nav-item"><a class="btn btn-primary text-light nav-link" href="<%=request.getContextPath() %>/member/login.jsp">로그인</a></li>
			&nbsp;
			<li class="nav-item" ><a class="btn btn-light text-dark nav-link" href="<%=request.getContextPath() %>/member/signup.jsp">회원가입</a></li>
		</ul>
		<%
			} else {
		%>
		<!-- 로그인상태 -->
		<ul class="navbar-nav">
			<li class=" nav-item text-light">
				<%=session.getAttribute("loginMemberEmail") %>님 반갑습니다.
			</li>
			&nbsp;
			<li class="nav-item"><a class="btn btn-primary text-light nav-link" href="<%=request.getContextPath() %>/member/logoutAction.jsp">로그아웃</a></li>
			&nbsp;
			<li class="nav-item"><a class="btn btn-light text-dark nav-link" href="">회원정보</a></li>
		</ul>
		<%
			}
		%>
	</nav>
</div>