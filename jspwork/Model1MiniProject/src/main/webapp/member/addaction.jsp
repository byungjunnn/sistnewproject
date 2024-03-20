<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	String email=request.getParameter("email1")+"@"+request.getParameter("email2");
%>
<jsp:useBean id="dao" class="data.dao.MemberDao"/>
<jsp:useBean id="dto" class="data.dto.MemberDto"/>
<jsp:setProperty property="*" name="dto"/>
<%
	dto.setEmail(email);
	dao.insertMember(dto);
	
	//가입성공페이지로 바꿀 예정
	//response.sendRedirect("../index.jsp?main=member/memberlist.jsp");
	response.sendRedirect("../index.jsp?main=member/gaipSuccess.jsp?id="+id);
%>