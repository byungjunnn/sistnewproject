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
<body>
<div style="margin: 100px 100px; width: 500px;">
	<form action="member/addaction.jsp" method="post" onsubmit="return check(this)">
		<table class="table table-bordered">
			<caption align="top"><b>회원가입</b></caption>
			<tr>
				<th width="100" class="table-dark">아이디</th>
				<td>
					<div class="d-inline-flex">
					  <input type="text" name="id" id="id" maxlength="8" class="form-control"
					  required="required" style="width: 120px;">
					  <button type="button" class="btn btn-danger" id="btnidCheck"
					  style="margin-left: 10px">중복체크</button>
					  <span class="idsuccess" style="color: blue; font-size: 0.8em;margin-left: 10px"></span>
					</div>
				</td>
			</tr>
			
			<tr>
				<th width="100" class="table-dark">비밀번호</th>
				<td>
					<div class="d-inline-flex">
						<input type="password" name="pass" class="form-control"
						required="required" style="width: 120px; margin-right: 10px" placeholder="비밀번호">
						<input type="password" name="pass2" class="form-control"
						required="required" style="width: 120px" placeholder="비밀번호 확인">
					</div>
				</td>
			</tr>
			
			<tr>
				<th width="100" class="table-dark">이름</th>
				<td>
					<input type="text" name="name" class="form-control" required="required" style="width: 120px">
				</td>
			</tr>
			<tr>
				<th width="100" class="table-dark">핸드폰</th>
				<td>
					<input type="text" name="hp" class="form-control" required="required" style="width: 180px">
				</td>
			</tr>
			<tr>
				<th width="100" class="table-dark">주소</th>
				<td>
					<input type="text" name="addr" class="form-control" required="required" style="width: 330px">
				</td>
			</tr>
			<tr>
				<th width="100" class="table-dark">이메일</th>
				<td>
					<div class="d-inline-flex">
						<input type="text" name="email1" class="form-control" required="required"
						style="width: 100px;">
						<b style="margin-left: 10px">@</b>
						<input type="text" name="email2" id="email2" class="form-control" required="required"
						style="width: 100px; margin-left 10px">
						<select id="selemail" class="form-control" style="margin-left: 10px">
							<option value="-">직접입력</option>
							<option value="naver.com">네이버</option>
							<option value="nate.com">네이트</option>
							<option value="gmail.com">구글</option>
							<option value="daum.net">다음</option>
						</select>
					</div>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-info"
					style="width: 100px">가입하기</button>
					<button type="reset" class="btn btn-outline-danger"
					style="width: 100px">초기화</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>