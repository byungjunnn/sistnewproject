<%@page import="java.text.SimpleDateFormat"%>
<%@page import="uploadboard.data.UploadBoardDto"%>
<%@page import="uploadboard.data.UploadBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Hahmlet:wght@100..900&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Poor+Story&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
<title>Insert title here</title>
<style type="text/css">
.div1{
   border: 1px solid lightgray;
   width: 2000px;
   font-family: Gowun Dodum;
   border-radius: 10px;

}

.div2,.div3{
   margin: 50px 30px;
   font-family: Gowun Dodum;
}

.div4{
   margin: 50px 100px;
   font-family: Gowun Dodum;
}
</style>
</head>
<%
	String num = request.getParameter("num");
	UploadBoardDao dao = new UploadBoardDao();
	UploadBoardDto dto = dao.getData(num);
	dao.updateReadCount(num);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
%>
<body>

   <form action="addForm.jsp" metho="post">
   <div style="margin: 50px 100px; width: 500px" class="div1">
      <div class="div2">
         <h3><%=dto.getSubject() %></h3>
      
         <b><%=dto.getWriter() %></b>
         &nbsp;&nbsp;
         <span  style="color: gray; font-size: 9pt; margin-left: 210px;"><%=sdf.format(dto.getWriteday()) %>&nbsp;&nbsp;
         조회 <%=dto.getReadcount() %></span>
         <hr>
      </div>
      <div class="div3">
         <a href="../save/<%=dto.getImgname() %>">
         <img src="../save/<%=dto.getImgname() %>" style="max-width: 200px;"></a><br><br>
         <p><%=dto.getContent().replace("\n", "<br>") %></p>
      </div>
      
      </div>
      <div class="div4">
         <button type="submit" class="btn btn-success"><i class="bi bi-pencil"
         onclick="location.href='addform.jsp'"></i>  글쓰기</button>
         <button type="button" class="btn btn-outline-warning" style="margin-left: 235px;"
         onclick="location.href='boardlist.jsp'">목록</button>
         <button type="button" class="btn btn-outline-dark"
         onclick="location.href='updateform.jsp?num=<%=dto.getNum()%>'">수정</button>
         <button type="button" class="btn btn-outline-danger"
         onclick="location.href='deleteform.jsp?num=<%=dto.getNum()%>'">삭제</button>
      </div>
   </form>
   

</body>
</html>