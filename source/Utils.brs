sub addItem(parent as object, initialText as string)
    item = parent.createChild("ContentNode")
    item.title = initialText
end sub


function getTextWidth(sourceLabel as object, text as string)
    label = createObject("roSGNode", "label")
    label.text = text
    label.font = sourceLabel.font
    span = 15
    return label.boundingRect().width + (span * 2)
end function
