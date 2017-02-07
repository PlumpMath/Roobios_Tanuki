{
    applyMiddleware, compose, createStore
} = require 'redux'
{ combineReducers } = require 'redux-immutable'
thunk = require('redux-thunk').default
middleware = thunk

mocks = (state, action) ->
    c 'action', action
    state

lounger = require('./reducers/lounger.coffee').default

reducers = { mocks, lounger }

initial_state = require('./modules/initial_state.coffee').default
imm_initial_state = Imm.Map initial_state

store = createStore(combineReducers(reducers), imm_initial_state, compose(applyMiddleware(middleware)))


side_effects = require('./side_effects.coffee').default { store }

side_effect_trigger_f = ({ store }) ->
    ->
        state_js = store.getState().toJS()
        side_effects { state_js }

set = side_effect_trigger_f { store }
store.subscribe set

store.dispatch
    type: 'init:primus'
    payload: null


module.exports = store
