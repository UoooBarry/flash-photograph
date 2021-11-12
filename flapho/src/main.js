import {
  createApp
} from 'vue'
import App from './App.vue'
import router from './router'
import Toast, {
  POSITION
} from "vue-toastification";
import "vue-toastification/dist/index.css";
import store from './store'

createApp(App).use(store).use(router).use(Toast, {
  position: POSITION.BOTTOM_RIGHT
}).mount('#app')