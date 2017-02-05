c = console.log.bind console
_ = require 'lodash'
express = require 'express'
app = express()
body_parser = require 'body-parser'
path = require 'path'
public_dir = path.join __dirname, '../react-browser-client/public'
index_subpath = '/containers/Root'

if process.env.NODE_ENV is 'production'
    index = '/index_prod.html'
else
    index = '/index_dev.html'

app.use '/js', express.static(path.join(public_dir, '/js'))
app.use '/images', express.static(path.join(public_dir, '/images'))
app.use '/svgs', express.static(path.join(public_dir, '/svgs'))
app.all '/*', (req, res, next) ->
    res.sendFile path.join(public_dir, index_subpath, index)

app.use express.static(public_dir)

if process.env.PORT
    port = process.env.PORT
else if process.env.NODE_ENV is 'production'
    port = 4444
else
    port = 3333

app.listen port, ->
    c 'server listening on ', port
