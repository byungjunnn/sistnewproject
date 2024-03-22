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
<title>Insert title here</title>
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
	
	//List<SimpleBoardDto> list=dao.getAllDatas();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	//int count=list.size();
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
	<h6 align="left" style="margin-left: 100px;"><b>총<%=totalCount %>개의 글이 있습니다</b></h6>
		<%
			if(totalCount==0){
			%>
				<h6><b>등록된 게시글이 없습니다</b></h6>
			<%}else{
				for(int i=0;i<list.size();i++){
					GuestDto dto=list.get(i);
					MemberDao adao=new MemberDao();
					String id=dto.getMyid();
					String name=adao.getName(id);
					%>
					<div style="margin: 10px 100px; width: 600px; border: 2px groove gray; border-radius: 30px">
						<i class="bi bi-trash fs-4" style="color: red; float: right; margin-right: 20px"></i>
						<i class="bi bi-pencil fs-4" style="color: green; float: right; margin-right: 10px"></i>
						<br>
						<span style="margin-left: 20px;"><%=name %>(<%=dto.getMyid() %>)</span>
						<span style="float: right; margin-right: 10px"><%=sdf.format(dto.getWriteday()) %></span><br><br>
						<div class="d-inline-flex">
						<pre style="margin-left: 20px; font-family: Gowun Dodum"><%=dto.getContent() %></pre>
					<%
						if(dto.getPhotoname()==null){%>
							<b>사진없음</b></div>
						<%}else{%>
							<img src="save/<%=dto.getPhotoname() %>" width="100" style="margin-left: 350px;">
							</div>
						<%}
					%>
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
</body>
</html>