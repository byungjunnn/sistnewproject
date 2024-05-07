<%@page import="uploadboard.data.UploadBoardDao"%>
<%@page import="uploadboard.data.UploadBoardDto"%>
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
		
		//업로드에 필요한 변수선언
		//업로드할 경로(톰캣에 올라가는 프로젝트 경로)
		String realFolder=getServletContext().getRealPath("/save");
		System.out.println(realFolder);
		
		//업로드 사이즈
		int uploadSize=1024*1024*4; //4MB
		
		//생성자 파라메터(request,업로드폴더,업로드사이즈,한글,같은이름일경우1,2 붙히기)
		try{
		MultipartRequest multi=new MultipartRequest(request,realFolder,uploadSize,"utf-8",
				new DefaultFileRenamePolicy());
		
		//입력값 읽기
		String writer=multi.getParameter("writer");
		String subject=multi.getParameter("subject");
		String content=multi.getParameter("content");
		String pass=multi.getParameter("pass");
		
		//실제 업로드 이미지이름 읽어오기
		String imgname=multi.getFilesystemName("photo");
		
		//dto에 담기
		UploadBoardDto dto=new UploadBoardDto();
		dto.setWriter(writer);
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setPass(pass);
		dto.setImgname(imgname);
		
		//dao 생성
		UploadBoardDao dao=new UploadBoardDao();
		dao.insertUploadBoard(dto);
		
		//목록 이동
		response.sendRedirect("boardlist.jsp");
		
		}catch(Exception e){
		}
	%>
</body>
</html>