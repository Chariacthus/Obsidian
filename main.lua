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

local Button = Universal:Button({
    Title = "Infinite Yield",
    Desc = "Infinite Yield is a popular admin command script for Roblox.",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
    end
})

local Button = Universal:Button({
    Title = "Dark Dex",
    Desc = "Dark Dex is a Roblox tool that lets you explore and edit objects and scripts in a game.",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/AlterX404/DarkDEX-V5/refs/heads/main/DarkDEX-V5', true))()
    end
})

local Button = Universal:Button({
    Title = "Dark Dex",
    Desc = "Dark Dex is a Roblox tool that lets you explore and edit objects and scripts in a game.",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/AlterX404/DarkDEX-V5/refs/heads/main/DarkDEX-V5', true))()
    end
})

Window:SelectTab(1)
Window:ToggleTransparency(true)
