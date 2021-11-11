<template>
  <div>
    <form @submit.prevent="submitForm">
      <label>Select Image File:</label>
      <div class="photograph_image" @click="clickImage()">
        <input
          id="upload"
          type="file"
          name="image"
          v-on:change="changImage"
          style="display: none"
        />
        <img
          :src="preview"
          alt="点击上传图片"
          v-if="image"
          aria-hidden="true"
        />
      </div>
      <input
        type="number"
        name="duration"
        placeholder="duration"
        v-model="duration"
        class="duration"
        min="1"
        max="10"
      />
      <br />
      <input type="submit" name="submit" value="Upload" class="submit-btn" />
    </form>
  </div>
</template>

<script>
import { ref } from "vue";
import { useToast } from "vue-toastification";
import { createPhotograph } from "@/api/photograph_api";
import { useRouter } from "vue-router";

export default {
  name: "NewPhotograph",
  setup() {
    const image = ref({});
    const duration = ref(3);
    const preview = ref("");
    const toast = useToast();
    const router = useRouter();

    const submitForm = async () => {
      const bodyFormData = new FormData();
      bodyFormData.append("image", image.value);
      bodyFormData.append("duration", duration.value);

      const { sucess, photograph, errors } = await createPhotograph(
        bodyFormData
      );
      if (sucess) {
        toast.success("Upload Success");
        router.push({ path: `/flash/${photograph.id}` });
      } else {
        errors.forEach((error) => {
          toast.error(error);
        });
      }
      console.log(bodyFormData);
    };

    const changImage = (e) => {
      image.value = e.target.files[0];
      preview.value = URL.createObjectURL(image.value);
    };

    const clickImage = () => {
      document.getElementById("upload").click();
    };

    return {
      image,
      duration,
      submitForm,
      changImage,
      preview,
      clickImage,
    };
  },
};
</script>

<style scoped>
.photograph_image {
  max-height: 50vh;
  height: 50vh;
  min-height: 50vh;
  max-width: 100%;
  width: 100%;
  min-width: 95vw;
  border: 1px solid #ccc;
}

.photograph_image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.duration {
  margin-top: 1rem;
  margin-bottom: 1rem;
  width: 50%;
  font-size: 1.5rem;
  border: 1px solid #ccc;
  width: 99%;
}

.submit-btn {
  font-size: 1rem;
  color: #fff;
  background-color: rgb(0, 0, 0);
  width: 100%;
  border: 0px;
  padding: 0.8rem;
  border-radius: 5px;
}
</style>
