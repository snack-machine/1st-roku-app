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
    ' 0.75 is the factor for the image height to get a 4 to 3 ratio
    coeffForRatio4To3 = 0.75
    m.background.height = m.background.width * coeffForRatio4To3
    m.thumbnail.height = m.background.width * coeffForRatio4To3
    span = 10
    m.label.translation = [0, m.thumbnail.height + span]
end function


sub onContentChanged()
    newContent = m.top.itemContent
    m.thumbnail.uri = newContent.FHDPosterUrl
    m.label.text = newContent.title
end sub
