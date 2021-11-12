import axios from 'axios';
import { useToast } from "vue-toastification";

const serverUrl = process.env.VUE_APP_BASE_URL

const service = axios.create({
  baseURL: `${serverUrl}/api`,
  timeout: 5000
});

const onSuccess = (response) => {
  const toast = useToast();

  if (!String(response.headers['content-type']).includes('application/json')) {
    return response;
  }
  const { data } = response;
  if (data.status === 'error') {
    data.payload.errors.forEach((error) => {
      toast.error(error);
    });
  }
  return data.payload
};

const onError = (error) => {
  throw error;
}

service.interceptors.response.use(onSuccess, onError);

export default service;
