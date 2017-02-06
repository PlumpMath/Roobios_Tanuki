
arq = {}

arq = assign arq, require('./reducer/lounge_ufo.coffee')

keys_arq = keys arq

reducer = ({ cs, state, action }) ->
    state = state.setIn ['desires'], Imm.Map({})
    if includes(keys_arq, action.type)
        arq[action.type] { cs, state, action }
    else
        state

exports.default = reducer
