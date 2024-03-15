<%@page import="java.text.SimpleDateFormat"%>
<%@page import="simpleboard.model.SimpleBoardDao"%>
<%@page import="simpleboard.model.SimpleBoardDto"%>
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
<title>Insert title here</title>
<style type="text/css">
	body *{
		font-family: 'Nanum Pen Script';
		font-size: 15pt;
	}
	
	span.day{
		color: #ccc;
		font-size: 0.8em;
	}
	
	span.aday{
		float: right;
		font-size: 0.8em;
		color: #bbb;
	}
	div.alist{
		margin-left: 20px;
	}
	i.amod{
		margin-left: 20px;
		color: green;
		cursor: pointer;
	}
	
	i.adel{
		color: red;
		cursor: pointer;
	}
</style>
<script type="text/javascript">
	$(function(){
		
		list();
		//댓글 저장
		$("#btnsend").click(function(){
			var num=$("#num").val();
			var nickname=$("#nickname").val().trim();
			var content=$("#content").val().trim();
			var s="num="+num+"&nickname="+nickname+"&content="+content;
			
			if(nickname==''){
				alert("닉네임을 입력 후 저장해주세요")
				return;
			}if(content==''){
				alert("댓글내용을 입력 후 저장해주세요");
				retun;
			}
			//ajax로 insert
			//alert(num);
			$.ajax({
				type:"post",
				url:"../simpleboardanswer/insertAnswer.jsp",
				dataType:"html",
				data:s,
				//data:{"num":num,"nickname":nickname,"content":content},
				success:function(){
					$("#nickname").val("");
					$("#content").val("");
					list();
				}
			})
		})
		
		//댓글 삭제
		$(document).on("click",".adel",function(){
			var idx=$(this).attr("idx");
			//alert(idx);
			var ans=confirm("댓글을 삭제하려면 [확인]을 눌러주세요");
			if(ans){
				$.ajax({
					type:"get",
					url:"../sim pleboardanswer/deleteAnswer.jsp",
					dataType:"html",
					data:{"idx":idx},
					success:function(){
						alert("삭제되었습니다");
						list();
					}
				})
			}
		})
	})
	
	function list(){
		console.log("list num="+$("#num").val());
		
		$.ajax({
			type:"get",
			url:"../simpleboardanswer/listAnswer.jsp",
			dataType:"json",
			data:{"num":$("#num").val()},
			success:function(res){
				
				//댓글갯수
				$("b.acount>span").text(res.length);
				
				var s="";
				$.each(res,function(idx, ele){
					
					s+="<div>"+ele.nickname+": "+ele.content;
					s+="<span class='aday'>"+ele.writeday+"</span>";
					s+="<i class='bi bi-vector-pen amod' idx='"+ele.idx+"'></i>";
					s+="<i class='bi bi-trash3 adel' idx='"+ele.idx+"'></i>";
				})
				$("div.alist").html(s);
			}
			
		})
	}
</script>
</head>
<%
	String num=request.getParameter("num");
	SimpleBoardDao dao=new SimpleBoardDao();
	//dto
	SimpleBoardDto dto=dao.getContent(num);
	//조회수 증가
	dao.updateReadCount(num);
	//날짜
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm");
%>

<input type="hidden" id="num" value="<%=num%>">

<body>
	<div style="margin: 50px 100px; width: 500px;">
		<table class="table table-bordered">
			<caption align="top"><b style="font-size: 20pt;"><%=dto.getSubject() %></b></caption>
			<tr>
				<td>
					<b>작성자: <%=dto.getWriter() %></b><br>
					<span class="day"><%=sdf.format(dto.getWriteday()) %></span>
					&nbsp;&nbsp;&nbsp;&nbsp;조회: <%=dto.getReadcount() %>
				</td>
			</tr>
			<tr height="250">
				<td>
					<%=dto.getContent().replace("\n", "<br>") %>
				</td>
			</tr>
			
			<!-- 댓글부분 -->
			<tr>
				<td>
					<b class="acount">댓글 <span>0</span></b>
					<div class="alist">
						댓글목록
					</div>
					<div class="aform input-group">
						<input type="text" id="nickname" class="form-control"
						style="width: 100px;" placeholder="닉네임">
						<input type="text" id="content" class="form-control"
						style="width: 300px; margin-left: 10px" placeholder="댓글메세지">
						
						<button type="button" id="btnsend"
						class="btn btn-info btn-sm" style="margin-left: 10px">저장</button>
					</div>
				</td>
			</tr>
			
			<tr>
				<td align="right">
					<button type="button" class="btn btn-outline-info btn-sm"
					onclick="location.href='addform.jsp'"><i class="bi bi-pencil"></i>  글쓰기</button>
					<button type="button" class="btn btn-outline-success btn-sm"
					onclick="location.href='boardlist.jsp'"><i class="bi bi-card-list"></i>  목록</button>
					<button type="button" class="btn btn-outline-warning btn-sm"
					onclick="location.href='updatepassform.jsp?num=<%=dto.getNum()%>'">
					<i class="bi bi-vector-pen"></i>  수정</button>
					<button type="button" class="btn btn-outline-danger btn-sm"
					onclick="location.href='deletepassform.jsp?num=<%=dto.getNum()%>'">
					<i class="bi bi-trash3"></i>  삭제</button>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>