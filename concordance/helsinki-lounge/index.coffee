


EventEmitter = require 'events'
class Emitter extends EventEmitter
Dispatch = new Emitter()

process.setMaxListeners 10000

module.exports = ({ cs, env, redis, helsinki_primus }) ->

    require './modules/globals.coffee'

    state = require('./modules/initial_state.coffee')
        env: env
        helsinki_primus: helsinki_primus
        redis: redis

    reducer = require('./reducer.coffee').default({ Dispatch, env })

    side_effects = require('./side_effects.coffee').default { Dispatch, cs, env }

    Dispatch.on 'new_action', ({ action }) ->
        State = reducer { State, action }
        side_effects { State }

    side_effects { State }
