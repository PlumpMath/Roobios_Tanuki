


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

    spark.write
        type: 'orient:reply'
        payload: { username }


exports.default = arq
