
console.log 'hi'

require './globals_dev.coffee'


root_el = document.getElementById 'root'
Provider = rc require('react-redux').Provider
store = require('../../store/create.coffee')

ready__stub = ->
    { ww, wh } = @props
    div null,
        p null, 'hello38838302929'
        p null, 'stnhstnhstnhstnh'

root_component = rr
    render: ->
        { ww, wh } = @props
        Provider
            store: store
            ready__stub.bind(@)()

set_and_render = ->
    { width, height } = root_el.getBoundingClientRect()
    React_DOM.render root_component({ ww: width, wh: height }), root_el

window.onload = ->
    set_and_render()
    window.onresize = debounce(set_and_render, 100, false)
