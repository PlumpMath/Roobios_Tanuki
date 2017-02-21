chat_lounge = rc require('../../scenes/chat_lounge_308.coffee').default

render = ->
    { ww, wh } = @props
    chat_lounge { ww, wh }

comp = rr
    render: render

map_state_to_props = (state) ->
    {}

map_dispatch_to_props = (dispatch) ->
    {}

exports.default = connect(map_state_to_props, map_dispatch_to_props)(comp)
