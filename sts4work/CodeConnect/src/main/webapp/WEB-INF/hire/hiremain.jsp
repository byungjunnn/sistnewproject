<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
   href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gowun+Dodum&family=IBM+Plex+Sans+KR&display=swap"
   rel="stylesheet">
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
   rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
   .all {
        height: 100%;
     }
     
   .center {
      margin: 0 auto;
      width: 100%;
      height: 100%;
      max-width: 980px;
   }
   
   #wrap {
      margin-top: 100px; /* 헤더 들어갈 부분 */
      font-family: IBM Plex Sans KR;
   }
   
   span.title {
      font-size: 22pt;
      font-weight: bold;
   }   
     
   .job {
      width: 35px;
      height: 35px;
      border: 1px solid lightgray;
      cursor: pointer;
      justify-content: space-between;
      align-items: center;
      vertical-align: middle;
      border-radius: 10px;
      background-color: #fff;
   }
   
   .job i {
      font-size: 15px;
      font-weight: bold;
   }
   
   .selectbox-option{
   		overflow-x: hidden;
		overflow-y: scroll;
		display: inline-block;
		border: 1px solid gray;
		width: 400px;
		height: 200px;
		list-style: none;
		
   }
   
   .option-btn{
   		border: none;
   		background: none;
   }
   
   .category1{
   		border: 1px solid white;
   		width: 600px;
   		height: 500px;
   		margin: 100px 100px;
   		border-radius: 20px;
   		box-shadow: 0px 0px 5px 15px #fafafa;
   }
   

.selectbox, .selectbox2, .selectbox3 {
   position: relative;
}

.toggle-btn, .toggle-btn2, .toggle-btn3 {
   width: 100%;
   padding: 10px;
   border: 1px solid #ccc;
   background-color: #fff;
   cursor: pointer;
   display: flex;
   justify-content: space-between;
   align-items: center;
   border-radius: 10px;
}

.toggle-btn span, .toggle-btn2 span, .toggle-btn3 span {
   pointer-events: none;
   font-weight: bold;
   color: #696969;
   font-family: IBM Plex Sans KR;
}

.toggle-btn span.selected, .toggle-btn2 span.selected, .toggle-btn3 span.selected {
   color: black; /* 선택된 경우 검정색 */
}

.selectbox-option, .selectbox-option2, .selectbox-option3 {
   position: absolute;
   top: 100%;
   left: 0;
   width: 300px;
   height: 400px;
   border: 1px solid #ccc;
   background-color: #fff;
   margin-top: 5px;
   z-index: 1;
   list-style-type: none;
   padding: 0;
   border-radius: 10px;
   overflow: hidden;
   max-height: 400px; /* 스크롤바가 나타날 최대 높이 */
   overflow-y: auto; /* 세로 스크롤바 활성화 */
}

.selectbox-option.hide, .selectbox-option2.hide2, .selectbox-option3.hide3 {
   display: none;
}

.option-btn, .option-btn2, .option-btn3 {
   width: 100%;
   padding: 10px;
   border: none;
   background-color: #fff;
   cursor: pointer;
   text-align: left;
   font-family: IBM Plex Sans KR;
}

.option-btn:hover, .option-btn2:hover, .option-btn3:hover {
   background-color: #EDF2FD;
   width: 780px;
   border-radius: 10px;
   margin-top: 5px;
   margin-left: 5px;
   font-weight: bold;
   font-family: IBM Plex Sans KR;
}
</style>

</head>
<body>
   <div class="all">
      <div id="wrap">
         <div class="center">
            <div class="category">   
               <span class="title">개발 선택</span>
               <button class="job" type="button">
                  <i class="bi bi-chevron-down"></i>
               </button>
            </div>
         </div>
      </div>
   </div>
   
   <div class="category1">
   		<span>직무</span>
   		<div>
        <section class="selectbox">
           <ul class="selectbox-option">
              <li><button type="button" class="option-btn3">서버/백엔드
                    개발자</button></li>
              <li><button type="button" class="option-btn3">프론트엔드
                    개발자</button></li>
              <li><button type="button" class="option-btn3">웹
                    풀스택 개발자</button></li>
              <li><button type="button" class="option-btn3">안드로이드
                    개발자</button></li>
              <li><button type="button" class="option-btn3">IOS
                    개발자</button></li>
              <li><button type="button" class="option-btn3">크로스플랫폼
                    앱개발자</button></li>
              <li><button type="button" class="option-btn3">게임
                    클라이언트 개발자</button></li>
              <li><button type="button" class="option-btn3">게임
                    서버 개발자</button></li>
              <li><button type="button" class="option-btn3">DBA</button></li>
              <li><button type="button" class="option-btn3">빅데이터
                    엔지니어</button></li>
              <li><button type="button" class="option-btn3">인공지능/머신러닝</button></li>
              <li><button type="button" class="option-btn3">devops/시스템
                    엔지니어</button></li>
              <li><button type="button" class="option-btn3">정보보안
                    담당자</button></li>
              <li><button type="button" class="option-btn3">QA
                    엔지니어</button></li>
              <li><button type="button" class="option-btn3">개발
                    PM</button></li>
              <li><button type="button" class="option-btn3">HW/임베디드</button></li>
              <li><button type="button" class="option-btn3">SW/솔루션</button></li>
              <li><button type="button" class="option-btn3">웹퍼블리셔</button></li>
              <li><button type="button" class="option-btn3">VR/AR/3D</button></li>
              <li><button type="button" class="option-btn3">블록체인</button></li>
              <li><button type="button" class="option-btn3">기술지원</button></li>
           </ul>
        </section>
        </div>
        <div style="margin-top: 420px">
        	<button type="reset" class="btn btn-outline-secondary">초기화</button>
        	<button type="button" class="btn btn-primary" style="float: right;">적용</button>
        </div>
   </div>
</body>
</html>