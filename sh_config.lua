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

PLUGIN.guiTime = 15

PLUGIN.groupAccess = {
    ["owner"] = true,
    ["founder"] = true,
    ["superadmin"] = true,
    ["admin"] = true,
    ["senior_administrator"] = true,
    ["regular_administrator"] = true,
    ["junior_administrator"] = true,
}

PLUGIN:AddNewNotify("killed", function(client, target, weapon)
    return Color(223, 66, 66), client, Color(255, 255, 255), " убил игрока ", Color(74, 114, 202), target, Color(255, 255, 255), weapon and (" при помощи " .. weapon) or ""
end)

PLUGIN:AddNewNotify("joincharacter", function(clientSt, client)
    return Color(74, 114, 202), clientSt, Color(255, 255, 255), " зашел за персонажа ", Color(216, 204, 34), client
end)

PLUGIN:AddNewNotify("spawn", function(client)
    return Color(74, 114, 202), client, Color(255, 255, 255), " возродился"
end)

PLUGIN:AddNewNotify("connect", function(client)
    return Color(50, 211, 77), client, Color(255, 255, 255), " подключился к серверу"
end)

PLUGIN:AddNewNotify("disconnect", function(client)
    return Color(202, 74, 74), client, Color(255, 255, 255), " отключился от сервера"
end)
