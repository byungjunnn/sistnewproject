<%@page import="java.text.SimpleDateFormat"%>
<%@page import="myinfo.db.myinfoDao"%>
<%@page import="myinfo.db.myinfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String name=request.getParameter("name");
	String blood=request.getParameter("blood");
	String birth=request.getParameter("birth");
	String hp=request.getParameter("hp1")+"-"+request.getParameter("hp2")+"-"+request.getParameter("hp3");
	/* String hp1=request.getParameter("hp1");
	String hp2=request.getParameter("hp2");
	String hp3=request.getParameter("hp3"); */
	//String hp=hp1+"-"+hp2+"-"+hp3;
	
	
	myinfoDto dto=new myinfoDto();
	dto.setName(name);
	dto.setHp(hp);
	dto.setBlood(blood);
	dto.setBirth(birth);
	
	myinfoDao dao=new myinfoDao();
	dao.insertMyInfo(dto);
	
	response.sendRedirect("infoList.jsp");
%>