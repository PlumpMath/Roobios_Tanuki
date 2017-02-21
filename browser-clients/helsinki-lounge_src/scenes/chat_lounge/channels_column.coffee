


styles =
    main_channels_cont:
        display: 'flex'
        flexDirection: 'column'
        backgroundColor: 'linen'
        minHeight: '100%'
        maxWidth: 120
        minWidth: 120

channels_column = ->
    div
        style: styles.main_channels_cont
        span { style: styles_one.dev_label }, "channels_column"













exports.default = channels_column
