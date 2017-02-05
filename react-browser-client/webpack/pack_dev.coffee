path = require 'path'
output_path = path.resolve(__dirname, '..', 'public', 'js')

module.exports = config =
    worker:
        output:
            filename: "hash.worker.js"
            chunkFilename: "[id].hash.worker.js"
    node:
        fs: "empty"
    context: __dirname
    cache: true
    debug: true
    entry:
        app: ['../src/containers/Root/index_dev.coffee']
        # app: ['./react_clients_src/admin_interface_src/app.coffee']
    stats:
        colors: on
        reasons: on
    module:
        preLoaders: [
            {
                test: /\.js$/
                loader: "source-map-loader"
            }
        ]
        loaders: [
            # {
            #     test: /\.glsl$/
            #     loader: 'webpack-glsl'
            # },
            # {
            #     test: /\.styl$/
            #     loader: 'style-loader!css-loader!stylus-loader'
            # },
            {
                test: /\.coffee$/
                loaders: ['coffee-loader', 'source-map-loader']
            }
        ]
    # externals:
    #     "react": "React",
    #     "react-dom": "ReactDOM"
    output:
        path: output_path
        filename: 'app_development.js'

    # plugins: [
    #     new webpack.DefinePlugin
    #         'process.env':
    #             NODE_ENV: '"production"'
    #         __CLIENT__: true
    #         __SERVER__: false
    #         __DEVELOPMENT__: false
    #         __DEVTOOLS__: false
    # ]
