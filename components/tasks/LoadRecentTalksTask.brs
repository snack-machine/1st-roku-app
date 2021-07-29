sub init()
    m.top.functionName = "request"
end sub


sub request()
    talksUrl = "https://api.ted.com/v1/talks.json?api-key=4aufvjhph9rawjrp7xv23rte&sort=newest&fields=photo_urls,images,speakers,languages,media,media_profile_uris,viewed_count,image,original_image,talks&photo_url_sizes=113x85,240x180,615x461"
    urlTransfer = CreateObject("roUrlTransfer")
    urlTransfer.setCertificatesFile("common:/certs/ca-bundle.crt")
    urlTransfer.initClientCertificates()
    urlTransfer.setUrl(talksUrl)
    messagePort = createObject("roMessagePort")
    urlTransfer.setPort(messagePort)
    
    if urlTransfer.asyncGetToString()
        message = wait(10000, messagePort)
        if message <> invalid and type(message) = "roUrlEvent"
            response = message.getString()
            m.top.result = parseRecentTalks(response)
            urlTransfer.asyncCancel()
        end if
    end if
end sub


function parseRecentTalks(response as string)
    json = parseJson(response)
    result = CreateObject("roSGNode", "ContentNode")
    for each item in json.talks
        newTalk = result.createChild("ContentNode")
        talkData = item.talk
        newTalk.title = talkData.name
        newTalk.FHDPosterUrl = talkData.photo_urls[2].url
        newTalk.update(talkData, true)
    end for
    return result
end function
