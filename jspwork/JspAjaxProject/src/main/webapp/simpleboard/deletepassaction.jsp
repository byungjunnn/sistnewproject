<%@page import="simpleboard.model.SimpleBoardDto"%>
<%@page import="simpleboard.model.SimpleBoardDao"%>
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
		//입력값 읽기
		String pass=request.getParameter("pass");
		String num=request.getParameter("num");
		
		//dao 생성
		SimpleBoardDao dao=new SimpleBoardDao();
		boolean b=dao.isEqualPass(num, pass);
		
		if(b){
			dao.deleteSimpleBoard(num);
			%>
				<script type="text/javascript">
					alert("삭제되었습니다\n목록으로 이동합니다")
					location.href='boardlist.jsp';
				</script>			
			//response.sendRedirect("boardlist.jsp");
		<%}else{%>
			<script type="text/javascript">
				alert("비밀번호가 틀렸습니다");
				history.back();
			</script>
		<%}
	%>
</body>
</html>