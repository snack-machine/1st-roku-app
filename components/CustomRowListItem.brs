function init()
    m.background = m.top.findNode("background")
end function 


function onWidthChanged()
    m.background.width = m.top.width * 0.9
end function


function onHeightChanged()
    m.background.height = m.top.height * 0.9
end function