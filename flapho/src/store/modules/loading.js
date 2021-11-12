const loadingModule = {
  namespaced: true,
  state: {
    loading: false
  },
  mutations: {
    setLoading(state, loading) {
      state.loading = loading;
    }
  },
  getters: {
    loading: (state) => {
      return state.loading;
    }
  },
  actions: {
    load: ({commit}) => {
      commit('setLoading', true)
    },
    finish: ({commit}) => {
      commit('setLoading', false)
    }
  }
}

export default loadingModule;
