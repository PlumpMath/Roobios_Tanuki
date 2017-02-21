


styles =
    servers_cont:
        display: 'flex'

        flexDirection: 'column'
        backgroundColor: 'thistle'
        minHeight: '100%'
        maxWidth: 50
        minWidth: 50
        # width: '60px'



servers_column = ->
    div
        style: styles.servers_cont
        span
            style:
                fontSize: 10
            'servers column'












exports.default = servers_column
