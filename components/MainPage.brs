function init()
    initTopNavigationBar()
    initTalksRowList()
    m.top.observeField("focusedChild", "onFocusChange")
end function 


sub initTopNavigationBar()
    m.topNavigationBar = m.top.findNode("topNavigationBar")
    m.topNavigationBarContent = CreateObject("roSGNode", "ContentNode")
    addTopNavigationBarItem("Recent talks")
    addTopNavigationBarItem("Browse playlists") 
    m.topNavigationBar.content = m.topNavigationBarContent
end sub


sub addTopNavigationBarItem(initialText as string)
    item = m.topNavigationBarContent.createChild("ContentNode")
    item.title = initialText
end sub


sub initTalksRowList()
    m.talksRowList = m.top.findNode("talksRowList")
    talksRowListContentNode = CreateObject("roSGNode", "ContentNode")
    for x = 1 to 6
        row = talksRowListContentNode.createChild("ContentNode")
        randomNumber = Rnd(15) + 5
        for y = 1 to randomNumber
            item = row.createChild("ContentNode")
        end for
    end for
    m.talksRowList.content = talksRowListContentNode 
end sub


function onKeyEvent(key as string, press as boolean) as boolean
    if press
        currentTalksRowListRow = m.talksRowList.rowItemFocused[0]
        currentTalksRowListColumn = m.talksRowList.rowItemFocused[1]
        currentTopNavigationBarItem = m.topNavigationBar.itemFocused
        if key = "back"
            if currentTopNavigationBarItem = 0 and m.topNavigationBar.hasFocus()
                showExitDialog()
                return true
            else if currentTalksRowListColumn <> 0
                m.talksRowList.jumpToRowItem = [currentTalksRowListRow, 0]  
                return true
            else if currentTalksRowListRow <> 0 
                m.talksRowList.jumpToRowItem = [0, 0]  
                return true 
            else
                m.topNavigationBar.setFocus(true)
                return true
            end if
        else if key = "up"
            if currentTalksRowListColumn = 0 and currentTalksRowListRow = 0
                m.topNavigationBar.setFocus(true)
                return true
            end if
            return true
        else if key = "down"
            if currentTopNavigationBarItem = 0
                m.talksRowList.setFocus(true)
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
        m.talksRowList.setFocus(true)
    end if
end sub
