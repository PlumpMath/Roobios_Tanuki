path = require 'path'
output_path = path.resolve(__dirname, '..', 'public', 'js')

module.exports = config =

    node:
        fs: "empty"
    context: __dirname
    cache: true
    entry:
        app: ['../src/containers/Root/index_dev.coffee']
        # app: ['./react_clients_src/admin_interface_src/app.coffee']
    stats:
        colors: on
        reasons: on
    module:

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
                loaders: ['coffee-loader']
            }
        ]
    # externals:
    #     "react": "React",
    #     "react-dom": "ReactDOM"
    output:
        path: output_path
        filename: 'app_development.js'
