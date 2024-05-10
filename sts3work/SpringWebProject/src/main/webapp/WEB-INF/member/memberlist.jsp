<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gowun+Dodum&family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>
<body>
<div style="margin: 50px 100px;width: 800px;">
	<button type="button" class="btn btn-outline-dark"
		onclick="location.href='writeform'">회원가입</button>
	<br><br>
	
	<table class="table table-bordered">
		<tr class="table-dark">
			<th width="80" style="text-align: center">번호</th>
			<th width="120" style="text-align: center">회원명</th>
			<th width="180" style="text-align: center">아이디</th>
			<th width="180" style="text-align: center">핸드폰</th>
			<th width="180" style="text-align: center">가입일</th>
			<th width="180" style="text-align: center">편집</th>
		</tr>
		<c:forEach var="dto" items="${list }" varStatus="i">
			<tr>
				<td align="center">${i.count }</td>
				<td align="center">${dto.name }</td>
				<td align="center">${dto.id }</td>
				<td align="center">${dto.hp }</td>
				<td align="center">
					<fmt:formatDate value="${dto.gaipday }" pattern="yyyy-MM-dd"/>
				</td>
				<td align="center">
					<button type="button" class="btn btn-outline-warning btn-sm"
					onclick="location.href='updateform?num=${dto.num}'">수정</button>
					<button type="button" class="btn btn-outline-danger btn-sm"
					onclick="location.href='delete?num=${dto.num}'">삭제</button>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>