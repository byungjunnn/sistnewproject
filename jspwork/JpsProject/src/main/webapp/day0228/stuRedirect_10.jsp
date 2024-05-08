<%@page import="test.student"%>
<%@page import="java.util.Vector"%>
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
	<h3 class="alert alert-danger">여기는 리다이렉트(stuRedirect_10.jsp) 파일입니다</h3>
	
	<%
		Vector<student> list=(Vector<student>)request.getAttribute("list");
		
		//redirect로 이동시, request는 새로 생성이 되므로 list는 없음
		if(list==null){
			out.print("list가 없어요");
		}else
			out.print("list가 있어요");
	%>
</body>
</html>