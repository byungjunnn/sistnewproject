<%@page import="info.model.infoDao"%>
<%@page import="info.model.infoDto"%>
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
		
		String name=request.getParameter("name");
		String addr=request.getParameter("addr");
		
		//입력데이터를 dto로 묶어서 메서드로 전달
		infoDto dto=new infoDto();
		
		dto.setName(name);
		dto.setAddr(addr);
		
		//insert메서드로 전달
		infoDao dao=new infoDao();
		dao.infoInsert(dto);
		
		//출력 jsp로 이동 - url 주소 바뀌어야함
		response.sendRedirect("list.jsp");
	%>
</body>
</html>