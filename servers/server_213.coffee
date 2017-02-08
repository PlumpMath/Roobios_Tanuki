
dev_server = ({ env, cs, redis }) ->

    shortid = require 'shortid'
    c = console.log.bind console
    uuid = require 'node-uuid'
    v4 = uuid.v4.bind uuid
    color = require 'bash-color'
    body_parser = require 'body-parser'
    cookie_parser = require 'cookie-parser'
    express = require 'express'
    _ = require 'lodash'
    fs = require 'fs'
    path = require 'path'
    http = require 'http'
    Primus = require 'primus'

    {
        keys, assign, map, reduce
    } = _

    common_public_dir = path.resolve('..', 'react-browser-client', 'public')

    helsinki_lounge_arq = do ->
        cookie_parser_secret = "sa4004chpaseutshtm$*(0909(*^))"
        cookies = cookie_parser cookie_parser_secret

        cookie_parser_secret: cookie_parser_secret
        cookies: cookies
        index_path: '/html/helsinki_lounge_index_dev.html'
        primus_dir: path.resolve('..', 'react-browser-client', 'public', 'js')

    # brujo_terminal_arq = do ->
    #     cookie_parser_secret = "49894839avvmbk;"
    #     cookies: cookies
    #     index_path: '/html/brujo_terminal.html'
    #     primus_dir: path.resolve('..', 'react-browser-client', 'public', 'js')

    primus_session_f = require './modules/primus_session.coffee'

    app_helsinki_lounge = express()

    express_session = require 'express-session'
    connect_redis = require 'connect-redis'
    Redis_Store = connect_redis express_session

    helsinki_lounge_redis_store_opts = {}
    helsinki_lounge_redis_store = new Redis_Store(helsinki_lounge_redis_store_opts)

    # brujo_redis_store_opts = {}
    # brujo__redis__store = new Redis__Store(brujo_redis_store_opts)

    helsinki_lounge_store_arq =
        resave: true
        saveUninitialized: true
        store: helsinki_lounge_redis_store
        secret: helsinki_lounge_arq.cookie_parser_secret

    app_helsinki_lounge.use helsinki_lounge_arq.cookies
    app_helsinki_lounge.use express_session(helsinki_lounge_store_arq)
    app_helsinki_lounge.use '/js', express.static(path.join(common_public_dir, '/js'))
    app_helsinki_lounge.use '/css', express.static(path.join(common_public_dir, '/css'))
    app_helsinki_lounge.use '/images', express.static(path.join(common_public_dir, '/images'))
    app_helsinki_lounge.use '/fonts', express.static(path.join(common_public_dir, '/fonts'))
    app_helsinki_lounge.use '/svgs', express.static(path.join(common_public_dir, '/svgs'))

    app_helsinki_lounge.all '/*', (req, res, next) ->
        if not(includes(keys(req.cookies), 'caracal'))
            res.cookie 'caracal', "eureka::#{v4()}"
        res.sendFile path.join(common_public_dir, helsinki_lounge_arq.index_path)

    app_helsinki_lounge.use express.static(common_public_dir)

    app_helsinki_lounge_port = 6494
    app_brujo_port = 2239

    app_helsinki_lounge_server = http.createServer app_helsinki_lounge

    opts_helsinki_primus =
        transformer: 'websockets'

    helsinki_primus = new Primus(app_helsinki_lounge_server, opts_helsinki_primus)

    helsinki_primus.use 'cookies', helsinki_lounge_arq.cookies

    helsinki_primus.use 'session', primus_session_f, { store: helsinki_lounge_redis_store }

    helsinki_primus.save path.join(helsinki_lounge_arq.primus_dir, '/primus.js')

    require('../concordance/helsinki-lounge/index.coffee')
        env: env
        helsinki_primus: helsinki_primus
        redis: redis

    app_helsinki_lounge_server.listen app_helsinki_lounge_port, ->
        c color.blue("Server listening on port" , on), color.cyan(app_helsinki_lounge_port, on)

require('../concordance/helsinki-lounge/modules/startup_transce.coffee') { dev_server }
