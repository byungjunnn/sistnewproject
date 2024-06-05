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

.center2 {
   margin: 0 auto;
   width: 100%;
   height: 100%;
   max-width: 980px;
}

#wrap2 {
   padding-top: 30px;
   padding-bottom: 100px;
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
   margin-top: 3px;
   margin-left: 10px;
}

.job i {
   font-size: 15px;
   font-weight: bold;
}

.category {
   display: flex;
   align-items: center;
}

.bottomlist {
   background-color: #f6f6f6;
   width: 100%;
}

.selectbox {
   position: relative;
   width: 250px;
}

.selectbox-option {
   width: 250px;
   margin-top: 5px;
   z-index: 1;
   list-style-type: none;
   padding: 0;
   overflow: hidden;
   max-height: 350px; /* 스크롤바가 나타날 최대 높이 */
   overflow-y: auto; /* 세로 스크롤바 활성화 */
}

.option-btn {
   background: none;
   width: 100%;
   padding: 10px;
   border: none;
   cursor: pointer;
   text-align: left;
   font-family: IBM Plex Sans KR;
}

.option-btn:hover{
   background-color: #EDEDED;
   width: 210px;
   border-radius: 10px;
   margin-top: 5px;
   margin-left: 2px;
   font-weight: bold;
   font-family: IBM Plex Sans KR;
}

/* 모달 관련 */
.modal-content, .modal-header, .modal-footer, .modal-body {
    border: none;

}

.modal-body {
   padding-bottom: 0;
}

.modal-content {
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
}

.modal-backdrop {
   display: none;
}

.custom-modal-position {
    position: absolute;
    top: 160px;
    right: inherit;
    bottom: inherit;
    left: 470px;

}

.modal-dialog.modal-fullsize {
   width: 700px;
   height: 350px;
   margin: 0;
   padding: 0;
}

.modal-footer {
   padding-top: 4px;   
   justify-content: space-between;
}

.job-select{
   max-height: 350px; /* 스크롤바가 나타날 최대 높이 */
   overflow-y: auto; /* 세로 스크롤바 활성화 */
}

/* 알림창 */
.alert-message {
display: none;
            display: none;
            position: fixed;
            top: 20px;
            left: 50%;
            transform: translateX(-50%);
            background-color: rgba(0, 0, 0, 0.5); /* 검정 반투명 배경색 */
            color: #ffffff; /* 텍스트 색상 */
            padding: 10px 20px;
            border-radius: 5px;
            z-index: 1000;
            opacity: 0; /* 초기 투명도 설정 */
            transition: opacity 0.5s ease; /* 페이드아웃 효과 */
}


/* category2 */
.category2{
   letter-spacing: -0.5px;
    border-radius: 20px;
    padding: 7px 16px;
    background-color: rgb(238, 238, 238);
    font-size: 15px;
    line-height: 24px;
    border: 1px solid rgb(228, 228, 228);
    color: rgb(34, 34, 34);
    transition: transform 0.3s ease;
}

.category2-container {
    display: flex;
    align-items: center;
    overflow: hidden;
    white-space: nowrap;
    max-width: 1000px; /* 필요에 따라 조정 */
    position: relative;
}

.option {
   flex-shrink: 0;
   width: 30px;
   height: 30px;
   border: 1px solid lightgray;
   cursor: pointer;
   justify-content: center;
   align-items: center;
   border-radius: 50%;
   background-color: #fff;
   font-size: 13px;
}

.option:hover{
   background-color: black;
   color: white;
}

.option i {
   font-size: 15px;
   font-weight: bold;
}


.category3 {
   width: 70px;
   height: 35px;
   border: 1px solid lightgray;
   cursor: pointer;
   justify-content: space-between;
   align-items: center;
   vertical-align: middle;
   border-radius: 100px;
   background-color: #fff;
   font-size: 13px;
}

.category3:hover{
   border: 1px solid black;
   border-radius: 100px;
}

.category3 i {
   font-size: 15px;
   font-weight: bold;
}

/* 경력 */
.career {
    width: 300px;
    height: 300px;
    border: 1px solid lightgray;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
    background: white;
    padding: 15px 30px;
    margin-top: 5px;
}

.career_row {
    display: flex;
    justify-content: space-between; /* 좌우 정렬 */
    flex-wrap: wrap; /* 넘치는 경우 자동으로 줄 바꿈 */
}

.career_item {
    flex-basis: calc(50% - 10px); /* 아이템의 너비를 반으로 설정하고 간격을 고려해 마진 설정 */
    margin-bottom: 10px; /* 아래쪽 간격 설정 */
}

