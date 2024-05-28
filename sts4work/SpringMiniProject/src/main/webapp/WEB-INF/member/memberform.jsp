<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gowun+Dodum&family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<title>Insert title here</title>
<style type="text/css">
	#showimg{
		width: 130px;
		height: 160px;
		border: 1px solid gray;
	}
</style>
<script type="text/javascript">
	$(function(){
		
		//버튼 클릭시 사진 불러오는 이벤트
		$("#btnphoto").click(function(){
			$("#myphoto").trigger("click");
		})
		
		//사진을 불러오면 미리보기
		$("#myphoto").change(function(){
			
			 if ($(this)[0].files[0]) {
			        var reader = new FileReader();
			        reader.onload = function (e) {
			            $("#showimg").attr('src', e.target.result);
			        }
			        reader.readAsDataURL($(this)[0].files[0]);
			    }
		});
		
		//중복체크 버튼 클릭시 아이디 체크
		$("#btnidcheck").click(function() {
			var id=$("#loginid").val();
			
			$.ajax({
				type:"get",
				dataType:"json",
				url:"idcheck",
				data:{"id":id},
				success:function(res){
					if(res.count==0){
						$("span.idsuccess").text("ok");
					}else{
						$("span.idsuccess").text("fail");
						$("#loginid").val('');
					}
				}
			})
		})
		
		//아이디 입력시 idsuccess값 지우기
		$("#loginid").keydown(function() {
			$("span.idsuccess").text("");
		});
		
		//2번째 비밀번호 입력시 체크
		$("#pass2").keydown(function(){
			var p1=$("#pass").val();
			var p2=$(this).val();
			
			if(p1==p2)
				$("span.passsuccess").text("ok");
			else
				$("span.passsuccess").text("fail");
		})

	});
	
	//submit전에 호출
	function check(){

		//사진
		if($("#myphoto").val()==''){
			alert("사진을 넣어주세요");
			return false;
		}
		//중복체크
		if($("span.idsuccess").text()!='ok'){
			alert("아이디 중복체크 해주세요");
			return false;
		}
		//비밀번호
		if($("span.passsuccess").text()!='ok'){
			alert("비밀번호가 다릅니다");
			return false;
		}
	}
		
</script>
</head>
<body>
	<div style="margin: 20px 50px;">
		<form action="insert" method="post" enctype="multipart/form-data" onsubmit="return check()">
			<table class="table table-bordered" style="width: 600px;">
				<caption align="top"><b>회원가입</b></caption>
				<tr>
					<td style="width: 250px;" align="center" rowspan="4">
						<input type="file" name="myphoto" id="myphoto" style="display: none;">
						<button type="button" id="btnphoto" class="btn btn-secondary">사진선택</button>
						<br>
						<img id="showimg">
					</td>
					<td>
						<div class="d-inline-flex">
							<input type="text" placeholder="아이디 입력" name="id" id="loginid"
							class="form-control" style="width: 120px;" required="required">
							<button type="button" class="btn btn-danger btn-sm"
							id="btnidcheck">중복체크</button>
							&nbsp;
							<span class="idsuccess" style="width: 60px; color: green;font-size: 1.4em;"></span>
						</div>
					</td>
				</tr>
				
				<tr>
					<td>
						<div class="d-inline-flex">
							<input type="password" style="width: 120px;" class="form-control"
							required="required" pattern="[0-9]{4}" name="pass" id="pass"
							placeholder="숫자 4자리">
							&nbsp;
							<input type="password" style="width: 120px;" class="form-control"
							required="required" pattern="[0-9]{4}" id="pass2"
							placeholder="비밀번호 확인">
							&nbsp;
							<span class="passsuccess" style="width: 60px; color: green;font-size: 1.4em;"></span>
						</div>
					</td>
				</tr>
				
				<tr>
					<td>
						<input type="text" name="name" class="form-control" style="width: 150px;"
						placeholder="이름 입력" required="required">
					</td>
				</tr>
				
				<tr>
					<td>
						<input type="email" name="email" class="form-control" style="width: 240px;"
						placeholder="이메일 입력" required="required">
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
						<div class="d-inline-flex">
							<input type="text" name="hp" placeholder="숫자만 입력"
							style="width: 200px;" required="required" class="form-control">
							<input type="text" name="addr" placeholder="주소 입력"
							style="width:300px;" required="required" class="form-control">
						</div>
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-secondary" style="width: 150px;">회원가입</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>