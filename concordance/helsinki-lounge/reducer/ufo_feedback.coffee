

arq = {}

arq['login:success'] = ({ cs, state, action }) ->
    { clean_user_hash, token, spark_id, session_metadata } = action.payload.payload
    container = Imm.fromJS
        stuff: 43
        role: 'lounger'
    user_hash = Imm.fromJS clean_user_hash
    max = container.setIn(['user_hash', user_hash])
    state = state.setIn(['lounger_sessions', token, 'user'], max)
    state


arq['signup:success'] = ({ cs, state, action }) ->
    { user_hash, token, spark_id, session_metadata } = action.payload
    session = state.getIn(['lounger_sessions', token])
    container = Imm.fromJS
        stuff: 43
        role: 'lounger'
    user_hash = Imm.fromJS user_hash
    max = container.setIn(['user_hash'], user_hash)
    state = state.setIn(['lounger_sessions', token, 'user'], max)
    state


exports.default = arq
