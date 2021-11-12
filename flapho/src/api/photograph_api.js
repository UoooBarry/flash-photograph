import service from "./service";

const getPhotograph = (id) => {
  return service.get(`/photographs/${id}`);
}

const createPhotograph = (form) => {
  return service.post('/photographs', form, { headers: { 'Content-Type': 'multipart/form-data' } });
}

const tapPhotograph = (id) => {
  return service.post(`/photographs/${id}/tap`);
}

export { getPhotograph, createPhotograph, tapPhotograph };
