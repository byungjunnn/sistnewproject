<template>
  <div class="menu">
    <!-- <a v-for="header in 3" :key="header">home</a> -->
    <a v-for="menu in menus" :key="menu">{{ menu }}</a>
  </div>

  <div class="celeb" v-for="(agency,key) in agencys" :key="key">
    <img :src="agency.imgSrc">
    <h3>{{ agency.name }}</h3>
    <p>{{ agency.company }}</p>
    <button @click="onClickLikes(key)">좋아요</button>
    <span>좋아요:{{ agency.likes }}</span>
  </div>
  <!-- <div class="celeb">
    <img src="@/assets/images/5.jpg">
    <h3>{{ celeb[1] }}</h3>
    <p>소속사: SM</p>
    <button @click="likes++">좋아요</button>
    <span>좋아요:{{ likes }}</span>
  </div>
  <div class="celeb">
    <img src="@/assets/images/12.jpg">
    <h3>{{ celeb[2] }}</h3>
    <p>소속사: JYP</p>
    <button @click="likes++">좋아요</button>
    <span>좋아요:{{ likes }}</span>
  </div>
  <div class="celeb">
    <img src="@/assets/images/13.jpg">
    <h3>{{ celeb[3] }}</h3>
    <p>소속사: 하이브</p>
    <button @click="likes++">좋아요</button>
    <span>좋아요:{{ likes }}</span>
  </div> -->
</template>

<script>
export default {
  data () {
    

    return {
      menus:['Home', 'Celeb','About'],
      agencys:[{name:'여진구', company:'하이브',likes:0,imgSrc:require('./assets/images/1.jpg')},
               {name:'최지우', company:'SM',likes:0,imgSrc:require('./assets/images/5.jpg')},
               {name:'박보영', company:'JYP',likes:0,imgSrc:require('./assets/images/12.jpg')},
               {name:'박신혜', company:'하이브',likes:0,imgSrc:require('./assets/images/13.jpg')},
               {name:'유아인', company:'SM',likes:0,imgSrc:require('./assets/images/15.jpg')}]
      // celeb:['여진구','최지우','박보영','박신혜','유아인'],
      // likes:0,
    }
  },
  methods:{
    onClickLikes(num){
      this.agencys[num].likes++;
    }
  }
}
</script>

<style lang="css" scoped>
  .menu{
    background-color: blueviolet;
    padding: 10px;
    border-radius: 5px;
  }

  .menu a{
    color: white;
    padding: 10px;
  }

  .celeb img{
    width: 200px;
    border-radius: 30px
  }
</style>