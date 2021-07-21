function init()
    m.rowList = m.top.findNode("mainRowList")
    mainContentNode = CreateObject("roSGNode", "ContentNode")

    for x = 1 to 6
        row = mainContentNode.createChild("ContentNode")
        randomNumber = Rnd(15) + 5
        for y = 1 to randomNumber
            item = row.createChild("ContentNode")
        end for
    end for

    m.rowList.content = mainContentNode 
    m.rowList.setFocus(true)
end function 


function onKeyEvent(key as string, press as boolean) as boolean
    if press and key = "back"
        currentRow = m.rowList.rowItemFocused[0]
        currentColumn = m.rowList.rowItemFocused[1]

        if currentColumn <> 0
            m.rowList.jumpToRowItem = [currentRow, 0]  
            return true
        else if currentRow <> 0 
            m.rowList.jumpToRowItem = [0, currentColumn]  
            return true 
        else
            
        end if
    end if

    return false
end function 