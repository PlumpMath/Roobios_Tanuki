



render = ->
    div null, 'hi'


comp = rr
    render: render


map_state_to_props = (state) ->
    state.get('lounger').toJS()

map_dispatch_to_props = (dispatch) ->
    {}

exports.default = connect(map_state_to_props, map_dispatch_to_props)(comp)
