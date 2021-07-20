function init()
    rowList = m.top.findNode("mainRowList")
    rowList.content = CreateObject("roSGNode", "RowListContent")
    m.top.setFocus(true)
end function 
