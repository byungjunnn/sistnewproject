<%@page import="java.text.NumberFormat"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.ShopDto"%>
<%@page import="data.dao.ShopDao"%>
<%@page import="org.apache.el.parser.AstDiv"%>
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
<style type="text/css">
	img.large{
		width: 400px;
		height: 500px;
	}
</style>
</head>
<%
	String shopnum=request.getParameter("shopnum");
	String loginok=(String)session.getAttribute("loginok");
	String myid=(String)session.getAttribute("myid");
	
	MemberDao mdao=new MemberDao();
	String num=mdao.getNum(myid);
	
	//해당상품에 대한 데이터 가져오기
	ShopDao sdao=new ShopDao();
	ShopDto dto=sdao.getData(shopnum);
	
	NumberFormat nf=NumberFormat.getCurrencyInstance();
%>

<script type="text/javascript">
	$(function(){
		
		$("#btncart").click(function(){
			
			//로그인 되어있는지 확인
			var login="<%=loginok%>";
			
			if(login=="null"){
				alert("로그인을 해주세요");
				return;
			}
			
			//form태그 가져오기
			var cartdata=$("#frm").serialize();
			//alert(cartdata);
			
			//insert
			$.ajax({
				type:"post",	
				url:"shop/detailprocess.jsp",
				dataType:"html",
				data:cartdata,
				success:function(){
					//alert("success");
					
					var a=confirm("장바구니에 저장하였습니다\n장바구니로 이동하려면 [확인]을 눌러주세요");
					
					if(a){
						location.href="index.jsp?main=shop/mycart.jsp";
					}
				}
				
			})
		})
	});
</script>
<body>
<div style="margin: 50px 100px; width: 800px;">
	<form id="frm">
		<!-- hidden 장바구니 db에 넣어야 할 것 -->
		<input type="hidden" name="shopnum" value="<%=shopnum%>">
		<input type="hidden" name="num" value="<%=num%>">
		
		<table class="table table-bordered">
			<caption align="top"><b>상세페이지</b></caption>
			<tr>
				<td style="width: 500px;" rowspan="1" align="center"><img src="shopsave/<%=dto.getPhoto() %>"
				class="large img-thumbnail"></td>
				<td style="width: 300px;">
					<h4>카테고리: <%=dto.getCategory() %></h4><br>
					<h4>상품명: <%=dto.getSangpum() %></h4><br>
					<h4>가격: <%=nf.format(dto.getPrice()) %></h4><br>
					<!-- 갯수 -->
					<h4 class="d-inline-flex">갯수: 
						<input type="number" min="1" max="10" value="1"
						step="1" name="cnt" class="form-control" style="width: 100px;">
					</h4><br>
					
					<div style="margin-top: 100px;margin-left: 60px;">
						<button type="button" class="btn btn-primary" id="btncart">장바구니</button>
						<button type="button" class="btn btn-success"
						onclick="location.href='index.jsp?main=shop/shoplist.jsp'">상품목록</button>
					</div>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>