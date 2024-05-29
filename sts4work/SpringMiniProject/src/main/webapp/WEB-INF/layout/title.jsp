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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	div.login{
		position: absolute;
		left: 800px;
		top: 30px;
		width: 350px;
	}
	
	#btnlogin{
    	margin-left: 900px;
  	}
	
</style>
</head>
<body>
	<c:set var="root" value="<%=request.getContextPath() %>"/>
	<a href="/">
		<img src="${root }/image/tv_program_img6.jpg">
		<b>SpringBoot+Mybatis+Tiles3</b>
	</a>
	
	<div class="login">
		
		<c:if test="${sessionScope.loginok==null }">
			<button type="button" class="btn btn-success" style="width: 100px;"
			onclick="location.href='${root}/login/main'">Login</button>
		</c:if>
		<c:if test="${sessionScope.loginok!=null }">
			<b>${sessionScope.myid }님 로그인중</b>
			<button type="button" class="btn btn-danger" style="width: 100px;"
			onclick="location.href='${root}/login/logoutprocess'" id="btnlogout">Logout</button>
		</c:if>
	</div>
	
	
	<!-- 모달창 -->
   <div class="container mt-3">
      <button type="button" class="btn btn-primary" data-bs-toggle="modal"
         data-bs-target="#myModal" id="btnlogin">Ajax Login</button>
   </div>
   
   <!-- The Modal -->
   <div class="modal" id="myModal">
      <div class="modal-dialog madal-sm">
         <div class="modal-content">
   
            <!-- Modal Header -->
            <div class="modal-header">
               <h4 class="modal-title">회원로그인</h4>
               <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
   
            <!-- Modal body -->
            <div class="modal-body">
              <div>
                <i class="bi bi-person-circle"></i>
                <input type="text" class="form-control" id="loginid" placeholder="id 입력">
              </div>
              <br>
              <div>
                <i class="bi bi-check-circle"></i>
                <input type="text" class="form-control" id="loginpass" placeholder="password 입력">
              </div>
            </div>
   
            <!-- Modal footer -->
            <div class="modal-footer">
               <button type="button" class="btn btn-danger" data-bs-dismiss="modal" id="btnloginok">Login</button>
               <button type="button" class="btn btn-danger" data-bs-dismiss="modal" >Close</button>
            </div>
   
         </div>
      </div>
   </div>
	
	
	
	<!-- ajax로그인 이벤트 -->
	<script type="text/javascript">
		//팝업창에 있는 로그인 버튼
		$("#btnloginok").click(function(){
			
			//아이디 비번 읽기
			var id=$("#loginid").val();
			var pass=$("#loginpass").val();
			var root="${root}";
			
			$.ajax({
				type:"get",
				url:root+"/member/login",
				dataType:"json",
				data:{"id":id, "pass":pass},
				success:function(res){
					if(res.result=='fail'){
						alert("아이디나 비번이 맞지않습니다");
					}else{
						location.reload();
					}
				}
			})
		});
		
		//로그아웃
		$("#btnlogout").click(function(){
			
			var root="${root}";
			
			$.ajax({
				type:"get",
				url:root+"/member/logout",
				dataType:"html",
				success:function(res){
					location.reload();
				}
			})
		})
	</script>
	
	
	
</body>
</html>