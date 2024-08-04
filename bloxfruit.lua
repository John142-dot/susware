-- Load the Orion library
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Key for the key system
local Key = "zonkey9070"
local AccessGranted = false

-- Create the main window
local Window = OrionLib:MakeWindow({
    Name = "Orion Key System - Key: " .. Key,
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "OrionExample"
})

-- Create the key input tab
local KeyTab = Window:MakeTab({
    Name = "Key System",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Key input section
KeyTab:AddSection({
    Name = "Enter Key"
})

-- Key input textbox
KeyTab:AddTextbox({
    Name = "Key",
    Default = "",
    TextDisappear = true,
    Callback = function(value)
        if value == Key then
            AccessGranted = true
            OrionLib:MakeNotification({
                Name = "Access Granted",
                Content = "You have entered the correct key!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
            
            -- Execute the script from the URL
            local scriptContent = game:HttpGet("https://raw.githubusercontent.com/John142-dot/bloxfruitsgui/main/something.lua")
            loadstring(scriptContent)()
        else
            OrionLib:MakeNotification({
                Name = "Access Denied",
                Content = "The key you entered is incorrect.",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
    end
})

-- Hide other tabs until key is entered correctly
OrionLib:MakeTab({
    Name = "Scripts",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false,
    Disabled = not AccessGranted
})

-- Initialization
OrionLib:Init()
