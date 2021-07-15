
function init()
    m.hwLabel = m.top.findNode("hwLabel")
    
    m.hwLabel.translation = [1920 *  0.5 - m.hwLabel.width * 0.5, 1080 * 0.5 - m.hwLabel.height * 0.5]

    ' Set the font size.
    m.hwLabel.font.size = 92
    
    ' Set the color to light blue.
    m.hwLabel.color = "0xFFFFFF"
    
    m.top.setFocus(true)
end function
