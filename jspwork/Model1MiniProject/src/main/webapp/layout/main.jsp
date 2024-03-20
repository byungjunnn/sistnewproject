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
	<img src="<%=root%>/image/cafe.png" width="580" height="350">
	<img src="<%=root%>/image/cafe2.jpg" width="580" height="350"><br>
	<img src="<%=root%>/image/cafemenu.jpg"><br><br>
	<h3>주요 제품 둘러보기</h3>
	<img src="<%=root%>/image/avata/b3.png">
	<img src="<%=root%>/image/avata/b5.png"><br>
	<img src="<%=root%>/image/avata/b6.png">
	<img src="<%=root%>/image/avata/b7.png"><br>
</body>
</html>