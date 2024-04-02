<%@page import="java.text.NumberFormat"%>
<%@page import="data.dto.ShopDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ShopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Hahmlet:wght@100..900&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Poor+Story&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	img.photo{
	width: 200px;
	height: 230px;
	border: 1px solid gray;
	margin: 10px; 
	}
	
	.shoptable{
		padding: 10px;
		height: 150px; 
	}
	
	.goDetail{
		text-decoration: none;
		color: black;
	}
	a:hover{
		text-decoration: none;
		color: black;
	}
</style>
<script type="text/javascript">
	$(function(){
		
		$("a.goDetail").click(function(){
			var shopnum=$(this).attr("shopnum");
			//alert(shopnum);
			
			//디테일 페이지로 이동
			location.href="index.jsp?main=shop/detailpage.jsp?shopnum="+shopnum;
		})
	})
</script>
</head>
<%
	ShopDao dao=new ShopDao();
	List<ShopDto> list=dao.getAllSangs();
	NumberFormat nf=NumberFormat.getCurrencyInstance();
%>
<body>
<div class="container">

  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#tabs-total">전체</a></li>
    <li><a data-toggle="tab" href="#tabs-outer">아우터</a></li>
    <li><a data-toggle="tab" href="#tabs-top">상의</a></li>
    <li><a data-toggle="tab" href="#tabs-bottom">하의</a></li>
    <li><a data-toggle="tab" href="#tabs-set">세트</a></li>
    <li><a data-toggle="tab" href="#tabs-acc">악세서리</a></li>
  </ul>
 
  <div class="tab-content">
    <div id="tabs-total" class="tab-pane fade in active">
      <h3>전체</h3>
      <p>
      	<table class="shoptable table table-bordered" style="width: 1000px;">
      		<tr>
      			<%
      				int i=0;
      				for(ShopDto dto:list){
      					
      					//20~50까지 난수발생
      					int sale=(int)(Math.random()*31)+20;
					%>
						<td>
							<a shopnum="<%=dto.getShopnum() %>" style="cursor: pointer;" class="goDetail">
							<img alt="" src="shopsave/<%=dto.getPhoto()%>" class="photo">
							<br>
							<%=dto.getSangpum() %></a><br>
							<b style="color: red;"><%=sale%>%</b>
							<span style="float: right;">
								<div style="color: gray; font-size: 12px;">
									<%
										int price=(int)(dto.getPrice()+(dto.getPrice()*(sale/100.0)));
									%>
									<strike><%=nf.format(price) %></strike>
								</div>
								<div style="color: black">
									<%=nf.format(dto.getPrice()) %>
								</div>
							</span>
						</td> 
						
						<%
							if((i+1)%6==0){
							%>
								</tr><tr>	
							<%}
						i++;
						%>
      				<%}
      			%>
      		</tr>
      	</table>
      </p>
    </div>
    <div id="tabs-outer" class="tab-pane fade">
      <h3>아우터</h3>
      <p>
      	<table class="shoptable table table-bordered" style="width: 1000px;">
      		<tr>
      			<%
      				i=0;
      				for(ShopDto dto:list){
      					
      					if(dto.getCategory().equals("아우터")){
      					
      					//20~50까지 난수발생
      					int sale=(int)(Math.random()*31)+20;
					%>
						<td>
							<a shopnum="<%=dto.getShopnum() %>" style="cursor: pointer;" class="goDetail">
							<img alt="" src="shopsave/<%=dto.getPhoto()%>" class="photo">
							<br>
							<%=dto.getSangpum() %></a><br>
							<b style="color: red;"><%=sale%>%</b>
							<span style="float: right;">
								<div style="color: gray; font-size: 12px;">
									<%
										int price=(int)(dto.getPrice()+(dto.getPrice()*(sale/100.0)));
									%>
									<strike><%=nf.format(price) %></strike>
								</div>
								<div style="color: black">
									<%=nf.format(dto.getPrice()) %>
								</div>
							</span>
						</td>
						
						<%
							if((i+1)%6==0){
							%>
								</tr><tr>	
							<%}
						i++;}
						%>
      				<%}
      			%>
      		</tr>
      	</table>
      </p>
    </div>
    <div id="tabs-top" class="tab-pane fade">
      <h3>상의</h3>
      <p>
      	<table class="shoptable table table-bordered" style="width: 1000px;">
      		<tr>
      			<%
      				i=0;
      				for(ShopDto dto:list){
      					
      					if(dto.getCategory().equals("상의")){
      					
      					//20~50까지 난수발생
      					int sale=(int)(Math.random()*31)+20;
					%>
						<td>
							<a shopnum="<%=dto.getShopnum() %>" style="cursor: pointer;" class="goDetail">
							<img alt="" src="shopsave/<%=dto.getPhoto()%>" class="photo">
							<br>
							<%=dto.getSangpum() %></a><br>
							<b style="color: red;"><%=sale%>%</b>
							<span style="float: right;">
								<div style="color: gray; font-size: 12px;">
									<%
										int price=(int)(dto.getPrice()+(dto.getPrice()*(sale/100.0)));
									%>
									<strike><%=nf.format(price) %></strike>
								</div>
								<div style="color: black">
									<%=nf.format(dto.getPrice()) %>
								</div>
							</span>
						</td>
						
						<%
							if((i+1)%6==0){
							%>
								</tr><tr>	
							<%}
						i++;}
						%>
      				<%}
      			%>
      		</tr>
      	</table>
      </p>
    </div>
    <div id="tabs-bottom" class="tab-pane fade">
      <h3>하의</h3>
      <p>
      	<table class="shoptable table table-bordered" style="width: 1000px;">
      		<tr>
      			<%
      				i=0;
      				for(ShopDto dto:list){
      					
      					if(dto.getCategory().equals("하의")){
      					
      					//20~50까지 난수발생
      					int sale=(int)(Math.random()*31)+20;
					%>
						<td>
							<a shopnum="<%=dto.getShopnum() %>" style="cursor: pointer;" class="goDetail">
							<img alt="" src="shopsave/<%=dto.getPhoto()%>" class="photo">
							<br>
							<%=dto.getSangpum() %></a><br>
							<b style="color: red;"><%=sale%>%</b>
							<span style="float: right;">
								<div style="color: gray; font-size: 12px;">
									<%
										int price=(int)(dto.getPrice()+(dto.getPrice()*(sale/100.0)));
									%>
									<strike><%=nf.format(price) %></strike>
								</div>
								<div style="color: black">
									<%=nf.format(dto.getPrice()) %>
								</div>
							</span>
						</td>
						
						<%
							if((i+1)%6==0){
							%>
								</tr><tr>	
							<%}
						i++;}
						%>
      				<%}
      			%>
      		</tr>
      	</table>
      </p>
    </div>
    
        <div id="tabs-set" class="tab-pane fade">
      <h3>상의</h3>
      <p>
      	<table class="shoptable table table-bordered" style="width: 1000px;">
      		<tr>
      			<%
      				i=0;
      				for(ShopDto dto:list){
      					
      					if(dto.getCategory().equals("세트")){
      					
      					//20~50까지 난수발생
      					int sale=(int)(Math.random()*31)+20;
					%>
						<td>
							<a shopnum="<%=dto.getShopnum() %>" style="cursor: pointer;" class="goDetail">
							<img alt="" src="shopsave/<%=dto.getPhoto()%>" class="photo">
							<br>
							<%=dto.getSangpum() %></a><br>
							<b style="color: red;"><%=sale%>%</b>
							<span style="float: right;">
								<div style="color: gray; font-size: 12px;">
									<%
										int price=(int)(dto.getPrice()+(dto.getPrice()*(sale/100.0)));
									%>
									<strike><%=nf.format(price) %></strike>
								</div>
								<div style="color: black">
									<%=nf.format(dto.getPrice()) %>
								</div>
							</span>
						</td>
						
						<%
							if((i+1)%6==0){
							%>
								</tr><tr>	
							<%}
						i++;}
						%>
      				<%}
      			%>
      		</tr>
      	</table>
      </p>
    </div>
    
        <div id="tabs-acc" class="tab-pane fade">
      <h3>상의</h3>
      <p>
      	<table class="shoptable table table-bordered" style="width: 1000px;">
      		<tr>
      			<%
      				i=0;
      				for(ShopDto dto:list){
      					
      					if(dto.getCategory().equals("악세서리")){
      					
      					//20~50까지 난수발생
      					int sale=(int)(Math.random()*31)+20;
					%>
						<td>
							<a shopnum="<%=dto.getShopnum() %>" style="cursor: pointer;" class="goDetail">
							<img alt="" src="shopsave/<%=dto.getPhoto()%>" class="photo">
							<br>
							<%=dto.getSangpum() %></a><br>
							<b style="color: red;"><%=sale%>%</b>
							<span style="float: right;">
								<div style="color: gray; font-size: 12px;">
									<%
										int price=(int)(dto.getPrice()+(dto.getPrice()*(sale/100.0)));
									%>
									<strike><%=nf.format(price) %></strike>
								</div>
								<div style="color: black">
									<%=nf.format(dto.getPrice()) %>
								</div>
							</span>
						</td>
						
						<%
							if((i+1)%6==0){
							%>
								</tr><tr>	
							<%}
						i++;}
						%>
      				<%}
      			%>
      		</tr>
      	</table>
      </p>
    </div>
    
  </div>
</div>
</body>
</html>