</style>
</head>
<body>
   <div class="all">
      <div id="wrap">
         <div class="center">
            <div class="category">
               <span class="title">개발 선택</span>
               <button class="job" type="button" data-bs-toggle="modal" data-bs-target="#myModal">
                  <i class="bi bi-chevron-down"></i>
               </button>
               <!-- 개발 직무 -->
               <div class="modal" id="myModal">
                 <div class="modal-dialog custom-modal-position modal-fullsize">
                   <div class="modal-content">
               
                     <!-- Modal Header -->
                     <div class="modal-header">
                       <h4 class="modal-title" style="font-weight: bold;">개발 직무</h4>
                       <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                     </div>
               
                     <!-- Modal Body -->
                     <div class="modal-body d-inline-flex">
                       <section class="selectbox">
                         <ul class="selectbox-option hide">
                           <li><button type="button" class="option-btn">서버/백엔드 개발자</button></li>
                           <li><button type="button" class="option-btn">프론트엔드 개발자</button></li>
                           <li><button type="button" class="option-btn">웹 풀스택 개발자</button></li>
                           <li><button type="button" class="option-btn">안드로이드 개발자</button></li>
                           <li><button type="button" class="option-btn">IOS 개발자</button></li>
                           <li><button type="button" class="option-btn">크로스플랫폼 앱개발자</button></li>
                           <li><button type="button" class="option-btn">게임 클라이언트 개발자</button></li>
                           <li><button type="button" class="option-btn">게임 서버 개발자</button></li>
                           <li><button type="button" class="option-btn">DBA</button></li>
                           <li><button type="button" class="option-btn">빅데이터 엔지니어</button></li>
                           <li><button type="button" class="option-btn">인공지능/머신러닝</button></li>
                           <li><button type="button" class="option-btn">devops/시스템 엔지니어</button></li>
                           <li><button type="button" class="option-btn">정보보안 담당자</button></li>
                           <li><button type="button" class="option-btn">QA 엔지니어</button></li>
                           <li><button type="button" class="option-btn">개발 PM</button></li>
                           <li><button type="button" class="option-btn">HW/임베디드</button></li>
                           <li><button type="button" class="option-btn">SW/솔루션</button></li>
                           <li><button type="button" class="option-btn">웹퍼블리셔</button></li>
                           <li><button type="button" class="option-btn">VR/AR/3D</button></li>
                           <li><button type="button" class="option-btn">블록체인</button></li>
                           <li><button type="button" class="option-btn">기술지원</button></li>
                         </ul>
                       </section>
                       <div class="job-select">
                          <div id="selected-job" style="font-size: 10pt; margin-top: 10px;"></div>
                       </div>
                     </div>
               
                     <!-- Modal Footer -->
                     <div class="modal-footer" style="float: left;">
                        <button type="button" class="btn btn-outline-light" 
                        data-bs-dismiss="modal" style="color: black; border-color: lightgray;">초기화</button>
                       <button type="button" class="btn btn-primary" data-bs-dismiss="modal" style="float: right;">적용</button>
                     </div>
                   </div>
                 </div>
               </div>
               <span id="alert-message" class="alert-message">5개 이상의 직무를 선택할 수 없습니다.</span>
            </div>
         </div>
      </div>
   </div>
