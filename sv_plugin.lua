--[[
        © Asterion Project 2021.
        This script was created from the developers of the AsterionTeam.
        You can get more information from one of the links below:
            Site - https://asterionproject.ru
            Discord - https://discord.gg/Cz3EQJ7WrF
        
        developer(s):
            Selenter - https://steamcommunity.com/id/selenter

        ——— Chop your own wood and it will warm you twice.
]]--

local PLUGIN = PLUGIN

function PLUGIN:SendNotify(notify, ...)
    if !self.notifyList[notify] then return end

    for k, v in pairs(player.GetAll()) do
        if self:HasAccess(v) then
            netstream.Start(v, "ixAdminNotify", notify, ...)
        end
    end
end

function PLUGIN:PlayerInitialSpawn(client)
    PLUGIN:SendNotify("connect", client:Name() .. " (" .. client:SteamID() .. ")")
end

function PLUGIN:OnCharacterDisconnect(client, character)
    PLUGIN:SendNotify("disconnect", client:Name() .. " [" .. character:GetName() .. "] (" .. client:SteamID() .. ")")
end

function PLUGIN:CharacterLoaded(character)
    PLUGIN:SendNotify("joincharacter", character:GetPlayer():SteamName(), character:GetName())
end

function PLUGIN:PlayerDeath(client, inflictor, attacker)
    local character = client:GetCharacter()
    local weapon = attacker:IsPlayer() and attacker:GetActiveWeapon()

    if character then
        PLUGIN:SendNotify("killed", attacker:GetName() ~= "" and attacker:GetName() .. " (" .. attacker:SteamName() .. ")" or attacker:GetClass(), client:Name() .. " (" .. client:SteamName() .. ")", IsValid(weapon) and weapon:GetClass())
    end
end

function PLUGIN:PlayerSpawn(client)
    PLUGIN:SendNotify("spawn", client:Name() .. " (" .. client:SteamName() .. ")")
end