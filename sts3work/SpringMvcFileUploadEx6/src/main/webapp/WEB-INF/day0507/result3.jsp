<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
   href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gowun+Dodum&family=IBM+Plex+Sans+KR&display=swap"
   rel="stylesheet">
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
   rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>
<body>
	<div class="alert alert-dark" style="size: 1.5em; width: 500px;">
		<h1>[Map으로 읽은 결과]</h1>
		상품명: ${sang }<br>
		색상: <b style="color: ${color }">${color }</b> <br>
		가격: <fmt:formatNumber value="${price }" type="currency"/><br>
		선택한 이미지: <img alt="" src="../photo/${img }.png">
	</div>
</body>
</html>