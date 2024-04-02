<%@page import="data.dao.ShopDao"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Hahmlet:wght@100..900&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Poor+Story&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<title>Insert title here</title>
<style type="text/css">
	div.cart{
		float: right;
		cursor: pointer;
	}
	.cartcount{
		height: 30px;
		float: right;
		color: black;
		border-radius: 100px;
		z-index: 10;
		top: 10px;
		position: relative;
		font-size: 0.4em;
		margin-right: 30px;
		font-weight: bold;
	}
	
	a.cartlink{
		text-decoration: none;
		color: black;
	}
</style>
</head>
<%
	//프로젝트 경로(절대경로)
	String root=request.getContextPath();
%>
<body>
	<a href="<%=root%>" style="color: black; text-decoration: none">
		<img alt="" src="<%=root%>/image/1.png" width="300">
		JSP & JQuery 미니프로젝트
	</a>
	
	<div style="float: right; padding-right: 50px;">
		<%
			//로그인 세션 얻기
			String loginok=(String)session.getAttribute("loginok");
			//아이디 얻기
			String myid=(String)session.getAttribute("myid");
			
			MemberDao dao=new MemberDao();
			String name=dao.getName(myid);
			
			if(loginok==null){
			%>
				<button type="button" class="btn btn-success" style="width: 100px;"
				onclick="location.href='index.jsp?main=login/loginform.jsp'">로그인</button>	
			<%}else{
			%>
				<b style="font-size: 17px"><%=name %>님 로그인 중</b>
				<button type="button" class="btn btn-danger" style="width: 100px;"
				onclick="location.href='login/logoutaction.jsp'">로그아웃</button>	
			<%}
		%>
	</div>
	
	<%
		//shopdao
		ShopDao sdao=new ShopDao();
		
		//cart 갯수
		int cartSize=sdao.getCartList(myid).size();
	%>
	<div class="cart">
	<a href="index.jsp?main=shop/mycart.jsp" class="cartlink">
	<i class="bi bi-cart-fill fs-2 carticon"></i>
	<div class="cartcount">장바구니 [<%=cartSize %>]</div>
	</a>
	</div>
</body>
</html>