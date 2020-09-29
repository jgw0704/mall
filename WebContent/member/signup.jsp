<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signup</title>
</head>
<body>
<div class="container">
	<h1>회원가입</h1>
	<form method="post" action="<%=request.getContextPath() %>/member/signupAction.jsp">
	<table class="table">
		<tr>
			<td>member_email</td>
			<td><input type='text' name="memberEmail"></td>
		</tr>
		<tr>
			<td>member_pw</td>
			<td><input type='password' name="memberPw"></td>
		</tr>
		<tr>
			<td>member_name</td>
			<td><input type='text' name="memberName"></td>
		</tr>
	</table>
	<button type="submit" class="btn btn-primary">가입하기</button>
	</form>
</div>
</body>
</html>