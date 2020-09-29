<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "vo.*" %>
<%
	// 비정상적으로 이 파일을 접근했을때 메인페이지로 보냄
	if(session.getAttribute("loginMemberEmail") != null) {
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		return;
	}
	
	request.setCharacterEncoding("utf-8");
	String memberEmail = request.getParameter("memberEmail");
	String memberPw = request.getParameter("memberPw");
	String memberName = request.getParameter("memberName");
	
	// 사용가능한 이메일인지 검증한다
	MemberDao memberDao = new MemberDao();
	Member member = memberDao.selectMemberEmailCk(memberEmail); // 중복 이메일 체크
	if(member != null) {
		System.out.println("이미 사용중인 이메일입니다.");
		response.sendRedirect(request.getContextPath()+"/member/signup.jsp");
		return;
	}
	
	Member paramMember = new Member();
	paramMember.setMemberEmail(memberEmail);
	paramMember.setMemberPw(memberPw);
	paramMember.setMemberName(memberName);
	memberDao.insertMember(paramMember); // 회원가입 메서드 호출
	
	response.sendRedirect(request.getContextPath()+"/member/login.jsp");
%>