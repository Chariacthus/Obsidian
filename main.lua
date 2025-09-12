-- Load WindUI
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

-- Create the window
local Window = WindUI:CreateWindow({
    Title = "Obsidian",
    Icon = "sparkle",
    Author = "By char",
    Folder = "obsidian",
    SideBarWidth = 200,
    HideSearchBar = false,
    ScrollBarEnabled = true,
})

-- Create tabs
local Main = Window:Tab({ Title = "Main", Icon = "house", Locked = false })
local Game = Window:Tab({ Title = "Game Scripts", Icon = "gamepad-2", Locked = false })
local Universal = Window:Tab({ Title = "Universal Scripts", Icon = "earth", Locked = false })
local Settings = Window:Tab({ Title = "Settings", Icon = "settings", Locked = false })


-- Section in Main tab
local Section = Main:Section({ 
    Title = "Info",
    TextXAlignment = "Left",
    TextSize = 17,
})

-- Get player display name
local Players = game:GetService("Players")
local player = Players.LocalPlayer or Players.PlayerAdded:Wait()
local displayname = player.DisplayName or player.Name

-- Paragraph in Main tab with display name
local WelcomeParagraph = Main:Paragraph({
    Title = "Welcome " .. displayname .. ".",
    Desc = "Obsidian focuses on quality, which is one of the reasons why it does not include a scripthub.",
    Locked = false,
})

local myParagraph = Universal:Paragraph({
    Title = "Infinite Yield ",
    Desc = "Infinite Yield is a popular admin command script for Roblox.",
    Color = "Grey",
    Image = "https://i.pinimg.com/736x/03/d2/84/03d284fabde1086adc135cd8e855d483.jpg",
    ImageSize = 30,
    Thumbnail = "https://i.pinimg.com/736x/03/d2/84/03d284fabde1086adc135cd8e855d483.jpg",
    ThumbnailSize = 80,
    Locked = false,
Buttons = {
    {
        Title = "Load",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source', true))()
        end,
    }
}
})

local myParagraph = Universal:Paragraph({
    Title = "Dark Dex",
    Desc = "Dark Dex is a Roblox tool that lets you explore and edit objects and scripts in a game.",
    Color = "Black",
    Image = "https://i.pinimg.com/736x/03/d2/84/03d284fabde1086adc135cd8e855d483.jpg",
    ImageSize = 30,
    Thumbnail = "https://i.pinimg.com/736x/03/d2/84/03d284fabde1086adc135cd8e855d483.jpg",
    ThumbnailSize = 80,
    Locked = false,
Buttons = {
    {
        Title = "Load",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source', true))()
        end,
    }
}
})


Window:SelectTab(1)
Window:ToggleTransparency(true)
