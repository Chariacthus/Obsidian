local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/refs/heads/main/Library.lua"))()

local Window = Library:CreateWindow({
    Title = "Obsidian",
    Footer = "v1.0.0",
    ToggleKeybind = Enum.KeyCode.RightControl,
    Center = true,
    AutoShow = true
})

local MainTab = Window:AddTab("Main", "house", "Overview & Info")
local GameTab = Window:AddTab("Game Scripts", "gamepad-2", "Search to find games")
local UniversalTab = Window:AddTab("Universal Scripts", "earth", "Scripts for any game")
local SettingsTab = Window:AddTab("Settings", "settings", "Settings & Configurations")
local CreditsTab = Window:AddTab("Credits", "star", "Credits & Acknowledgements")

-- Developers
local DevelopersBox = CreditsTab:AddLeftGroupbox("Developers", "user-pen")
DevelopersBox:AddLabel("char — Lead Developer")
DevelopersBox:AddLabel("bitdancerr — Developer")

-- Contributors / Library
local ContributorsBox = CreditsTab:AddRightGroupbox("Contributors", "users")
ContributorsBox:AddLabel("bitdancerr")
ContributorsBox:AddLabel("deividcomsono")

-- Version Info
local VersionBox = CreditsTab:AddLeftGroupbox("Version", "history")
VersionBox:AddLabel("Current Version: 1.0.0")
VersionBox:AddLabel("Last Updated: 13/9/25")

-- How to Contribute
local ContributeBox = CreditsTab:AddLeftGroupbox("Want to Contribute?", "info")
ContributeBox:AddLabel({
    Text = "Submit feature suggestions on the Main page. Approved ideas will earn you a spot on the contributor list.",
    DoesWrap = true
})


local LeftGroupbox = MainTab:AddLeftGroupbox("Information", "info")
local RightGroupbox = MainTab:AddRightGroupbox("Changelog", "info")

local displayName = game.Players.LocalPlayer.DisplayName
LeftGroupbox:AddLabel("Hello " .. displayName)

LeftGroupbox:AddLabel({
    Text = "Welcome to Obsidian. Please note this script hub is still in BETA, so bugs may occur.",
    DoesWrap = true
})
RightGroupbox:AddLabel({
    Text = [[
v1.0.0 - 13/9/25

- Initial release of Obsidian
- Added MainPage, Added Support for 50+ games, Added 20 Universal Scripts, and 10 FE Scripts, Settings, and Credits.
- Implemented bug report and suggestion inputs with webhook
- Added version info and developer/contributor credits
- UI improvements for groupboxes and labels
- Basic Changelog tab with wrapped text support
]],
    DoesWrap = true
})


local Tabbox = MainTab:AddLeftTabbox("Settings")
local Tab1 = Tabbox:AddTab("Report")
local Tab2 = Tabbox:AddTab("Suggest")

local WebhookURL = "https://discord.com/api/webhooks/1416373366880735282/q4BY9rsChDMljM1kOdG6CKdhJ8VO-oNrRryOO5s3JIByA6Wqqa2CM3SxwtH_vKoVbcNK"
local HttpService = game:GetService("HttpService")

local function SendToWebhook(content)
    local jsonData = HttpService:JSONEncode({content = content})
    if syn then
        syn.request({
            Url = WebhookURL,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = jsonData
        })
    elseif http_request then
        http_request({
            Url = WebhookURL,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = jsonData
        })
    elseif fluxus then
        fluxus.request({
            Url = WebhookURL,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = jsonData
        })
    else
        warn("No supported HTTP request function found.")
    end
end

-- General tab input (Bug Reports)
-- General tab input (Bug Reports)
Tab1:AddInput("ReportInput", {
    Text = "Report",
    Default = "",
    Numeric = false,
    Finished = true,
    Placeholder = "Please describe the bug in detail",
    Callback = function(Value)
        if Value ~= "" then
            local playerName = game.Players.LocalPlayer.Name
            SendToWebhook("🐞 **Bug Report from "..playerName.."**:\n"..Value)
        end
    end
})

-- Advanced tab input (Suggestions)
Tab2:AddInput("SuggestInput", {
    Text = "Suggest",
    Default = "",
    Numeric = false,
    Finished = true,
    Placeholder = "Provide a suggestion for improvement",
    Callback = function(Value)
        if Value ~= "" then
            local playerName = game.Players.LocalPlayer.Name
            SendToWebhook("💡 **Suggestion from "..playerName.."**:\n"..Value)
        end
    end
})
