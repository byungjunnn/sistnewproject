<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ShopDao"%>
<%@page import="data.dto.CartDto"%>
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
<script type="text/javascript">
	$(function(){
		//전체체크 클릭시 체크값 얻어서 모든 체크값에 전달
		$("#allcheck").click(function(){
			
			//전체 체크값 얻기
			var chk=$(this).is(":checked");
			console.log(chk);
			
			//전체체크값을 글앞에 체크에 일괄 전달
			$(".idx").prop("checked",chk);
		})
		 
		//삭제버튼 클릭시 삭제
		$("#btncartdel").click(function(){
			
			var cnt=$(".idx:checked").length;
			//alert(cnt);
			
			if(cnt==0){
				alert("최소 1개 이상의 글을 선택해 주세요");
				return;
			}
			//체크된 곳의 value값(num)얻기
			$(".idx:checked").each(function(i,elt){
				var idx=$(this).attr("idx");
				//alert(idx);
				
				//선택한 장바구니 모두 삭제
				del(idx);
			})
			location.reload();
		})
		
		$("div.sangpum").click(function(){
			var shopnum=$(this).attr("shopnum");
			//alert(shopnum);
			location.href="index.jsp?main=shop/detailpage.jsp?shopnum="+shopnum;
		})
		
		//i태그 한 개 삭제 기능
		$("i.del").click(function(){
			var idx=$(this).attr("idx");
			//alert(idx);
			
			var a=confirm("삭제하려면 [확인]을 눌러주세요");
			if(a){
				del(idx);
				location.reload();
			}
		})
	})
	
	//사용자 함수
	function del(idx){
		$.ajax({
			type:"get",
			url:"shop/deletecart.jsp",
			dataType:"html",
			data:{"idx":idx},
			success:function(){
			}
		})
	}
</script>
<style type="text/css">
	img.photo{
		width: 60px;
		height: 100px;
		border: 2px solid gray;
	}
	
	div.sangpum{
		cursor: pointer;		
	}
</style>
</head>
<%
	String id=(String)session.getAttribute("myid");
	ShopDao dao=new ShopDao();
	List<HashMap<String, String>> list=dao.getCartList(id);
	NumberFormat nf=NumberFormat.getInstance(); //천단위 콤마 방법
%>
<body>
<h4 class="alert alert-info" style="width: 1000px;"><%=id %>님의 장바구니 <%=list.size() %>개</h4>
	<table class="table table-striped" style="width: 1000px;">
		<tr>
			<th style="width: 30px;"><input type="checkbox" id="allcheck"></th>
			<th style="width: 200px;">상품정보</th>
			<th style="width: 200px;">상품금액</th>
		</tr>
		
		<%
			int totalmoney=0;
			for(int i=0;i<list.size();i++){
				HashMap<String, String> map=list.get(i);
				
				//사진얻기
				String photo=map.get("photo");
				%>
				
				<tr>
					<td>
						<input type="checkbox" name="idx" idx="<%=map.get("idx") %>" class="idx">
					</td>
					<td>
						<!-- 페이지 넘어가려면 shopnum 가져와야함 -->
						<div class="sangpum" shopnum="<%=map.get("shopnum")%>">  
							<img src="shopsave/<%=photo%>" class="photo" align="left" hspace="20">
							<b>상품명: <%=map.get("sangpum") %></b><br>
							<b>갯수: <%=map.get("cnt") %>개</b><br>
							<b>가격: <%=map.get("price") %>원</b><br>
							<b>날짜: <%=map.get("cartday") %></b>
						</div>
					</td>
					<td valign="middle">
						<%
							int price=Integer.parseInt(map.get("price"));
							int cnt=Integer.parseInt(map.get("cnt"));
							price*=cnt;
							//int tot=price*cnt;
							
							totalmoney+=price;
							
							String str = String.format("%,d", price);  //천단위 콤마 방법
						%>
						<b><%=str %>원  <i class="bi bi-trash fs-4 del" idx="<%=map.get("idx")%>"
						style="color: red"></i></b>
					</td>
				</tr>
			<%}
		%>
		
		<tr>
			<td colspan="3" valign="middle">
				<span style="font-size: 1.5em; float: right">총 주문금액   <%=nf.format(totalmoney) %>원</span>
				<button type="button" class="btn btn-danger" style="margin-left: 100px;" id="btncartdel">선택상품 삭제</button>
			</td>
		</tr>
	</table>
</body>
</html>