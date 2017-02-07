






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

        span
            style:
                # paddingLeft: 1
                height: 16
                # marginLeft: 40
                fontSize: 10
            item.input_field


comp = rr
    render: render


map_state_to_props = (state) ->
    state.get('lounger').toJS()

map_dispatch_to_props = (dispatch) ->
    {}

exports.default = connect(map_state_to_props, map_dispatch_to_props)(comp)
