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
	<div style="margin: 50px 100px; width: 900px">
		<table class="table talbe-bordered">
			<caption align="top"><b>앨범형 목록</b>
				<button type="button" class="btn btn-info" onclick="location.href='addform.jsp'">글쓰기</button>
			</caption>
			<tr>
				<%
					for(int i=0;i<list.size();i++){
						int no=list.size()-i;
						UploadBoardDto dto = list.get(i);
						%>
					<td>
						<a href="content.jsp?num=<%=dto.getNum()%>" style="text-decoration: none; color: black">
						<img alt="" src="../save/<%=dto.getImgname()%>"
					     style="width: 200px; height: 200px; border: 1px solid gray; margin: 5px">
					     <br>
					     작성자: <%=dto.getWriter()%><br>
					     제목: <%=dto.getSubject()%></a><br>
					     <span style="color: gray; font-size: 10pt;">
					     	조회: <%=dto.getReadcount()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					     	<%=sdf.format(dto.getWriteday())%>
					     </span>
					     <br><br>
					</td>
						<%
							if((i+1)%4==0){
							%>
								</tr>
								<tr>								
							<%}
						%>
					<%}
				%>
			</tr>
		</table>
	</div>
</body>
</html>