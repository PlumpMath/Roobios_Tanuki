


arq = {}

arq = assign arq, require('./side_effects/system_primus.coffee')

# arq = assign arq, require('./side_effects/lounger.coffee')

keys_arq = keys arq


side_effects_f = ({ cs, Dispatch, env }) ->

    dispatch = (opts) ->
        Dispatch.emit 'new_action', { action: opts }

    ({ cs, state }) ->
        for key_id, desire of state.get('desires').toJS()
            if includes(keys_arq, desire.type) is true
                arq[desire.type] { cs, state, dispatch, desire }

exports.default = side_effects_f
