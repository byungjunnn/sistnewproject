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
%>

	<jsp:useBean id="dao" class="intro.model.introDao"/>
	<jsp:useBean id="dto" class="intro.model.introDto"/>
	<jsp:setProperty property="*" name="dto"/>
	
	<%
		String hometown=request.getParameter("hometown");
		dto.setHometown(hometown==null?"없음":dto.getHometown());
		String[] hobby=request.getParameterValues("hobby");

		String s="";
		if(hobby==null){ 
			s="없음";
		}else{
			for(int i=0;i<hobby.length;i++){
				s+=hobby[i]+", ";
			}
			s=s.substring(0, s.length()-2);
		}
		dto.setHobby(s);
		dao.insertIntro(dto);
	
		response.sendRedirect("guestList.jsp");
	%>
</body>
</html>