<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="quizshop.model.QuizShopDao"%>
<%@page import="quizshop.model.QuizShopDto"%>
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
	.sang_name{
		cursor: pointer;
	}
</style>

</head>
<%
	QuizShopDao dao=new QuizShopDao();
	List<QuizShopDto> list=dao.getAllQuizShop();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>
<body>
	<div style="margin: 50px 50px; width: 800px;">
		<h3 class="alert alert-info">QuizShop 입고목록</h3>
		<br>
		<button type="button" class="btn btn-info" onclick="location.href='addform.jsp'">상품추가</button>
		<br>
		<table class="table table-bordered">
			<tr class="table-info" style="text-align: center">
				<th width="60">번호</th>
				<th width="200">상품명</th>
				<th width="180">가격</th>
				<th width="160">입고일</th>
				<th width="160">등록일</th>				
			</tr>
			
			<%
			for(int i=0;i<list.size();i++){
				QuizShopDto dto=list.get(i);
				%>
				<tr>
					<td align="center" valign="middle"><%=i+1 %></td>
					<td class="sang_name" align="center" valign="middle"
					onclick="location.href='detailpage.jsp?num=<%=dto.getNum()%>'"><%=dto.getSang_name() %></td>
					<td align="center" valign="middle"><%=dto.getPrice() %>원</td>
					<td align="center" valign="middle"><%=dto.getIpgoday() %></td>
					<td align="center" valign="middle"><%=sdf.format(dto.getWriteday()) %></td>
				</tr>
			<%}
		%>
		</table>
	</div>
</body>
</html>