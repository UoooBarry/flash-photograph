<template>
  <div>
    <div class="photograph">
      <div class="photograph_image" v-if="!loading && ableToView">
        <img
          :src="getFullFile(photograph.url.url)"
          alt="photo"
          v-if="tapped && !finishedViewed"
        />
        <Blurred v-else-if="!tapped && finishedViewed" />
        <Blurred :ableToView="ableToView" v-else v-on:click="onTap()" />
      </div>
      <div class="photograph_image" v-else>
        <Blurred />
      </div>
      <h1>{{ ableToView ? `${photograph.duration}s` : "Not able to view" }}</h1>
    </div>
    <div class="top-bar">
      <a href='/new' class="share-span">分享自己的图片</a>
    </div>
  </div>
</template>

<script>
import { onMounted, ref } from "vue";
import { getPhotograph } from "@/api/photograph_api";
import getFullFile from "@/utils/get_full_file";
import { useRoute } from "vue-router";
import Blurred from "@/components/Blurred";

export default {
  name: "Photograph",
  components: {
    Blurred,
  },
  setup() {
    const photograph = ref({});
    const loading = ref(true);
    const tapped = ref(false);
    const finishedViewed = ref(false);
    const ableToView = ref(true);
    const { id } = useRoute().params;

    const getPhotographData = async (id) => {
      try {
        loading.value = true;
        const data = await getPhotograph(id);
        loading.value = false;
        return data;
      } catch (error) {
        console.log(error);
      }
    };

    onMounted(async () => {
      const response = await getPhotographData(id);
      ableToView.value = response.able_to_view;
      photograph.value = response.photograph;
    });

    const onTap = () => {
      if (tapped.value) return;
      const timer = setInterval(async () => {
        photograph.value.duration -= 1;
        if (photograph.value.duration === 0) {
          clearInterval(timer);
          finishedViewed.value = true;

          const response = await getPhotographData(id);
          ableToView.value = response.able_to_view;
          photograph.value = response.photograph;
        }
      }, 1000);
      tapped.value = true;
    };

    return {
      ableToView,
      photograph,
      loading,
      tapped,
      onTap,
      finishedViewed,
      getFullFile
    };
  },
};
</script>

<style scoped>
.photograph {
  text-align: center;
}

.photograph_image {
  height: 90vh;
  width: 95vw;
  border: 1px solid #ccc;
}

.photograph_image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.share-span {
  font-size: 1rem;
  color: #fff;
  background-color: rgb(0, 0, 0);
  text-decoration: none;
  width: 100%;
  border: 0px;
  padding: 0.8rem;
  border-radius: 5px;
}

.top-bar {
  text-align: right;
}
</style>
