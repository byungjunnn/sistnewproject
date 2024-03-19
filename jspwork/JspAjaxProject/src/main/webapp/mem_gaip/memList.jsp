<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
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
<style type="text/css">
	body *{
		font-family: 'Gowun Dodum';
		font-size: 15pt;
	}
	
	img{
		width: 50px;
		height: 50px;
		border: 1px solid gray;
	}
</style>
</head>
<%
	MemgaipDao dao=new MemgaipDao();
	List<MemgaipDto> list=dao.getAllDatas();
	int totalCount=dao.getTotalCount();
	SimpleDateFormat sdf=new SimpleDateFormat();
%>
<body>
	<div style="margin: 50px 100px; width: 800px">
	<br>
	<h6><b>총 <%=totalCount %>명의 회원이 가입되었습니다</b>
	<button type="button" class="btn btn-dark"
	onclick="location.href='addForm.jsp'" style="float: right">회원가입</button></h6>
	<table class="table table-bordered">
		<caption align="top"><b><전체 회원 명단></b></caption>
		<tr class="table-light">
			<th width="60" style="text-align: center">번호</th>
			<th width="100" style="text-align: center">아이디</th>
			<th width="150" style="text-align: center">회원명</th>
			<th width="180" style="text-align: center">핸드폰</th>
			<th width="100" style="text-align: center">가입일</th>
			<th width="100" style="text-align: center">편집</th>
		</tr>
		
		<%
			if(totalCount==0){
			%>
				<tr>
					<td colspan="6" align="center">
						<h6><b>가입된 회원이 없습니다</b></h6>
					</td>
				</tr>	
			<%}else{
				int i=1;
				for(MemgaipDto dto:list){
					%>
					<tr>
						<td align="center" valign="middle"><%=i++ %></td>
						<td align="center" valign="middle"><%=dto.getM_id() %></td>
						<td align="center" valign="middle">
							<%
								if(dto.getM_photo()==null){
								%>
									<img src="../image/연예인사진/noimage.png" class="rounded-circle">
								<%}else{
								%>
									<img src="../upload/<%=dto.getM_photo() %>" class="rounded-circle">
								<%}
							%>
							<%=dto.getM_name() %>
						</td>
						<td align="center" valign="middle"><%=dto.getM_hp() %></td>
						<td align="center" valign="middle"><%=sdf.format(dto.getGaipday()) %></td>
						<td align="center" valign="middle">
							<button type="button" class="btn btn-outline-warning btn-sm"
							onclick="location.href='updatepassForm.jsp?num=<%=dto.getM_num()%>'">수정</button>
							<button type="button" class="btn btn-outline-danger btn-sm"
							onclick="location.href='deletepassForm.jsp?num=<%=dto.getM_num()%>'">삭제</button>
						</td>
					</tr>
				<%}
			}
		%>
	</table>
</div>
</body>
</html>