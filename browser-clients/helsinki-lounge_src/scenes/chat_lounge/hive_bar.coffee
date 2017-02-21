

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

            if (@props.hive)
                for key, sesh of @props.hive
                    p
                        style:
                            fontSize: 10
                            color: 'lightblue'
                        sesh.username
            else
                c @props.hive


exports.default = sidebar_hive
