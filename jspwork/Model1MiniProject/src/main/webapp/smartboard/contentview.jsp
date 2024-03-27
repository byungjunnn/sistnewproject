<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.SmartDto"%>
<%@page import="data.dao.SmartDao"%>
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
	String num=request.getParameter("num");
	SmartDao dao=new SmartDao();
	SmartDto dto=dao.getData(num);
	dao.updateReadcount(num);
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>
<body>
	<!-- 상세페이지 적당히 만들어볼 것.. 조회수 증가 포함..맨 아래에 목록, 글쓰기, 수정, 삭제 버튼-->
	<div style="margin: 50px 100px; width: 1200px;">
	<form action="">
		<table class="table table-bordered">
			<caption align="top"><b>상세페이지</b></caption>
			<tr class="table-dark" style="text-align: center">
				<th width="100"><b>제목</b></th>
				<th width="80"><b>작성자</b></th>
				<th width="400"><b>내용</b></th>
				<th width="80"><b>작성일</b></th>
				<th width="60"><b>조회수</b></th>				
			</tr>
				
			<tr style="font-size: 12pt;">
				<td style="line-height: 130px; text-align: center"><%=dto.getSubject() %></td>
				<td style="line-height: 130px; text-align: center"><%=dto.getWriter() %></td>
				<td style="line-height: 130px; text-align: center"><%=dto.getContent() %></td>
				<td style="line-height: 130px; text-align: center"><%=sdf.format(dto.getWriteday()) %></td>
				<td style="line-height: 130px; text-align: center"><%=dto.getReadcount() %></td>
			</tr>
			
			<tr>
				<td colspan="5" align="right">
					<button type="button" class="btn btn-success btn-sm" name="btnlist"
					onclick="location.href='index.jsp?main=smartboard/boardlist.jsp'">목록</button>
					<button type="button" class="btn btn-info btn-sm" name="btnlist"
					onclick="location.href='index.jsp?main=smartboard/smartform.jsp'">글쓰기</button>
					<button type="button" class="btn btn-warning btn-sm" name="btnupdate"
					onclick="location.href=''">수정</button>
					<button type="button" class="btn btn-danger btn-sm" name="btndelete"
					onclick="location.href=''">삭제</button>
				</td>
				</tr>
			</table>
		</form>
	</div>	
</body>
</html>