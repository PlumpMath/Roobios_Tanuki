
render = ->
    { ww, wh } = @props
    div null,
        h1 null, "hi thene."
        input
            type: 'text'
            placeholder: 'go there'
            onChange: (e) =>
                @props.ping_test
                    payload: e.target.value


comp = rr
    render: render

map_state_to_props = (state) ->
    state.toJS()


map_dispatch_to_props = (dispatch) ->
    ping_test: ({ payload }) ->
        dispatch
            type: 'send_ping'
            payload: payload

exports.default = connect(map_state_to_props, map_dispatch_to_props)(comp)
