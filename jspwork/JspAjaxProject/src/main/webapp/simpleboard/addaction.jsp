<%@page import="simpleboard.model.SimpleBoardDao"%>
<%@page import="simpleboard.model.SimpleBoardDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
		
		//입력값 읽기
		String writer=request.getParameter("writer");
		String pass=request.getParameter("pass");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		String num=request.getParameter("num");
		
		//dto에 담기
		SimpleBoardDto dto=new SimpleBoardDto();
		dto.setWriter(writer);
		dto.setPass(pass);
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setNum(num);
		
		//dao 생성
		SimpleBoardDao dao=new SimpleBoardDao();
		dao.insertSimpleBoard(dto);
		
		//목록 이동
		//response.sendRedirect("boardlist.jsp");
		//인서트 후 내용보기로 이동하려면 방금 insert된 num값을 알아야함
		int num1=dao.getMaxNum();
		response.sendRedirect("contentview.jsp?num="+num1);
	%>
</body>
</html>