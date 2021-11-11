import service from "./service";

const getPhotograph = (id) => {
  return service.get(`/photographs/${id}`);
}

const createPhotograph = (form) => {
  return service.post('/photographs', form, { headers: { 'Content-Type': 'multipart/form-data' } });
}

export { getPhotograph, createPhotograph };
