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
<%
	//프로젝트 경로(절대경로)
	String root=request.getContextPath();
%>
<body>
<%
	String id=request.getParameter("id");
	//아이디에 해당하는 이름을 dao로부터 얻어온다
	MemberDao dao=new MemberDao();
	String name=dao.getName(id);
%>
<br><br>
<h4 class="alert alert-warning" style="width: 400px"><%=name %>님이 가입하셨습니다</h4>
<img alt="" src="<%=root%>/image/avata/b1.png">
<input value="로그인" class="btn btn-info" type="button"
onclick="location.href='index.jsp?main=login/loginmain.jsp'">
<input value="메인" class="btn btn-success" type="button"
onclick="location.href='index.jsp'">
</body>
</html>