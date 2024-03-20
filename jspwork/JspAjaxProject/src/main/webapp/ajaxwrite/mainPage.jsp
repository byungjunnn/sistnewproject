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
	div.board{
		position: absolute;
		left: 20%;
		top: 20%;
		font-family:'Gowun Dodum';
		font-size: 1.2em;
	}
	
	div.list{
		width: 800px;
	}
	
	.detail{
		cursor: pointer;
	}
</style>
<script type="text/javascript">
	$(function(){
		
		$("div.addform").hide();
		$("div.updateform").hide();
		$("div.detailview").hide();
		
		list();
		
		//이미지 선택시
		$("#selimage").change(function(){
			var im=$(this).val();
			
			//이미지명을 현재값에 넣기
			$("#image").val(im);
			
			//아래 이미지뷰에 추가로 이미지가 보이게
			var s="<img src='"+im+"' width='50'>";
			$("#imgview").html(s);
		})
		
		//글쓰기 버튼 누르면 입력폼 나오게
		$(document).on("click",".addbtn", function(){
			$("div.list").hide();
			$("div.addform").show();
			
			
		})
		
		//추가
		$("#btninsert").click(function(){
			var s=$("#addfrm").serialize();
			//alert(s);
			$.ajax({
				type:"post",
				url:"insertWrite.jsp",
				dataType:"html",
				data:s,
				success:function(){
					
					list();
					
					$("#writer").val("");
					$("#subject").val("");
					$("#story").val("");
					$("#image").val("");
					
					$("#imgview").empty();
					
					$("div.addform").hide();
					$("div.list").show();
				}
			})
		})
		
		//디테일 페이지
		$(document).on("click","td.detail",function(){
			var num=$(this).attr("num");
			//alert(num);
			$.ajax({
				type:"get",
				url:"getDataWrite.jsp",
				dataType:"json",
				data:{"num":num},
				success:function(res){
					
					$("span.title").html(res.subject);
					$("span.day").html(res.writeday);
					$("span.writer").html(res.writer);
					$("div.story").html("<pre>"+res.story+"</pre>");
					$("div.image").html("<img src='"+res.image+"'>");
					$(".deletebtn").attr("num",res.num);
					$("div.list").hide();
					$("div.detailview").show();
				}
			})
		})
		
		$(document).on("click","button.addbtn",function(){
			$("div.detailview").hide();
		})
		
		//삭제
		$(".deletebtn").click(function(){
			var num=$(this).attr();
			
		})
		
	})
	
	function list(){
		$.ajax({
			type:"get",
			url:"listWrite.jsp",
			dataType:"json",
			success:function(res){
				
				//alert(res.length);
				
				var s="";
				s+="<table class='board table table-bordered'>";	
				s+="<caption align='top'><button type='button' class='btn btn-dark addbtn'>";
				s+="<i class='bi bi-pencil'></i> 글쓰기</button></caption>";
				s+="<tr class='table-light'>";
				s+="<td width='100' align='center'>번호</td>";
				s+="<td width='300' align='center'>제목</td>";
				s+="<td width='150' align='center'>작성자</td>";
				s+="<td width='200' align='center'>작성일</td>";
				s+="<td width='100' align='center'>추천</td>";
				s+="</tr>"
				
				var n=res.length;
				if(n==0){
					s+="<tr>";
					s+="<td colspan='5' align='center'>";
					s+="<b>게시된 글이 없습니다</b></td></tr>";
				}else{
					$.each(res, function(i, ele){
						//출력
						s+="<tr>"
						s+="<td align=center>"+(i+1)+"</td>";
						s+="<td align=center num='"+ele.num+"' class='detail'>"+ele.subject+"</a></td>";
						s+="<td align=center>"+ele.writer+"</td>";
						s+="<td align=center>"+ele.writeday+"</td>";
						s+="<td align=center>"+ele.likes+"</td>";
						s+="</tr>";
					})
				}
				s+="</table>";
				
				$("div.list").html(s);
			}
		})
		
	}
