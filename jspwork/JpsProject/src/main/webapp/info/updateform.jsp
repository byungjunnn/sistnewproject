<%@page import="info.model.infoDto"%>
<%@page import="info.model.infoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Hahmlet:wght@100..900&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Poor+Story&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<%
String num = request.getParameter("num");
infoDao dao = new infoDao();
infoDto dto = dao.getData(num);
%>
<body>
	<div style="margin: 50px 100px">
		<form action="updateaction.jsp" method="post">
			<table class="table table-bordered" style="width: 350px">
				<tr>
					<th class="table-warning" width="80">이름</th>
					<td><input type="text" name="name" placeholder="이름"
						required="required" class="form-control" style="width: 120px"
						 value="<%=dto.getName()%>"></td>
				</tr>

				<tr>
					<th class="table-warning" width="80">주소</th>
					<td><input type="text" name="addr" placeholder="주소"
						required="required" class="form-control" style="width: 250px"
						 value="<%=dto.getAddr()%>">
					</td>
				</tr>

				<tr>
					<td colspan="2" align="center">
						<!-- num hidden 처리 -->
						<input type="hidden" name="num"
						value="<%=num%>">
						<input type="submit" value="수정"
						class="btn btn-outline-success">
						<input type="button"
						value="목록" class="btn btn-outline-warning"
						onclick="location.href='list.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>