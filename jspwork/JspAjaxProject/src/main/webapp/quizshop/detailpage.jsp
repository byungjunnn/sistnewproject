<%@page import="java.text.SimpleDateFormat"%>
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
</head>
<%
	String num=request.getParameter("num");
	QuizShopDao dao=new QuizShopDao();
	QuizShopDto dto=dao.getData(num);
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>
<body>
	<!-- 이미지가 크게 나오고 옆에 설명 추가
			상품명  가격  입고일 
			아래에 목록, 수정, 삭제 버튼-->
	<div style="margin: 50px 100px; width: 500px;">
		<form action="">
			<table class="table table-bordered">
				<caption align="top"><b>상세페이지</b></caption>
				<tr class="table-dark" style="text-align: center">
					<th width="120"><b>상품사진</b></th>
					<th width="100"><b>상품명</b></th>
					<th width="100"><b>가격</b></th>
					<th width="100"><b>입고일</b></th>				
				</tr>
				
				<tr>
					<td align="center">
						<img src="../image/쇼핑몰사진/<%=dto.getPhoto() %>.jpg" width="150" height="150">
					</td>
					<td style="line-height: 130px; text-align: center"><%=dto.getSang_name() %></td>
					<td style="line-height: 130px; text-align: center"><%=dto.getPrice() %>원</td>
					<td style="line-height: 130px; text-align: center"><%=dto.getIpgoday() %></td>
				</tr>
				
				<tr>
					<td colspan="4" align="right">
						<button type="button" class="btn btn-info btn-sm" name="btnlist"
						onclick="location.href='shoplist.jsp'">목록</button>
						<button type="button" class="btn btn-warning btn-sm" name="btnupdate"
						onclick="location.href='updateform.jsp?num=<%=dto.getNum()%>'">수정</button>
						<button type="button" class="btn btn-danger btn-sm" name="btndelete"
						onclick="location.href='deleteshop.jsp?num=<%=dto.getNum()%>'">삭제</button>
					</td>
				</tr>
			</table>
		</form>
	</div>		
</body>
</html>