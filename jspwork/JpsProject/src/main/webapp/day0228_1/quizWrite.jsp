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
		request.setCharacterEncoding("utf-8");
	
		String name=request.getParameter("name");
		String date=request.getParameter("date");
		String food=request.getParameter("food");
		String[] menu=request.getParameterValues("menu");
	%>
	
	<h4 class="alert alert-info">
		사원명: <%=name %><br>
		입사일자: <%=date %><br>
		오늘 점심메뉴: <img src="<%=food %>" width="100"><br>
		건의 메뉴: 
			<%
				if(menu==null){
				%>
					<font color="red">원하는 메뉴 없음</font>
				<%}else{
					for(int i=0;i<menu.length;i++){
					%>
						[<%=menu[i] %>]&nbsp;
					<%}
				} 
			%>
	</h4>
</body>
</html>