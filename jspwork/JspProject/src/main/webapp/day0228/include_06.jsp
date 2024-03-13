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
	
	<!-- jsp: include:다른파일의 결과페이지를 현재파일에 포함
			  jsp: forward :다른 파일로 이동 (url주소 안바뀜) request, response 등이 그대로 전달
			  jsp: redirect : url주소바뀜 request, response 등이 새로 생성-->
	
	<h2>다른 폴더의 파일 include하기</h2>
	
	<h4>day0228_3번 예제</h4>
	<jsp:include page="jspArray_03.jsp"/>
	<h4>day0228_4번 예제</h4>
	<jsp:include page="jspGugudan_04.jsp"/>
</body>
</html>