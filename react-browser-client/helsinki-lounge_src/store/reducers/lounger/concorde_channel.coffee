


arq = {}


arq['orient:reply'] = ({ state, action, data }) ->
    { username, hive } = data.payload
    state = state.set 'username', username
    state = state.set 'hive', Imm.fromJS(hive)
    state


arq['new_message'] = ({ state, action, data }) ->
    c 'is in new message', data
    # { username } = data.payload
    chat_log = state.get('chat_log')
    c 'chat_log', chat_log.toJS()
    # chat_log = chat_log.push
    #     input_field: data.payload.input_field

    chat_log = chat_log.push data.payload

    state.set('chat_log', chat_log)




exports.default = arq
