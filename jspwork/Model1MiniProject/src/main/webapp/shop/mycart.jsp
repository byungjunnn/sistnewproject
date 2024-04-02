<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ShopDao"%>
<%@page import="data.dto.CartDto"%>
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
	String id=(String)session.getAttribute("myid");
	ShopDao dao=new ShopDao();
	List<HashMap<String, String>> list=dao.getCartList(id);
%>
<body>
<h4><%=id %>님의 장바구니 <%=list.size() %>개</h4>

<div>
	<form action="">
		<table class="table table-bordered">
			<tr>
				<th>번호</th>
				<th>주문자명</th>
				<th>상품명</th>
				<th>상품번호</th>
				<th>상품이미지</th>
				<th>가격</th>
				<th>수량</th>
				<th>장바구니 담은 날짜</th>
			</tr>
			
			<%
				for(HashMap map:list){
					
				}
			%>
			<tr>
				<td><%= %></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>