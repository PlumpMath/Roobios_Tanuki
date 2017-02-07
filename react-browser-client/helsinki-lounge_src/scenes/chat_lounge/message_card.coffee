






render = ->
    { item, idx } = @props
    div null,
        span
            style:
                color: 'plum'
            @props.hive[item.safe_id].username

        span
            key: "messg:#{idx}"
            style:
                height: 16
                margin: 0
                padding: 8
                fontSize: 12
            item.input_field


comp = rr
    render: render


map_state_to_props = (state) ->
    state.get('lounger').toJS()

map_dispatch_to_props = (dispatch) ->
    {}

exports.default = connect(map_state_to_props, map_dispatch_to_props)(comp)
