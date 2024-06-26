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
<c:set var="root" value="<%=request.getContextPath() %>"/>
<body>
	<i class="bi bi-envelope-arrow-down-fill"></i> &nbsp;leebj4690@gmail.com<br>
	<i class="bi bi-headset"></i> &nbsp;02-1684-1634<br>
	<i class="bi bi-house-add-fill"></i> &nbsp;서울시 강남구 역삼동<br><br>
	
	<!-- 로그아웃 상태에서는 기본이미지 / 로그인 상태는 본인 이미지 -->
	<c:if test="${sessionScope.loginok==null }">
		<img src="${root }/image/03.png" style="width: 80px; border-radius: 100px;">
	</c:if>
	
	<c:if test="${sessionScope.loginok!=null }">
		<img src="${root }/memberphoto/${sessionScope.loginphoto }"
		style="width: 80px; border-radius: 100px;">
	</c:if>
</body>
</html>