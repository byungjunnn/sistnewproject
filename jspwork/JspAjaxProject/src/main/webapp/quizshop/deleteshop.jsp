<%@page import="quizshop.model.QuizShopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num=request.getParameter("num");
	QuizShopDao dao=new QuizShopDao();
	dao.deleteQuizShop(num);
	response.sendRedirect("shoplist.jsp");
%>