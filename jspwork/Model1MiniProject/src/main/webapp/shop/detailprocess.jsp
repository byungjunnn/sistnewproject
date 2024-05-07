<%@page import="data.dto.CartDto"%>
<%@page import="data.dao.ShopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- <jsp:useBean id="dao" class="data.dao.ShopDao"/>
<jsp:useBean id="dto" class="data.dto.CartDto"/>
<jsp:setProperty property="*" name="dto"/> --%>
<%
	request.setCharacterEncoding("utf-8");
	String shopnum=request.getParameter("shopnum");
	String num=request.getParameter("num");
	int cnt=Integer.parseInt(request.getParameter("cnt"));
	
	ShopDao dao=new ShopDao();
	CartDto dto=new CartDto();
	
	dto.setShopnum(shopnum);
	dto.setNum(num);
	dto.setCnt(cnt);
	
	dao.insertcart(dto);
%>