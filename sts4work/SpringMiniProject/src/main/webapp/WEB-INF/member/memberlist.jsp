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
<h3 class="alert alert-secondary">${mcount }명의 회원이 있습니다</h3>
<br>

<table class="table table-bordered" style="width: 1000px;">
	<caption align="top"><b>전체 회원 명단</b></caption>
	<tr class="table-secondary">
		<th width="60" style="text-align: center;">번호</th>
		<th width="180" style="text-align: center;">회원명</th>
		<th width="130" style="text-align: center;">아이디</th>
		<th width="160" style="text-align: center;">핸드폰</th>
		<th width="250" style="text-align: center;">주소</th>
		<th width="250" style="text-align: center;">이메일</th>
		<th width="100" style="text-align: center;">
			<input type="checkbox" id="allcheck">강퇴
		</th>
	</tr>
	<c:forEach var="dto" items="${list }" varStatus="i">
		<tr>
			<td align="center" valign="middle">${i.count }</td>
			<td align="center" valign="middle">
				<img src="../memberphoto/${dto.photo }" style="width: 50px; height: 50px;">
				&nbsp;&nbsp;
				${dto.name }
			</td>
			<td align="center" valign="middle">${dto.id }</td>
			<td align="center" align="center" valign="middle" valign="middle">${dto.hp }</td>
			<td align="center" valign="middle">${dto.addr }</td>
			<td align="center" valign="middle">${dto.email }</td>
			<td align="center" valign="middle">
				<input type="checkbox" num="${dto.num }" class="del">
			</td>
		</tr>
	</c:forEach>
</table>

<button type="button" class="btn btn-outline-danger"
style="margin-left: 925px;" id="btnmemberdel">Delete</button>
</body>
</html>