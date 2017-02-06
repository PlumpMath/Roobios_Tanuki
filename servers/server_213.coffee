



dev_server = ({ env }) ->

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

    common_html_dir = path.resolve('..', 'react-browser-client', 'public')

    helsinki_lounge_dev_arq = do ->
        cookie_parser_secret = "sa4004chpaseutshtm$*(0909(*^))"
        cookies = cookie_parser cookie_parser_secret

        cookie_parser_secret: cookie_parser_secret
        cookies: cookies
        index_path: '/html/helsinki_lounge_index_dev.html'
        primus_dir: path.resolve('..', 'react-browser-client', 'public', 'js')


    primus_session_f = require './modules/primus_session.coffee'
