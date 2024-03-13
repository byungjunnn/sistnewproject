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
	
		String grade=request.getParameter("grade");
		String[] Lang=request.getParameterValues("Lang");
		String like=request.getParameter("like");
		String height=request.getParameter("height");
		String weight=request.getParameter("weight");
		String ipsaday=request.getParameter("ipsaday");
	%>
	
	<h3 class="alert alert-success">***사원정보***<br><br>
		최종학력: <b><%=grade %></b><br>
		가능한 컴퓨터 언어: <br>
		<%
			if(Lang==null){
			%>
				<font color="green">아무언어도 못합니다<br></font>	
			<%}else{
				for(int i=0;i<Lang.length;i++){
				%>	
					&nbsp;<b><%=Lang[i] %></b><br>
				<%}
			}
		%>
		우리반 같은조 하고 싶은 사람: <b><%=like %></b><br>
		신장: <b><%=height %></b><br>
		몸무게: <b><%=weight %></b><br>
		입사일: <b><%=ipsaday %></b><br>
	</h3>
</body>
</html>