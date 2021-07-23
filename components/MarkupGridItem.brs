sub init()
    m.background = m.top.findNode("background")
    m.label = m.top.findNode("label")
end sub


sub onWidthChanged()
    m.background.width = m.top.width
    m.label.width = m.top.width
end sub


sub onHeightChanged()
    m.background.height = m.top.height
    m.label.height = m.top.height
end sub


sub onContentChanged()
    newContent = m.top.itemContent 
    m.label.text = newContent.labelText
end sub


sub onFocusChanged()
    newState = m.top.itemHasFocus
    m.background.color = getCurrentBackgroundColor(newState)
end sub


function getCurrentBackgroundColor(state as boolean)
    if state = true
        color = "#1565c0"
    else
        color = "#455a64"
    end if
    return color
end function
