
sub main()
    screen = createObject("roSGScreen")
    m.port = createObject("roMessagePort")
    screen.setMessagePort(m.port)
    scene = screen.createScene("MainScene")
    screen.show()
    scene.observeField("closeChannel", m.port)
    scene.setFocus(true)

    while true
        msg = wait(0, m.port)
        msgType = type(msg)

        if msgType = "roSGScreenEvent"
            if msg.isScreenClosed()
                return
            end if
        else if msgType = "roSGNodeEvent"
            field = msg.getField()
            if field = "closeChannel"
                return
            end if
        end if
    end while
end sub
