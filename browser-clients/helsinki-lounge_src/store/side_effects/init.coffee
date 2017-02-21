arq = {}

arq['init_keyboard'] = ({ desire, store }) ->
    window.keypress_ee = new EE()
    document.onkeydown = (e) =>
        keycode = e.keycode or e.which
        if keycode is 13
            keypress_ee.emit 'new_keypress_enter'
        else if keycode is 27
            keypress_ee.emit 'new_keypress_escape'

exports.default = arq
