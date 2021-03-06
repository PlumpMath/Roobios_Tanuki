

sidebar_hive = require('./chat_lounge/hive_bar.coffee').default
central_book_and_input = require('./chat_lounge/central_thread_scroll.coffee').default

servers_column =
    require('./chat_lounge/servers_column.coffee').default

channels_column = require('./chat_lounge/channels_column.coffee').default

right_hive_column = require('./chat_lounge/hive_column.coffee').default





styles =
    root:
        height: '100%'
        width: '100%'
        display: 'flex'
        flexDirection: 'column'
        alignItems: 'center'
        justifyContent: 'flex-start'
        backgroundColor: 'snow'
    trunk:
        display: 'flex'
        backgroundColor: 'lightblue'
        width: '100%'
        flexGrow: 1
        maxHeight: 50
        flexShrink: 4
        justifyContent: 'space-around'
        alignItems: 'space-between'
    header:
        alignSelf: 'flex-start'
        height: 60
        color: 'grey'
        fontFamily: 'sans'
    chat_noir_cont:
        display: 'flex'
        justifyContent: 'space-between'
        width: '20%'
        alignItems: 'center'


atts = {}


the_whole = ->
    { ww, wh } = @props
    div
        style: styles.root
        div
            style: styles.trunk
            div
                style: styles.chat_noir_cont

                img
                    width: 40
                    height: 40
                    src: '/images/le_chat_noir.jpg'
                h3
                    style: styles.header
                    "Le Chat Noir"
            button
                style:
                    cursor: 'pointer'
                    color: 'magenta'
                    height: '50%'
                    alignSelf: 'center'
                onClick: =>
                    c 'clicked'
                "t1"
        div
            style:
                display: 'flex'
                flexGrow: 23
                width: '100%'
                backgroundColor: 'aliceblue'

            # sidebar_hive.bind(@)()
            servers_column.bind(@)()
            channels_column.bind(@)()
            central_book_and_input.bind(@)()

            right_hive_column.bind(@)()


render = ->
    { ww, wh } = @props
    the_whole.bind(@)()


comp = rr
    componentDidMount: ->
        keypress_ee.on 'new_keypress_enter', =>
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
            else
                c 'kepress noop in chat_lounge'


    getInitialState: ->
        input_focus: false
        username_input_focus: false
        input_field: ''
        username_input_field: ''
        username: @props.username

    render: render


map_state_to_props = (state) ->
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