<br><br>
   <div class="bottomlist">
      <div id="wrap2">
         <div class="center2">
            <button class="carreerbtn category3" type="button">
				경력 <span><i class="bi bi-chevron-down"></i></span>
			</button>

            <div class="career">
			    <div class="career_row">
			        <div class="career_item">
			            <input type="radio" class="form-check-input" style="color: green;" name="career" id="all" value="all" checked="checked"><label for="all">&nbsp;전체</label>
			        </div>
			        <div class="career_item">
			            <input type="radio" class="form-check-input" name="career" id="newbie" value="newbie"><label for="newbie">&nbsp;신입</label>
			        </div>
			        <div class="career_item">
			            <input type="radio" class="form-check-input" name="career" id="1year" value="1year"><label for="1year">&nbsp;1년</label>
			        </div>
			        <div class="career_item">
			            <input type="radio" class="form-check-input" name="career" id="2years" value="2years"><label for="2years">&nbsp;2년</label>
			        </div>
			        <div class="career_item">
			            <input type="radio" class="form-check-input" name="career" id="3years" value="3years"><label for="3years">&nbsp;3년</label>
			        </div>
			        <div class="career_item">
			            <input type="radio" class="form-check-input" name="career" id="4years" value="4years"><label for="4years">&nbsp;4년</label>
			        </div>
			    </div>
			    <div class="career_row">
			        <div class="career_item">
			            <input type="radio" class="form-check-input" name="career" id="5years" value="5years"><label for="5years">&nbsp;5년</label>
			        </div>
			        <div class="career_item">
			            <input type="radio" class="form-check-input" name="career" id="6years" value="6years"><label for="6years">&nbsp;6년</label>
			        </div>
			        <div class="career_item">
			            <input type="radio" class="form-check-input" name="career" id="7years" value="7years"><label for="7years">&nbsp;7년</label>
			        </div>
			        <div class="career_item">
			            <input type="radio" class="form-check-input" name="career" id="8years" value="8years"><label for="8years">&nbsp;8년</label>
			        </div>
			        <div class="career_item">
			            <input type="radio" class="form-check-input" name="career" id="9years" value="9years"><label for="9years">&nbsp;9년</label>
			        </div>
			        <div class="career_item">
			            <input type="radio" class="form-check-input" name="career" id="10years" value="10years"><label for="10years">&nbsp;10년 이상</label>
			        </div>
			    </div>
			   	<hr style="margin-top: 5px;">
			    <div>
			    	<button type="button" class="btn btn-outline-light btnreset"
			    	style="color: black;border: 1px solid lightgray;">초기화</button>
			    </div>
			</div>
            
            <button class="category3" type="button">
               지역 <i class="bi bi-chevron-down"></i>
            </button>
            <br><br>
            <div class="category2-wrapper" style="display: flex; align-items: center;">
               <button class="option" type="button">
                  <i class="bi bi-chevron-left"></i>
               </button>
               <div class="category2-container">
               &nbsp;&nbsp;
                  <button aria-pressed="false" tabindex="-1" class="category2" style="display: inline-block;">🍯 4.5일제</button>&nbsp;
                  <button aria-pressed="false" tabindex="-1" class="category2" style="display: inline-block;">🏠 재택근무</button>&nbsp;
                  <button aria-pressed="false" tabindex="-1" class="category2" style="display: inline-block;">⏰ 유연근무제</button>&nbsp;
                  <button aria-pressed="false" tabindex="-1" class="category2" style="display: inline-block;">🕙 시차출근제</button>&nbsp;
                  <button aria-pressed="false" tabindex="-1" class="category2" style="display: inline-block;">💵 인센티브</button>&nbsp;
                  <button aria-pressed="false" tabindex="-1" class="category2" style="display: inline-block;">👾 코드리뷰</button>&nbsp;
                  <button aria-pressed="false" tabindex="-1" class="category2" style="display: inline-block;">👖 반바지/슬리퍼 OK</button>&nbsp;
                  <button aria-pressed="false" tabindex="-1" class="category2" style="display: inline-block;">👕 자유복장</button>&nbsp;
                  <button aria-pressed="false" tabindex="-1" class="category2" style="display: inline-block;">☕ 맛있는간식냠냠</button>&nbsp;
                  <button aria-pressed="false" tabindex="-1" class="category2" style="display: inline-block;">💻 맥북으로개발</button>&nbsp;
                  <button aria-pressed="false" tabindex="-1" class="category2" style="display: inline-block;">👩‍ 닉네임사용</button>&nbsp;
                  <button aria-pressed="false" tabindex="-1" class="category2" style="display: inline-block;">🙌 수평적조직</button>&nbsp;
                  <button aria-pressed="false" tabindex="-1" class="category2" style="display: inline-block;">🐶 반려동물</button>&nbsp;
                  <button aria-pressed="false" tabindex="-1" class="category2" style="display: inline-block;">💰 누적투자금100억이상</button>&nbsp;
                  <button aria-pressed="false" tabindex="-1" class="category2" style="display: inline-block;">📈 스톡옵션제공</button>&nbsp;
                  <button aria-pressed="false" tabindex="-1" class="category2" style="display: inline-block;">📗 도서구입비지원</button>&nbsp;
                  <button aria-pressed="false" tabindex="-1" class="category2" style="display: inline-block;">🚕 택시비지원</button>&nbsp;
                  <button aria-pressed="false" tabindex="-1" class="category2" style="display: inline-block;">👨 병역특례</button>&nbsp;
                  <button aria-pressed="false" tabindex="-1" class="category2" style="display: inline-block;">🎓 전공우대</button>&nbsp;&nbsp;
               </div>
               <button class="option" type="button">
                  <i class="bi bi-chevron-right"></i>
               </button>
            </div>
         </div>
      </div>
   </div>


<!-- 직무 선택 -->
<script type="text/javascript">
$(".career").hide();
/* 직무 select */
document.addEventListener('DOMContentLoaded', function() {
   const toggleBtn = document.querySelector('.toggle-btn');
   const selectBox = document.querySelector('.selectbox-option');
   const options = document.querySelectorAll('.option-btn');
   const toggleText = document.querySelector('.toggle-btn span');

   toggleBtn.addEventListener('click', function() {
      selectBox.classList.toggle('hide');
   });

   options.forEach(function(option) {
      option.addEventListener('click', function() {
         toggleText.textContent = this.textContent;
         toggleText.classList.add('selected');
         selectBox.classList.add('hide');
      });
   });

   document.addEventListener('click', function(event) {
      if (!selectBox.parentElement.contains(event.target)) {
         selectBox.classList.add('hide');
      }
   });
});

