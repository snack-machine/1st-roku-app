function init()
    m.background = m.top.findNode("background")
    m.label = m.top.findNode("label")
end function 


function onWidthChanged()
    m.background.width = m.top.width
    m.label.width = m.top.width
end function


function onHeightChanged()
    m.background.height = m.top.height
    m.label.height = m.top.height
end function


sub onIndexChanged()
  if m.top.rowIndex = -1 then return
  updateLabel()
end sub


sub onRowIndexChanged()
  if m.top.index = -1 then return
  updateLabel()
end sub


function updateLabel()
  m.label.text = "Row: " + (m.top.rowIndex + 1).toStr() + chr(10) + "Col: " + (m.top.index + 1).toStr()
end function

