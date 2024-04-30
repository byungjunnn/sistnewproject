<%@page import="myinfo.db.myinfoDao"%>
<%@page import="myinfo.db.myinfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String num=request.getParameter("num");
	String name=request.getParameter("name");
	String blood=request.getParameter("blood");
	String birth=request.getParameter("birth");
	String hp=request.getParameter("hp1")+"-"+request.getParameter("hp2")+"-"+request.getParameter("hp3");
	
	myinfoDto dto=new myinfoDto();
	dto.setNum(num);
	dto.setName(name);
	dto.setHp(hp);
	dto.setBlood(blood);
	dto.setBirth(birth);
	
	myinfoDao dao=new myinfoDao();
	dao.updateMyInfo(dto);
	response.sendRedirect("infoList.jsp");
	
%>