<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gowun+Dodum&family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>
<body>
	<h3 class="alert alert-info">Ex2번 예제</h3>
	<br>
	<button type="button" id="btn2" class="btn btn-info">foodlist2 Json 데이터 출력</button>
	<div id="out2"></div>
	
	<script type="text/javascript">
		$("#btn2").click(function(){
			$.ajax({
				type:"get",
				dataType:"json",
				url:"foodlist2",
				success:function(res){
					var s="";
					$.each(res, function(i,ele){
						s+="<figure>";
						s+="<img src='upload/"+ele.photo+"' width=100>";
						s+="<figcaption><b>";
						s+=ele.foodname;
						s+="</b></figcaption></figure>"
					});
					$("#out2").html(s);
				}
			})
		
		})
	</script>
</body>
</html>