<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeList</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<body>
	<div class ="container">
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
		<div>
			<%
				NoticeDao noticeDao = new NoticeDao();
				ArrayList<Notice> noticeList = noticeDao.selectNoticeList2();
			%>
		<div class="container">
			<h1 class="text-center">공지사항</h1>
				<table class="table">
					<thead>
						<tr>
							<td>공지번호</td>
							<td>공지제목</td>
						</tr>
					</thead>
					<tbody>
						<%
							for(Notice n : noticeList) {
						%>
							<tr>
								<td><%=n.getNoticeId()%></td>
								<td><a href="/mall/notice/noticeOne.jsp?noticeTitle=<%=n.getNoticeTitle()%>"><%=n.getNoticeTitle()%></a></td>
							</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
</body>
</html>