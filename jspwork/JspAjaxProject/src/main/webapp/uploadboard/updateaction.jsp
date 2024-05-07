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

   //업로드에 필요한 변수 선언
   //업로드할 경로(톰캣에 올라가는 프로젝트 경로)
   String realFolder = getServletContext().getRealPath("/save");
   System.out.println(realFolder);
   
   //업로드 사이즈
   int uploadSize=1024*1024*4; //3mb
   
   //생성자 파라미터 (request, 업로드 폴더, 업로드 사이즈, 한글, 같은이름일 경우 1,2,3붙이기)
   try{
   MultipartRequest multi = new MultipartRequest(request,realFolder,uploadSize,"utf-8",
         new DefaultFileRenamePolicy());
   
   String writer = multi.getParameter("writer");
   String subject = multi.getParameter("subject");
   String content = multi.getParameter("content");
   String pass = multi.getParameter("pass");
   String num =multi.getParameter("num");
   
   //실제 업로드 이미지이름 읽어오기
   String imgname = multi.getFilesystemName("photo");
   
   //dto에 담기
   UploadBoardDto dto = new UploadBoardDto();
   
   dto.setWriter(writer);
   dto.setSubject(subject);
   dto.setContent(content);
   dto.setPass(pass);
   dto.setImgname(imgname);
   dto.setNum(num);
   
   //dao 생성
   UploadBoardDao dao = new UploadBoardDao();
   
   //비번이 맞으면 수정후 디테일 페이지
   //비번이 틀리면 스크립트로 경고
   boolean b=dao.isEqualPass(num, pass);
   
   if(b){
      dao.updateUploadBoard(dto); //수정 실행
      response.sendRedirect("content.jsp?num="+num);
   }else{
      %>
      <script type="text/javascript">
      alert("비밀번호가 틀렸습니다");
      history.back();
      </script>
   <%}
   }catch(Exception e){
   }
   %>
</body>
</html>