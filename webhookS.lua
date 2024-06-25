local discordWebhookURL = "url"

function sendDiscordMessage(message)
sendOptions = {
    formFields = {
        content="```"..message.."```"
    },
}
fetchRemote ( discordWebhookURL, sendOptions, WebhookCallback )
end

function WebhookCallback(responseData) 
outputDebugString("(Discord webhook callback): responseData: "..responseData)
end


function SendDiscordJoin(player, command)
oyuncu = getPlayerName(source)
sendDiscordMessage("Oyuncu Giriş Yaptı: "..oyuncu)
end
addEventHandler ( "onPlayerJoin", root, SendDiscordJoin )

function SendDiscordJoin(player, command)
oyuncu = getPlayerName(source)
sendDiscordMessage("Oyuncu Çıkış Yaptı: "..oyuncu)
end
addEventHandler ( "onPlayerQuit", root, SendDiscordJoin )

local function playerChat(message, messageType)
isim = getPlayerName(source)
	if messageType == 0 then --Global (main) chat
                cancelEvent()
                local red, green, blue = getPlayerNametagColor(source)
		--outputChatBox(getPlayerName(source)..": #FFFFFF"..message, root, red, green, blue, true )
		--outputServerLog("CHAT: "..getPlayerName(source)..": "..message)
		sendDiscordMessage(isim.." : "..	message)
	end
end
addEventHandler("onPlayerChat", root, playerChat)