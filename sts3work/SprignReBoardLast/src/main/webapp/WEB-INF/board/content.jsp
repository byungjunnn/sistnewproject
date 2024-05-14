<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gowun+Dodum&family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<title>Insert title here</title>
<style type="text/css">
	#answer{
		margin-left: 20px;
		padding: 10px 20px;
		font-size: 0.8em;
	}
</style>
<script type="text/javascript">
	$(function(){
		
		$("i.adel").click(function(){
			var idx=$(this).attr("idx");
			//alert(idx);
			
			//비번입력
			var pass=prompt("비밀번호를 입력해 주세요");
			//alert(pass);
			
			if(pass==null){
				return; //취소 누르면 함수 종료
			}
			
			$.ajax({
				type:"get",
				dataType:"json",
				url:"adelete", //같은 폴더에서 할 경우 뒤에 주소값만
				data:{"idx":idx,"pass":pass},
				success:function(res){
					if(res.check==0){
						alert("비밀번호가 맞지않습니다");
					}else{
						alert("댓글 삭제합니다");
						location.reload(); //새로고침
					}
				}
			})
		})
	});
</script>
</head>
<body>
<div style="margin: 100px 100px; width: 600px;">
	<table class="table table-bordered">
		<caption align="top"><b>내용보기</b></caption>
		<tr>
			<td>
				<h3><b>${dto.subject }</b></h3>
				<span style="color:gray; float: right; margin-right: 20px;">조회  ${dto.readcount }&nbsp;&nbsp;&nbsp;&nbsp;
					<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/>
				</span>
				<br>
				<h6>작성자  ${dto.writer }</h6>
			</td>
		</tr>
		<tr>
			<td>
				<pre>${dto.content }</pre>
				<br><br>
				<c:if test="${dto.photo!='no' }">
					<c:forTokens var="im" items="${dto.photo }" delims=",">
							<a href="../photo/${im }">
								<img src="../photo/${im }" style="width: 100px;">
							</a>
					</c:forTokens>
				</c:if>
			</td>
		</tr>
		
		<tr>
			<td>
				<div id="answer">
				<b>댓글 ${acount }</b><br><br>
				<c:forEach var="a" items="${alist }">
					${a.nickname }: ${a.content }
					&nbsp;&nbsp;
					<span style="color: gray;font-size: 0.8em;">
						<fmt:formatDate value="${a.writeday }"/>
					</span>
					&nbsp;
					<i class="bi bi-pencil-square"></i>
					<i class="adel bi bi-trash" idx="${a.idx }"></i><br>
				</c:forEach>
				</div>
				<form action="ainsert" method="post">
					<input type="hidden" name="num" value="${dto.num }">
					<input type="hidden" name="currentPage" value="${currentPage }">
					<div class="d-inline-flex">
						<b>닉네임: </b>
						<input type="text" name="nickname" class="form-control"
						style="width: 100px;" required="required">
						<b>비밀번호: </b>
						<input type="password" name="pass" class="form-control"
						style="width: 100px;" required="required"
						onclick="">
					</div>
					<br><br>
					<div class="d-inline-flex">	
						<input type="text" name="content" class="form-control"
						style="width: 500px;" required="required" placeholder="댓글내용을 입력해주세요">
						<button type="submit" class="btn btn-outline-info">확인</button>
					</div>
				</form>
			</td>
		</tr>
		
		<tr>
			<td align="right">
				<button type="button" class="btn btn-outline-dark"
				onclick="location.href='writeform'">글쓰기</button>
				<button type="button" class="btn btn-outline-dark"
				onclick="location.href='writeform?num=${dto.num}&regroup=${dto.regroup }&restep=${dto.restep }&relevel=${dto.relevel }&currentPage=${currentPage }'">답글</button>
				<button type="button" class="btn btn-outline-info"
				onclick="location.href='list?currentPage=${currentPage}'">목록</button>
				<button type="button" class="btn btn-outline-warning"
				onclick="location.href='updatepassform?num=${dto.num}&currentPage=${currentPage }'">수정</button>
				<button type="button" class="btn btn-outline-danger"
				onclick="location.href='deletepassform?num=${dto.num}&currentPage=${currentPage }'">삭제</button>
			</td>
		</tr>
	</table>
</div>
</body>
</html>