function init()
    m.background = m.top.findNode("background")
    m.label = m.top.findNode("label")
end function 


function onWidthChanged()
    m.background.width = m.top.width * 0.9
    m.label.width = m.top.width * 0.9
end function


function onHeightChanged()
    m.background.height = m.top.height * 0.9
    m.label.height = m.top.height * 0.5
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
  m.label.text = "Row: " + (m.top.rowIndex + 1).toStr() + " Column: " + (m.top.index + 1).toStr()
end function

