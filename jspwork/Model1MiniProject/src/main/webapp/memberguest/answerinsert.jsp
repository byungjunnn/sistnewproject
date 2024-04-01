<%@page import="data.dao.AnswerGuestDao"%>
<%@page import="data.dto.AnswerGuestDto"%>
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
   AnswerGuestDto dto = new AnswerGuestDto();
   dto.setNum(request.getParameter("num"));
   dto.setMyid(request.getParameter("myid"));
   dto.setContent(request.getParameter("content"));
   
   //페이지 번호 읽기
   String currentPage = request.getParameter("currentPage");
   
   //db에 저장
   AnswerGuestDao dao = new AnswerGuestDao();
   dao.insertAnswer(dto);
   
   response.sendRedirect("../index.jsp?main=memberguest/guestlist.jsp?currentPage="+currentPage);
   
   %>
</body>
</html>