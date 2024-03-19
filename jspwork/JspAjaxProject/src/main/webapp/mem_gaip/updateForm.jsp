<%@page import="mem_gaip.model.MemgaipDao"%>
<%@page import="mem_gaip.model.MemgaipDto"%>
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
	MemgaipDao dao=new MemgaipDao();
	MemgaipDto dto=dao.getOneData(num);
%>
<body>
<div style="margin: 50px 100px; width: 500px;">
	<form action="updateMember.jsp" method="post" enctype="multipart/form-data" name="mfrm">
	<input type="hidden" name="m_num" value="<%=num%>">
		<table class="table tabl-bordered">
			<caption align="top"><b>나의 정보 수정</b></caption>
			<tr >
				<td width="120" class="table-warning">아이디</td>
				<td>
					<b><%=dto.getM_id() %></b>
				</td>
			</tr>
			
			<tr>
				<td width="120" class="table-warning">회원명</td>
				<td>
					<input type="text" class="form-control"
					style="width: 120px" name="m_name" required="required" value="<%=dto.getM_name()%>">
				</td>
			</tr>
			
			<tr>
				<td width="120" class="table-warning">사진</td>
				<td>
					<input type="file" class="form-control"
					style="width: 200px" name="m_photo">
				</td>
			</tr>
			
			<tr>
				<td width="120" class="table-warning">핸드폰</td>
				<td>
					<input type="text" class="form-control"
					style="width: 180px" name="m_hp" required="required" value="<%=dto.getM_hp()%>">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-warning" id="btnsubmit">회원정보 수정</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>