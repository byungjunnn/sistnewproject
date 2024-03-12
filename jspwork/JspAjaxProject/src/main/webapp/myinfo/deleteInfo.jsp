<%@page import="myinfo.db.myinfoDao"%>
<%@page import="myinfo.db.myinfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num=request.getParameter("num");
	myinfoDao dao=new myinfoDao();
	dao.deleteMyInfo(num);
	response.sendRedirect("infoList.jsp");
%>