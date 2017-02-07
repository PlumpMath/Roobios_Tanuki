



arq = {}


arq['init:primus'] = ({ state, action }) ->
    state.setIn ['desires', shortid()],
        type: 'init:primus'
        payload: null



arq['request_orient'] = ({ state, action }) ->
    state.setIn ['desires', shortid()],
        type: 'request_orient'
        payload: null



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

# counter = 0
lounger = (state, action) ->
    # c counter++
    # c 'lounger has state', state
    # c 'lounger has action', action
    state = state.setIn ['desires'], Imm.Map({})
    if includes(keys_arq, action.type)
        c 'includes'
        arq[action.type]({ state, action })
    else
        c 'noop'
        state





exports.default = lounger
