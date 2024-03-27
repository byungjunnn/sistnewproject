<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Hahmlet:wght@100..900&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Poor+Story&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
	String id=request.getParameter("id");
	//아이디에 해당하는 이름을 dao로부터 얻어온다
	MemberDao dao=new MemberDao();
	String name=dao.getName(id);
%>
<div style="margin: 100px 250px;">
	<img alt="" src="image/avata/b1.png"><br>
	<h5 class="alert alert-dark" style="width: 350px"><<%=name %>>님의 가입을 축하합니다</h5>
	<input value="로그인" class="btn btn-outline-info" type="button"
		onclick="location.href='index.jsp?main=login/loginmain.jsp'">
	<input value="메인" class="btn btn-outline-success" type="button"
		onclick="location.href='index.jsp'"> 
</div>
</body>
</html>