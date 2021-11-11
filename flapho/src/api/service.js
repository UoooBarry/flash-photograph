import axios from 'axios';

const serverUrl = process.env.VUE_APP_BASE_URL

const service = axios.create({
  baseURL: `${serverUrl}/api`,
  timeout: 5000
});

const onSuccess = (response) => {
  if (!String(response.headers['content-type']).includes('application/json')) {
    return response;
  }
  const { data } = response;
  if (data.status === 'ok') {
    return data.payload;
  }
  return Promise.reject(data);
};

const onError = (error) => {
  throw error;
}

service.interceptors.response.use(onSuccess, onError);

export default service;
