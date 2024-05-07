<%@page import="java.text.SimpleDateFormat"%>
<%@page import="uploadboard.data.UploadBoardDto"%>
<%@page import="java.util.List"%>
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<title>Insert title here</title>
</head>
<%
	UploadBoardDao dao=new UploadBoardDao();
	List<UploadBoardDto> list=dao.getAllDatas();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>
<body>
	<div style="margin: 50px 100px; width: 1000px">
		<button type="button" class="btn btn-info"
		onclick="location.href='addform.jsp'">게시글 추가</button><br><br>
		
		<button type="button" class="btn btn-warning" onclick="location.href='boardlist2.jsp'">앨범형 목록</button>
		
		<h6 class="alert alert-info">총 <%=list.size() %>개의 게시글이 있습니다</h6>
		
		<table class="table talbe-hover">
			<tr>
				<th width="80" >번호</th>
				<th width="280">제목</th>
				<th width="160">작성자</th>
				<th width="250">작성일</th>
				<th width="100">조회</th>
			</tr>
			
			<%
			      for (int i = 0; i < list.size(); i++) {
			         UploadBoardDto dto = list.get(i);
			         int num = list.size() - i;
			      %>
			        <tr align="center" style="font-family: Gowun Dodum">
			           <td><%=num%></td>
			           <td><a href="content.jsp?num=<%=dto.getNum() %>" style="text-decoration: none; color: black;">
			           <img alt="" src="../save/<%=dto.getImgname()%>" style="width: 30px">
			           <%=dto.getSubject()%></a></td>
			           <td><%=dto.getWriter()%></td>
			           <td><%=sdf.format(dto.getWriteday())%></td>
			           <td><%=dto.getReadcount()%></td>
			        </tr>
			      <%
			      }
			      %>
     
		</table>
	</div>
</body>
</html>