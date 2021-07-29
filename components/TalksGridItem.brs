function init()
    m.background = m.top.findNode("background")
    m.thumbnail = m.top.findNode("thumbnail")
    m.label = m.top.findNode("label")
end function 


function onWidthChanged()
    m.background.width = m.top.width
    m.thumbnail.width = m.top.width
    m.label.width = m.top.width
end function


function onHeightChanged()
    m.background.height = m.top.height
    m.thumbnail.height = m.top.height
    m.label.height = m.top.height
end function


sub onContentChanged()
    newContent = m.top.itemContent
    m.thumbnail.uri = newContent.FHDPosterUrl
    m.label.text = newContent.title
end sub
