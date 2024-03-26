<%@page import="data.dto.AnswerGuestDto"%>
<%@page import="data.dao.AnswerGuestDao"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.GuestDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.GuestDao"%>
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
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$("span.likes").click(function(){
			var num=$(this).attr("num");
			//alert(num);
			var c=$(this);
			$.ajax({
				type:"get",
				url:"memberguest/updateincrechu.jsp",
				data:{"num":num},
				dataType:"json",
				success:function(res){
					c.next().text(res.chu);
					//c.siblings().eq(1).text(res.chu);
					c.find("i.bi-heart").removeClass("bi-heart").addClass("bi-heart-fill");
					
					//하트에 animate
					c.next().next().animate({"font-size":"20px"},1000, function(){
						//애니메이션 끝난 후
						$(this).css("font-size","0px");
					}); 
				}
			})
		})
		
		//삭제
		$("i.del").click(function(){
			var num=$(this).attr("num");
			var currentPage=$(this).attr("currentPage");
			//alert(num+","+currentPage);
			var yes=confirm("정말 삭제하시겠습니까?");
			
			if(yes){
				location.href="memberguest/delete.jsp?num="+num+"&currentPage="+currentPage;
			}
		})
		
		//댓글부분은 무조건 처음에는 안 보이게 처리
		$("div.answer").hide();
		
		//댓글 클릭 시 댓글부분이 보였다 안 보였다 하기
		$("span.answer").click(function(){
			//$("div.answer").toggle();
			$(this).parent().find("div.answer").toggle();
		})
		
		//댓글삭제
		$("i.adel").click(function(){
			var idx=$(this).attr("idx");
			//alert(idx);
			
			var yes=confirm("정말 삭제하시겠습니까?");
			if(yes){
				$.ajax({
					type:"get",
					dataType:"html",
					data:{"idx":idx},
					url:"memberguest/deleteanswer.jsp",
					success:function(){
						location.reload(); //새로고침
					}
				})
			}						
		})
		
		//수정아이콘 누르면 모달창 띄움
		$("i.aedit").click(function(){
			
			var idx=$(this).attr("idx");
			//alert(idx);
			$("#idx").val(idx);
			
			$.ajax({
				type:"get",
				dataType:"json",
				url:"memberguest/answercontent.jsp",
				data:{"idx":idx},
				success:function(res){
					$("#idx").val(res.idx);
					$("#ucontent").val(res.story);
				}
			})
		})
		
	//댓글 수정
		$("#btnupdate").click(function(){
			var idx=$("#idx").val();
			var content=$("#ucontent").val();
			
				$.ajax({
					type:"get",
					dataType:"html",
					data:{"idx":idx,"content":content},
					url:"memberguest/updateanswer.jsp",
					success:function(){
						location.reload(); //새로고침
					}
				})
		})
		
	})
