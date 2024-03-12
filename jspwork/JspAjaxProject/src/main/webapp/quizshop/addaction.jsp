<%@page import="quizshop.model.QuizShopDao"%>
<%@page import="quizshop.model.QuizShopDto"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String sang_name=request.getParameter("sang_name");
	String photo=request.getParameter("photo");
	int price=Integer.parseInt(request.getParameter("price"));
	String ipgoday=request.getParameter("ipgoday");
	
	QuizShopDto dto=new QuizShopDto();
	dto.setSang_name(sang_name);
	dto.setPhoto(photo);
	dto.setPrice(price);
	dto.setIpgoday(ipgoday);
	
	QuizShopDao dao=new QuizShopDao();
	dao.insertQuizShop(dto);
	response.sendRedirect("shoplist.jsp");
%>