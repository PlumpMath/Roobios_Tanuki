


arq = {}

arq['incoming:stub'] = ({ state, action, data }) ->
    state = state.setIn ['placeholder_lounger'], "some random messages"
    state


exports.default = arq
