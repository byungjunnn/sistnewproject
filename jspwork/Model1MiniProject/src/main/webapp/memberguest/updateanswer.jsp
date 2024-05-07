<%@page import="data.dto.AnswerGuestDto"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.AnswerGuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String idx=request.getParameter("idx");
	String content=request.getParameter("content");
	
	AnswerGuestDto dto  = new AnswerGuestDto();
	dto.setIdx(idx);
	dto.setContent(content);
	
	AnswerGuestDao dao=new AnswerGuestDao();
	dao.updateAnswer(idx, content);
%>