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
<style type="text/css">
	.stuimg{
		width: 40px;
		height: 40px;
	}
</style>
</head>
<body>
<div style="margin: 100px 100px;">
	<button type="button" class="btn btn-outline-warning"
	onclick="location.href='addform'">학생정보입력</button>
	<br><br>
	<h5 class="alert alert-success">
		<b>총 ${totalCount }명의 학생정보가 있습니다</b>
	</h5>
	
	<table class="table table-bordered" style="width: 800px;">
		<tr class="table-success">
			<th width="80">번호</th>
			<th width="150">학생명</th>
			<th width="180">사진</th>
			<th width="280">연락처</th>
			<th width="380">주소</th>
			<th width="180">편집</th>
		</tr>
		
		<c:forEach var="dto" items="${list }" varStatus="i">
			<tr>
				<td align="center">${i.count }</td>
				<td align="center">${dto.stuname }</td>
				<td align="center">
					<img src="../${dto.stuphoto }" class="stuimg">
				</td>
				<td align="center">${dto.stuhp }</td>
				<td align="center">${dto.stuaddr }</td>
				<td align="center">
					<button type="button" class="btn btn-outline-info btn-sm"
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