


arq = {}


arq['orient:reply'] = ({ state, action, data }) ->
    c 'into orient reply', data
    { username } = data.payload
    c 'username', username
    state.set 'username', username

arq['new_message'] = ({ state, action, data }) ->
    c 'is in new message', data
    # { username } = data.payload
    chat_log = state.get('chat_log')
    c 'chat_log', chat_log.toJS()
    chat_log = chat_log.push
        input_field: data.payload.input_field
    state.set('chat_log', chat_log)

arq['incoming:stub'] = ({ state, action, data }) ->
    state = state.setIn ['placeholder_lounger'], "some random messages"
    state


exports.default = arq
