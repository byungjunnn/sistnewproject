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
<c:if test="${sessionScope.loginok!=null }">
	<button type="button" class="btn btn-outline-success"
	style="width: 100px; margin-left: 900px;"
	onclick="location.href='form'">글쓰기</button>
</c:if>
<br><br>
<table class="table table-bordered" style="width: 1000px;">
	<tr class="table-light">
		<th width="60">번호</th>
		<th width="360">제목</th>
		<th width="160">작성자</th>
		<th width="80">조회</th>
		<th width="250">등록일</th>	
	</tr>
	
	<c:if test="${totalCount==0 }">
		<tr height="50">
			<td colspan="5" align="center">
				<h5><b>등록된 글이 없습니다</b></h5>
			</td>
		</tr>
	</c:if>
	
	<c:if test="${totalCount>0 }">
		
	</c:if>
</table>
</body>
</html>