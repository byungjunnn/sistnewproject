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
	<form action="quizWrite.jsp" method="post">
		<table class="table table-bordered" style="width:600px">
			<tr>
				<th class="table table-info" width="120" style="text-align: center">사원명</th>
				<td>
					<input type="text" name="name">
				</td>
			</tr>
			
			<tr>
				<th class="table table-info" width="120" style="text-align: center">입사일자</th>
				<td>
					<input type="date" name="date">
				</td>
			</tr>
			
			<tr>
				<th class="table table-info" width="120" style="text-align: center">점심메뉴</th>
				<td>
					<input type="radio" value="../image/Food/1.jpg" name="food"><img src="../image/Food/1.jpg" width="80">
					<input type="radio" value="../image/Food/2.jpg" name="food"><img src="../image/Food/2.jpg" width="80">
					<input type="radio" value="../image/Food/3.jpg" name="food"><img src="../image/Food/3.jpg" width="80">
				</td>
			</tr>
			
			<tr>
				<th class="table table-info" width="120" style="text-align: center">건의 메뉴</th>
				<td>
					<select name="menu" class="form-control" style="width:200px" multiple="multiple">
						<option value="쌀국수">쌀국수</option>
						<option value="마라탕">마라탕</option>
						<option value="떡볶이">떡볶이</option>
						<option value="돈까스">돈까스</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="전송" class="btn btn-success">
					<input type="reset" value="초기화" class="btn btn-warning">
				</td>
			</tr>
		</table>
	
	</form>
</body>
</html>