



change_input_field = ({ val }) ->
    @setState
        input_field: val

change_username_input_field = ({ val }) ->
    @setState
        username_input_field: val

sidebar_hive = ->
    div
        style:
            backgroundColor: 'lightcyan'
            display: 'flex'
            flexGrow: 1
            flexDirection: 'column'
        div
            style:
                display: 'flex'
                flexDirection: 'column'
                alignItems: 'center'
                justifyContent: 'center'
                backgroundColor: 'lavender'
                width: '100%'
                height: '20%'

            p
                style:
                    fontSize: 10
                    color: 'maroon'
                "Your name: #{@props.username}"

            input
                style:
                    fontSize: 12
                    color: 'darkgrey'
                    padding: 8
                type: 'text'
                placeholder: "set username"
                value: @state.username_input_field
                onFocus: (e) =>
                    @setState
                        username_input_focus: true
                onBlur: (e) =>
                    @setState
                        username_input_focus: false
                onChange: (e) =>
                    change_username_input_field.bind(@) val: e.target.value

        div
            style:
                backgroundColor: 'lemonchiffon'
                width: '100%'
                height: '80%'
                display: 'flex'
                flexDirection: 'column'
                alignItems: 'center'
                justifyContent: 'flex-start'
            p
                style:
                    fontSize: 10
                    color: 'maroon'
                "People in the lounge:"

central_book_and_input = ->
    # c '@props', @props
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
            if @props.chat_log.length > 0
                for item, idx in @props.chat_log
                    p
                        key: "messg:#{idx}"
                        style:
                            height: 16
                            margin: 0
                            fontSize: 12
                        item.input_field
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
                value: @state.input_field
                type: 'text'
                placeholder: 'chat here'
                onFocus: (e) =>
                    @setState
                        input_focus: true
                onBlur: (e) =>
                    @setState
                        input_focus: false
                onChange: (e) =>
                    change_input_field.bind(@) val: e.target.value
                    # @props.ping_test
                    #     payload: e.target.value


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
    c @state
    c @props
    # c 'in render with @props', @props
    { ww, wh } = @props
    the_whole.bind(@)()

comp = rr
    componentDidMount: ->
        document.onkeydown = (e) =>
            keycode = e.keycode or e.which
            if keycode is 13
                if @state.input_focus is true
                    @props.send_message
                        payload:
                            input_field: @state.input_field
                    @setState
                        input_field: ''
                else if @state.username_input_focus is true
                    @props.change_username
                        payload:
                            username_input_field: @state.username_input_field
                    @setState
                        username_input_field: ''

    getInitialState: ->
        input_focus: false
        username_input_focus: false
        input_field: ''
        username_input_field: ''
        username: @props.username

    render: render

map_state_to_props = (state) ->
    # c state.get('lounger').toJS()
    state.get('lounger').toJS()

map_dispatch_to_props = (dispatch) ->
    change_username: ({ payload }) ->
        dispatch
            type: 'change_username'
            payload: payload

    send_message: ({ payload }) ->
        dispatch
            type: 'send_message'
            payload: payload

    request_orient: ({ payload }) ->
        dispatch
            type: 'request_orient'
            payload: payload

exports.default = connect(map_state_to_props, map_dispatch_to_props)(comp)
