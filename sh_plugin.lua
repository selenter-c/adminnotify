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

PLUGIN.name = "AdminNotify"
PLUGIN.author = "AsterionTeam"
PLUGIN.description = ""

PLUGIN.notifyList = PLUGIN.notifyList or {}

function PLUGIN:HasAccess(client)
    if !IsValid(client) then return end

    return self.groupAccess[client:GetUserGroup()]
end

function PLUGIN:AddNewNotify(name, data)
    if !name then return end
    if !isfunction(data) then return end

    self.notifyList[name] = data
end

ix.util.Include("cl_plugin.lua")
ix.util.Include("sh_config.lua")
ix.util.Include("sv_plugin.lua")
