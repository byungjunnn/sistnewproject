<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="ajaxboard.AjaxBoardDao"%>
<%@page import="ajaxboard.AjaxBoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//num 읽기
	String num=request.getParameter("num");
	AjaxBoardDao dao=new AjaxBoardDao();
	//num에 해당 dto얻기
	AjaxBoardDto dto=dao.getData(num);
	//날자타입을 문자열로 지정
	SimpleDateFormat sdf=new SimpleDateFormat();
	
	//dto를 json으로 변환
	JSONObject ob=new JSONObject();
	ob.put("num", dto.getNum());
	ob.put("writer", dto.getWriter());
	ob.put("subject", dto.getSubject());
	ob.put("content", dto.getContent());
	ob.put("avata", dto.getAvata());
	ob.put("writeday", sdf.format(dto.getWriteday()));
%>
<%=ob.toString() %>