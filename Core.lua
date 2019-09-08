message = "Sir! Home Base ahead!"
showInChat = false
showOnScreen = true

local options = {
    type = 'group',
    args = {
        msg = {
            type = 'text',
            name = 'msg',
            desc = 'The message text to be displayed',
            usage = '<Your message here>',
            get = function()
                return message
            end,
            set = function(value)
                message = value
            end,
        },
        showInChat = {
            type = 'toggle',
            name = 'Show in Chat',
            desc = 'Toggles the display of the message in the chat window',
            get = function()
                return showInChat
            end,
            set = function()
                showInChat = not showInChat
            end,
        },
        showOnScreen = {
            type = 'toggle',
            name = 'Show on Screen',
            desc = 'Toggles the display of the message on the screen',
            get = function()
                return showOnScreen
            end,
            set = function()
                showOnScreen = not showOnScreen
            end,
        },
    },
}

WelcomeHome = AceLibrary("AceAddon-2.0"):new("AceConsole-2.0", "AceEvent-2.0")
WelcomeHome:RegisterChatCommand({"/welcomehome", "/wh"}, options)

function WelcomeHome:OnInitialize()
    -- Called when the addon is loaded
end

function WelcomeHome:OnEnable()
    -- Called when the addon is enabled
    self:Print("zones " .. GetRealZoneText() .. " " .. GetSubZoneText())
    self:RegisterEvent("ZONE_CHANGED")
    self:RegisterEvent("ZONE_CHANGED_NEW_AREA")
end

function WelcomeHome:ZONE_CHANGED()
    if showInChat then
        self:Print("You have changed zones! " .. UnitName('player') .. ", You arrived at: " .. GetSubZoneText())
        self:Print("Your bind location is: " .. GetBindLocation())
        if GetBindLocation() == GetSubZoneText() then
            self:Print(message)
        end
    end

    if showOnScreen then 
        UIErrorsFrame:AddMessage("You have changed zones! " .. UnitName('player') .. ", You arrived at: " .. GetSubZoneText())
        UIErrorsFrame:AddMessage("Your bind location is: " .. GetBindLocation())
        if GetBindLocation() == GetSubZoneText() then
            UIErrorsFrame:AddMessage(message)
        end
    end
end

function WelcomeHome:ZONE_CHANGED_NEW_AREA()
    if showInChat then
        self:Print("You have changed zones! " .. UnitName('player') .. ", You arrived at: " .. GetRealZoneText())
        self:Print("Your bind location is: " .. GetBindLocation())
        if GetBindLocation() == GetRealZoneText() then
            self:Print(message)
        end
    end
    if showOnScreen then
        UIErrorsFrame:AddMessage("You have changed zones! " .. UnitName('player') .. ", You arrived at: " .. GetRealZoneText())
        UIErrorsFrame:AddMessage("Your bind location is: " .. GetBindLocation())
        if GetBindLocation() == GetRealZoneText() then
            UIErrorsFrame:AddMessage(message)
        end
    end
end
 
function WelcomeHome:OnDisable()
    -- Called when the addon is disabled
    self:Print("Disabled: Bye World!")
end