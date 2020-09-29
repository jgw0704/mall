<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticetOne</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<body class="container">
	<div class ="container">
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<%
		String noticeTitle = request.getParameter("noticeTitle");
		System.out.println(noticeTitle+ "<--noticeId"); // id출력
		
		Notice notice = new NoticeDao().selectNoticeOne(noticeTitle);
		
		System.out.println(notice.getNoticeId());
		System.out.println(notice.getNoticeTitle());
		System.out.println(notice.getNoticeContent());
		System.out.println(notice.getNoticeDate());
	%>
	<h1 class = "text-center">공지사항</h1>
	<table class="table">
		<tr>
			<td>공지번호</td>
			<td class = "table-light"><%=notice.getNoticeId()%></td>
		</tr>
		<tr>
			<td>제목</td>
			<td class = "table-light"><%=notice.getNoticeTitle()%></td>
		</tr>
		<tr>
			<td>내용</td>
			<td class = "table-light"><%=notice.getNoticeContent()%></td>
		</tr>
		<tr>
			<td>업로드 날짜</td>
			<td class = "table-light"><%=notice.getNoticeDate()%></td>
		</tr>
	</table>
</body>
</html>