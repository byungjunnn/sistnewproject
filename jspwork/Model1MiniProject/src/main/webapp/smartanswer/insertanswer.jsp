<%@page import="data.dto.SmartAnswerDto"%>
<%@page import="data.dao.SmartAnswerDao"%>
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
	request.setCharacterEncoding("utf-8");
	
	//data읽어서 dto넣기
	SmartAnswerDto dto = new SmartAnswerDto();
	dto.setNum(request.getParameter("num"));
	dto.setNickname(request.getParameter("nickname"));
	dto.setContent(request.getParameter("content"));
	
	//db에 저장
	SmartAnswerDao dao = new SmartAnswerDao();
	dao.insertAnswer(dto);
	
	response.sendRedirect("../index.jsp?main=smartanswer/listanswer.jsp");
%>
</body>
</html>