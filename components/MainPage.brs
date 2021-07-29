function init()
    initTopNavigationBar()
    m.talksGrid = m.top.findNode("talksGrid")
    m.top.observeField("focusedChild", "onFocusChange")
    initLoadRecentTalksTask()
end function 


sub initTopNavigationBar()
    m.topNavigationBar = m.top.findNode("topNavigationBar")
    m.topNavigationBarContent = CreateObject("roSGNode", "ContentNode")
    addItem(m.topNavigationBarContent, "Recent talks")
    addItem(m.topNavigationBarContent, "Browse playlists") 
    m.topNavigationBar.content = m.topNavigationBarContent
    adjustWidthOfTopNavigationBarItems()
end sub


sub adjustWidthOfTopNavigationBarItems()
    item1 = m.topNavigationBar.content.getChild(0)
    item2 = m.topNavigationBar.content.getChild(1)
    newColumnWidths = [getTextWidth(item1), getTextWidth(item2)]
    m.topNavigationBar.columnWidths = newColumnWidths
end sub


sub initLoadRecentTalksTask()
    m.loadRecentTalksTask = CreateObject("roSGNode", "LoadRecentTalksTask")
    m.loadRecentTalksTask.observeField("result", "onLoadRecentTalksTaskResult")
    m.loadRecentTalksTask.control = "run"
end sub


sub onLoadRecentTalksTaskResult(newContent as object)
    m.talksGrid.content = newContent.getData()
end sub


function onKeyEvent(key as string, press as boolean) as boolean
    if press
        currentTalksGridRow = m.talksGrid.itemFocused \ m.talksGrid.numColumns    
        currentTalksGridColumn = m.talksGrid.itemFocused mod m.talksGrid.numColumns 
        currentTopNavigationBarItem = m.topNavigationBar.itemFocused

        if key = "back"
            if currentTopNavigationBarItem = 0 and m.topNavigationBar.hasFocus()
                showExitDialog()
                return true
            else if currentTalksGridColumn <> 0
                m.talksGrid.jumpToItem = currentTalksGridRow * m.talksGrid.numColumns
                return true
            else if currentTalksGridRow <> 0 
                m.talksGrid.jumpToItem = 0  
                return true 
            else
                firstItem = m.topNavigationBar.content.getChild(0)
                firstItem.isVisualFocused = false
                m.topNavigationBar.setFocus(true)
                return true
            end if
        else if key = "up"
            if currentTalksGridColumn = 0 and currentTalksGridRow = 0
                firstItem = m.topNavigationBar.content.getChild(0)
                firstItem.isVisualFocused = false
                m.topNavigationBar.setFocus(true)
                return true
            end if
            return true
        else if key = "down"
            if currentTopNavigationBarItem = 0
                firstItem = m.topNavigationBar.content.getChild(0)
                firstItem.isVisualFocused = true
                m.talksGrid.setFocus(true)
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
        m.talksGrid.setFocus(true)
    end if
end sub
