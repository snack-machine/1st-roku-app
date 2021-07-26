sub init()
    m.background = m.top.findNode("background")
    m.label = m.top.findNode("label")
    m.outline = m.top.findNode("outline")
end sub


sub onWidthChanged()
    m.background.width = m.top.width
    m.label.width = m.top.width
    m.outline.width = m.top.width
end sub


sub onHeightChanged()
    m.background.height = m.top.height
    m.label.height = m.top.height
    m.outline.height = m.top.height
end sub


sub onIndexChanged()
    if m.top.index = -1 
        return
    else if m.top.index = 0
        m.background.color = getCurrentBackgroundColor(true)
    else 
        m.background.color = getCurrentBackgroundColor(false)
    end if
end sub


sub onContentChanged()
    newContent = m.top.itemContent 
    m.label.text = newContent.labelText
end sub


sub onFocusChanged()
    newState = m.top.itemHasFocus
    m.background.color = getCurrentBackgroundColor(newState)
    m.outline.blendColor = getCurrentOutlineColor(newState)
end sub


function getCurrentBackgroundColor(state as boolean)
    if state = true
        color = "#1565c0"
    else
        color = "#37474f"
    end if
    return color
end function


function getCurrentOutlineColor(state as boolean)
    if state = false
        color = "#455a64"
    else
        color = "#37474f"
    end if
    return color
end function

