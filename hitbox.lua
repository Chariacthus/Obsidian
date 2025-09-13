-- // Hitbox Expander (Made by char)

if not game:IsLoaded() then game.Loaded:Wait() end

local Players, RunService = game:GetService("Players"), game:GetService("RunService")
local LocalPlayer, hitboxObjects = Players.LocalPlayer, {}
local hitboxEnabled, rainbowMode = false, false
local hitboxSize, hitboxTransparency, hitboxColor = Vector3.new(5,5,5), 0.7, Color3.fromRGB(255,0,0)

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/Library.lua"))()
local Window = Library:CreateWindow({Title="Hitbox Expander",Center=true,AutoShow=true})

local function applyHitbox(player)
    if player==LocalPlayer or not player.Character then return end
    local hrp = player.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    if hitboxEnabled then
        hrp.Size,hrp.Transparency,hrp.Color,hrp.Material,hrp.CanCollide =
        hitboxSize,hitboxTransparency,hitboxColor,Enum.Material.Neon,false
    else
        hrp.Size,hrp.Transparency,hrp.Material,hrp.Color =
        Vector3.new(2,2,1),1,Enum.Material.Plastic,Color3.new(1,1,1)
    end
    hitboxObjects[player]=hrp
end

local function setupPlayer(plr)
    plr.CharacterAdded:Connect(function() task.wait(0.5) applyHitbox(plr) end)
end
for _,p in pairs(Players:GetPlayers()) do setupPlayer(p) end
Players.PlayerAdded:Connect(setupPlayer)

local HitboxBox = Window:AddTab("Hitbox Expander","target"):AddLeftGroupbox("Hitbox Settings")
HitboxBox:AddToggle("EnableHitbox",{Text="Enable Hitbox Expander",Callback=function(s)
    hitboxEnabled=s; for _,p in pairs(Players:GetPlayers()) do applyHitbox(p) end end})
HitboxBox:AddSlider("HitboxSize",{Text="Hitbox Size",Default=5,Min=2,Max=20,Rounding=1,Callback=function(v)
    hitboxSize=Vector3.new(v,v,v); for _,p in pairs(Players:GetPlayers()) do applyHitbox(p) end end})
HitboxBox:AddSlider("HitboxTransparency",{Text="Hitbox Transparency",Default=0.7,Min=0,Max=1,Rounding=1,Callback=function(v)
    hitboxTransparency=v; for _,p in pairs(Players:GetPlayers()) do applyHitbox(p) end end})

local ColorBox = Window:AddTab("Hitbox Color","palette"):AddLeftGroupbox("Hitbox Colors")
for n,c in pairs({Red=Color3.new(1,0,0),Blue=Color3.new(0,0,1),Green=Color3.new(0,1,0),Yellow=Color3.new(1,1,0),Purple=Color3.fromRGB(128,0,128),Pink=Color3.fromRGB(255,105,180)}) do
    ColorBox:AddButton(n,function() hitboxColor=c; for _,p in pairs(Players:GetPlayers()) do applyHitbox(p) end end)
end
ColorBox:AddToggle("RainbowHitbox",{Text="Rainbow Mode",Callback=function(s) rainbowMode=s end})

RunService.RenderStepped:Connect(function()
    if rainbowMode then
        local col=Color3.fromHSV((tick()%5)/5,1,1)
        for _,hrp in pairs(hitboxObjects) do if hrp and hrp.Parent then hrp.Color=col end end
    end
end)

Window:AddTab("Credits","star"):AddLeftGroupbox("Credits"):AddLabel("Made by char")
