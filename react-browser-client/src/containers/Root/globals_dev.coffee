


window.c = console.log.bind console
window.React = require 'react'
window.React_DOM = require 'react-dom'
window._ = require 'lodash/fp'
window._sq = require 'lodash'
window.shortid = require 'shortid'
window.key_mirror = require 'keymirror'
{ connect: window.connect } = require 'react-redux'
window.Imm = require 'immutable'

# window.primus

window.debounce = (fn, wait, immediate) ->
    timeout = false
    ->
        context = @
        args = arguments
        later = ->
            timeout = null
            if not(immediate) then fn.apply(context, args)
        callNow = immediate and not(timeout)
        clearTimeout timeout
        timeout = setTimeout(later, wait)
        if callNow then fn.apply(context, args)

window.rr = React.createFactory(React.createClass.apply(React, arguments))
window.rc = React.createFactory.apply(React, arguments)

dom_stuff = {
    p, form, strong, pre, div, h1, h2, h3, h4, h5, h6, span, svg, circle,
    tspan, rect, ul, line, li, ol, code, a, input, defs, clipPath,
    body, linearGradient, stop, g, path, d, polygon, image, pattern,
    filter, feBlend, feOffset, polyline, feGaussianBlur, feBlend, feMergeNode,
    feMerge, radialGradient, foreignObject, text, textArea, ellipse,
    pattern, thead, th, tr, tbody
} = React.DOM

for k, v of dom_stuff
    window[k] = v


for item in ['textArea', 'filter', 'foreignObject', 'feGaussianBlur', 'feImage', 'feOffset', 'feMerge', 'feMergeNode', 'feBlend', 'feComponentTransfer', 'feFuncR', 'feFuncG', 'feFuncB', 'feComposite']
    window[item] = React.createFactory item



window.assign = _.assign
window.keys = _sq.keys
window.includes = _sq.includes
window.map = _.map
window.reduce = _.reduce


# Major TODO & note:  This system is really good and should be improved features like zoom.
# I still believe this is a more general and better way to build GUIs than classic CSS, especially on large
# projects with big development scale that would benefit from efficiencies in re-use.
# This function is used solely in the programmatic SVG pattern SVG-all-the-Things.
# I'll have other paths in this system that deliver classic CSS based apps and in those I'll be
# developing and demoing my flexbox layout skills. Flexbox is fun and makes me happy to work with CSS
# , but at the same time I want to continue developing the SVG centric pattern.  So in that segment,
# look to develop the system of functional machinery  (for the SVG stuff)
# that allows the full gamut of responsive algos-implementations and features, e.g. zoom response to
# zoom commands, that users expect.

window.get_abs_val_open = (fig_raw) ->
    { ww , wh } = @props
    ratio_zzz = fig_raw / 1366
    fig_abs = ratio_zzz * ww
    return fig_abs
