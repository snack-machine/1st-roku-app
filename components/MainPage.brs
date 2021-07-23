function init()
    initMainMarkupGrid()
    initMainRowList()
    m.mainMarkupGrid.setFocus(true)
end function 


sub initMainMarkupGrid()
    m.mainMarkupGrid = m.top.findNode("mainMarkupGrid")
    m.mainMarkupGridContent = CreateObject("roSGNode", "ContentNode")
    addMarkupGridItem("Recent talks")
    addMarkupGridItem("Browse playlists")
    m.mainMarkupGrid.content = m.mainMarkupGridContent
end sub


sub addMarkupGridItem(initialText as string)
    item = m.mainMarkupGridContent.createChild("MarkupGridContent")
    item.labelText = initialText
end sub


sub changeFocusedMarkupGridItem()

end sub


sub initMainRowList()
    m.rowList = m.top.findNode("mainRowList")
    rowListContentNode = CreateObject("roSGNode", "ContentNode")
    for x = 1 to 6
        row = rowListContentNode.createChild("ContentNode")
        randomNumber = Rnd(15) + 5
        for y = 1 to randomNumber
            item = row.createChild("ContentNode")
        end for
    end for
    m.rowList.content = rowListContentNode 
    m.top.observeField("focusedChild", "onFocusChange")
end sub


function onKeyEvent(key as string, press as boolean) as boolean
    if press
        if key = "back"
            currentRow = m.rowList.rowItemFocused[0]
            currentColumn = m.rowList.rowItemFocused[1]
            if currentColumn <> 0
                m.rowList.jumpToRowItem = [currentRow, 0]  
                return true
            else if currentRow <> 0 
                m.rowList.jumpToRowItem = [0, 0]  
                return true 
            else
                showExitDialog()
                return true
            end if
        end if
    end if
    return false
end function 


sub showExitDialog()
    exitDialog = createObject("roSGNode", "Dialog")
    exitDialog.title = "Leaving the channel"
    exitDialog.message = "Are you sure?"
    exitDialog.buttons = ["Exit", "Cancel"]
    exitDialog.observeFieldScoped("buttonSelected", "onButtonSelected")
    m.top.getScene().dialog = exitDialog
end sub


sub onButtonSelected(event as object)
    buttonSelected = event.getData()
    if buttonSelected = 0
        leaveChannel()
    else if buttonSelected = 1
        closeDialog()
    end if
end sub


sub leaveChannel()
    m.top.getScene().closeChannel = true
end sub


sub closeDialog()
    m.top.getScene().dialog.close = true
end sub


sub onFocusChange()
    if m.top.hasFocus()
        m.rowList.setFocus(true)
    end if
end sub
