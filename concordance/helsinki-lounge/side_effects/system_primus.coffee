


arq = {}

arq['primus:init_all_the_primus'] = ({ cs, state, dispatch, desire }) ->

    helsinki_primus = state.get('helsinki_primus')
    helsinki_primus.on 'connection', (spark) ->
        headers = spark.headers
        primus_req = headers['primus::req::backup']
        { cookies, signedCookies, session } = primus_req
        token = signedCookies['connect.sid']
        session_metadata = { session, cookies, signedCookies, token }
        dispatch
            type: 'helsinki:primus:spark'
            payload: { spark, session_metadata }
        spark_id = spark.id
        spark.on 'data', (data) ->
            { session, cookies, signedCookies } = spark.headers['primus::req::backup']
            token = signedCookies['connect.sid']
            session_metadata = { session, cookies, signedCookies, token }

            dispatch
                type: 'helsinki:spark:data'
                payload: { spark_id, data, session_metadata, token }

            spark.on 'end', ->
                c color.white('todo: implement spark ending stuff')

module.exports = arq
