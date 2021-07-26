sub addItem(parent as object, initialText as string)
    item = parent.createChild("ContentNode")
    item.title = initialText
end sub
