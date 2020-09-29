<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<body>
<div class ="container">
		<jsp:include page="/inc/menu.jsp"></jsp:include>
</div>
	<%
		CategoryDao categoryDao = new CategoryDao();
		// 전체 카테고리 이름 리스트
		ArrayList<Category> categoryList1 = categoryDao.selectCategoryList();
		// 추천 카테고리 이미지 리스트(4개)
		ArrayList<Category> categoryList2 = categoryDao.selectCategoryCkList();
	%>
	<div class="container">
		<div>
			<!-- 전체카테고리3 / 이미지 배너9 -->
			<div class="row">
				<div class="col-sm-3">
					<!-- 전체카테고리 -->
					<div class="btn-group-vertical">
						<button type="button" class="btn btn-primary btn-block" style="width: 215pt; height: 30pt">전체 카테고리</button>
						<%
							for (Category c : categoryList1) {
						%>
						<a href="" class="btn btn-dark btn-lg"><%=c.getCategoryName()%></a>
						<%
							}
						%>
					</div>
				</div>
				<div class="col-sm-9">
					<img src="<%=request.getContextPath()%>/images/b1.jpg"width="825" height="275">
				</div>
			</div>
		</div>

		<!-- 추천 카테고리 이미지 링크 -->
		<div>
			<%
			
				for (Category c : categoryList2) {
			%>
			<a href=""> <img src="<%=request.getContextPath()%>/images/<%=c.getCategoryPic()%>"
			 class="rounded-circle" width="200" height="200"></a>
			<%
				}
			%>
		</div>

		<%
			Calendar today = Calendar.getInstance(); // new Calendar()
		%>
		<!-- 카테고리별 추천상품 -->
		<div>
			<h4>
				오늘의 추천 상품
				 <span class="badge badge-primary"> <%=today.get(Calendar.YEAR)%>. <%=today.get(Calendar.MONTH) + 1%>.
				 <%=today.get(Calendar.DAY_OF_MONTH)%>
			</span>
			</h4>
			<div>
				<a href="" class="btn btn-primary">전체 카테고리</a>	
				<%
					
					for (Category c : categoryList1) {
				%>
				<a href="" class="btn btn-dark"><%=c.getCategoryName()%></a>
				<%
					}
				%>
			</div>
		</div>

		<%
			ProductDao productDao = new ProductDao();
			ArrayList<Product> productList = productDao.selectProductPicList();
		%>
		<!-- 상품 목록 6개 -->
		<table>
			<tr>
				<%
					int i = 0;
					for (Product p : productList) {
						i=i+1;
				%>
						<td>
							<div class="card" style="width: 360px">
								<img class="card-img-top" src="<%=request.getContextPath()%>/images/<%=p.getProductPic()%>">
								<div class="card-body">
									<h4 class="card-title">
										<a href="<%=request.getContextPath()%>/product/productOne.jsp?productId=<%=p.getProductId()%>">
											<%=p.getProductName()%>
										</a>
									</h4>
									<p class="card-text"><%=p.getProductPrice()%></p>
								</div>
							</div>
						</td>
				<%
						if(i%3==0) {
				%>
							</tr><tr>
				<%			
						}
					}
				%>
			</tr>
		</table>
		
		<!--최근 공지 2개 -->
		<div>
			<%
				NoticeDao noticeDao = new NoticeDao();
				ArrayList<Notice> noticeList = noticeDao.selectNoticeList();
			%>
			<div>
				<h4>공지사항</h4>
				<table class="table">
					<thead>
						<th>
							<tr>notice_id</tr>
							&nbsp;
							<tr>notice_title</tr>
						</th>
					</thead>
					<tbody>
						<%
							for(Notice n : noticeList) {
						%>
							<tr>
								<td><%=n.getNoticeId() %></td>
								<td>
									<a href="<%=request.getContextPath() %>/notice/noticeOne.jsp">
										<%=n.getNoticeTitle() %>
									</a>
								</td>
							</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>