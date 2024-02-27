<template>
    <div>
        <h1 class="alert alert-info">SecondApp 입니다</h1>

        <h2>{{ counter }}</h2>
        <button @click="btnNum">증가</button>

        <h2>{{ msgs }}</h2>
        <button @click="btnMsg">메세지 증가</button>
    </div>
</template>

<script>
import { ref } from 'vue';

export default {
    setup () {
        
        const counter=ref(0);
        const btnNum=()=>{
            counter.value++;
        }

        const msgs=ref("안녕 뷰 재미있냐?");
        const btnMsg=()=>{
            msgs.value=msgs.value+"?";
        }

        return {
            counter,
            btnNum,
            msgs,
            btnMsg
        }
    }
}
</script>

<style lang="scss" scoped>

</style>