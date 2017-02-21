


arq = {}


arq['orient:reply'] = ({ state, action, data }) ->
    { username, hive, chat_log, safe_id  } = data.payload
    state = state.set 'username', username
    state = state.set 'safe_id', safe_id
    state = state.set 'hive', Imm.fromJS(hive)
    state= state.set 'chat_log', chat_log
    state


arq['new_message'] = ({ state, action, data }) ->
    chat_log = state.get('chat_log')
    chat_log = chat_log.push data.payload
    state.set('chat_log', chat_log)




exports.default = arq
