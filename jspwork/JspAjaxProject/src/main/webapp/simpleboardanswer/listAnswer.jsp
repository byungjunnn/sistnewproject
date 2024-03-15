<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.apache.tomcat.util.json.JSONParserTokenManager"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="simpleboardanswer.model.SimpleAnswerDto"%>
<%@page import="java.util.List"%>
<%@page import="simpleboardanswer.model.SimpleAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	String num=request.getParameter("num");
	SimpleAnswerDao dao=new SimpleAnswerDao();
	List<SimpleAnswerDto> list=dao.getAllDatas(num);
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm");
	
	JSONArray arr=new JSONArray();
	
	for(SimpleAnswerDto dto:list){
		JSONObject ob=new JSONObject();
		ob.put("idx", dto.getIdx());
		ob.put("num", dto.getNum());
		ob.put("nickname", dto.getNickname());
		ob.put("content", dto.getContent());
		ob.put("writeday", sdf.format(dto.getWriteday()));
		
		arr.add(ob);
	}
%>
<%=arr.toString()%>