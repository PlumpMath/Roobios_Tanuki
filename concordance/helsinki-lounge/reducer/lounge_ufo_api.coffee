



arq = {}

arq['request_orient'] = ({ state, action }) ->
    c 'got the req'
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
