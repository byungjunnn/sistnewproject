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
	#preshow{
		position: absolute;
		left: 800px;
		top: 50px;
	}
</style>
<script type="text/javascript">
	$(function() {
		$("i.bi-camera").click(function(){
			$("#photo").trigger("click");
		})
	})
	
	function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	    	$("#preshow").attr('src', e.target.result);
	    }
	    reader.readAsDataURL(input.files[0]);
	  }
	}
</script>
</head>
<body>
<div style="margin: 50px 100px; width: 600px;">
	<form action="memberguest/guestaction.jsp" method="post" enctype="multipart/form-data">
		<table class="table table-bordered">
			<caption align="top">
				<b>방명록 등록</b>
				<i class="bi bi-camera fs-2" ></i>
				<input type="file" name="photo" id="photo" style="visibility: hidden;"
				onchange="readURL(this)">
			</caption>
			
			<tr>
				<td>
					<textarea style="width: 500px; height: 100px;"
					name="content" class="form-control"
					required="required"></textarea>
				</td>
				<td>
					<button type="submit" class="btn btn-outline-info"
					style="width: 100px; height: 100px">등록</button>
				</td>
			</tr>
		</table>
	</form>
	<img alt="" src="" id="preshow">
</div>
</body>
</html>