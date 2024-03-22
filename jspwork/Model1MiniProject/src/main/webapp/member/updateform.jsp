<%@page import="java.util.StringTokenizer"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
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
	$(function(){
		//아이디 중복체크
		$("#btnidCheck").click(function(){
			//id읽기
			var id=$("#id").val();
			//alert(id);
			$.ajax({
				type:"get",
				url:"member/idCheck.jsp",
				dataType:"json",
				data:{"id":id},
				success:function(res){
					//alert(res.count);
					if(res.count==1){
						//alert("이미 가입된 아이디입니다\n다시 입력해주세요");
						$("span.idsuccess").text("가입불가");
						$("#id").val("");
					}else{
						//alert("가입이 가능한 아이디입니다");
						$("span.idsuccess").text("가입가능");
					}
				}
			})
		})
		//이메일 선택 이벤트
		$("#selemail").change(function(){
			var s=$(this).val();
			if(s=='-'){
				$("#email2").val("");
			}else{
				$("#email2").val(s);
			}
		})
		
	})
	
	function check(f) { //f는 form(this) 자신을 나타냄
		if(f.pass.value!=f.pass2.value){
			alert("비밀번호가 서로 다릅니다");
			//초기화
			f.pass.value="";
			f.pass2.value="";
			return false; //action호출하지 않음
		}
	}
</script>
</head>
<%
	String num=request.getParameter("num");
	MemberDao dao=new MemberDao();
	MemberDto dto=dao.getData(num);
	
	StringTokenizer st=new StringTokenizer(dto.getEmail(),"@");
	String email1=st.nextToken();
	String email2=st.nextToken();
%>
<body>
<div style="margin: 100px 100px; width: 500px;">
	<form action="member/updateaction.jsp" method="post" onsubmit="return check(this)">
	<input type="hidden" name="num" value="<%=num%>">
		<table class="table table-bordered">
			<caption align="top"><b>회원정보 수정</b></caption>
			<tr>
				<th width="100" class="table-dark">아이디</th>
				<td>
					<div class="d-inline-flex">
						<b><%=dto.getId() %></b>					  
					</div>
				</td>
			</tr>
			
			<tr>
				<th width="100" class="table-dark">이름</th>
				<td>
					<input type="text" name="name" class="form-control" required="required" style="width: 120px"
					value="<%=dto.getName()%>">
				</td>
			</tr>
			<tr>
				<th width="100" class="table-dark">핸드폰</th>
				<td>
					<input type="text" name="hp" class="form-control" required="required" style="width: 180px"
					value="<%=dto.getHp()%>">
				</td>
			</tr>
			<tr>
				<th width="100" class="table-dark">주소</th>
				<td>
					<input type="text" name="addr" class="form-control" required="required" style="width: 330px"
					value="<%=dto.getAddr()%>">
				</td>
			</tr>
			<tr>
				<th width="100" class="table-dark">이메일</th>
				<td>
					<div class="d-inline-flex">
						<input type="text" name="email1" class="form-control" required="required"
						style="width: 100px;" value="<%=email1%>">
						<b style="margin-left: 10px">@</b>
						<input type="text" name="email2" id="email2" class="form-control" required="required"
						style="width: 100px; margin-left 10px" value="<%=email2%>">
						<select id="selemail" class="form-control" style="margin-left: 10px">
							<option value="-" <%=email2.equals("")?"selected":"selected" %>>직접입력</option>
							<option value="naver.com" <%=email2.equals("naver.com")?"selected":"" %>>네이버</option>
							<option value="nate.com" <%=email2.equals("nate.com")?"selected":"" %>>네이트</option>
							<option value="gmail.com" <%=email2.equals("gmail.com")?"selected":"" %>>구글</option>
							<option value="daum.net" <%=email2.equals("daum.net")?"selected":"" %>>다음</option>
						</select>
					</div>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-warning"
					style="width: 100px" onclick="location.href='index.jsp?main=member/updateaction.jsp'">수정하기</button>
					<button type="reset" class="btn btn-outline-danger"
					style="width: 100px">초기화</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>