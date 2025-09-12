local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "Obsidian",
    Icon = "sparkle",
    Author = "By char",
    Folder = "obsidian",
    SideBarWidth = 200,
    HideSearchBar = false,
    ScrollBarEnabled = true,
})

local Main = Window:Tab({
    Title = "Main",
    Icon = "house",
    Locked = false,
})

local Section = Tab:Section({ 
    Title = "Info",
    TextXAlignment = "Left",
    TextSize = 17, -- Default Size
})

local Paragraph = Main:Paragraph({
    Title = "",
    Desc = "Test Paragraph",
    Locked = false,
})


Window:SelectTab(1)

Window:ToggleTransparency(true)
