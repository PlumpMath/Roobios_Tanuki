


arq = {}

arq['request_orient'] = ({ state, dispatch, desire }) ->
    c 'sideeffecing'

    { token } = desire.payload
    { spark, user } = state.getIn(['lounger_sessions', token]).toJS()

    spark.write
        type: 'orient:reply'
        payload: 'placholder payload'

exports.default = arq
