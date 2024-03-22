<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.MemberDto"%>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	function delfunc(num) {
		//alert(num);
		$("#delnum").val(num);
		$("#myModal").modal('show');
		
		//삭제버튼 이벤트
		$("button.btndel").click(function(){
			var num=$("#delnum").val();
			var pass=$("#delpass").val();
			
			location.href="member/deletemypage.jsp?num="+num+"&pass="+pass;
		})
	}
</script>
</head>
<%
	MemberDao dao=new MemberDao();
	List<MemberDto> list=dao.getAllMembers();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	
	String loginok=(String)session.getAttribute("loginok");
	String myid=(String)session.getAttribute("myid");
%>
<body>
	<div style="margin: 50px 200px; width: 1200px; font-size: 20pt">
		<table class="table table-bordered">
			<%
				for(MemberDto dto:list){
					if(loginok!=null && myid.equals(dto.getId())){
				%>	
					<tr>
						<input type="hidden" name="num" value="<%=dto.getNum()%>">
						<td rowspan="5" align="center">
							<img src="image/3.jpg" width="400">
						</td>
						<td valign="middle">회원명: <%=dto.getName() %></td>
						<td rowspan="5" align="center" valign="middle">
							<button type="button" class="btn btn-outline-warning btn-lg"
							onclick="location.href='index.jsp?main=member/updatepassform.jsp?num=<%=dto.getNum()%>'">수정</button><br><br>
							<button type="button" class="btn btn-outline-danger btn-lg"
							onclick="delfunc('<%=dto.getNum()%>')">탈퇴</button>
						</td>
					</tr>
					<tr>
						<td valign="middle">아이디: <%=dto.getId() %></td>
					</tr>
					<tr>
						<td valign="middle">이메일: <%=dto.getEmail() %></td>
					</tr>
					<tr>
						<td valign="middle">핸드폰: <%=dto.getHp() %></td>
					</tr>
					<tr>
						<td valign="middle">주소: <%=dto.getAddr() %></td>
					</tr>
				<%}
			%>
			<% }%>
			</tr>
		</table>
	</div>
	
	<!-- The Modal -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">삭제확인</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body d-inline-flex">
      <input type="hidden" id="delnum">
        <b>삭제 비밀번호: </b>&nbsp;&nbsp;&nbsp;
        <input type="password" id="delpass" class="form-control" style="width: 120px;">
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger btndel" data-bs-dismiss="modal">삭제</button>
      </div>

    </div>
  </div>
</div>
	
</body>
</html>