</script>
</head>
<%
	GuestDao dao=new GuestDao();
	//전체갯수
	int totalCount=dao.getTotalCount();
	int perPage=3; //한페이지당 보여질 글의 갯수
	int perBlock=5; //한 블럭당 보여질 페이지 갯수
	int startNum; //db에서 가져올 글의 시작번호(mysql은 첫글이 0번, 오라클은 1번)
	int startPage; //각 블럭당 보여질 시작페이지
	int endPage; //각 블럭당 보여질 끝페이지
	int currentPage; //현재 페이지
	int totalPage; // 총 페이지
	int no; //각 페이지당 출력할 시작번호
	
	//현재 페이지 읽는데 단, null일 경우는 1페이지로 준다
	if(request.getParameter("currentPage")==null){
		currentPage=1;
	}else{
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
	}
	
	//총 페이지수 구하기
	//총 글갯수/한페이지당보여질갯수로 나눔(7/5=1)
	//나머지가 1이라도 있으면 무조건 1페이지 추가
	totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
		
	//각 블럭당 보여질 시작페이지
	//perBlock=5일 경우 현제페이지가 1~5일 경우, 시작페이지가 1, 끝페이지가 5
	//현재가 13이면, 시작:11 끝: 15
	startPage=(currentPage-1)/perBlock*perBlock+1;
	endPage=startPage+perBlock-1;
	
	//총 페이지가 23일경우 마지막블럭은 끝페이지가 25가 아니라 23
	if(endPage>totalPage){
		endPage=totalPage;
	}
	//각 페이지에서 보여질 시작번호
	//1페이지:0, 2페이지:5 3페이지:10....
	startNum=(currentPage-1)*perPage;
	
	//각 페이지당 출력할 시작번호 구하기
	//총글갯수가 23, 1페이지:23 2페이지:18 3페이지:13
	no=totalCount-(currentPage-1)*perPage;
	
	//페이지에서 보여질 글만 가져오기
	List<GuestDto> list=dao.getList(startNum, perPage);
	
	if(list.size()==0 && currentPage!=1){
		%>
		<script type="text/javascript">
			location.href="index.jsp?main=memberguest/guestlist.jsp?currentPage=<%=currentPage-1%>";
		</script>
	<%}
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>
<body>
<%
	//로그인상태 확인
	String loginok=(String)session.getAttribute("loginok");
%>

<%
	if(loginok!=null){
	%>
		<jsp:include page="guestform.jsp"/>	
		<hr width="700" align="left" style="margin-left: 100px;">
	<%}
