local discord_webhook = {
    url = "Discord Webhook URL Here,
    image = "Image URL Here"
}

AddEventHandler("chatMessage", function(source, author, text)
    PerformHttpRequest(discord_webhook.url, 
    function(err, text, header) end, 
    'POST', 
    json.encode({username = author, content = text, avatar_url=discord_webhook.image }), {['Content-Type'] = 'application/json'}) 
    
end)


RegisterCommand("getspace", function(source, args)
    PerformHttpRequest("http://api.open-notify.org/astros.json", 
    function(err, text, header) 
        local data = json.decode(text)
        print(text)
        TriggerClientEvent("chat:addMessage", source, { args = {string.format("There are currently %s people in space", data.number)} })
    end, 
    'GET', 
    json.encode({}), {['Content-Type'] = 'application/json'})
end)
