function init()
    rowList = m.top.findNode("mainRowList")
    mainContentNode = CreateObject("roSGNode", "ContentNode")

    for x = 1 to 6
        row = mainContentNode.createChild("ContentNode")
        randomNumber = Rnd(20)
        for y = 1 to randomNumber
            item = row.createChild("ContentNode")
        end for
    end for

    rowList.content = mainContentNode 
    rowList.setFocus(true)
end function 