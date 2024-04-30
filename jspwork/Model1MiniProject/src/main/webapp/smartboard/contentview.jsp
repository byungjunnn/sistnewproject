<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.SmartDto"%>
<%@page import="data.dao.SmartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Hahmlet:wght@100..900&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Poor+Story&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	span.aday{
		float: right;
		font-size: 0.8em;
		color: gray;
	}
	
	div.alist{
		margin-left: 20px;
		font-size: 0.8em;
		color: gray;
	}
	
	span.icon{
		margin-left: 30px;
	}
</style>
<script type="text/javascript">
	$(function(){
		
		//처음 시작 시 댓글 호출
		list();
		
		var num=$("#num").val();
		//alert(num);
		$("#btnsend").click(function(){
			var nickname=$("#nickname").val().trim();
			var content=$("#content").val().trim();
			
			if(nickname.trim().length==0){
				alert("닉네임 입력 후 저장해주세요");
				return;
			}
			if(content.trim().length==0){
				alert("댓글 입력 후 저장해주세요");
				return;
			}
			
			$.ajax({
				type:"get",
				url:"smartanswer/insertanswer.jsp",
				dataType:"html",
				data:{"num":num,"nickname":nickname,"content":content},
				success:function(){
					//alert("success!!");
					//초기화
					$("#nickname").val("");
					$("#content").val("");
					
					list();
				}
			})
		})
		
		//삭제
		$(document).on("click", "i.adel",function(){
			var idx=$(this).attr("idx");
			var a=confirm("정말 삭제하시겠습니까?");
			if(a){
				$.ajax({
					type:"get",
					url:"smartanswer/deleteanswer.jsp",
					data:{"idx":idx},
					dataType:"html",
					success:function(){
						swal("삭제 성공!", "삭제가 성공했어요", "success");
						list();
					}
				})
			}
		})
		
		//수정폼에 데이터 띄우기
		$(document).on("click", "i.amod",function(){
			
			idx=$(this).attr("idx");
			//alert(idx);
	
			$.ajax({
				type:"get",
				url:"smartanswer/jsonupdateform.jsp",
				dataType:"json",
				data:{"idx":idx},
				success:function(res){
					$("#unickname").val(res.nickname);
					$("#ucontent").val(res.content);
				}
			})
			$("#myModal").modal("show");
			
		});
		
		//수정
		$(document).on("click", "#btnupdate",function(){
			
			var nickname=$("#unickname").val();
			var content=$("#ucontent").val();
			//alert(nickname+","+content);
			
			$.ajax({
				type:"get",
				url:"smartanswer/updateanswer.jsp",
				dataType:"html",
				data:{"idx":idx,"nickname":nickname,"content":content},
				success:function(){
					
					list();
				}
			})
		})
		
	})

	function funcdel(num, currentPage){
		//alert(num+","+currentPage);
		var y=confirm("정말 삭제하시겠습니까?");
		if(y){
			location.href="smartboard/delete.jsp?num="+num+"&currentPage="+currentPage;			
		}
	}
	
	function list(){
		
		//console.log("list num="+$("#num").val());
		$.ajax({
			type:"get",
			url:"smartanswer/listanswer.jsp",
			dataType:"json",
			data:{"num":$("#num").val()},
			success:function(res){
				
				//댓글갯수 출력
				$("b.acount>span").text(res.length);
				
				var s="";
				$.each(res, function(idx,ele){
					s+="<div>"+ele.nick+": "+ele.content;
					s+="<span class='aday'>"+ele.writeday+"</span>";
					s+="<span class='icon'><i class='bi bi-trash adel' style='color: red;' idx='"+ele.idx+"'></i>";
					s+="<i class='bi bi-pencil-square amod' style='color: green;' idx='"+ele.idx+"'></i></span>";
					s+="</div>";
				})
				
				$("div.alist").html(s);
			}
		})
	}
</script>
</head>
<%
	String num=request.getParameter("num");
	String currentPage=request.getParameter("currentPage");
	SmartDao dao=new SmartDao();
	
	//dto 내 데이터 가져오기
	SmartDto dto=dao.getData(num);
	//조회수 1증가
	dao.updateReadcount(num);
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>
<body>
	<!-- 상세페이지 적당히 만들어볼 것.. 조회수 증가 포함..맨 아래에 목록, 글쓰기, 수정, 삭제 버튼-->
	<div style="margin: 50px 100px; width: 1200px;">
	<form action="">
		<table class="table table-bordered">
			<caption align="top"><b>상세페이지</b></caption>
			<tr class="table-dark" style="text-align: center">
				<th width="100"><b>제목</b></th>
				<th width="80"><b>작성자</b></th>
				<th width="400"><b>내용</b></th>
				<th width="80"><b>작성일</b></th>
				<th width="60"><b>조회수</b></th>				
			</tr>
				
			<tr style="font-size: 12pt;">
				<td style="text-align: center" valign="middle"><%=dto.getSubject() %></td>
				<td style="text-align: center" valign="middle"><%=dto.getWriter() %></td>
				<td style="text-align: center" valign="middle"><%=dto.getContent().replace("\n", "<br>") %></td>
				<td style="text-align: center" valign="middle"><%=sdf.format(dto.getWriteday()) %></td>
				<td style="text-align: center" valign="middle"><%=dto.getReadcount() %></td>
			</tr>
			
			<tr>
				<td colspan="5" align="right">
					<button type="button" class="btn btn-success btn-sm" name="btnlist"
					onclick="location.href='index.jsp?main=smartboard/boardlist.jsp?currentPage=<%=currentPage%>'">목록</button>
					<button type="button" class="btn btn-info btn-sm" name="btnlist"
					onclick="location.href='index.jsp?main=smartboard/smartform.jsp'">글쓰기</button>
					<button type="button" class="btn btn-warning btn-sm" name="btnupdate"
					onclick="location.href='index.jsp?main=smartboard/updateform.jsp?num=<%=num%>&currentPage=<%=currentPage%>'">수정</button>
					<button type="button" class="btn btn-danger btn-sm" name="btndelete"
					onclick="funcdel(<%=num%>,<%=currentPage%>)">삭제</button>
				</td>
			</tr>
			
						<!-- 댓글 -->
			<tr>
				<td colspan="5">
					<b class="acount">댓글<span>0</span></b><br>
					
					<div class="aform d-inline-flex">
						<input type="hidden" id="num" value="<%=num%>">
						<input type="text" id="nickname" class="form-control" style="width: 100px"
						placeholder="닉네임">
						<input type="text" id="content" class="form-control" style="width: 300px"
						placeholder="댓글메세지">
						<button type="button" id="btnsend" class="btn btn-primary">저장</button>
					</div>
					
					<div class="alist">
						댓글목록
					</div>
				</td>
			</tr>
		</table>
	</form>
	</div>
	
	<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">댓글 수정</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      	<input type="hidden" id="idx">
        <input type="hidden" id="unickname" style="width: 100px;" placeholder="닉네임">
        <input type="hidden" id="ucontent" style="width: 300px;" placeholder="댓글내용">
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-warning" data-bs-dismiss="modal"
        id="btnupdate">댓글 수정</button>
      </div>

    </div>
  </div>
</div>	
</body>
</html>