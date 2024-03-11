<%@page import="ajaxboard.AjaxBoardDto"%>
<%@page import="ajaxboard.AjaxBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String uwriter=request.getParameter("uwriter");
	String usubject=request.getParameter("usubject");
	String uavata=request.getParameter("uavata");
	String ucontent=request.getParameter("ucontent");
	String unum=request.getParameter("unum");
		
	AjaxBoardDto dto=new AjaxBoardDto();
	dto.setWriter(uwriter);
	dto.setSubject(usubject);
	dto.setAvata(uavata);
	dto.setContent(ucontent);
	dto.setNum(unum);
	
	AjaxBoardDao dao=new AjaxBoardDao();
	dao.updateBoard(dto);
%>
