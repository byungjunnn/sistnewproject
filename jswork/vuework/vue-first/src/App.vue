<template>
    <div>
        <h3>Hello Vue Start</h3>
        <!-- 선언적 렌더링 -->
        <h3>{{ message }}</h3>
        <h3 v-html="message2"></h3>

        <h3 style="color: pink;">스타일 바인딩 테스트</h3>
        <h3 v-bind:style="{color: '#ff00ff', fontSize: 40+'px'}">스타일 바인딩 테스트</h3>

        <h2 v-bind:class="{active:isActive}">클래스 바인딩 테스트</h2>
        <h2 :class="{active:isActive}">클래스 바인딩 테스트</h2>

        <button @click="change">버튼</button>
    </div>
</template>

<script>
export default {
    data () {
        

        return {
            message: '오늘은 뷰sj설치한 날',
            message2: '<span style="color:red">주의 메세지</span>',
            isActive:false
        }
    },
    methods:{
        change(){
            this.isActive=!this.isActive
        }
    }
}
</script>

<style lang="css" scoped>
    h2.active{
        color: yellowgreen;
    }
</style>