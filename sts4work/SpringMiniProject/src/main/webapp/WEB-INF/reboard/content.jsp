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
<div style="margin: 100px 100px">
<table class="table table-bordered" style="width: 600px;">
	<tr>
		<td>
			<h3><b>${dto.subject }</b></h3>
			<b>${dto.name }(${dto.id })</b>
			<span style="color: gray;float: right;">
				<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/>
			</span>
		</td>
	</tr>
	<tr height="300" valign="top">
		<td>
			<pre>${dto.content }</pre>
			<br><br>
			<c:if test="${dto.photo!='no' }">
				<c:forTokens var="photo" items="${dto.photo }" delims=",">
					<img src="../boardphoto/${photo }" width="100"
					class="img-thumbnail" onerror="this.style.display='none'">
				</c:forTokens>
			</c:if>
			<br><br>
			<div class="d-inline-flex">
			<div class="likes">
				<i class="bi bi-heart"></i>좋아요 <b>${dto.likes }</b>
			</div>
			&nbsp;&nbsp;
			<i class="bi bi-chat-text"></i>&nbsp;<b class="banswer">0</b></div>
		</td>
	</tr>
	
	<tr>
		<td>
			<button type="button" class="btn btn-outline-info"
			onclick="location.href='form'">글쓰기</button>
			<button type="button" class="btn btn-outline-info"
			onclick="location.href='form?num=${dto.num}&regroup=${dto.regroup }&restep=${dto.restep }&relevel=${dto.relevel }&currentPage=${currentPage }'">답글</button>
			<button type="button" class="btn btn-outline-info"
			onclick="location.href='list'">목록</button>
			
			<!-- 로그인 중, 아이디가 일치할 때만 -->
			<c:if test="${sessionScope.loginok!=null && sessionScope.myid==dto.id }">
				<button type="button" class="btn btn-outline-info"
				onclick="location.href='updateform?num=${dto.num}&currentPage=${currentPage }'">수정</button>
				<button type="button" class="btn btn-outline-info"
				onclick="location.href='delete?num=${dto.num}&currentPage=${currentPage }'">삭제</button>
			</c:if>
		</td>
	</tr>
</table>
</div>
</body>
</html>