<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signup</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#btn").click(function(){
			if($("#memberEmail").val()=="") {
				alert("이메일을 입력해주세요");
				return;
			} else if($("#memberPw").val()=="") {
				alert("비밀번호를 입력해주세요");
				return;
			} else if($("#memberName").val()=="") {
				alert("이름을 입력해주세요");
				return;
			}
			$("#signupAction").submit();
		});
	});
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" 
crossorigin="anonymous">
</head>
<body>
<div class ="container">
		<jsp:include page="/inc/menu.jsp"></jsp:include>
</div>
<div class="container">
	<h1 class="text-center">회원가입</h1>
	<form method="post" action="<%=request.getContextPath() %>/member/signupAction.jsp" id="signupAction">
	<table class="table">
		<tr>
			<td>회원 이메일 등록</td>
			<td><input type='text' name="memberEmail" id="memberEmail"></td>
		</tr>
		<tr>
			<td>비밀번호 등록</td>
			<td><input type='password' name="memberPw" id="memberPw"></td>
		</tr>
		<tr>
			<td>이름 등록</td>
			<td><input type='text' name="memberName" id="memberName"></td>
		</tr>
	</table>
	<button type="button" id="btn" class="btn btn-primary">가입하기</button>
	</form>
</div>
</body>
</html>