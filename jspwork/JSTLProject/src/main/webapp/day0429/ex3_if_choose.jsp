<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Hahmlet:wght@100..900&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Poor+Story&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
	<fmt:requestEncoding value="utf-8"/>
	
	<form action="ex3_if_choose.jsp" method="post">
		<table class="table table-bordered" style="width: 300px;">
			<tr>
				<th class="table-light">이름</th>
				<td>
					<input type="text" name="name" class="form-control"
					style="width: 120px;">
				</td>
			</tr>
			<tr>
				<th class="table-light">나이</th>
				<td>
					<input type="text" name="age" class="form-control"
					style="width: 120px;">
				</td>
			</tr>
			<tr>
				<th class="table-light">부서</th>
				<td>
					<input type="text" name="buseo" class="form-control"
					style="width: 150px;">
				</td>
			</tr>
			<tr>
				<th class="table-light">급여</th>
				<td>
					<input type="text" name="pay" class="form-control"
					style="width: 200px;">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-danger">결과확인</button>
				</td>
			</tr>
		</table>
	</form>
	
	
	<!-- 이름을 입력했을 경우에만 출력 -->
	<c:if test="${!empty param.name }">
		<h3>이름: ${param.name }님</h3>
		<h3>나이: ${param.age }세(
		
			<c:if test="${param.age>=20 }">
				<h3>성인</h3>
			</c:if>
			<c:if test="${param.age<20 }">
				<h3>미성년자</h3>
			</c:if>
		)</h3><br>
		
		<h3>월급여: <fmt:formatNumber value="${param.pay }" type="currency"/></h3>
		<h3>부서: ${param.buseo }</h3>
		<c:choose>
			<c:when test="${param.buseo=='기획부' }">
				기획부
			</c:when>
			<c:when test="${param.buseo=='경영관리부' }">
				경영관리부
			</c:when>
			<c:when test="${param.buseo=='디자인부' }">
				디자인부
			</c:when>
			<c:otherwise>
				<h3>${param.buseo }는 저희 회사에 없네요</h3>
			</c:otherwise>
		</c:choose>
		
	</c:if>
</body>
</html>