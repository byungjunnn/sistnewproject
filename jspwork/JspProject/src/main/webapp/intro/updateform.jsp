<%@page import="intro.model.introDto"%>
<%@page import="intro.model.introDao"%>
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
<%
	String num=request.getParameter("num");
	introDao dao=new introDao();
	introDto dto=dao.getOneData(num);
%>
<body>
	<div style="margin: 30px 50px">
		<form action="undateAction.jsp" method="post">
			<input type="hidden" name="num" value="<%=num%>">
			<table class="table table-bordered" style="width: 600px">
				<caption align="top"><b><<%=dto.getName() %>님의 자기소개 수정></b></caption>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="name" class="form-control" required="required" style="width: 120px" value="<%=dto.getName()%>">
					</td>
				</tr>
				<tr>
					<th>나이</th>
					<td>
						<input type="number" name="age" class="form-control" value="20" style="width: 80px" value="<%=dto.getAge()%>">
					</td>
				</tr>
				
				<tr>
					<th>생년월일</th>
					<td>
						<input type="date" name="birthday" class="form-control" value="1997-02-25" style="width: 200px" value="<%=dto.getBirthday()%>">
					</td>
				</tr>
				
				<tr>
					<th>거주지역</th>
					<td>
						<label><input type="radio" name="hometown" value="서울" <%=dto.getHometown().equals("서울")?"checked":"" %>>서울</label>
						<label><input type="radio" name="hometown" value="경기" <%=dto.getHometown().equals("경기")?"checked":"" %>>경기</label>
						<label><input type="radio" name="hometown" value="인천" <%=dto.getHometown().equals("인천")?"checked":"" %>>인천</label>
						<label><input type="radio" name="hometown" value="대전" <%=dto.getHometown().equals("대전")?"checked":"" %>>대전</label>
						<label><input type="radio" name="hometown" value="대구" <%=dto.getHometown().equals("대구")?"checked":"" %>>대구</label>
						<label><input type="radio" name="hometown" value="부산" <%=dto.getHometown().equals("부산")?"checked":"" %>>부산</label>
					</td>
				</tr>
				
				<tr>
					<th>취미</th>
					<td>
						<label><input type="checkbox" name="hobby" value="게임" <%=dto.getHobby().contains("게임")?"checked":"" %>>게임</label>
						<label><input type="checkbox" name="hobby" value="넷플릭스" <%=dto.getHobby().contains("넷플릭스")?"checked":"" %>>넷플릭스</label>
						<label><input type="checkbox" name="hobby" value="독서" <%=dto.getHobby().contains("독서")?"checked":"" %>>독서</label>
						<label><input type="checkbox" name="hobby" value="여행" <%=dto.getHobby().contains("여행")?"checked":"" %>>여행</label>
						<label><input type="checkbox" name="hobby" value="공부" <%=dto.getHobby().contains("공부")?"checked":"" %>>공부</label>
					</td>
				</tr>
				
				<tr>
					<th>성격</th>
					<td>
						<textarea name="memo" style="width: 500px; height: 100px;" placeholder="자유롭게 서술"
						class="form-control" name="memo"><%=dto.getMemo() %></textarea>
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-outline-success">수정 전송</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>