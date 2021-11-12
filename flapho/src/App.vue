<template>
  <div>
    <template v-if="loading">
      <div class="loader"><Loader /></div>
    </template>
    <router-view v-else />
  </div>
</template>

<script>
import { mapState } from "vuex";
import Loader from "@/components/Loader";

export default {
  name: "App",
  computed: {
    ...mapState("loading", ["loading"]),
  },
  components: {
    Loader,
  },
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
}
.loader {
  margin-top: 50%;
}
</style>
