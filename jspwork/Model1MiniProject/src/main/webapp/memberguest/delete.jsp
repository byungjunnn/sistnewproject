<%@page import="java.io.File"%>
<%@page import="data.dao.GuestDao"%>
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
	String num=request.getParameter("num");
	String currentPage=request.getParameter("currentPage");
	
	GuestDao dao=new GuestDao();
	
	//게시글 지우기 전 업로드된 이미지 지우기
	String imgName=dao.getData(num).getPhotoname();
	//업로드 경로
	String uploadPath=getServletContext().getRealPath("/save");
		
	//파일 생성
	File file=new File(uploadPath+"/"+imgName);
	//파일 삭제
	if(file.exists()){ //파일 존재하면 파일 삭제
		file.delete();
	}
	dao.deleteGuest(num);
	response.sendRedirect("../index.jsp?main=memberguest/guestlist.jsp?currentPage="+currentPage);
%>
</body>
</html>