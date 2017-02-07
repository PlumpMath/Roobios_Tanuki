



arq = {}



verified_lounger = require('./verified_lounger.coffee')
keys_verified_lounger = keys verified_lounger


ufo = require('./lounge_ufo_api').default
keys_ufo = keys ufo


arq['lounger:spark:data'] = ({ cs, state, action }) ->
    { session_metadata, spark_id, data, token } = action.payload
    { type, payload } = data

    if includes(keys_ufo, type)
        state = ufo[type] { cs, state, action, data, token }
    else if includes(keys_verified_lounger, type)
        user = state.getIn(['lounger_sessions', token, 'user'])
        if user.toJS?
            if user.toJS().role is 'lounger'
                state = verified_lounger[type] { cs, state, action, data, token }
    state


arq['lounger:primus:spark'] = ({ cs, state, action }) ->
    { spark, session_metadata } = action.payload
    { signedCookies, cookies, session, token } = session_metadata
    token = signedCookies['connect.sid']
    if state.hasIn(['lounger_sessions', token]) isnt true
        master_session = Imm.Map
            spark: spark
            session_metadata: session_metadata
            token: token
        state = state.setIn(['lounger_sessions', token], master_session)
    else
        state = state.setIn(['lounger_sessions', token, 'spark'], spark)
        state

module.exports = arq