</script>
</head>
<body>
	<!-- 추가폼 -->
	<div class="board addform" style="margin: 50px 100px; width: 400px">
		<form id="addfrm">
			<table class="table table-bordered">
				<caption align="top"><b>😊글쓰기😊</b></caption>
				<tr>
					<th width="100" class="table-dark" style="text-align: center" valign="middle">작성자</th>
					<td>
						<input type="text" name="writer" id="writer"
						class="form-control" required="required" style="width: 130px">
					</td>
				</tr>
				
				<tr>
					<th width="100" class="table-dark" style="text-align: center" valign="middle">제목</th>
					<td>
						<input type="text" name="subject" id="subject"
						class="form-control" required="required" style="width: 250px">
					</td>
				</tr>
				
				<tr>
					<th width="100" class="table-dark" style="text-align: center" valign="middle">내용</th>
					<td>
						<textarea style="width: 300px; height: 100px;"
						name="story" id="story" required="required"
						class="form-control"></textarea>
					</td>
				</tr>
				
				<tr>
					<th width="100" class="table-dark" style="text-align: center" valign="middle">이미지</th>
					<td>
						<input type="hidden" name="image" id="image" width="100%">
						<select id="selimage" style="width: 100px;" class="form-control">
							<option value="../image/avata/b1.png">사랑해</option>
							<option value="../image/avata/b2.png">우울함</option>
							<option value="../image/avata/b5.png">배고파</option>
							<option value="../image/avata/b6.png">좌절</option>
							<option value="../image/avata/b10.png">심심해</option>
							<option value="../image/avata/b8.png">최고</option>
						</select><br>
						<div id="imgview"></div>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="button" class="btn btn-success" id="btninsert">DB추가</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div class="board updateform" style="margin: 50px 100px; width: 400px">
		<form id="updatefrm">
			<table class="table table-bordered">
				<caption align="top"><b>😊글 수정😊</b></caption>
				<tr>
					<th width="100" class="table-dark" style="text-align: center" valign="middle">작성자</th>
					<td>
						<input type="text" name="uwriter" id="uwriter"
						class="form-control" required="required" style="width: 130px">
					</td>
				</tr>
				
				<tr>
					<th width="100" class="table-dark" style="text-align: center" valign="middle">제목</th>
					<td>
						<input type="text" name="usubject" id="usubject"
						class="form-control" required="required" style="width: 250px">
					</td>
				</tr>
				
				<tr>
					<th width="100" class="table-dark" style="text-align: center" valign="middle">내용</th>
					<td>
						<textarea style="width: 300px; height: 100px;"
						name="ustory" id="ustory" required="required"
						class="form-control"></textarea>
					</td>
				</tr>
				
				<tr>
					<th width="100" class="table-dark" style="text-align: center" valign="middle">이미지</th>
					<td>
						<input type="hidden" name="uimage" id="uimage" width="100%">
						<select id="uselimage" style="width: 100px;" class="form-control">
							<option value="../image/avata/b1.png">사랑해</option>
							<option value="../image/avata/b2.png">우울함</option>
							<option value="../image/avata/b5.png">배고파</option>
							<option value="../image/avata/b6.png">좌절</option>
							<option value="../image/avata/b10.png">심심해</option>
							<option value="../image/avata/b8.png">최고</option>
						</select><br>
						<div id="uimgview"></div>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="button" class="btn btn-warning" id="btnupdate">DB수정</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<div class="board list">목록</div>
	
	<div class="board detailview">
	<input type="hidden" name="num" id="num" value=""> 
		<table class="story table table-bordered" style="width: 600px">
			<caption align="top"><b>게시글 확인</b></caption>
			<tr>
				<td>
					<span class="title">제목</span>
					<span class="day" style="float: right">날짜</span>
				</td>		
			</tr>
			<tr>
				<td>
					<span class="writer">작성자</span>
					<span class="likes" style="float: right">
					<i class="bi bi-suit-heart-fill" style="color: red;"></i>
						<span class="su">0</span>
					</span>
				</td>
			</tr>
			<tr>
				<td style="height: 200px;" valign="top">
					<div class="story">내용</div>
					<div class="image">이미지</div>
				</td>		
			</tr>
			
			<tr>
				<td>
					<button type="button" class="deletebtn btn btn-outline-danger btn-sm"
					style="float: right; margin-left: 10px">삭제</button>
					<button type="button" class="updatebtn btn btn-outline-warning btn-sm"
					style="float: right; margin-left: 10px">수정</button>
					<button type="button" class="addbtn btn btn-outline-success btn-sm"
					style="float: right; margin-left: 10px">글쓰기</button>
					<button type="button" class="btn btn-outline-info btn-sm" style="float: right; margin-left: 10px"
					onclick="location.href='mainPage.jsp'">목록</button>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>