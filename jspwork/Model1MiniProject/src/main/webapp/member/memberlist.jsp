<%@page import="data.dto.MemberDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Hahmlet:wght@100..900&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Poor+Story&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	function delfunc(num) {
		var yes=confirm("정말 강퇴하시겠습니까?");
		if(yes){
			location.href='member/memberdelete.jsp?num='+num;
		}
	}
</script>
</head>
<%
	MemberDao dao=new MemberDao();
	List<MemberDto> list=dao.getAllMembers();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>
<body>
	<div style="margin: 100px 100px; width: 1200px;">
	
		<h5 class="alert alert-dark" style="width: 300px"><b><%=list.size() %>명</b>의 회원이 있습니다</h5>
		<table class="table table-bordered">
			<caption align="top"><b>😊전체 회원명단😊</b></caption>
			<tr class="table-dark">
				<th width="80" style="text-align: center">번호</th>
				<th width="100" style="text-align: center">이름</th>
				<th width="130" style="text-align: center">아이디</th>
				<th width="180" style="text-align: center">핸드폰</th>
				<th width="220" style="text-align: center">주소</th>
				<th width="220" style="text-align: center">이메일</th>
				<th width="180" style="text-align: center">가입일</th>
				<th width="120" style="text-align: center">비고</th>
			</tr>
			
			<%
				int no=1;
				for(MemberDto dto:list){
				%>	
					<tr align="center">
						<td><%=no++ %></td>
						<td><%=dto.getName() %></td>
						<td><%=dto.getId() %></td>
						<td><%=dto.getHp() %></td>
						<td><%=dto.getAddr() %></td>
						<td><%=dto.getEmail() %></td>
						<td><%=sdf.format(dto.getGaipday()) %></td>
						<td>
							<button type="button" class="btn btn-danger btn-sm"
							onclick="delfunc('<%=dto.getNum()%>')">강퇴</button>
						</td>
					</tr>
				<%}
			%>
		</table>
	</div>
</body>
</html>