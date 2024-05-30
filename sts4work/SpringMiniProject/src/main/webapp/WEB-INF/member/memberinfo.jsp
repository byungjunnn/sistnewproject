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
	  $(".btnnewphoto").click(function(){
		  $("#newphoto").trigger("click");
	  });
	  
	  $("#newphoto").change(function(){
		  
		  var num=$(this).attr("num");
		  //alert(num);
		  
		  var form=new FormData();
		  
		  form.append("photo",$("#newphoto")[0].files[0]);
		 	form.append("num",num); 
		  
		  console.dir(form); 
		  
		  
		  $.ajax({
			  type:"post",
			  dataType:"json",
			  url:"updatephoto",
			  processData:false,
			  contentType:false,
			  data:form,
			  success:function(){
				  location.reload();
			  }
			  
		  })
		  
	  });
	  
	  //수정버튼 클릭시 모달 다이얼로그에 데이터 넣기
	  $(".btnupdate").click(function(){
		  updatenum=$(this).attr("num");
		  //alert(updatenum);
		  
		  $.ajax({
			  type:"get",
			  dataType:"json",
			  url:"updateform",
			  data:{"num":updatenum},
			  success:function(res){
				  console.dir(res);
				  $("#updatename").val(res.name);
				  $("#updatehp").val(res.hp);
				  $("#updateemail").val(res.email);
				  $("#updateaddr").val(res.addr);
			  }
		  })
	  })
	  
	  //수정
	  $("#btnupdateok").click(function(){
		
		  var updatename=$("#updatename").val();
		  var updatehp=$("#updatehp").val();
		  var updateemail=$("#updateemail").val();
		  var updateaddr=$("#updateaddr").val();
		  
		  var data="num="+updatenum+"&name="+updatename+"&hp="+updatehp+"&email="+updateemail+"&addr="+updateaddr;
		  
		  $.ajax({
			  type:"post",
			  dataType:"html",
			  url:"update",
			  data:data,
			  success:function(){
				  location.reload();
			  }
		  })
	  })
	  
	  //탈퇴
	  $(".btndelete").click(function() {
		var num=$(this).attr("num");
		//alert(num);
		
		var a=confirm("정말 탈퇴하시겠습니까?");
		if(a){
			$.ajax({
				type:"get",
				dataType:"html",
				url:"deleteme",
				data:{"num":num},
				success:function(){
					alert("탈퇴되었습니다");
					location.reload();
				}
			})
		}
	})
  });
</script>
</head>
<body>
<div style="margin: 50px 100px;">
	<table class="table table-bordered">
		<c:forEach var="dto" items="${list }">
		
		<c:if test="${sessionScope.loginok!=null and sessionScope.myid==dto.id }">
			<tr>
				<td style="width: 250px;" align="center" rowspan="5">
					<img src="../memberphoto/${dto.photo }" width="200" height="220" border="1px solid gray;">
					<br><br>
					<input type="file" id="newphoto" num="${dto.num }" style="display: none;">
					<button type="button" class="btn btn-info btnnewphoto">사진수정</button>
				</td>
				<td>회원명: ${dto.name }</td>
				<td rowspan="5" align="center" valign="middle" style="width: 200px;">
					<button type="button" class="btn btn-outline-warning btnupdate" num="${dto.num }"
					data-bs-toggle="modal" data-bs-target="#myUpdateModal">수정</button>
					<button type="button" class="btn btn-outline-danger btndelete" num="${dto.num }">삭제</button>
				</td>
			</tr>
			
			<tr>
				<td>아이디: ${dto.id }</td>
			</tr>
			<tr>
				<td>이메일: ${dto.email }</td>
			</tr>
			<tr>
				<td>핸드폰: ${dto.hp }</td>
			</tr>
			<tr>
				<td>주소: ${dto.addr }</td>
			</tr>
		</c:if>
		</c:forEach>
	</table>
</div>


<!-- The Modal -->
   <div class="modal" id="myUpdateModal">
      <div class="modal-dialog">
         <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
               <h4 class="modal-title">회원정보수정</h4>
               <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                  <div class="d-inline-flex">
                    <label>Name</label>
                    <input type="text" class="form-control"  id="updatename">
                  </div>
                  
                  <div class="d-inline-flex">
                    <label>HP</label>
                    <input type="text" class="form-control" id="updatehp">
                  </div>
                  
                  <div class="d-inline-flex">
                    <label>Email</label>
                    <input type="text" class="form-control" id="updateemail">
                  </div>
                  
                  <div class="d-inline-flex">
                    <label>Addr</label>
                    <input type="text" class="form-control" id="updateaddr">
                  </div>
                </div>

            <!-- Modal footer -->
            <div class="modal-footer">
               <button type="button" class="btn btn-danger" data-bs-dismiss="modal" id="btnupdateok">수정</button>
               <button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
            </div>

         </div>
      </div>
   </div>
</body>
</html>