<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Hahmlet:wght@100..900&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Poor+Story&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
	String num=request.getParameter("num");
%>
<body>
 <div style="margin: 200px 200px; width: 300px;">
 	<form action="updateForm.jsp" method="post">
 		<input type="hidden" name="num" value="<%=num%>">
 		<div class="d-inline-flex">
 			<h5 style="width: 100px">비밀번호</h5>
 			<input type="password" class="form-control" required="required"
 			name="pass" style="width: 150px;">
 		</div>
 		<br><br>
 		<button type="submit" class="btn btn-warning"
 		style="margin-left: 100px;">수정</button>
 	</form>
 </div>
</body>
</html>