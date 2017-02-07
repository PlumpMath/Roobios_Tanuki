



arq = {}


arq['init:primus'] = ({ state, action }) ->
    state.setIn ['desires']



arq['send_ping'] = ({ state, action }) ->




concorde_channel = require('./lounger/concorde_channel.coffee').default
keys_concorde_channel = keys concorde_channel
arq['primus:data'] = ({ state, action }) ->
    { data } = action.payload
    { type, payload } = action.payload.data
    if includes(keys_concorde_channel, type)
        concorde_channel[type] { state, action, data }
    else
        state

keys_arq = keys arq
lounger = (state, action) ->
    c 'lounger has action', action
    state = state.setIn ['desires'], Imm.Map({})
    if includes(keys_arq, action.type)
        arq[action.type]({ state, action })
    else
        state





exports.default = lounger
