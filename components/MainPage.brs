function init()
    rowList = m.top.findNode("mainRowList")
    mainContentNode = CreateObject("roSGNode", "ContentNode")

    ' rows = createObject("roArray", 6, true)
    ' for x = 1 to 6
    '     rows.Push(rows[x].createChild("ContentNode"))
    ' end for
    
    ' row1 = mainContentNode.createChild("ContentNode")

    for x = 1 to 6
        row = mainContentNode.createChild("ContentNode")
        for y = 1 to Rnd(20)
            item = row.createChild("ContentNode")
        end for
    end for

    rowList.content = mainContentNode 
    
    m.top.setFocus(true)
end function 