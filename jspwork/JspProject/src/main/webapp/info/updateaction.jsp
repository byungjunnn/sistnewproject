<%@page import="info.model.infoDto"%>
<%@page import="info.model.infoDao"%>
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
		
		//데이터 읽어서 dto담기
		String num=request.getParameter("num");
		String name=request.getParameter("name");
		String addr=request.getParameter("addr");
	
		//입력데이터를 dto로 묶어서 메서드로 전달
		infoDto dto=new infoDto();
		dto.setNum(num);
		dto.setName(name);
		dto.setAddr(addr);
	
		//db에 저장
		infoDao dao=new infoDao();
		dao.infoUpdate(dto);
	
		//출력 jsp로 이동 - url 주소 바뀌어야함
		response.sendRedirect("list.jsp");
	%>
</body>
</html>