


arq = {}


arq['change_username'] = ({ desire, store }) ->
    primus.write
        type: 'change_username'
        payload: desire.payload

arq['send_message'] = ({ desire, store }) ->
    primus.write
        type: 'send_message'
        payload: desire.payload

arq['init:primus'] = ({ desire, store }) ->
    primus.on 'data', (data) ->
        store.dispatch
            type: 'primus:data'
            payload: { data }

    setInterval =>
        primus.write
            type: 'request_orient'
    , 3000



keys_arq = keys arq


side_effects_f = ({ store }) ->
    ({ state_js }) ->
        state = state_js
        for key_id, desire of state.lounger.desires
            if includes(keys_arq, desire.type)
                arq[desire.type] { desire , store }

exports.default = side_effects_f
