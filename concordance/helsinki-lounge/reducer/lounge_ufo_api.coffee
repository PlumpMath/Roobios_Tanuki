



arq = {}


arq['change_username'] = ({ state, action }) ->
    { spark_id, token, data } = action.payload
    { username_input_field } = data.payload
    state = state.setIn ['lounger_sessions', token, 'username'], username_input_field
    state


arq['send_message'] = ({ state, action }) ->
    { spark_id, token } = action.payload

    c action.payload.data.payload

    sesh = state.getIn(['lounger_sessions', token]).toJS()
    c 'sesh', sesh
    { session_metadata, safe_id, username } = sesh
    { input_field } = action.payload.data.payload
    c 'safe_id', safe_id
    arq_900 =
        input_field: input_field
        content: input_field
        timestamp: Date.now()
        safe_id: safe_id

    chat_log = state.get('chat_log')
    state  = state.set('chat_log', chat_log.push(arq_900))





    state.setIn ['desires', shortid()],
        type: 'send_message'
        payload: arq_900

arq['request_orient'] = ({ state, action }) ->
    { spark_id, token } = action.payload
    state.setIn ['desires', shortid()],
        type: 'request_orient'
        payload: action.payload

arq['do_login'] = ({ cs, state, action }) ->
    { spark_id, token } = action.payload
    # spark = state.getIn(['lounger_sessions', token, 'spark'])
    { username_candide, password_candide } = action.payload.data.payload
    state = state.setIn ['desires', shortid()],
        type: 'do_login'
        payload: { username_candide, password_candide, spark_id, token }
    state


arq['do_signup'] = ({ cs, state, action }) ->
    { session_metadata, spark_id, data, token } = action.payload
    { type, payload } = data
    payload = assign payload, { session_metadata, spark_id, token }
    signup_attempt_entry =
        timestamp: Date.now()
        id: v4()
        payload: payload
    state = state.setIn ['desires', shortid()],
        type: 'do_signup'
        payload: 'payload'
    state

arq['check_is_username_valid_and_avail'] = ({ cs, state, action, data }) ->
    { session_metadata, spark_id, data, token } = action.payload
    { type, payload } = data
    todo = 'maintain some memory of ufos by ip and session'
    { username_candide } = data.payload
    state.setIn ['desires', shortid()],
        type: 'check_is_username_valid_and_avail'
        payload: { username_candide, session_metadata, spark_id }
    state


exports.default = arq
