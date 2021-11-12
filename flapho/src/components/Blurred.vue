<template>
  <div class='blurred'>
    <span class='hint' v-if="ableToView">轻点可查看图片</span>
  </div>
</template>

<script>
export default {
  props: {
    ableToView: {
      type: Boolean,
      default: false
    }
  },
  setup(props) {
    console.log(props.ableToView)
  }
}
</script>

<style scoped>
.blurred {
  height: 100%;
  width: 100%;
  background-color: rgb(214, 214, 214);
}
.hint {
  position: relative;
  top: 50%;
  font-size: 1.5rem;
}
</style>
