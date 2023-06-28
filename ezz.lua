-- Public Custom Capybara Modules By Ham#4565 --
repeat task.wait() until game:IsLoaded()
repeat task.wait() until shared.GuiLibrary
local GuiLibrary = shared.GuiLibrary
local ScriptSettings = {}
local UIS = game:GetService("UserInputService")
local COB = function(tab, argstable) 
    return GuiLibrary["ObjectsThatCanBeSaved"][tab.."Window"]["Api"].CreateOptionsButton(argstable)
end


function notify(text)
    local frame = GuiLibrary["CreateNotification"]("Capybara V1 Notification", text, 5, "assets/WarningNotification.png")
    frame.Frame.Frame.ImageColor3 = Color3.fromRGB(255, 64, 64)
end
function boxnotify(text)
    if messagebox then
        messagebox(text, "Capybara V1", 0)
     end
end

local AntiCrash = COB("World", {
    Name = "AntiCrash",
    Function = function(callback) 
        if callback then
            ScriptSettings.AntiCrash = true
            while wait(1.5) do
                if not ScriptSettings.AntiCrash == true then return end
               if game:GetService("Workspace"):GetRealPhysicsFPS() < ScriptSettings.AntiCrash_MinFps then
                    game:Shutdown()
                    boxnotify("FPS Are under minimum. Closed game.")
                end  
                if math.floor(tonumber(game:GetService("Stats"):FindFirstChild("PerformanceStats").Ping:GetValue())) > ScriptSettings.AntiCrash_MaxPing then
                    game:Shutdown()
		    boxnotify("Ping Are over maximum. Closed game.")
                end
            end       
        else
            ScriptSettings.AntiCrash = false
        end
    end,
    Default = false,
    HoverText = "Automatically shutdowns game when fps or ping too low/high"
})
AntiCrash.CreateSlider({
    ["Name"] = "MinFps",
    ["Min"] = 0,
    ["Max"] = 100,
    ["Function"] = function(val)
        ScriptSettings.AntiCrash_MinFps = val
    end,
    ["HoverText"] = "Minimum fps before closing roblox",
    ["Default"] = 10
})
AntiCrash.CreateSlider({
    ["Name"] = "MaxPing",
    ["Min"] = 1000,
    ["Max"] = 100000,
    ["Function"] = function(val)
        ScriptSettings.AntiCrash_MaxPing = val
    end,
    ["HoverText"] = "Minimum fps before closing roblox",
    ["Default"] = 10
})

local AnticheatDisabler = COB("Blatant", {
    Name = "ProFly.",
    Function = function(callback) 
        if callback then
          workspace.Gravity = 10
        else
            workspace.Gravity = 196.19999694824
        end
    end,
    Default = false,
    HoverText = "Sooo pro"
})

local AnticheatDisabler = COB("World", {
    Name = "Old Antivoid",
    Function = function(callback) 
        if callback then
            local antivoidpart = Instance.new("Part", Workspace)
            antivoidpart.Name = "AntiVoid"
            antivoidpart.Size = Vector3.new(2100, 0.5, 2000)
            antivoidpart.Position = Vector3.new(160.5, 25, 247.5)
            antivoidpart.Transparency = 0.4
            antivoidpart.Anchored = true
            antivoidpart.Touched:connect(function(dumbcocks)
                if dumbcocks.Parent:WaitForChild("Humanoid") and dumbcocks.Parent.Name == lplr.Name then
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
                    wait(0.2)
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
                    wait(0.2)
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
                end
            end)
        end
    end,
    Default = false,
    HoverText = "stud antivoid"
})

local AnticheatDisabler = COB("Render", {
    Name = "Ocean Lighting",
    Function = function(callback) 
        if callback then
    game.Lighting.Ambient = Color3.fromRGB(0,0,255)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
        end
    end,
    Default = false,
    HoverText = "pov your a shark lmao"
})

local AnticheatDisabler = COB("Render", {
    Name = "Blood Lighting",
    Function = function(callback) 
        if callback then
         game.Lighting.Ambient = Color3.fromRGB(255,0,0)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
        end
    end,
    Default = false,
    HoverText = "dracula.exe running"
})

