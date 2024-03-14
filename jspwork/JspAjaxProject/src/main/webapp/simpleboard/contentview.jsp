<%@page import="java.text.SimpleDateFormat"%>
<%@page import="simpleboard.model.SimpleBoardDao"%>
<%@page import="simpleboard.model.SimpleBoardDto"%>
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
<style type="text/css">
	body *{
		font-family: 'Nanum Pen Script';
		font-size: 15pt;
	}
	
	span.day{
		color: #ccc;
		font-size: 0.8em;
	}
</style>
</head>
<%
	String num=request.getParameter("num");
	SimpleBoardDao dao=new SimpleBoardDao();
	//dto
	SimpleBoardDto dto=dao.getContent(num);
	//조회수 증가
	dao.updateReadCount(num);
	//날짜
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm");
%>
<body>
	<div style="margin: 50px 100px; width: 500px;">
		<table class="table table-bordered">
			<caption align="top"><b style="font-size: 20pt;"><%=dto.getSubject() %></b></caption>
			<tr>
				<td>
					<b>작성자: <%=dto.getWriter() %></b><br>
					<span class="day"><%=sdf.format(dto.getWriteday()) %></span>
					&nbsp;&nbsp;&nbsp;&nbsp;조회: <%=dto.getReadcount() %>
				</td>
			</tr>
			<tr height="250">
				<td>
					<%=dto.getContent().replace("\n", "<br>") %>
				</td>
			</tr>
			
			<tr>
				<td align="right">
					<button type="button" class="btn btn-outline-info btn-sm"
					onclick="location.href='addform.jsp'"><i class="bi bi-pencil"></i>  글쓰기</button>
					<button type="button" class="btn btn-outline-success btn-sm"
					onclick="location.href='boardlist.jsp'"><i class="bi bi-card-list"></i>  목록</button>
					<button type="button" class="btn btn-outline-warning btn-sm"
					onclick="location.href='updatepassform.jsp?num=<%=dto.getNum()%>'">
					<i class="bi bi-vector-pen"></i>  수정</button>
					<button type="button" class="btn btn-outline-danger btn-sm"
					onclick="location.href='deletepassform.jsp?num=<%=dto.getNum()%>'">
					<i class="bi bi-trash3"></i>  삭제</button>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>