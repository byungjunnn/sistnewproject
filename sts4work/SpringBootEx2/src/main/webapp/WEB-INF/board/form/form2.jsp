<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
<h1>폼데이터 DTO 읽기</h1>
<form action="show2" method="post">
	<table class="table table-bordered" style="width: 300px;">
		<tr>
			<th>학생명</th>
			<td>
				<input type="text" name="name" class="form-control" required="required">
			</td>
		</tr>
		<tr>
			<th>연락처</th>
			<td>
				<input type="text" name="hp" class="form-control" required="required">
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<input type="text" name="addr" class="form-control" required="required">
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<button type="submit" class="btn btn-info">서버에 전송</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>