/* 직무 표시하기 */
 document.addEventListener('DOMContentLoaded', function() {
            const selectOptions = document.querySelectorAll('.option-btn');
            const selectedJobsContainer = document.getElementById('selected-job');
            const alertMessage = document.getElementById('alert-message');

            selectOptions.forEach(function(option) {
                option.addEventListener('click', function() {
                    const jobText = this.textContent;
                    addSelectedJob(jobText);
                });
            });

            function showAlert(message) {
                alertMessage.textContent = message;
                alertMessage.style.display = 'block';
                alertMessage.style.opacity = 1;

                setTimeout(function() {
                    alertMessage.style.opacity = 0;
                    setTimeout(function() {
                        alertMessage.style.display = 'none';
                    }, 500); // 페이드아웃 시간과 동일하게 설정
                }, 3000); // 3초 후에 페이드아웃 시작
            }

            function addSelectedJob(jobText) {
                const selectedJobs = selectedJobsContainer.getElementsByClassName('selected-job');
                if (selectedJobs.length >= 5) {
                    showAlert('5개 이상의 직무를 선택할 수 없습니다.');
                    return;
                }
                
                const jobElement = document.createElement('div');
                jobElement.className = 'selected-job';
                jobElement.style.display = 'inline-block';
                jobElement.style.marginLeft = '6px';
                jobElement.style.marginRight = '10px';
                jobElement.style.marginBottom = '5px';
                jobElement.style.border = '1px solid #ccc';
                jobElement.style.backgroundColor = '#fafafa';
                jobElement.style.padding = '6px';
                jobElement.style.borderRadius = '15px';
                jobElement.style.fontWeight = 'bold';
                jobElement.style.paddingLeft = '8px';
                
                const jobTextElement = document.createElement('span');
                jobTextElement.textContent = jobText;

                const removeButton = document.createElement('button');
                removeButton.innerHTML = '<i class="bi bi-x-lg"></i>';
                removeButton.style.marginLeft = '10px';
                removeButton.style.border = 'none';
                removeButton.style.background = 'none';
                removeButton.style.color = 'red';
                removeButton.style.cursor = 'pointer';

                removeButton.addEventListener('click', function() {
                    selectedJobsContainer.removeChild(jobElement);
                });

                jobElement.appendChild(jobTextElement);
                jobElement.appendChild(removeButton);
                selectedJobsContainer.appendChild(jobElement);
            }
        });
        
 /* 카테고리2 슬라이드 기능 */
document.addEventListener('DOMContentLoaded', function() {
    const category2Container = document.querySelector('.category2-container');
    const leftButton = document.querySelector('.bi-chevron-left').parentElement;
    const rightButton = document.querySelector('.bi-chevron-right').parentElement;
    let scrollPosition = 0;
    const scrollAmount = 500; // 스크롤 이동 거리 조정 가능

    rightButton.addEventListener('click', function() {
        const maxScroll = category2Container.scrollWidth - category2Container.clientWidth;
        if (scrollPosition < maxScroll) {
            scrollPosition += scrollAmount;
            category2Container.scrollTo({
                top: 0,
                left: scrollPosition,
                behavior: 'smooth'
            });
        }
    });

    leftButton.addEventListener('click', function() {
        if (scrollPosition > 0) {
            scrollPosition -= scrollAmount;
            category2Container.scrollTo({
                top: 0,
                left: scrollPosition,
                behavior: 'smooth'
            });
        }
    });
});
 
/* 경력 버튼 이벤트 */
$(".carreerbtn").click(function(){
	$(".career").toggle();
})

$(".btnreset").click(function(){
	// 모든 input 요소의 체크 상태를 해제
    $("input[type='radio']").prop('checked', false);
    // "전체" 항목을 선택
    $("#all").prop('checked', true);
 	// "경력" 버튼 내용을 원래대로 돌려놓기
    $(".carreerbtn").html('경력 <span><i class="bi bi-chevron-down"></i></span>').css('width','70px');
})

$('input[name="career"]').change(function() {
    // 선택된 경력 텍스트 가져오기
    var selectedCareer = $('input[name="career"]:checked').next().text().trim();
    // 경력 버튼 텍스트 업데이트
    $('.carreerbtn').html('경력 <span style="color: blue;">' + selectedCareer + '</span> <span class="bi bi-chevron-down" style="vertical-align: middle;font-size: 15px;font-weight: bold;"></span>');
    // 버튼 너비 조정
    $('.carreerbtn').css('width', 'auto');
});

</script>
</body>
</html>