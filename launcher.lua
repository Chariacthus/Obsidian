local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "Obsidian Launcher",
    Icon = "sparkle",
    Author = "v1.0",
    Size = UDim2.new(0, 460, 0, 500), 
    SideBarWidth = 0,  -- hides the sidebar
    Folder = "obs",
})

local Tab = Window:Tab({
    Title = "Main",
    Icon = "bird",
    Locked = false,
})

Window:SelectTab(1) -- Number of Tab

local Section = Tab:Section({ 
    Title = "Status",
    TextXAlignment = "Left",
    TextSize = 17, -- Default Size
})

local Paragraph = Tab:Paragraph({
    Title = "Launcher",
    Desc = "Active",
})

local Paragraph = Tab:Paragraph({
    Title = "Obsidian",
    Desc = "Active",
})

local Section = Tab:Section({ 
    Title = "Changelog",
    TextXAlignment = "Left",
    TextSize = 17, -- Default Size
})

local Paragraph1 = Tab:Paragraph({
    Title = "12/9",
    Desc = [[
- Added 50 games
- Added Launcher
- Added Settings
- Added Universal Scripts
- Fixed minor bugs
- Improved UI layout
- Updated server statuses
]],
    Locked = false,
})

local Section = Tab:Section({ 
    Title = "Launcher",
    TextXAlignment = "Left",
    TextSize = 17, -- Default Size
})

local Button = Tab:Button({
    Title = "Launch",
    Desc = "Click to launch the Obsidian",
    Locked = false,
    Callback = function()
            Window:Destroy()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Chariacthus/Obsidian/refs/heads/main/main.lua"))()
    end
})


WindUI:AddTheme({
    Name = "Classic",
    Accent = "#3c3c3c",
    Dialog = "#4a4a4a",
    Outline = "#dcdcdc",
    Text = "#f5f5f5",
    Placeholder = "#b3b3b3",
    Background = "#222222",
    Button = "#5a5a5a",
    Icon = "#c8c8c8",
})


local Dropdown = Tab:Dropdown({
    Title = "Theme",
    Values = { "Light", "Dark", "Classic" },
    Value = "Dark",  -- default selected
    Callback = function(option) 
        WindUI:SetTheme(option) 
    end
})

Window:DisableTopbarButtons({
    "Minimize", 
    "Fullscreen",
    "Close",  
})

Window:ToggleTransparency(true)
