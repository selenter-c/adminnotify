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

local PANEL = {}

function PANEL:Init()
    self:SetPos(0, 0)
    self:SetSize(ScrW(), ScrH())

    ix.adminnotify = self
    self.panels = self.panels or {}
end

function PANEL:AddNewNotify(data)
    self.panels = self.panels or {}

    local str = "<font=ixAdminNotifyFont>"
    local colorSet = false
    for k, v in pairs(data) do
        if isstring(v) or isnumber(v) then
            str = str .. v
        elseif istable(v) then
            if colorSet then str = str .. "</colour>" end
            str = str .. "<colour=" .. v.r .. "," .. v.g .. "," .. v.b .. "," .. v.a .. ">"
        end
    end

    if colorSet then str = str .. "</colour>" end
    str = str .. "</font>"

    local onlyString = ""
    for k, v in pairs(data) do
        if isstring(v) or isnumber(v) then
            onlyString = onlyString .. v
        end
    end

    surface.SetFont( "ixAdminNotifyFont" )
    local width, height = surface.GetTextSize(onlyString)

    local panel = self:Add("ixAdminNotifyAdd")
    panel.text = str
    panel.text2 = onlyString
    panel.width = width + 8
    panel.height = height + 8
    panel.id = #self.panels + 1
    panel.time = SysTime() + PLUGIN.guiTime

    self.panels[panel.id] = panel

    timer.Simple(PLUGIN.guiTime, function()
        if IsValid(panel) then
            panel.width = 0
            panel.height = 0

            panel:AlphaTo(0, 0.5, 0, function()
                self.panels[panel.id] = nil
                panel:Remove()
            end)
        end
    end)
end

function PANEL:Think()
    local y = 0
    for k, v in SortedPairs(ix.adminnotify.panels or {}) do
        if IsValid(v) then
            y = y + v:GetTall() + 4
            v.__y = y
        end
    end
end

vgui.Register("ixAdminNotify", PANEL, "Panel")


local PANEL = {}

function PANEL:Init()
    self:SetPos(0, 0)
    self:SetSize(0, 0)

    self:SetAlpha(0)
    self:AlphaTo(255, 0.1)
end

function PANEL:Paint(w, h)
    self.parsed = markup.Parse(self.text or "")

    local t = (self.time or 0) - SysTime()

    surface.SetDrawColor(0, 0, 0, 175)
    surface.DrawRect(0, 0, w, h)

    surface.SetDrawColor(ix.config.Get("color"))
    surface.DrawRect(0, h-2, t * (w / 15), 2)

    draw.DrawText(self.text2 or "", "ixAdminNotifyFont", 4, 5, Color(0, 0, 0, 255), TEXT_ALIGN_LEFT)
    self.parsed:Draw(4, 4, TEXT_ALIGN_LEFT)
end

function PANEL:Think()
    if !self._w or !self._h then self._w, self._h, self._y = 0, 0, 0 end

    self._w = Lerp(FrameTime() * 10, self._w, self.width or 0)
    self._h = Lerp(FrameTime() * 10, self._h, self.height or 0)
    self._y = Lerp(FrameTime() * 10, self._y, self.__y or ScrH())

    self:SetWide(self._w)
    self:SetTall(self._h)
    self:SetY(self._y)
    self:SetX(ScrW() - self._w - 24)
end

vgui.Register("ixAdminNotifyAdd", PANEL, "DPanel")