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
	<h3>request에 Vector 저장 후 불러오는 연습</h3>
	
	<%
		Vector<student> list=new Vector<>();
		list.add(new student("이미영","강남구",88));
		list.add(new student("이미지","서초구",84));
		list.add(new student("이미니","영등포구",81));
		list.add(new student("이미에","강북구",94));
		list.add(new student("이미형","부산시",98));
		
		//데이터 vector를 request에 저장
		request.setAttribute("list", list);
		
		//페이지 이동2: forward(url주소 안 바뀜), redirect(url주소 바뀜)
		//<jsp:> 태그이동
		response.sendRedirect("stuRedirect_10.jsp");
	%>
	
	
</body>
</html>