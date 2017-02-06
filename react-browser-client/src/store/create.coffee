{
    applyMiddleware, compose, createStore
} = require 'redux'
{ combineReducers } = require 'redux-immutable'
thunk = require('redux-thunk').default
middleware = thunk

mocks = (state, action) ->
    c 'action', action
    state

reducers = { mocks }

initial_state = require('./modules/initial_state.coffee').default
imm_initial_state = Imm.Map initial_state

store = createStore(combineReducers(reducers), imm_initial_state, compose(applyMiddleware(middleware)))

module.exports = store
