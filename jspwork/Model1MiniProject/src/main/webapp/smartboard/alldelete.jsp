<%@page import="data.dao.SmartDao"%>
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
	String nums=request.getParameter("nums");
	String currentPage=request.getParameter("currentPage");
	
	String num[]=nums.split(",");

	SmartDao dao=new SmartDao();
	
	for(String n:num){
		dao.deleteSmart(n);
	}
	
	response.sendRedirect("../index.jsp?main=smartboard/boardlist.jsp");
%>

</body>
</html>