<%@page import="ajaxwrite.model.AjaxWriteDao"%>
<%@page import="ajaxwrite.model.AjaxWriteDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String uwriter=request.getParameter("uwriter");
	String ustory=request.getParameter("ustory");
	String uimage=request.getParameter("uimage");
	String unum=request.getParameter("unum");
	
	AjaxWriteDto dto=new AjaxWriteDto();
	dto.setWriter(uwriter);
	dto.setStory(ustory);
	dto.setImage(uimage);
	dto.setNum(unum);
	
	AjaxWriteDao dao=new AjaxWriteDao();
	dao.updateWrite(dto);
%>