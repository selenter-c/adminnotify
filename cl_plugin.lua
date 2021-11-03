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

surface.CreateFont("ixAdminNotifyFont", {
    font = "Arial",
    size = ScreenScale(5),
    weight = 400,
    extended = true,
    antialias = true,
    shadow = false,
})

function PLUGIN:CreateNotify(data)
    local panel = ix.adminnotify

    if !IsValid(panel) then
        panel = vgui.Create("ixAdminNotify")
    end

    panel:AddNewNotify(data)
end

netstream.Hook("ixAdminNotify", function(notify, ...)
    if !PLUGIN.notifyList[notify] then return end

    local info = {PLUGIN.notifyList[notify](...)}

    if #info > 0 then
        PLUGIN:CreateNotify(info)
        MsgC(unpack(info))
        Msg("\n")
    end
end)

timer.Simple(1, function()
    if IsValid(ix.adminnotify) then
        ix.adminnotify:Remove()
    end

    vgui.Create("ixAdminNotify")
end)
