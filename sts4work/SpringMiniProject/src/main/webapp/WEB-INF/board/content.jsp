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
	span.day{
		color: gray;
		float: right;
		font-size: 0.8em;
	}
</style>
<script type="text/javascript">
$(function(){

		num=$("#num").val();
		loginok="${sessionScope.loginok}";
		myid="${sessionScope.myid}"

		list();
		
	$("#btnansweradd").click(function(){
		//alert(num);
		var content=$("#content").val();
		
		if(content.trim().length==0){
			alert("댓글내용을 입력해주세요");
			return;
		}
			
		$.ajax({
			type:"post",
			dataType:"html",
			data:{"num":num,"content":content},
			url:"ainsert",
			success:function(res){
				
				list();
				$("#content").val("");
			}
		})
	})
	
	//삭제
	$(document).on("click","i.adel",function(){
		var idx=$(this).attr("idx");
		//alert(idx);
		
		var a=confirm("해당 댓글을 삭제할까요?");
		if(a){
			$.ajax({
				type:"get",
				dataType:"html",
				data:{"idx":idx},
				url:"adelete",
				success:function(){
					alert("삭제완료");
					list();
					
				}
			})
		}
	})
	
	//댓글 수정버튼 누르면 모달 다이얼로그
	$(document).on("click","i.amod",function(){
		idx=$(this).attr("idx");
		//alert(idx);
		$.ajax({
			type:"get",
			dataType:"json",
			data:{"idx":idx},
			url:"adata",
			success:function(res){
				$("#ucontent").val(res.content);
			}
		})
		$("#myUpdateContentModal").modal("show");
	})
	
	//수정
	$(document).on("click","#btnupdateok",function(){
		var content=$("#ucontent").val();
		//alert(content+","+idx);
		$.ajax({
			type:"post",
			dataType:"html",
			url:"aupdate",
			data:{"content":content,"idx":idx},
			success:function(){
				alert("수정완료");
				list();
			}
		})
	})
	
	
})

//전체 출력
function list(){
	num=$("#num").val();
	loginok="${sessionScope.loginok}";
	myid="${sessionScope.myid}"
	
	$.ajax({
		type:"get",
		dataType:"json",
		url:"alist",
		data:{"num":num},
		success:function(res){
			$("span.acount").text(res.length); //댓글갯수
			
			var s="";
			$.each(res, function(i,dto){
				s+="<b>"+dto.name+"</b>: "+dto.content;
				s+="<span class='day'>"+dto.writeday;
				
				if(loginok=='yes' && myid==dto.myid){
					s+="&nbsp<i class='bi bi-pencil-square amod' idx='"+dto.idx+"'></i>&nbsp";
					s+="<i class='bi bi-trash-fill adel' idx='"+dto.idx+"'></i></span><br>";
				}
			})
			s+="<br>";
			$("div.alist").html(s);
		}
	})
}	
</script>
</head>
<body>
<div style="margin: 50px 100px;">
	<table class="table table-bordered" style="width: 600px;">
		<tr>
			<td>
				<h3><b>${dto.subject }</b>
				<span style="color: gray; float: right; font-size: 12pt;">
					<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/>
				</span>
				</h3>
				<span>작성자: ${dto.name }(${dto.myid })</span>
				
				<c:if test="${dto.uploadfile!='no' }">
					<span style="float: right;">
					<a href="download?clip=${dto.uploadfile }">
						<i class="bi bi-box-arrow-down fs-4" style="color: blue"></i>	
						<b>${dto.uploadfile }</b>
					</a>
					</span>
				</c:if>
			</td>
		</tr>
		
		<tr>
			<td>
				<c:if test="${bupload==true }">
					<h5>업로드 된 파일이 이미지입니다</h5>
					<img src="../boardphoto/${dto.uploadfile }" style="max-width: 400px;">
				</c:if>
				
				<br><br>
				<pre>
					${dto.content }
				</pre>
				<br>
				<b>조회: ${dto.readcount }</b>&nbsp;&nbsp;
				<b>댓글: <span class="acount"></span></b>
			</td>
		</tr>
		
		<!-- 댓글리스트 -->
		<tr>
			<td>
				<div class="alist" id="alist"></div>
				<input type="hidden" id="num" value="${dto.num }">
				<c:if test="${sessionScope.loginok!=null }">
					<div class="aform">
						<div class="d-inline-flex">
							<input type="text" class="form-control" style="width: 500px;"
							placeholder="댓글을 입력하세요" id="content">&nbsp;&nbsp;
							<button type="button" class="btn btn-info" style="width: 60px;"
							id="btnansweradd">등록</button>
						</div> 
					</div>
				</c:if>
			</td>
		</tr>
		
		<tr>
			<td align="right">
			<c:if test="${sessionScope.loginok!=null }">
				<button type="button" class="btn btn-outline-success" style="width: 80px;"
				onclick="location.href='form'">글쓰기</button>
			</c:if>
				<button type="button" class="btn btn-outline-info" style="width: 80px;"
				onclick="location.href='list'">목록</button>
				
			<c:if test="${sessionScope.loginok!=null and sessionScope.myid==dto.myid}">
				<button type="button" class="btn btn-outline-warning" style="width: 80px;"
				onclick="location.href='updateform?num=${dto.num}&currentPage=${currentPage }'">수정</button>
				<button type="button" class="btn btn-outline-danger" style="width: 80px;"
				onclick="location.href='delete?num=${dto.num}&currentPage=${currentPage }''">삭제</button>
			</c:if>
				
				
			</td>
		</tr>
	</table>
</div>

<!-- 댓글 수정 The Modal -->
<div class="modal" id="myUpdateContentModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">댓글 수정</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <input type="text" id="ucontent" class="form-control">
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
      	<button type="button" class="btn btn-success" data-bs-dismiss="modal" id="btnupdateok">수정</button>
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
      </div>

    </div>
  </div>
</div>



</body>
</html>