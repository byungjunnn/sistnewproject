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
<script type="text/javascript">
	$(function(){
		$("i.photo").click(function(){
			$("#photos").trigger("click");
		})
		
		$("#btnsave").click(function(){
			if($("#nick").val()==''){
				alert("닉네임을 입력해주세요");
				return;
			}
			if($("#pass").val()==''){
				alert("비밀번호를 입력해주세요");
				return;
			}
			if($("#content").val()==''){
				alert("내용을 입력해주세요");
				return;
			}
			
			//데이터 전송
			var s=$("#frm").serialize(); //name으로 한번에 전송(dto와 같아야함)
			
			//insert ajax
			$.ajax({
				type:"post",
				dataType:"json",
				url:"insert",
				data:s,
				success:function(res){
					alert(res.msg);
					
					location.reload();
					$("#nick").val('');
					$("#pass").val('');
					$("#content").val('');
				}
			})
		});
		
		$("#photos").change(function(){
			
			var fdata=new FormData();
			var inputFile=$("#photos");
			var files=inputFile[0].files;
			if(files.length==0){
				return false;
			}
			
			for(var i=0;i<files.length;i++){
				console.log(i);
				fdata.append("photos", files[i]);
			}
			
			$.ajax({
				url:"upload",
				processData:false, //서버전달 데이터는 쿼리스트릥 이라는 형태로 무조건 전달, 파일전송의 경우에는 이것을 하지않음
				contentType:false, //enctype이 원래 기본설정이 application/x.www 이거인데 multipart/form-data로 변경하는 것이 false
				type:"post",
				dataType:"json",
				data:fdata,  
				success:function(res){
					console.log("파일명들 확인: "+res.photoname);
				}
			})
		})
	})
</script>
</head>
<body>
<div style="margin: 50px 100px;" id="inputform">
	<h4>원하는 사진들을 등록하세요
	<input type="file" name="photos" id="photos" multiple="multiple" style="display: none;">
	&nbsp;&nbsp;
	<i class="bi bi-camera-fill photo fs-3"></i></h4>
	
	<form id="frm">
		<table class="table table-bordered" style="width: 700px;">
			<tr>
				<th width="100" valign="middle">닉네임</th>
				<td>
					<input type="text" class="form-control input-sm"
					style="width: 100px;" id="nick" name="nick">
				</td>
				<th width="100" valign="middle">비밀번호</th>
				<td>
					<input type="password" class="form-control input-sm"
					style="width: 100px;" id="pass" name="pass">
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<div class="d-inline-flex">
					<textarea style="width: 580px; height: 100px;"
					class="form-control" id="content" name="content"></textarea>
					<button type="button" id="btnsave" class="btn btn-outline-info"
					style="width: 100px; height: 80px; margin-left: 10px;">저장</button>
					</div>
				</td>
			</tr>
		</table>
	</form>
	
	<hr>
	
	<c:forEach var="a" items="${list }">
		<table class="table table-bordered" style="width: 600px;">
			<tr>
				<td>
					<b>${a.nick }</b>
					<h6 style="color: gray;">작성일: <fmt:formatDate value="${a.writeday }" pattern="yyyy-MM-dd"/></h6>
				</td>
			</tr>
			
			<tr>
				<td>
					<c:if test="${a.photo!='no' }">
						<c:forTokens var="imp" items="${a.photo }" delims=",">
							<a href="../guestphoto/${imp }">
								<img src="../guestphoto/${imp }" style="width: 100px; border: 1px solid green">
							</a>
						</c:forTokens>
					</c:if>
					
					<pre>
						<h6>${a.content }</h6>
					</pre>
					
					<hr>
					<button type="button" class="btn btn-light btn-sm"
					onclick="location.href=''">수정</button>
					<button type="button" class="btn btn-light btn-sm"
					onclick="del(${a.num})">삭제</button>
					
					<script type="text/javascript">
						function del(num){
							//alert(num);
							let pass=prompt("비밀번호를 입력해주세요");
							$.ajax({
								type:"get",
								dataType:"json",
								url:"delete",
								data:{"num":num,"pass":pass},
								success:function(res){
									if(res.status==1){
										alert("삭제되었습니다");
										location.reload();
									}else{
										alert("비밀번호가 맞지 않습니다");
									}
								}
							})
						}
					</script>
				</td>
			</tr>
		</table>
	</c:forEach>
</div>
</body>
</html>