local AnticheatDisabler = COB("World", {
    Name = "Shaders",
    Function = function(callback) 
        if callback then
            -- // Exec once for shaders, exec again to turn off
-- // Terrible code lmfaoo

local lighting = game:GetService("Lighting")
getgenv().shaders = {}
if not shared.Check then
getgenv().oldLighting = {}
getgenv().oldLightingProp = {  -- keep old game lighting or whatever
    Ambient = lighting.Ambient,
    Brightness = lighting.Brightness,
    ColorShift_Bottom = lighting.ColorShift_Bottom,
    ColorShift_Top = lighting.ColorShift_Top,
    GlobalShadows = lighting.GlobalShadows,
    OutdoorAmbient = lighting.OutdoorAmbient,
    ShadowSoftness = lighting.ShadowSoftness,
    EnvironmentDiffuseScale = lighting.EnvironmentDiffuseScale,
    EnvironmentSpecularScale = lighting.EnvironmentSpecularScale,
    ClockTime = lighting.ClockTime,
    GeographicLatitude = lighting.GeographicLatitude,
}
end
function revertshaders()
    for i,v in pairs(getgenv().oldLightingProp) do
        lighting[i] = v
    end
    for i,v in pairs(lighting:GetChildren()) do 
        if not v:IsA("BlurEffect") and v.ClassName:lower():find("effect") then 
            v.Parent = nil
        end 
    end
    
    for i,v in pairs(oldLighting) do 
        v.Parent = lighting
    end
    
    for i,v in pairs(getgenv().shaders) do 
        v.Parent = nil
    end
    
    sethiddenproperty(lighting, "Technology", getgenv().oldLighting["Technology"])
end


function doshaders()
for i,v in pairs(lighting:GetChildren()) do 
    if not v:IsA("BlurEffect") and v.ClassName:lower():find("effect") then 
        getgenv().oldLighting[v.Name] = v
        v.Parent = nil
    end 
    getgenv().oldLighting["Technology"] = gethiddenproperty(lighting, "Technology")
end
    local Bloom = lighting:FindFirstChild("EngoShaders_Bloom") or Instance.new("BloomEffect", lighting)
    local ColorCorrection = lighting:FindFirstChild("EngoShaders_ColorCorrection") or Instance.new("ColorCorrectionEffect", lighting)
    getgenv().shaders["Bloom"] = Bloom 
    getgenv().shaders["ColorCorrection"] = ColorCorrection
    lighting.Ambient = Color3.fromRGB(230, 164, 50)
    lighting.Brightness = 7
    lighting.ColorShift_Bottom = Color3.fromRGB(0,0,0)
    lighting.ColorShift_Top = Color3.fromRGB(217, 140, 32)
    lighting.GlobalShadows = true
    lighting.OutdoorAmbient = Color3.fromRGB(102, 105, 50)
    lighting.ShadowSoftness = 0
    lighting.EnvironmentDiffuseScale = 0.05
    lighting.EnvironmentSpecularScale = 0.05
    sethiddenproperty(lighting, "Technology", Enum.Technology.ShadowMap)
    lighting.ClockTime = 9
    lighting.GeographicLatitude = 80
    Bloom.Name = "EngoShaders_Bloom"
    Bloom.Intensity = 0.1 
    Bloom.Size = 46
    Bloom.Threshold = 0.8
    ColorCorrection.Name = "EngoShaders_ColorCorrection"
    ColorCorrection.TintColor = Color3.fromRGB(244, 255, 210)
    ColorCorrection.Contrast = 0.2
    ColorCorrection.Brightness = -0.05
end

if shared.ShadersExecuted then
shared.ShadersExecuted = false
revertshaders()
else
shared.ShadersExecuted = true
doshaders()
end

shared.Check = true -- keep old game lighting or whatever
        end
    end,
    Default = false,
    HoverText = "Private shader"
})

local AnticheatDisabler = COB("Render", {
    Name = "AestheticLighting",
    Function = function(callback) 
        if callback then
    game.Lighting.Ambient = Color3.fromRGB(135, 31, 219)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(135, 31, 219)
        end
    end,
    Default = false,
    HoverText = "Cool Lighting "
})

