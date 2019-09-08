message = "Banana"

local options = {
    type = 'group',
    args = {
        msg = {
            type = 'text',
            name = 'msg',
            desc = 'The message text to be displayed',
            usage = '<Your message here>',
            get = 'GetMessage',
            set = function(value)
                message = value
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
    self:Print("Enabled: Hello World!")
    self:Print("zones " .. GetRealZoneText() .. " " .. GetSubZoneText())
    self:RegisterEvent("ZONE_CHANGED")
end

function WelcomeHome:ZONE_CHANGED()
    self:Print("You have changed zones! " .. UnitName('player') .. " " .. GetRealZoneText())
    self:Print("Your bind location is: " .. GetBindLocation())
    if GetBindLocation() == GetSubZoneText() then
        self:Print(message)
    end
end

function WelcomeHome:GetMessage() 
    return message
end

-- function WelcomeHome.SetMessage(newValue)
--     WelcomeHome.message = newValue
-- end

function WelcomeHome:OnDisable()
    -- Called when the addon is disabled
    self:Print("Disabled: Bye World!")
end