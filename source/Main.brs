
sub main()
    screen = createObject("roSGScreen")
    port = createObject("roMessagePort")
    screen.setMessagePort(port)
    scene = screen.createScene("MainScene")
    screen.show()

    while true
        msg = wait(0, port)
        msgType = type(msg)
        if msgType = "roSGScreenEvent"
            if msg.isScreenClosed()
                ' End the message loop.
                ' App closes when main() ends its execution.
                return
            end if
        end if
        
    end while
end sub
