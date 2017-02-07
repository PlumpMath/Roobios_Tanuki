



get_hive = ({ state }) ->
    lounger_sessions = state.get('lounger_sessions').toJS()
    hive = {}
    for k, sesh of lounger_sessions
        do (sesh) ->
            hive["#{sesh.safe_id}"] =
                username: sesh.username
    hive


arq = {}

arq['send_message'] = ({ state, dispatch, desire }) ->
    c 'desire', desire
    primus = state.get('helsinki_primus')
    { token } = desire.payload
    { input_field } = desire.payload.data.payload
    # c 'have an input field', input_field
    primus.write
        type: 'new_message'
        payload: { input_field }


arq['request_orient'] = ({ state, dispatch, desire }) ->
    { token } = desire.payload
    { spark, username } = state.getIn(['lounger_sessions', token]).toJS()
    hive = get_hive { state }
    spark.write
        type: 'orient:reply'
        payload:
            username: username
            hive: hive


exports.default = arq
