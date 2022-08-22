QBCore = exports['qb-core']:GetCoreObject()
local PD = QBCore.Functions.GetPlayerData()
if PD.charinfo.firstname then
	Citizen.CreateThread(function()
		while true do
			SetDiscordAppId(Config.DiscordAppId)

			SetDiscordRichPresenceAsset(Config.LargeAssetName)
			SetDiscordRichPresenceAssetText(Config.LargeAssetText)
			SetDiscordRichPresenceAction(0, "Join Discord", Config.DiscordLink)
			SetDiscordRichPresenceAction(1, "Fly in!", Config.FiveMConnectLink)

			local PlayerData = QBCore.Functions.GetPlayerData()
			local name = "("..PlayerData.cid..") "..PlayerData.charinfo.firstname .." ".. PlayerData.charinfo.lastname..""
			SetRichPresence(name ..' playing '.. Config.ServerName)

			if Config.SmallAssetEnabled == true then
				SetDiscordRichPresenceAssetSmall(Config.SmallAsset)
				SetDiscordRichPresenceAssetSmallText(Config.SmallAssetText)
			end


			Citizen.Wait(30000)
		end
	end)
end