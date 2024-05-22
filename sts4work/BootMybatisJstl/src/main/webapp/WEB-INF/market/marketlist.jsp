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
	.img{
		width: 300px;
		height: 200px;
	}
</style>
</head>
<body>

<div style="margin: 50px 100px;">
	<button type="button" class="btn btn-outline-info"
	onclick="location.href='addform'">상품등록</button>
</div>

<c:if test="${totalCount==0 }">
	<div class="alert alert-info" style="margin: 50px 100px;">
		<b>저장된 정보가 없습니다</b>
	</div>
</c:if>
<c:if test="${totalCount>0 }">
	<div class="alert alert-info" style="margin: 50px 100px;">
		<b>총 ${totalCount }개의 상품정보가 있습니다</b>
	</div>
</c:if>
<br>

<table class="table table-bordered" style="margin: 20px 100px; width: 1000px;">
	<c:forEach var="dto" items="${list }" varStatus="i">
		<tr>
			<td rowspan="5" align="center">
				<c:if test="${dto.photoname!=null}">
					<img src="../photo/${dto.photoname }" class="img">
				</c:if>
				<c:if test="${dto.photoname==null}">
					<img src="../photo/${dto.photoname }" class="img">
				</c:if>
			</td>
		</tr>
		<tr>
			<td align="center">상품명: ${dto.sang }</td>
		</tr>
		<tr>
			<td align="center">상품단가: <fmt:formatNumber value="${dto.dan }" type="currency"/></td>
		</tr>
		<tr>
			<td align="center">입고일: <fmt:formatDate value="${dto.ipgoday }" pattern="yyyy-HH-MM hh:mm"/></td>
		</tr>
		<tr>
			<td align="center" valign="middle">
				<button type="button" class="btn btn-outline-info btn-sm"
				onclick="location.href='updateform?num=${dto.num}'">수정</button>
				<button type="button" class="btn btn-outline-danger btn-sm"
				onclick="location.href='delete?num=${dto.num}'">삭제</button>
			</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>