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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<title>Insert title here</title>
</head>
<body>
<div style="margin: 100px 100px; width: 600px;">
	<table class="table table-bordered">
		<caption align="top"><b>내용보기</b></caption>
		<tr>
			<td>
				<h3><b>${dto.subject }</b></h3>
				<span style="color:gray; float: right; margin-right: 20px;">조회  ${dto.readcount }&nbsp;&nbsp;&nbsp;&nbsp;
					<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/>
				</span>
				<br>
				<h6>작성자  ${dto.writer }</h6>
			</td>
		</tr>
		<tr>
			<td>
				<pre>${dto.content }</pre>
				<br><br>
				<c:if test="${dto.photo!='no' }">
					<c:forTokens var="im" items="${dto.photo }" delims=",">
							<a href="../photo/${im }">
								<img src="../photo/${im }" style="width: 100px;">
							</a>
					</c:forTokens>
				</c:if>
			</td>
		</tr>
		<tr>
			<td align="right">
				<button type="button" class="btn btn-outline-dark"
				onclick="location.href='writeform'">글쓰기</button>
				<button type="button" class="btn btn-outline-dark"
				onclick="location.href='writeform?num=${dto.num}&regroup=${dto.regroup }&restep=${dto.restep }&relevel=${dto.relevel }&currentPage=${currentPage }'">답글</button>
				<button type="button" class="btn btn-outline-info"
				onclick="location.href='list?currentPage=${currentPage}'">목록</button>
				<button type="button" class="btn btn-outline-warning"
				onclick="location.href='updateform?num=${dto.num}&currentPage=${currentPage }'">수정</button>
				<button type="button" class="btn btn-outline-danger"
				onclick="location.href='delete?num=${dto.num}&currentPage=${currentPage }'">삭제</button>
			</td>
		</tr>
	</table>
</div>
</body>
</html>