local AnticheatDisabler = COB("Render", {
    Name = "BigHead (requires rthro head)",
    Function = function(callback) 
        if callback then
         loadstring(game:HttpGet("https://raw.githubusercontent.com/sysGhost-aka-BiKode/Scripts2022/main/BigHeadV3_Unpatched", true))()
        end
    end,
    Default = false,
    HoverText = "From Ixvl's custom vape ty"
})

local AnticheatDisabler = COB("Blatant", {
    Name = "JN HH Gayming Speed",
    Function = function(callback) 
        if callback then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 41
        end
    end,
    Default = false,
    HoverText = "no anticheat yess"
})

local AnticheatDisabler = COB("Render", {
    Name = "HalloweenLighting",
    Function = function(callback) 
        if callback then
    game.Lighting.Ambient = Color3.fromRGB(230, 135, 41)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(230, 135, 41)
        end
    end,
    Default = false,
    HoverText = "🎃"
})

local AnticheatDisabler = COB("Render", {
    Name = "GooseQuote",
    Function = function(callback) 
        if callback then
    --[[// CMDS: 
    >goose *remember this can change if u change prefixv*
    >crazydave
    >duck
    *more soon*
]]

--// Locals
local players = game:GetService('Players')
local quotes = {"am goose hjonk", "good work", "🦆", "nsfd asdas sorry hard to type withh feet", "i cause problems on purpose", "peace was never an option", "am goose", "honk honk", "peace truly was never an option", "i steel u food", "i eat ur crops"} 
local wabbys = {"wabby weebo", "waddo wabby wabbo woaboo wop", "behbapbow bhow", "DraGdVA", "VHAvEVAa", "wabby", "weebo", "beDragFha haBha"}
local prefix = ">"
local prefixv = "goose"
local ver = "1.0.3"

local function csay(tex)
    wait(0.1)
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(tex, "All")
end

--// Script
spawn(function()
    players.PlayerChatted:Connect(function(PlayerChatType, sender, message, recipient)
        if message == prefix..prefixv then
            csay(quotes[math.random(#quotes)].." -the goose [goose qoutes "..ver.."]") 
        elseif message == prefix.."duck" then
            csay("is u that dumb? HOW DO U NOT KNOW THE DIFFERENCE BETWEEN DUCK AND GOOSE?!")
        elseif message == prefix.."crazydave" then
            csay(wabbys[math.random(#wabbys)])
        end
    end)
end)

csay("goose quote [by spec] loaded! 🦆🦆 say "..prefix..prefixv.." for a goose quote! 🦆🦆 [gquote "..ver.."] *or try to find secret cmds*", "All")

spawn(function()
    while wait(120) do
        csay("🦆🦆 just a reminder to say "..prefix..prefixv.." for a goose quote! 🦆🦆 [gquote "..ver.."]", "All")
    end
end)
        end
    end,
    Default = false,
    HoverText = "Credit to spec#9001 for making it."
})

local AnticheatDisabler = COB("Render", {
    Name = "OldRoblox",
    Function = function(callback) 
        if callback then
    --// remastered a old script i never released, hope u enjoy :)
--// epic 2016 remastered
if not game:IsLoaded() then
	game.Loaded:Wait()
end
wait()

--// instances
local cc = Instance.new("ColorCorrectionEffect")
local lighting = game:GetService("Lighting")

--// hd killer
local ihateu = {"DepthOfFieldEffect", "SunRaysEffect", "BloomEffect", "BlurEffect", "ColorCorrectionEffect", "Atmosphere"}
for i, v in pairs(lighting:GetChildren()) do
    for index, value in ipairs(ihateu) do
    	if v:IsA(value) then
    	   v:Destroy() 
    	end
    end
end

--// setup
cc.Parent = game.Lighting
cc.Saturation = -0.1
cc.Contrast = -0.1
lighting.GlobalShadows = false

sethiddenproperty(lighting, "Technology", Enum.Technology.Compatibility) 

settings().Rendering.QualityLevel = 7

--// load old gui
loadstring(game:HttpGet('https://raw.githubusercontent.com/specowos/lua-projects/main/small%20projects/project%3A2016/2016raw.lua',true))()
        end
    end,
    Default = false,
    HoverText = "Changes Lighting And Textures To fit the old roblox style."
})

local AnticheatDisabler = COB("Render", {
    Name = "ShrekLighting",
    Function = function(callback) 
        if callback then
    game.Lighting.Ambient = Color3.fromRGB(66, 207, 23)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(66, 207, 23)
        end
    end,
    Default = false,
    HoverText = "yes"
})

local AnticheatDisabler = COB("Render", {
    Name = "ChillLighting",
    Function = function(callback) 
        if callback then
    game.Lighting.Ambient = Color3.fromRGB(32, 212, 212)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(32, 212, 212)
        end
    end,
    Default = false,
    HoverText = "cool ig"
})

local AnticheatDisabler = COB("Render", {
    Name = "Sky",
    Function = function(callback) 
        if callback then
    local Lighting = game.Lighting
local random = math.random(100000000, 999999999)
Lighting.Name = "Lighting"..random
local LightingName = "Lighting"..random
for i,v in pairs(Lighting:GetChildren()) do
	v:Destroy()
end
wait(.1)
---Instance---
local Atmosphere = Instance.new("Atmosphere")
local Sky = Instance.new("Sky")
local Bloom = Instance.new("BloomEffect")
local ColorCorrection = Instance.new("ColorCorrectionEffect")
local DepthOfField = Instance.new("DepthOfFieldEffect")
local SunRays = Instance.new("SunRaysEffect")
--------------

--Parent--
Atmosphere.Parent = game[LightingName]
Sky.Parent = game[LightingName]
Bloom.Parent = game[LightingName]
ColorCorrection.Parent = game[LightingName]
DepthOfField.Parent = game[LightingName]
SunRays.Parent = game[LightingName]
----------

--------Vibe Sky pack--------
	--Vibe Sky Pack
	game[LightingName].Sky.SkyboxBk = "rbxassetid://5084575798"
	game[LightingName].Sky.SkyboxDn = "rbxassetid://5084575916"
	game[LightingName].Sky.SkyboxFt = "rbxassetid://5103949679"
	game[LightingName].Sky.SkyboxLf = "rbxassetid://5103948542"
	game[LightingName].Sky.SkyboxRt = "rbxassetid://5103948784"
	game[LightingName].Sky.SkyboxUp = "rbxassetid://5084576400"
	game[LightingName].Sky.MoonAngularSize = 0
	game[LightingName].Sky.SunAngularSize = 0
    game[LightingName].Sky.SunTextureId = ""
    game[LightingName].Sky.MoonTextureId = ""
	game[LightingName].Brightness = 0
	game[LightingName].GlobalShadows = true
	game[LightingName].ClockTime = 17.8
	game[LightingName].GeographicLatitude = 0


	game[LightingName].Atmosphere.Density = 0.3
	game[LightingName].Atmosphere.Offset = 0.25
	game[LightingName].Atmosphere.Color = Color3.new(199, 199, 199)
	game[LightingName].Atmosphere.Decay = Color3.new(106, 112, 125)
	game[LightingName].Atmosphere.Glare = 0
	game[LightingName].Atmosphere.Haze = 0

	game[LightingName].Bloom.Enabled = true
	game[LightingName].Bloom.Intensity = 1
	game[LightingName].Bloom.Size = 24
	game[LightingName].Bloom.Threshold = 2

	game[LightingName].DepthOfField.Enabled = false
	game[LightingName].DepthOfField.FarIntensity = 0.1
	game[LightingName].DepthOfField.FocusDistance = 0.05
	game[LightingName].DepthOfField.InFocusRadius = 30
	game[LightingName].DepthOfField.NearIntensity = 0.75

	game[LightingName].SunRays.Enabled = true
	game[LightingName].SunRays.Intensity = 0.01
	game[LightingName].SunRays.Spread = 0.1
---------------------------------
        end
    end,
    Default = false,
    HoverText = "IMPORTANT! THIS WILL NOT WORK WITH WINTER THEME OR FULLBRIGHT TURN THOSE OFF!"
})

local AnticheatDisabler = COB("Utility", {
    Name = "Chat-Crasher",
    Function = function(callback) 
        if callback then
      -- FE chat made by MrBeast#5353
-- The effect isn't immediate, it they may take a few minutes.
-- This is a beta version, it only works in games that use the default roblox chat
while true do
    wait(1.7)
local args = {
    [1] = " ",
    [2] = "All"
}
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
end
        end
    end,
    Default = false,
    HoverText = "Only works sometimes ;c"
})

local AnticheatDisabler = COB("Blatant", {
    Name = "JN-Skid Infinite Jump",
    Function = function(callback) 
        if callback then
local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfiniteJumpEnabled then
		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)
        end
    end,
    Default = false,
    HoverText = "OP LONGJUMP HACKS WORKING 2022"
})

local AnticheatDisabler = COB("Utility", {
    Name = "JN-SKID TOTALLY REL ANTICHEAT DISABLER!1",
    Function = function(callback) 
        if callback then
       loadstring(game:HttpGet(('https://raw.githubusercontent.com/Cesare0328/my-scripts/main/joke%20anticheat.lua'),true))()

        end
    end,
    Default = false,
    HoverText = "when you delete your root part and call it a Anticheat disabler 💀"
})

local AnticheatDisabler = COB("Render", {
    Name = "NickHider",
    Function = function(callback) 
        if callback then
         while game:IsLoaded() == false do wait() end
local fakeplr = {["Name"] = "ROBLOX", ["UserId"] = "1"}
local otherfakeplayers = {["Name"] = "ROBLOX", ["UserId"] = "1"}
local lplr = game:GetService("Players").LocalPlayer

local function plrthing(obj, property)
    for i,v in pairs(game:GetService("Players"):GetChildren()) do
        if v ~= lplr then
            obj[property] = obj[property]:gsub(v.Name, otherfakeplayers["Name"])
            obj[property] = obj[property]:gsub(v.DisplayName, otherfakeplayers["Name"])
            obj[property] = obj[property]:gsub(v.UserId, otherfakeplayers["UserId"])
        else
            obj[property] = obj[property]:gsub(v.Name, fakeplr["Name"])
            obj[property] = obj[property]:gsub(v.DisplayName, fakeplr["Name"])
            obj[property] = obj[property]:gsub(v.UserId, fakeplr["UserId"])
        end
    end
end

local function newobj(v)
    if v:IsA("TextLabel") or v:IsA("TextButton") then
        plrthing(v, "Text")
        v:GetPropertyChangedSignal("Text"):connect(function()
            plrthing(v, "Text")
        end)
    end
    if v:IsA("ImageLabel") then
        plrthing(v, "Image")
        v:GetPropertyChangedSignal("Image"):connect(function()
            plrthing(v, "Image")
        end)
    end
end

for i,v in pairs(game:GetDescendants()) do
    newobj(v)
end
game.DescendantAdded:connect(newobj)
        end
    end,
    Default = false,
    HoverText = "old feature in vape i tried to recreate"
})

local AnticheatDisabler = COB("World", {
    Name = "Load da Rektsky",
    Function = function(callback) 
        if callback then
         loadstring(game:HttpGet("https://raw.githubusercontent.com/8pmX8/rektsky4roblox/main/mainscript.lua"))()
        end
    end,
    Default = false,
    HoverText = "Loads rektsky made by 8pmx8"
})

COB("Blatant", {
    Name = "MoonInfCustomFLY",
	HoverText = "redid",
    Function = function(v)
        longjumpval = v
        if longjumpval then
			workspace.Gravity = 55
            spawn(function()
                repeat
                    if (not longjumpval) then return end
                  game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Freefall")
					wait(0.000000000000001)
                   game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Running")
					wait(0.000000000000001)
                  game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Climbing")
					wait(0.000000000000001)
                   game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Swimming")
					wait(0.000000000000001)
					game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
					wait(0.000000000000001)
                  game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Landed")
					wait(0.000000000000001)
					game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Freefall")
					wait(0.000000000000001)
					game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Landed")
					wait(0.000000000000001)
					game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Freefall")
					wait(0.000000000000001)
                   game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Freefall")
					wait(0.000000000000001)
					 game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Landed")
					wait(0.000000000000001)
					 game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Swimming")
					wait(0.000000000000001)
					 game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Swimming")
					wait(0.000000000000001)
					 game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Landed")
					wait(0.000000000000001)
					 game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Freefall")
					wait(0.000000000000001)
					 game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Landed")
					wait(0.000000000000001)
					 game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Running")
					wait(0.000000000000001)
					 game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Running")
					wait(0.000000000000001)
					 game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Landed")
					wait(0.000000000000001)
					 game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Swimming")
					wait(0.000000000000001)
				 game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Swimming")
					wait(0.000000000000001)
					 game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Running")
					wait(0.000000000000001)
					 game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Landed")
					wait(0.000000000000001)
                until (not longjumpval)
            end)
        else
            workspace.Gravity = 196.19999694824
            return
        end
    end
})


COB("Blatant", {
    Name = "AnticheatBFly",
	HoverText = "best bypass",
    Function = function(v)
        longjumpval = v
        if longjumpval then
			workspace.Gravity = 0
            spawn(function()
                repeat
                    if (not longjumpval) then return end
                  game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Freefall")
					wait(0.000000000000001)
                   game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Running")
					wait(0.000000000000001)
                  game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Climbing")
					wait(0.000000000000001)
                   game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Swimming")
					wait(0.000000000000001)
					game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Landed")
					wait(0.000000000000001)
                until (not longjumpval)
            end)
        else
            workspace.Gravity = 196.19999694824
            return
        end
    end
})

local AnticheatDisabler = COB("Render", {
    Name = "AestheticLightingV2",
    Function = function(callback) 
        if callback then
             local Lighting = game:GetService("Lighting")
local StarterGui = game:GetService("StarterGui")
local Bloom = Instance.new("BloomEffect")
local Blur = Instance.new("BlurEffect")
local ColorCor = Instance.new("ColorCorrectionEffect")
local SunRays = Instance.new("SunRaysEffect")
local Sky = Instance.new("Sky")
local Atm = Instance.new("Atmosphere")


for i, v in pairs(Lighting:GetChildren()) do
	if v then
		v:Destroy()
	end
end

Bloom.Parent = Lighting
Blur.Parent = Lighting
ColorCor.Parent = Lighting
SunRays.Parent = Lighting
Sky.Parent = Lighting
Atm.Parent = Lighting

if Vignette == true then
	local Gui = Instance.new("ScreenGui")
	Gui.Parent = StarterGui
	Gui.IgnoreGuiInset = true
	
	local ShadowFrame = Instance.new("ImageLabel")
	ShadowFrame.Parent = Gui
	ShadowFrame.AnchorPoint = Vector2.new(0.5,1)
	ShadowFrame.Position = UDim2.new(0.5,0,1,0)
	ShadowFrame.Size = UDim2.new(1,0,1.05,0)
	ShadowFrame.BackgroundTransparency = 1
	ShadowFrame.Image = "rbxassetid://4576475446"
	ShadowFrame.ImageTransparency = 0.3
	ShadowFrame.ZIndex = 10
end

Bloom.Intensity = 1
Bloom.Size = 2
Bloom.Threshold = 2

Blur.Size = 0

ColorCor.Brightness = 0.1
ColorCor.Contrast = 0
ColorCor.Saturation = -0.3
ColorCor.TintColor = Color3.fromRGB(107, 78, 173)

SunRays.Intensity = 0.03
SunRays.Spread = 0.727

Sky.SkyboxBk = "http://www.roblox.com/asset/?id=8139677359"
Sky.SkyboxDn = "http://www.roblox.com/asset/?id=8139677253"
Sky.SkyboxFt = "http://www.roblox.com/asset/?id=8139677111"
Sky.SkyboxLf = "http://www.roblox.com/asset/?id=8139676988"
Sky.SkyboxRt = "http://www.roblox.com/asset/?id=8139676842"
Sky.SkyboxUp = "http://www.roblox.com/asset/?id=8139676647"
Sky.SunAngularSize = 10

Lighting.Ambient = Color3.fromRGB(128,128,128)
Lighting.Brightness = 2
Lighting.ColorShift_Bottom = Color3.fromRGB(0,0,0)
Lighting.ColorShift_Top = Color3.fromRGB(0,0,0)
Lighting.EnvironmentDiffuseScale = 0.2
Lighting.EnvironmentSpecularScale = 0.2
Lighting.GlobalShadows = false
Lighting.OutdoorAmbient = Color3.fromRGB(0,0,0)
Lighting.ShadowSoftness = 0.2
Lighting.ClockTime = 14
Lighting.GeographicLatitude = 45
Lighting.ExposureCompensation = 0.5

        end
    end,
    Default = false,
    HoverText = "use if u want idfk"
})

local AnticheatDisabler = COB("World", {
    Name = "UltraFPSBoost",
    Function = function(callback) 
        if callback then
        local decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
local g = game
local w = g.Workspace
local l = g.Lighting
local t = w.Terrain
t.WaterWaveSize = 0
t.WaterWaveSpeed = 0
t.WaterReflectance = 0
t.WaterTransparency = 0
l.GlobalShadows = false
l.FogEnd = 9e9
l.Brightness = 0
settings().Rendering.QualityLevel = "Level01"
for i, v in pairs(g:GetDescendants()) do
    if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
    elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
        v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
        v.BlastPressure = 1
        v.BlastRadius = 1
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") then
        v.Enabled = false
    elseif v:IsA("MeshPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
        v.TextureID = 10385902758728957
    end
end
for i, e in pairs(l:GetChildren()) do
    if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
        e.Enabled = false
    end
end
        end
    end,
    Default = false,
    HoverText = "best fps boost out there, to bad its private cry"
})

local AnticheatDisabler = COB("Blatant", {
    Name = "Infinite Yield",
    Function = function(callback) 
        if callback then
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
        end
    end,
    Default = false,
    HoverText = false
})

local AnticheatDisabler = COB("World", {
    Name = "Whitelists (in console)",
    Function = function(callback) 
        if callback then
       print ("Whitelisted!")
        end
    end,
    Default = false,
    HoverText = "ok"
})

COB("Blatant", {
    Name = "ProFlyV2",
	HoverText = "v2",
    Function = function(v)
        longjumpval = v
        if longjumpval then
			workspace.Gravity = 10
            spawn(function()
                repeat
                    if (not longjumpval) then return end
                  game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Freefall")
					wait(0.000000000000001)
                   game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Running")
					wait(0.000000000000001)
                  game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Climbing")
					wait(0.000000000000001)
                   game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Swimming")
					wait(0.000000000000001)
					game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Landed")
					wait(0.000000000000001)
                until (not longjumpval)
            end)
        else
            workspace.Gravity = 196.19999694824
            return
        end
    end
})

local AnticheatDisabler = COB("Blatant", {
    Name = "InfiniteJump",
    Function = function(callback) 
        if callback then
            toggled = true
				game:GetService("UserInputService").jumpRequest:Connect(function()
					if toggled == true then
						wait(jumpdelay)
						game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass"Humanoid":ChangeState("Jumping")
						wait(0.0000003)
						game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass"Humanoid":ChangeState("freefall")						
					end
				end)
			else
				toggled = false
        end
    end,
    Default = false,
    HoverText = "jumps inf times"
})

local AnticheatDisabler = COB("World", {
    Name = "funny",
    Function = function(callback) 
        if callback then
        if not game:IsLoaded() then
	game.Loaded:Wait()
end
wait()

--// instances
local cc = Instance.new("ColorCorrectionEffect")
local lighting = game:GetService("Lighting")
local sbox = Instance.new("Sky")

--// coool
sbox.Parent = lighting
sbox.SkyboxBk = "http://www.roblox.com/asset/?id=9276018925"
sbox.SkyboxDn = "http://www.roblox.com/asset/?id=9276018925"
sbox.SkyboxFt = "http://www.roblox.com/asset/?id=9276018925"
sbox.SkyboxLf = "http://www.roblox.com/asset/?id=9276018925"
sbox.SkyboxRt = "http://www.roblox.com/asset/?id=9276018925"
sbox.SkyboxUp = "http://www.roblox.com/asset/?id=9276018925"

lighting.Ambient = Color3.fromRGB(128,128,128)
lighting.FogColor = Color3.fromRGB(128,128,128)
lighting.ClockTime = 14
lighting.FogEnd = 2000

for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
    if v:IsA("BasePart") and v.Material == Enum.Material.Grass then
        v.Transparency = 0.25
        v.Color = Color3.fromRGB(125, 125, 200)
    end
end

        end
    end,
    Default = false,
    HoverText = false
})