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
<title>Insert title here</title>
</head>
<%
	String num = request.getParameter("num");
	UploadBoardDao dao=new UploadBoardDao();
	List<UploadBoardDto> list=dao.getAllDatas();
	SimpleDateFormat sdf=new SimpleDateFormat("yy-MM-dd");
	dao.updateReadCount(num);
%>
<body>
	<div style="margin: 50px 100px; width: 300px">
		<table class="table talbe-bordered">
			<%
			      for (int i=0; i<(list.size()/5);i++) {%>
			    	  <tr align="center" style="font-family: Gowun Dodum">
			    	  <%
			         for(int j=0; j<list.size();j++){
			         	UploadBoardDto dto = list.get(j);
			       	 	if(j%5==0){%>
			       	 	<td>
				         <img alt="" src="../save/<%=dto.getImgname()%>"
					     style="width: 200px; height: 200px"><br>
					     제목: <%=dto.getSubject()%><br>
					     작성자: <%=dto.getWriter()%><br>
					     <%=sdf.format(dto.getWriteday())%>
					     조회: <%=dto.getReadcount()%></td>
			       	 	</tr>
			       	 	<%}else{%>
				         <td>
				         <img alt="" src="../save/<%=dto.getImgname()%>"
					     style="width: 200px; height: 200px"><br>
					     제목: <%=dto.getSubject()%><br>
					     작성자: <%=dto.getWriter()%><br>
					     <%=sdf.format(dto.getWriteday())%>
					     조회: <%=dto.getReadcount()%></td>
					     <%}
			         }
			    	  %></tr><%
					}%>
			</tr>
		</table>
</body>
</html>