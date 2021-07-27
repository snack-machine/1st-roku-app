sub addItem(parent as object, initialText as string)
    item = parent.createChild("ContentNode")
    item.addFields({isVisualFocused: false})
    item.title = initialText
end sub


function getTextWidth(item as object)
    label = createObject("roSGNode", "label")
    label.text = item.title
    label.font = "font:MediumBoldSystemFont" 
    span = 25
    labelRectangle = label.boundingRect()
    newWidth = labelRectangle.width + (span * 2)
    return newWidth
end function
