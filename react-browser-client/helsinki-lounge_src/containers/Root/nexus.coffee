



sidebar_hive = ->
    div
        style:
            backgroundColor: 'lightcyan'
            display: 'flex'
            flexGrow: 1

central_book_and_input = ->
    div
        style:
            backgroundColor: 'aliceblue'
            display: 'flex'
            flexDirection: 'column'
            flexGrow: 4
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
                    height: 20
                    fontSize: 16
                    color: 'grey'
                    padding: '8px'
                type: 'text'
                placeholder: 'chat here'
                onChange: (e) =>
                    @props.ping_test
                        payload: e.target.value


the_whole = ->
    { ww, wh } = @props
    div
        style:
            height: '100%'
            width: '100%'
            display: 'flex'
            flexDirection: 'column'
            alignItems: 'center'
            justifyContent: 'flex-start'
            backgroundColor: 'snow'

        div
            style:
                flexGrow: 1
                maxHeight: 50
                flexShrink: 4
            h2
                style:
                    height: 60
                    color: 'grey'
                    fontFamily: 'sans'
                "The Chat"

        div
            style:
                display: 'flex'
                flexGrow: 23
                width: '100%'
                backgroundColor: 'aliceblue'

            sidebar_hive.bind(@)()
            central_book_and_input.bind(@)()

render = ->
    # c 'in render with @props', @props
    { ww, wh } = @props
    the_whole.bind(@)()

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
