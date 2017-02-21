change_input_field = ({ val }) ->
    @setState
        input_field: val

message_card = rc require('./message_card.coffee').default

chat_log = ->
    { ww, wh } = @props
    div
        style:
            overflowY: 'auto'
            overflowX: 'hidden'
            maxHeight: .8 * wh
            backgroundColor: 'ivory'
            flexGrow: 8
            width: '100%'
        if @props.chat_log.length > 0
            for item, idx in @props.chat_log
                message_card.bind(@) { item, idx }


central_book_and_input = ->

    div
        style:
            backgroundColor: 'aliceblue'
            display: 'flex'
            flexDirection: 'column'
            flexGrow: 4
        chat_log.bind(@)()

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
                placeholder: '...'
                onFocus: (e) =>
                    @setState
                        input_focus: true
                onBlur: (e) =>
                    @setState
                        input_focus: false
                onChange: (e) =>
                    change_input_field.bind(@) val: e.target.value


exports.default = central_book_and_input
