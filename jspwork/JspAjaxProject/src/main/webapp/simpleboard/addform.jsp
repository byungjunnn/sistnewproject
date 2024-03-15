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
	<div style="margin: 50px 100px; width: 500px;">
		<form action="addaction.jsp " method="post">
			<table class="table table-bordered">
				<tr>
					<th width="100" class="table-light">작성자</th>
					<td>
						<input type="text" name="writer" class="form-control"
						style="width: 120px;" required="required">
					</td>
				</tr>
				
				<tr>
					<th width="100" class="table-light">제목</th>
					<td>
						<input type="text" name="subject" class="form-control"
						style="width: 300px;" required="required">
					</td>
				</tr>
				
				<tr>
					<th width="100" class="table-light">비밀번호</th>
					<td>
						<input type="text" name="pass" class="form-control"
						style="width: 200px;" required="required">
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
						<textarea style="width: 480px; height: 100px"
						class="form-control" name="content" required="required"></textarea>
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="image" src="../image/logoImg/submit.png" style="width: 50px">
						<input type="image" src="../image/logoImg/list.png" style="width: 50px" onclick="location.href='boardlist.jsp'">
						<!-- <button type="submit" style="width: 100px;"
						class="btn btn-outline-success btn-md">저장하기</button>
						<button type="button" style="width: 100px;"
						class="btn btn-outline-warning btn-md"
						onclick="location.href='boardlist.jsp'">목록보기</button> -->
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>