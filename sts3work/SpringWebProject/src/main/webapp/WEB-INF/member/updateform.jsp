<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gowun+Dodum&family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$("#btncheck").click(function(){
			//id읽기
			var id=$("#id").val();
			//alert(id);
			
			$.ajax({
				type:"get",
				url:"idcheck",
				dataType:"json",
				data:{"id":id},
				success:function(res){
					if(res.count==1){
						alert("이미 가입된 아이디 입니다\n다시 입력해 주세요!");
						$("#id").val('');
					}else{
						alert("가입 가능합니다!");
					}
				}
			})
		}) 
	})
</script>
</head>
<body>
<div style="margin: 100px 100px; width: 450px;">
	<form action="update" method="post">
	<input type="hidden" name="num" value="${dto.num }">
		<table class="table table-bordered">
			<caption align="top"><b>회원정보 수정</b></caption>
			<tr>
				<th>회원명</th>
				<td>
					<input type="text" name="name" required="required"
					style="width: 130px;" class="form-control" value="${dto.name }">
				</td>
			</tr>
			
			<tr>
				<th>아이디</th>
				<td><b>${dto.id }</b></td>
			</tr>
			
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="text" name="pass" required="required"
					style="width: 130px;" class="form-control">
				</td>
			</tr>
			
			<tr>
				<th>핸드폰</th>
				<td>
					<input type="text" name="hp" required="required"
					style="width: 150px;" class="form-control" value="${dto.hp }">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-warning">정보수정</button>
					<button type="button" class="btn btn-outline-success"
					onclick="location.href='list'">회원목록</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>