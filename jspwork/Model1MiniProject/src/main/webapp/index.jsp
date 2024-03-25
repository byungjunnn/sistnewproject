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
<style type="text/css">
	div.layout {
		border: 0px solid gray;
		position: absolute;
	}
	
	div.title{
		width: 100%;
		height: 80px;
		line-height: 80px;
		font-size: 30pt;
		font-family: 'Gowun Dodum';
		text-align: center;
	}
	
	div.menu{
		width: 100%;
		height: 80px;
		line-height: 80px;
		font-size: 20px;
		font-family: 'Gowun Dodum';
		text-align: center;
		top: 90px;
	}
	
	div.info{
		width: 200px;
		height: 300px;
		line-height: 10px;
		font-size: 15pt;
		font-family: 'Gowun Dodum';
		left: 50px;
		top: 200px;
		border: 5px groove black;
		border-radius: 30px;
		padding: 20px 20px;
	}
	
	div.main{
		width: 1200px;
		height: 700px;
		font-size: 15pt;
		font-family: 'Gowun Dodum';
		left: 350px;
		top: 200px;
	}
</style>
</head>
<%
	String mainPage="layout/main.jsp"; //기본페이지
	//System.out.println(request.getParameter(""));
	//url을 통해서 main값을 읽어서 메인페이지에 출력, 꼭 main이 아니어도 된다!
	if(request.getParameter("main")!=null){
		mainPage=request.getParameter("main");
	}
%>
<body>
	<div class="layout title">  
		<jsp:include page="layout/title.jsp"/>	
	</div>
	<div class="layout menu">
		<jsp:include page="layout/menu.jsp"/>	
	</div>
	<div class="layout info">
		<jsp:include page="layout/info.jsp"/>	
	</div>
	<div class="layout main">
		<jsp:include page="<%=mainPage %>"/>	
	</div>
</body>
</html>