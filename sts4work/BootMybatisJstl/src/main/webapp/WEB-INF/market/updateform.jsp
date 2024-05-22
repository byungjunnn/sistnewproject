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
<div style="margin: 100px 100px;">
	<h2>Market정보 수정</h2>
	<form action="update" method="post" enctype="multipart/form-data">
	<input type="hidden" name="num" value="${dto.num }">
		<table class="table table-bordered" style="width: 500px;">
			<tr>
				<th width="100" class="table-light">상품명</th>
				<td>
					<input type="text" name="sang" class="form-control"
					style="width: 130px;" required="required" value="${dto.sang }">
				</td>
			</tr>
			
			<tr>
				<th width="100" class="table-light">단가</th>
				<td>
					<input type="text" name="dan" class="form-control"
					style="width: 150px;" required="required" value="${dto.dan }">
				</td>
			</tr>
			
			<tr>
				<th width="100" class="table-light">상품이미지</th>
				<td>
					<input type="file" name="photo" class="form-control"
					style="width: 200px;">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-info">수정</button>
					<button type="button" class="btn btn-info"
					onclick="location.href='list'">목록</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>