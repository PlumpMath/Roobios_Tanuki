

config = {}

global.c = console.log.bind console
global.color = require 'bash-color'
global._ = require 'lodash/fp'

global.sq_ = require 'lodash'
global.keys = _.keys
global.assign = _.assign

global.map = _.map
global.reduce = _.reduce

global.omit = _.omit

global.includes = sq_.includes
global.shortid = require 'shortid'
global.Imm = require 'immutable'

global.bcrypt = require 'bcrypt'
uuid = require 'node-uuid'
global.v4 = uuid.v4.bind uuid
global.async = require 'async'


Redis = require 'ioredis'

global.redis = new Redis({ db: 1, dropBufferSupport: true })
