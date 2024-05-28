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
<div class="alert alert-info" style="width: 800px; margin: 50px 100px">
	<b>${totalCount }개의 상품이 있습니다</b>>
</div>

<table class="table table-bordered" style="width: 800px; margin: 50px 100px">
	<caption align="top"><b>
		<button type="button" style="float: right" class="btn btn-outline-success"
		onclick="location.href='writeform'">상품추가</button>
	</b></caption>
	
	<c:forEach var="dto" items="${list }">
		<tr>
			<td width="400" rowspan="5" align="center">
				<c:if test="${dto.photoname!='no' }">
					<c:forTokens var="pn" items="${dto.photoname }" delims="," begin="0" end="0">
						<a href="../ipgoimage/${pn }">
							<img src="../ipgoimage/${pn }" style="width: 150px;">
						</a>
					</c:forTokens>
				</c:if>
				
				<c:if test="${dto.photoname=='no' }">
						<a href="../ipgoimage/noimg.png">
							<img src="../image/noimg.png" style="width: 150px;">
						</a>
				</c:if>
			</td>
		</tr>
		<tr>
			<td>
				<b>상품명: ${dto.sangpum }</b>
			</td>
		</tr>
		<tr>
			<td>
				<b>단가: <fmt:formatNumber value="${dto.price }" type="currency"/></b>
			</td>
		</tr>
		<tr>
			<td>
				<b>입고일: <fmt:formatDate value="${dto.ipgoday }" pattern="yyyy년 MM월 dd일"/></b>
			</td>
		</tr>
		
		<tr>
			<td>
				<button type="button" class="btn btn-outline-warning"
				onclick="location.href='updateform?num=${dto.num}'">수정</button>
				<button type="button" class="btn btn-outline-danger"
				onclick="location.href='delete?num=${dto.num}'">삭제</button>
			</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>