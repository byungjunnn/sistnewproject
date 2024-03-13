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
		session.setAttribute("msg", "happy");
		session.setMaxInactiveInterval(10);
	%>
	
	<h2>10초 안에 눌러주세요</h2>
	<form action="sessionAction.jsp" method="post">
		<h2>받고 싶은 생일선물은?</h2>
		<input type="radio" value="아이폰15" name="gift">아이폰15&nbsp;
		<input type="radio" value="갤럭시 폴드" name="gift">갤럭시 폴드&nbsp;
		<input type="radio" value="백화점 상품권100만원" name="gift">백화점 상품권100만원&nbsp;
		<input type="radio" value="현금 100만원" name="gift" checked="checked">현금 100만원&nbsp;
		
		<input type="submit" value="선물선택">
	</form>
</body>
</html>