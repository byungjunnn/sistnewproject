function pop1(){
    window.open('../image/쇼핑몰사진/1.jpg', 'event', 'width=500, height=500');
}

function pop2(){
   newpopup=window.open('../image/logoImg/box.png', '', 'width=400, height=500') //var를 지워서 전역변수로 사용

   setTimeout('newpopup.close()', 3000); //전역변수 newpopup을 3초 뒤에 닫겠다
}