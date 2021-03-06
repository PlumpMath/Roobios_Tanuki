

arq = {}

arq['send_edited_message'] = ({ desire, store }) ->
    primus.write
        type: 'send_edited_message'
        payload: desire.payload

arq['change_username'] = ({ desire, store }) ->
    primus.write
        type: 'change_username'
        payload: desire.payload

arq['send_message'] = ({ desire, store }) ->
    primus.write
        type: 'send_message'
        payload: desire.payload

arq['init_primus'] = ({ desire, store }) ->
    primus.on 'data', (data) ->
        store.dispatch
            type: 'primus:data'
            payload: { data }

    setInterval =>
        primus.write
            type: 'request_orient'
    , 300


exports.default = arq
