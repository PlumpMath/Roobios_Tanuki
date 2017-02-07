






render = ->
    { item, idx } = @props
    nowish = new Date(item.timestamp)
    div
        key: "messg:#{idx}"
        style:

            display: 'flex'
            alignItems: 'flex-start'
            justifyContent: 'flex-start'
        span
            style:
                width: 80
                padding: 4
                color: 'chartreuse'
                fontSize: 10
            "#{nowish.getHours()}:#{nowish.getMinutes()}"
        span
            style:
                width: 160
                # backgroundColor: 'magenta'
                color: 'plum'
                padding: 4
                fontSize: 10
            @props.hive[item.safe_id].username + ': '

        if @state.editing is false
            span
                style:
                    width: 400
                    # paddingLeft: 1
                    height: 16
                    # marginLeft: 40
                    fontSize: 10
                item.input_field
        else
            input
                style:
                    fontSize: 10
                    color: 'grey'
                    height: 14
                    width: 400
                type: 'text'
                value: @state.input_value
                onChange: (e) =>
                    @setState
                        input_value: e.currentTarget.value

        if @props.safe_id is item.safe_id
            span
                onClick: =>
                    if @state.editing is false
                        @setState
                            editing: true
                    else if @state.editing is true
                        @setState
                            editing: false
                        @props.send_edited_message
                            item: item
                            input_value: @state.input_value
                style:
                    width: 40
                    marginLeft: 10
                    color: 'grey'
                    fontSize: 10
                    cursor: 'pointer'
                if @state.editing is false then 'edit' else 'ok'


comp = rr

    # componentDidMount: ->
    #     document.onkeydown = (e) =>
    #         c 'going'
    #         keycode = e.keycode or e.which
    #         if keycode is 13
    #             if @state.editing is true
    #                 @setState
    #                     editing: false


    getInitialState: ->
        editing: false
        input_value: @props.item.input_field

    render: render


map_state_to_props = (state) ->
    state.get('lounger').toJS()

map_dispatch_to_props = (dispatch) ->
    send_edited_message: ({ item, input_value }) ->
        dispatch
            type: 'send_edited_message'
            payload: { item, input_value }


exports.default = connect(map_state_to_props, map_dispatch_to_props)(comp)
