
# process.on 'uncaughtException', (err)->
#     c err
#     c 'hihihihihi'
#     c 'teteteaaeueu'
#     process.exit(0)

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

    c 'state', state

    reducer = require('./reducer.coffee').default

    side_effects = require('./side_effects.coffee').default { Dispatch, cs, env }

    Dispatch.on 'new_action', ({ action }) ->
        state = reducer { state, action }
        side_effects { state }

    side_effects { state }
