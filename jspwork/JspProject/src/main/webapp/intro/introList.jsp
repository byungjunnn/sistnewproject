<%@page import="intro.model.introDto"%>
<%@page import="java.util.List"%>
<%@page import="intro.model.introDao"%>
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
	introDao dao=new introDao();
	List<introDto> list=dao.getAllDatas();
%>

<div style="margin: 30px 50px">
	<h1 class="alert alert-dark" style="width: 1000px">자기소개</h1>
	<table class="table table-bordered" style="width: 1000px;">
		<tr>
			<th width="100" class="table-dark">번호</th>
			<th width="200" class="table-dark">이름</th>
			<th width="100" class="table-dark">나이</th>
			<th width="300" class="table-dark">생년월일</th>
			<th width="300" class="table-dark">자세히 보기</th>		
		</tr>
		
		<%
			if(list.size()==0){%>
				<tr>
					<td colspan="5" align="center">
						<h3>자기소개가 없습니다</h3>
					</td>
				</tr>
			<%}else{
				for(int i=0;i<list.size();i++){
					introDto dto=list.get(i);
					%>
					<tr>
						<td align="center"><%=i+1 %></td>
						<td align="center"><%=dto.getName() %></td>
						<td align="center"><%=dto.getAge() %></td>
						<td align="center"><%=dto.getBirthday() %></td>
						<td align="center"><button type="button" class="btn btn-dark" onclick="location.href='detailPage.jsp?num=<%=dto.getNum()%>'">자세히 보기</button></td>
					</tr>
				<%}
			}
		%>
	</table>
	<button class="btn btn-outline-dark" onclick="location.href='addform.jsp'">입력창</button>
</div>
</body>
</html>