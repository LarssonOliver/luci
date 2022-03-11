<template>
  <Swiper
    :navigation="true"
    loop
    :modules="modules"
    :autoplay="{ delay: 10000, disableOnInteraction: false }"
    :lazy="{
      loadPrevNext: true,
    }"
  >
    <SwiperSlide v-for="i in img">
      <img :data-src="`/${i}`" class="swiper-lazy" />
      <div class="swiper-lazy-preloader swiper-lazy-preloader-grey" />
    </SwiperSlide>
  </Swiper>
</template>

<script lang="ts">
import { Swiper, SwiperSlide } from "swiper/vue";
import { Navigation, Autoplay, Lazy } from "swiper";

import images from "@/assets/images.json";

import "swiper/css";
import "swiper/css/navigation";
import "swiper/css/lazy";

const shuffle = (array: any[]) => {
  for (let i = array.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [array[i], array[j]] = [array[j], array[i]];
  }
  return array;
};

export default {
  head() {
    return {
      title: "Luciffer",
    };
  },
  components: {
    Swiper,
    SwiperSlide,
  },
  async setup() {
    const img = shuffle(images);

    return {
      img,
      modules: [Navigation, Autoplay, Lazy],
    };
  },
};
</script>

<style>
#__nuxt {
  height: 100%;
}
html,
body {
  position: relative;
  overflow: hidden;
  height: 100%;
}

body {
  background: black;
  font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
  font-size: 14px;
  color: #000;
  margin: 0;
  padding: 0;
}

.swiper {
  width: 100%;
  height: 100%;
}

.swiper-slide {
  text-align: center;
  font-size: 18px;

  /* Center slide text vertically */
  display: -webkit-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  display: flex;
  -webkit-box-pack: center;
  -ms-flex-pack: center;
  -webkit-justify-content: center;
  justify-content: center;
  -webkit-box-align: center;
  -ms-flex-align: center;
  -webkit-align-items: center;
  align-items: center;
}

.swiper-slide img {
  display: block;
  width: 100%;
  height: 100%;
  object-fit: contain;
  background-color: black;
  border: none;
}

.swiper-button-next::after,
.swiper-button-prev::after {
  color: gray;
}

.swiper-lazy-preloader-grey {
  --swiper-preloader-color: grey;
  animation-name: spin;
  animation-duration: 1000ms;
  animation-iteration-count: infinite;
  animation-timing-function: linear;
}

@keyframes spin {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(360deg);
  }
}
</style>
