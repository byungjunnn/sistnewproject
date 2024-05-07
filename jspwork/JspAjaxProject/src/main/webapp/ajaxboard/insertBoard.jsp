<%@page import="ajaxboard.AjaxBoardDto"%>
<%@page import="ajaxboard.AjaxBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String writer=request.getParameter("writer");
	String subject=request.getParameter("subject");
	String avata=request.getParameter("avata");
	String content=request.getParameter("content");
	
	AjaxBoardDto dto=new AjaxBoardDto();
	dto.setWriter(writer);
	dto.setSubject(subject);
	dto.setAvata(avata);
	dto.setContent(content);

	AjaxBoardDao dao=new AjaxBoardDao();
	dao.insertBoard(dto);
%>
</body>
</html>