%>
<div>
	<h6 align="left" style="margin-left: 100px;"><b>총 <%=totalCount %>개의 글이 있습니다</b></h6>
		<%
			if(totalCount==0){
			%>
				<h6><b>등록된 게시글이 없습니다</b></h6>
			<%}else{
				for(GuestDto dto:list){
					MemberDao adao=new MemberDao();
					String id=dto.getMyid();
					String name=adao.getName(id);
					String myid=(String)session.getAttribute("myid");
					%>
					<div style="margin: 10px 100px; width: 600px; border: 2px groove gray; border-radius: 30px">
					<%
						//로그인한 아이디와 글을 쓴 아이디가 같을 경우에만, 수정 삭제 보이게
						if(loginok!=null && dto.getMyid().equals(myid)){
							%>
							<i class="bi bi-trash del fs-4" style="color: red; float: right; margin-right: 20px"
							num=<%=dto.getNum() %> currentPage=<%=currentPage %>></i>
							<i class="bi bi-pencil fs-4" style="color: green; float: right; margin-right: 10px"
							onclick="location.href='index.jsp?main=memberguest/updateform.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>'"></i>
						<%}
					%>
						<br>
						<span style="margin-left: 20px;"><%=name %>(<%=dto.getMyid() %>)</span>
						<span style="float: right; margin-right: 10px"><%=sdf.format(dto.getWriteday()) %></span><br><br>
						<div class="d-inline-flex">
						<pre style="margin-left: 20px; font-family: Gowun Dodum"><%=dto.getContent() %></pre>
						<%-- <%=dto.getContent().replace("\n", "<br>") %> --%>
						
					<%
						if(dto.getPhotoname()==null){%>
							<b style="margin-left: 350px;">사진없음</b></div>
						<%}else{%>
							<a href="save/<%=dto.getPhotoname() %>" target="_blank">
							<img src="save/<%=dto.getPhotoname() %>" width="70" style="margin-left: 350px;">
							</a>
							</div>
						<%}
					
					%>
					<%
						AnswerGuestDao mdao=new AnswerGuestDao();
						List<AnswerGuestDto> alist=mdao.getAllAnswers(dto.getNum());
					%>
					
					<div style="margin: 10px 20px;">
						<span class="answer" style="cursor: pointer;">댓글 <%=alist.size() %></span>
						<span class="likes" style="margin-left: 20px; cursor: pointer;" num=<%=dto.getNum() %>>
						<i class="bi bi-heart" style="color: red"></i></span>
						<span class="chu"><%=dto.getChu() %></span>
						<i class="bi bi-heart-fill" style="font-size: 0px; color: red"></i>
						
						<div class="answer">
							<%
								if(loginok!=null){%>
									<div class="answerform">
										<form action="memberguest/answerinsert.jsp" method="post">
											<input type="hidden" name="num" value="<%=dto.getNum()%>">
											<input type="hidden" name="myid" value="<%=myid%>">
											<input type="hidden" name="currentPage" value="<%=currentPage%>">
											<table>
												<tr>
													<td width="500">
														<textarea style="width: 480px; height: 70px;"
														name="content" required="required"
														class="form-control"></textarea>
													</td>
													<td>
														<button type="submit" class="btn btn-info"
														style="width: 70px; height: 70px;">등록</button>
													</td>
												</tr>
											</table>
										</form>
									</div>
								<%}
							%>
							
							<div class="answerlist">
								<table style="width: 500px;">
									<%
										for(AnswerGuestDto mdto:alist){
										%>
											<tr>
												<td>
													<i class="bi bi-person-circle fs-3"></i>
												</td>
												<td>
													<%
														//작성자명
														String aname=adao.getName(mdto.getMyid());
													%>
													<br>
													<b><%=aname %></b>
													&nbsp;
													
													<%
														//글작성자와 댓글작성자가 같을 경우
														if(dto.getMyid().equals(mdto.getMyid())){
															%>
															<span style="color: red; font-size: 9pt; border: 1px groove red;">작성자</span>
														<%}
													%>
													<span style="font-size: 9pt; color: gray; margin-left: 20px;">
													<%=sdf.format(mdto.getWriteday()) %></span>
													
													<!-- 댓글 수정삭제는 본인만 보이게 -->
													<%
														if(loginok!=null && mdto.getMyid().equals(myid)){
															%>
															<i class="aedit bi bi-pencil-square" idx=<%=mdto.getIdx() %> data-bs-toggle="modal" data-bs-target="#myModal"></i>
													 		<i class="bi bi-trash adel" idx=<%=mdto.getIdx()%> currentPage=<%=currentPage %>></i>
														<%}
													%>
													<br>
													<span style="font-size: 10pt;"><%=mdto.getContent().replace("\n", "<br>")%></span>
												</td>
											</tr>
										<%}
									%>
								</table>
							</div>
						</div>
					</div>
</div>
				<%}
			}
		%>
	<!-- 페이지 번호 출력 -->
	<ul class="pagination justify-content-center">
	<%
		//이전
		if(startPage>1){
		%>
			<li class="page-item">
			  <a class="page-link" href="index.jsp?main=memberguest/guestlist.jsp?currentPage=<%=startPage-1%>" style="color: black">이전</a>
			</li>	
		<%}
		for(int pp=startPage;pp<=endPage;pp++){
			if(pp==currentPage){
			%>
					<li class="page-item active">
					<a class="page-link" href="index.jsp?main=memberguest/guestlist.jsp?currentPage=<%=pp%>"><%=pp%></a>
					</li>
			<%}else{
			%>	
					<li class="page-item">
					<a class="page-link" href="index.jsp?main=memberguest/guestlist.jsp?currentPage=<%=pp%>"><%=pp%></a>
					</li>
			<%}
		}
		
		//다음
		if(endPage<totalPage){
		%>
			<li class="page-item">
			<a class="page-link" href="index.jsp?main=memberguest/guestlist.jsp?currentPage=<%=endPage+1%>"
			style="color: black">다음</a>
			</li>
		<%}
	%>
	</ul>
	
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
        <div class="updateform d-inline-flex">
        	<input type="hidden" id="idx">
        	<input type="text" id="ucontent">
        	<button type="button" class="btn btn-warning" id="btnupdate"
        	style="margin-left: 10px">댓글 수정</button>
        </div>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
</body>
</html>