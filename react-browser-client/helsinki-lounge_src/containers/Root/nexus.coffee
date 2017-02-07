









render = ->
    # c 'in render with @props', @props
    { ww, wh } = @props
    div
        style:
            height: '100%'
            width: '100%'
            display: 'flex'
            flexDirection: 'column'
            alignItems: 'center'
            justifyContent: 'flex-start'
            backgroundColor: 'burlywood'

        div
            style:
                flexGrow: 1
            h1
                style:
                    color: 'azure'
                "The Chat"

        div
            style:
                backgroundColor: 'ivory'
                display: 'flex'
                flexGrow: 8
                width: '100%'
                flexDirection: 'column'
                alignItems: 'center'
                justifyContent: 'flex-start'
                # height: '400px'



        div
            style:
                display: 'flex'
                flexDirection: 'column'
                alignItems: 'center'
                justifyContent: 'center'
                flexGrow: 2
            input
                style:
                    width: '400px'
                    height: '40px'
                    padding: '8px'
                type: 'text'
                placeholder: 'chat here'
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
            type: 'request_orient'
            payload: payload

exports.default = connect(map_state_to_props, map_dispatch_to_props)(comp)
