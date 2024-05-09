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
	<h3 class="alert alert-info">Ex3번 예제</h3>
	<br>
	<h4>메뉴이름을 입력 후 엔터를 눌러주세요</h4>
	<input type="text" id="search" class="form-control" style="width: 150px;"></input>
	<br><br>
	<h2 id="fname"></h2>
	<img src="" id="photo">
	
	<script type="text/javascript">
		$("#search").keyup(function(e){
			if(e.keyCode==13){
				var foodname=$(this).val();
				
				$.ajax({
					type:"get",
					dataType:"json",
					url:"foodlist3",
					data:{"foodname":foodname},
					success:function(res){
						$("#fname").text(res.foodname);
						$("#photo").attr("src","upload/"+res.photo);
						$("#search").val('');
					}
				})
			}
		})
	</script>
</body>
</html>