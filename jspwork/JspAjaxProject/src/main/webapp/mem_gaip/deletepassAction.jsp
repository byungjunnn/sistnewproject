<%@page import="mem_gaip.model.MemgaipDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String num=request.getParameter("num");
	String pass=request.getParameter("pass");
	
	MemgaipDao dao=new MemgaipDao();
	boolean b=dao.isEqualPass(num, pass);
	
	if(b){
		dao.deletdMemgaip(num);
		%>
			<script type="text/javascript">
				alert("삭제되었습니다\n목록으로 이동합니다")
				location.href='memList.jsp';
			</script>
	<%}else{%>
		<script type="text/javascript">
			alert("비밀번호가 틀렸습니다");
			history.back();
		</script>
	<%}
%>