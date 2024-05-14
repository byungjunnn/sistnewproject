<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gowun+Dodum&family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div style="margin: 100px 100px;">
		<form action="delete" method="post">
			<!-- hidden -->
			<input type="hidden" name="num" value="${num }">
			<input type="hidden" name="currentPage" value="${currentPage }">
			
			<div class="alert alert-info" style="font-size: 1.3em;width: 350px;">
				<b>비밀번호를 입력해 주세요</b>
			</div>
			<div class="d-inline-flex">
				<input type="password" name="pass" class="form-control" style="width: 130px"
				required="required">
				
				<button type="submit" class="btn btn-outline-warning" style="margin-left: 10px;">삭제</button>
				<button type="button" class="btn btn-outline-success" style="margin-left: 10px;"
				onclick="history.back()">이전</button>
			</div>
		</form>
	</div>
</body>
</html>