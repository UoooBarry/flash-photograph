const getFullFile = (path) => {
  const serverUrl = process.env.VUE_APP_BASE_URL;
  return `${serverUrl}${path}`
}

export default getFullFile;
