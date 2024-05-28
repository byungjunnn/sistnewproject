<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gowun+Dodum&family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<title>Insert title here</title>
</head>
<body>
<div style="margin: 50px 100px;">
	<table class="table table-bordered">
		<c:forEach var="dto" items="${list }">
			<tr>
				<td style="width: 250px;" align="center" rowspan="5">
					<img src="../memberphoto/${dto.photo }" width="200" height="220" border="1px solid gray;">
					<br><br>
					<input type="file" id="newphoto" num="${dto.num }" style="display: none;">
					<button type="button" class="btn btn-info">사진수정</button>
				</td>
				<td>회원명: ${dto.name }</td>
				<td rowspan="5" align="center" valign="middle" style="width: 200px;">
					<button type="button" class="btn btn-outline-warning" num="${dto.num }"
					onclick="">수정</button>
					<button type="button" class="btn btn-outline-danger" num="${dto.num }"
					onclick="">삭제</button>
				</td>
			</tr>
			
			<tr>
				<td>아이디: ${dto.id }</td>
			</tr>
			<tr>
				<td>이메일: ${dto.email }</td>
			</tr>
			<tr>
				<td>핸드폰: ${dto.hp }</td>
			</tr>
			<tr>
				<td>주소: ${dto.addr }</td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>