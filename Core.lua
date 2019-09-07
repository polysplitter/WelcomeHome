WelcomeHome = AceLibrary("AceAddon-2.0"):new("AceConsole-2.0")

function WelcomeHome:OnInitialize()
    -- Called when the addon is loaded
end

function WelcomeHome:OnEnable()
    -- Called when the addon is enabled
    self:Print("Enabled: Hello World!")
end

function WelcomeHome:OnDisable()
    -- Called when the addon is disabled
    self:Print("Disabled: Bye World!")
end