
game.StarterGui:SetCore("ChatMakeSystemMessage",  { Text = "VERSION | 2.4.8", Color = Color3.fromRGB(255, 0, 0), Font = Enum.Font.Merriweather, FontSize = Enum.FontSize.Size24 } )
game.StarterGui:SetCore("ChatMakeSystemMessage",  { Text = "[Central Custom] Update Log:", Color = Color3.fromRGB(0, 255, 0), Font = Enum.Font.Merriweather, FontSize = Enum.FontSize.Size24 } )
game.StarterGui:SetCore("ChatMakeSystemMessage",  { Text = "[Central Custom] Removed BoostAirJump", Color = Color3.fromRGB(0, 255, 0), Font = Enum.Font.Merriweather, FontSize = Enum.FontSize.Size24 } )
game.StarterGui:SetCore("ChatMakeSystemMessage",  { Text = "[Central Custom] Fixing InfFly", Color = Color3.fromRGB(0, 255, 0), Font = Enum.Font.Merriweather, FontSize = Enum.FontSize.Size24 } )
game.StarterGui:SetCore("ChatMakeSystemMessage",  { Text = "[Central Custom] Fixed Code Errors", Color = Color3.fromRGB(0, 255, 0), Font = Enum.Font.Merriweather, FontSize = Enum.FontSize.Size24 } )
game.StarterGui:SetCore("ChatMakeSystemMessage",  { Text = "[Central Custom] Fixing FastFly", Color = Color3.fromRGB(0, 255, 0), Font = Enum.Font.Merriweather, FontSize = Enum.FontSize.Size24 } )

repeat task.wait() until shared.GuiLibrary
local uis = game:GetService("UserInputService")
local GuiLibrary = shared.GuiLibrary
local ScriptSettings = {}
local UIS = game:GetService("UserInputService")
local COB = function(tab, argstable) 
	return GuiLibrary["ObjectsThatCanBeSaved"][tab.."Window"]["Api"].CreateOptionsButton(argstable)
end
function securefunc(func)
	task.spawn(function()
		spawn(function()
			pcall(function()
				loadstring(
					func()
				)()
			end)
		end)
	end)
end
function getstate()
	local ClientStoreHandler = require(game.Players.LocalPlayer.PlayerScripts.TS.ui.store).ClientStore
	return ClientStoreHandler:getState().Game.matchState
end
function iscustommatch()
	local ClientStoreHandler = require(game.Players.LocalPlayer.PlayerScripts.TS.ui.store).ClientStore
	return ClientStoreHandler:getState().Game.customMatch
end
function checklagback()
	local hrp = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
	return isnetworkowner(hrp)
end

GuiLibrary["MainGui"].ScaledGui.ClickGui.Version.Text = "Central Custom | Version 2.5.1 PRIVATE"
GuiLibrary["MainGui"].ScaledGui.ClickGui.MainWindow.TextLabel.Text = "Central Custom VERSION 2.5.1 | PRIVATE"
GuiLibrary["MainGui"].ScaledGui.ClickGui.Version.Version.Text = "Central Custom V2"
GuiLibrary["MainGui"].ScaledGui.ClickGui.Version.Position = UDim2.new(1, -175 - 20, 1, -25)

local AnticheatDisabler = COB("Utility", {
    Name = "Infinite Yield",
    Function = function(callback) 
        if callback then
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
        end
    end,
    Default = false,
    HoverText = "Executes Infinite Yield"
})
local AnticheatDisabler = COB("Utility", {
    Name = "RecordingMode",
    Function = function(callback) 
        if callback then
local fakeplr = {["Name"] = "Central User", ["UserId"] = "971"}
local otherfakeplayers = {["Name"] = "", ["UserId"] = "1"}
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
    HoverText = "Protects everyones usernames"
})
local AnticheatDisabler = COB("Render", {
    Name = "NightSky",
    Function = function(callback) 
        if callback then
         game.Lighting.TimeOfDay = "00:00:00"
        else
            game.Lighting.TimeOfDay = "14:00:00"
        end
    end,
    Default = false,
    HoverText = "Changes the sky to night"
})
local Shaders = COB("Render", {
	["Name"] = "Shaders",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				print("Shaders enabled")
				game:GetService("Lighting"):ClearAllChildren()
				local Bloom = Instance.new("BloomEffect")
				Bloom.Intensity = 0.1
				Bloom.Threshold = 0
				Bloom.Size = 100

				local Tropic = Instance.new("Sky")
				Tropic.Name = "Tropic"
				Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
				Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
				Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
				Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
				Tropic.StarCount = 100
				Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
				Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
				Tropic.Parent = Bloom

				local Sky = Instance.new("Sky")
				Sky.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
				Sky.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
				Sky.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
				Sky.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
				Sky.CelestialBodiesShown = false
				Sky.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
				Sky.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
				Sky.Parent = Bloom

				Bloom.Parent = game:GetService("Lighting")

				local Bloom = Instance.new("BloomEffect")
				Bloom.Enabled = false
				Bloom.Intensity = 0.35
				Bloom.Threshold = 0.2
				Bloom.Size = 56

				local Tropic = Instance.new("Sky")
				Tropic.Name = "Tropic"
				Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
				Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
				Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
				Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
				Tropic.StarCount = 100
				Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
				Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
				Tropic.Parent = Bloom

				local Sky = Instance.new("Sky")
				Sky.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
				Sky.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
				Sky.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
				Sky.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
				Sky.CelestialBodiesShown = false
				Sky.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
				Sky.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
				Sky.Parent = Bloom

				Bloom.Parent = game:GetService("Lighting")
				local Blur = Instance.new("BlurEffect")
				Blur.Size = 2

				Blur.Parent = game:GetService("Lighting")
				local Efecto = Instance.new("BlurEffect")
				Efecto.Name = "Efecto"
				Efecto.Enabled = false
				Efecto.Size = 2

				Efecto.Parent = game:GetService("Lighting")
				local Inaritaisha = Instance.new("ColorCorrectionEffect")
				Inaritaisha.Name = "Inari taisha"
				Inaritaisha.Saturation = 0.05
				Inaritaisha.TintColor = Color3.fromRGB(255, 224, 219)

				Inaritaisha.Parent = game:GetService("Lighting")
				local Normal = Instance.new("ColorCorrectionEffect")
				Normal.Name = "Normal"
				Normal.Enabled = false
				Normal.Saturation = -0.2
				Normal.TintColor = Color3.fromRGB(255, 232, 215)

				Normal.Parent = game:GetService("Lighting")
				local SunRays = Instance.new("SunRaysEffect")
				SunRays.Intensity = 0.05

				SunRays.Parent = game:GetService("Lighting")
				local Sunset = Instance.new("Sky")
				Sunset.Name = "Sunset"
				Sunset.SkyboxUp = "rbxassetid://323493360"
				Sunset.SkyboxLf = "rbxassetid://323494252"
				Sunset.SkyboxBk = "rbxassetid://323494035"
				Sunset.SkyboxFt = "rbxassetid://323494130"
				Sunset.SkyboxDn = "rbxassetid://323494368"
				Sunset.SunAngularSize = 14
				Sunset.SkyboxRt = "rbxassetid://323494067"

				Sunset.Parent = game:GetService("Lighting")
				local Takayama = Instance.new("ColorCorrectionEffect")
				Takayama.Name = "Takayama"
				Takayama.Enabled = false
				Takayama.Saturation = -0.3
				Takayama.Contrast = 0.1
				Takayama.TintColor = Color3.fromRGB(235, 214, 204)

				Takayama.Parent = game:GetService("Lighting")
				local L = game:GetService("Lighting")
				L.Brightness = 2.14
				L.ColorShift_Bottom = Color3.fromRGB(11, 0, 20)
				L.ColorShift_Top = Color3.fromRGB(240, 127, 14)
				L.OutdoorAmbient = Color3.fromRGB(34, 0, 49)
				L.ClockTime = 6.7
				L.FogColor = Color3.fromRGB(94, 76, 106)
				L.FogEnd = 1000
				L.FogStart = 0
				L.ExposureCompensation = 0.24
				L.ShadowSoftness = 0
				L.Ambient = Color3.fromRGB(59, 33, 27)

				local Bloom = Instance.new("BloomEffect")
				Bloom.Intensity = 0.1
				Bloom.Threshold = 0
				Bloom.Size = 100

				local Tropic = Instance.new("Sky")
				Tropic.Name = "Tropic"
				Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
				Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
				Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
				Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
				Tropic.StarCount = 100
				Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
				Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
				Tropic.Parent = Bloom

				local Sky = Instance.new("Sky")
				Sky.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
				Sky.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
				Sky.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
				Sky.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
				Sky.CelestialBodiesShown = false
				Sky.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
				Sky.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
				Sky.Parent = Bloom

				Bloom.Parent = game:GetService("Lighting")

				local Bloom = Instance.new("BloomEffect")
				Bloom.Enabled = false
				Bloom.Intensity = 0.35
				Bloom.Threshold = 0.2
				Bloom.Size = 56

				local Tropic = Instance.new("Sky")
				Tropic.Name = "Tropic"
				Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
				Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
				Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
				Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
				Tropic.StarCount = 100
				Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
				Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
				Tropic.Parent = Bloom

				local Sky = Instance.new("Sky")
				Sky.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
				Sky.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
				Sky.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
				Sky.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
				Sky.CelestialBodiesShown = false
				Sky.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
				Sky.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
				Sky.Parent = Bloom

				Bloom.Parent = game:GetService("Lighting")
				local Blur = Instance.new("BlurEffect")
				Blur.Size = 2

				Blur.Parent = game:GetService("Lighting")
				local Efecto = Instance.new("BlurEffect")
				Efecto.Name = "Efecto"
				Efecto.Enabled = false
				Efecto.Size = 4

				Efecto.Parent = game:GetService("Lighting")
				local Inaritaisha = Instance.new("ColorCorrectionEffect")
				Inaritaisha.Name = "Inari taisha"
				Inaritaisha.Saturation = 0.05
				Inaritaisha.TintColor = Color3.fromRGB(255, 224, 219)

				Inaritaisha.Parent = game:GetService("Lighting")
				local Normal = Instance.new("ColorCorrectionEffect")
				Normal.Name = "Normal"
				Normal.Enabled = false
				Normal.Saturation = -0.2
				Normal.TintColor = Color3.fromRGB(255, 232, 215)

				Normal.Parent = game:GetService("Lighting")
				local SunRays = Instance.new("SunRaysEffect")
				SunRays.Intensity = 0.05

				SunRays.Parent = game:GetService("Lighting")
				local Sunset = Instance.new("Sky")
				Sunset.Name = "Sunset"
				Sunset.SkyboxUp = "rbxassetid://323493360"
				Sunset.SkyboxLf = "rbxassetid://323494252"
				Sunset.SkyboxBk = "rbxassetid://323494035"
				Sunset.SkyboxFt = "rbxassetid://323494130"
				Sunset.SkyboxDn = "rbxassetid://323494368"
				Sunset.SunAngularSize = 14
				Sunset.SkyboxRt = "rbxassetid://323494067"

				Sunset.Parent = game:GetService("Lighting")
				local Takayama = Instance.new("ColorCorrectionEffect")
				Takayama.Name = "Takayama"
				Takayama.Enabled = false
				Takayama.Saturation = -0.3
				Takayama.Contrast = 0.1
				Takayama.TintColor = Color3.fromRGB(235, 214, 204)

				Takayama.Parent = game:GetService("Lighting")
				local L = game:GetService("Lighting")
				L.Brightness = 2.3
				L.ColorShift_Bottom = Color3.fromRGB(11, 0, 20)
				L.ColorShift_Top = Color3.fromRGB(240, 127, 14)
				L.OutdoorAmbient = Color3.fromRGB(34, 0, 49)
				L.TimeOfDay = "07:30:00"
				L.FogColor = Color3.fromRGB(94, 76, 106)
				L.FogEnd = 300
				L.FogStart = 0
				L.ExposureCompensation = 0.24
				L.ShadowSoftness = 0
				L.Ambient = Color3.fromRGB(59, 33, 27)
			end)
		else
			pcall(function()
				print("Shaders disabled")
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Cool shaders"
})
local AnticheatDisabler = COB("Utility", {
	["Name"] = "AnticheatDisabler [Lobby]",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.AnticheatDisabler = true
                                        local function disablerFunction()
	     local lplr = game.Players.LocalPlayer
        lplr.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
        lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
        repeat task.wait() until lplr.Character.Humanoid.MoveDirection ~= Vector3.zero
        task.wait(0.2)
        lplr.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
        lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Running)
        workspace.Gravity = 192.6    
    end
             disablerFunction()
			end)
		else
			pcall(function()
				ScriptSettings.AnticheatDisabler = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Disables Anticheat in the lobby"
})
local CollectAllDrops = COB("Blatant", {
	["Name"]  = "CollectAllDrops",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.CollectAllDrops = true
				while task.wait(0.6) do
					if not ScriptSettings.CollectAllDrops == true then return end
					for i,v in pairs(game:GetService("Workspace").ItemDrops:GetChildren()) do
						game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
						game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0,2,0)
					end
				end
			end)
		else
			pcall(function()
				ScriptSettings.CollectAllDrops = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = false
})
local HostCrasher = COB("Utility", {
	["Name"] = "HostCrasher",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.HostCrasher = true
				for i,plr in pairs(game:GetService("Players"):GetChildren()) do
                    local args = {
                        [1] = "",
                        [2] = {
                            [1] = {
                                ["userId"] = plr.UserId,
                                ["name"] = plr.Name,
                                ["displayName"] = plr.DisplayName
                            }
                        }
                    }
                    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("CustomMatches:CohostPlayer"):FireServer(unpack(args))
				end
				while task.wait() do
				    if not ScriptSettings.HostCrasher == true then return end
				    for i,plr in pairs(game:GetService("Players"):GetChildren()) do
                        local args = {
                            [1] = "",
                            [2] = {
                                [1] = {
                                    ["userId"] = plr.UserId,
                                    ["name"] = plr.Name,
                                    ["displayName"] = plr.DisplayName
                                },
                                [2] = math.random(1,999999999)
                            }
                        }
                        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("CustomMatches:SetPlayerMaxHealth"):FireServer(unpack(args))
				    end
				end
			end)
		else
			pcall(function()
				ScriptSettings.HostCrasher = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Spams health change messages with co host"
})
local RagdollDisabler = COB("Utility", {
	["Name"]  = "RagdollDisabler",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.RagdollDisabler = true
				while task.wait(0.1) do
					if not ScriptSettings.RagdollDisabler == true then return end
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Ragdoll)
					task.wait(0.085)
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Running)
				end
			end)
		else
			pcall(function()
				ScriptSettings.RagdollDisabler = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Makes you ragdoll to bypass anticheat"
})
local AnticheatDisabler = COB("Blatant", {
    Name = "Good AntiVoid",
    Function = function(callback) 
        if callback then
            local antivoidpart = Instance.new("Part", Workspace)
            antivoidpart.Name = "AntiVoid"
            antivoidpart.Size = Vector3.new(2100, 0.5, 2000)
            antivoidpart.Position = Vector3.new(160.5, 25, 247.5)
            antivoidpart.Transparency = 0.4
            antivoidpart.Anchored = true
            antivoidpart.Touched:connect(function()
                if Parent:WaitForChild("Humanoid") and Parent.Name == lplr.Name then
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
    HoverText = "Allows you to walk on the void"
})
repeat task.wait() until shared.GuiLibrary
local GuiLibrary = shared.GuiLibrary
local COB = function(tab, argstable) 
    return GuiLibrary["ObjectsThatCanBeSaved"][tab.."Window"]["Api"].CreateOptionsButton(argstable)
end

COB("Render", {
    Name = "Void",
    HoverText = "Turns the sky into the void event sky",
    Function = function(v)
        if v then
            game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=9851144466"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=9851144249"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=9851144099"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=9851143942"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=9851143761"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=9851143257"
            game.Lighting.FogColor = Color3.new(236, 88, 241)
            game.Lighting.FogEnd = "200"
            game.Lighting.FogStart = "0"
            game.Lighting.Ambient = Color3.new(0.5, 0, 1)
        else
            game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=6334928194"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=7018689553"
            game.Lighting.FogColor = Color3.new(1, 1, 1)
            game.Lighting.FogEnd = "10000"
            game.Lighting.FogStart = "0"
            game.Lighting.Ambient = Color3.new(0, 0, 0)
        end
    end
})
local AnimationDisabler = COB("Utility", {
	["Name"]  = "AnimationDisabler",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.AnimationDisabler = true
				game:GetService("Players").LocalPlayer.Character.Animate.Disabled = true
				while task.wait(1.5) do
					if not ScriptSettings.AnimationDisabler == true then return end
					repeat task.wait() until game:GetService("Players").LocalPlayer.Character.Animate
					game:GetService("Players").LocalPlayer.Character.Animate.Disabled = true
				end
			end)
		else
			pcall(function()
				ScriptSettings.AnimationDisabler = false
				game:GetService("Players").LocalPlayer.Character.Animate.Disabled = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Disables your animation"
})
local AnticheatDisabler = COB("Utility", {
    Name = "ChatCrasher",
    Function = function(callback) 
        if callback then
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
    HoverText = "Spams glitched text to slow down the chat"
})
local AntiAFK = COB("Utility", {
	["Name"] = "AntiAFK",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.AntiAFK = true
				local cons = getconnections or get_signal_cons
				if cons then
					for i,v in pairs(cons(game:GetService("Players").LocalPlayer.Idled)) do
						if ScriptSettings.AntiAFK == true then
							v:Disable()
							v:Disconnect()
						end
					end
				end
				assert(firesignal, "Asserted FireSignal")
				local uis = game:GetService("UserInputService")
				local runs = game:GetService("RUnService")
				uis.WindowFocusReleased:Connect(function()
					if ScriptSettings.AntiAFK == true then
						runs.Stepped:Wait()
						pcall(firesignal, uis.WindowFocused)
					end
				end)
			end)
		else
			pcall(function()
				ScriptSettings.AntiAFK = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Prevents you from being kicked when afk"
})
local AnticheatDisabler = COB("Blatant", {
    Name = "Infinite Jump",
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
    HoverText = false
})
local AnticheatDisabler = COB("Render", {
    Name = "BetterFPSBoost",
    Function = function(callback) 
        if callback then
        local decalsyeeted = true
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
    HoverText = "Removes all textures to give more fps"
})
local NoClickDelay = COB("Combat", {
	["Name"]  = "NoClickDelay",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.NoClickDelay = true
				local SwordCont = require(game:GetService("Players").LocalPlayer.PlayerScripts.TS.controllers.global.combat.sword["sword-controller"]).SwordController
				local ItemTableFunc = require(game:GetService("ReplicatedStorage").TS.item["item-meta"]).getItemMeta
				local ItemTable = debug.getupvalue(ItemTableFunc, 1)
				for i2,v2 in pairs(ItemTable) do
					if type(v2) == "table" and rawget(v2, "sword") then
						v2.sword.attackSpeed = 0.0000000000000000000000000000000000001
					end
					SwordCont.isClickingTooFast = function() return false end
				end
			end)
		else
			pcall(function()
				ScriptSettings.NoClickDelay = false
				local SwordCont = require(game:GetService("Players").LocalPlayer.PlayerScripts.TS.controllers.global.combat.sword["sword-controller"]).SwordController
				local ItemTableFunc = require(game:GetService("ReplicatedStorage").TS.item["item-meta"]).getItemMeta
				local ItemTable = debug.getupvalue(ItemTableFunc, 1)
				for i2,v2 in pairs(ItemTable) do
					if type(v2) == "table" and rawget(v2, "sword") then
						v2.sword.attackSpeed = 0.24
					end
					SwordCont.isClickingTooFast = function() return false end
				end
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Removes Click Delay when using items"
})
local AutoSwing = COB("Combat", {
	["Name"]  = "AutoSwing",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.AutoSwing = true
				while task.wait(0.01) do
					if not ScriptSettings.AutoSwing == true then return end
					local sc = require(game:GetService("Players").LocalPlayer.PlayerScripts.TS.controllers.global.combat.sword["sword-controller"]).SwordController
					sc:swingSwordAtMouse()
				end
			end)
		else
			pcall(function()
				ScriptSettings.AutoSwing = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Automatically swings your sword"
})
local RainbowHotbar = COB("Utility", {
    Name = "Rainbow Hotbar",
    Function = function(callback) 
        if callback then
		function SmokeRB(X) return math.acos(math.cos(X*math.pi))/math.pi end

counter = 0

while wait(0.1)do
 game.Players.LocalPlayer.PlayerGui.hotbar['1'].HotbarHealthbarContainer.HealthbarProgressWrapper['1'].BackgroundColor3 = Color3.fromHSV(SmokeRB(counter),1,1)
 
 counter = counter + 0.01
end
        end
    end,
    Default = false,
    HoverText = false
})
local AutoWin = COB("Utility", {
	["Name"] = "AutoWin [Skywars]",
	["Function"] = function(callback)
		if callback then
			pcall(function()
                game.Workspace.Gravity = 0
                for i,v in pairs(game.Players:GetPlayers()) do
                    if v.Team == game:GetService("Players").LocalPlayer.Team and v ~= game:GetService("Players").LocalPlayer then
                        v:Destroy()
                    end
                 end
local Players = game:GetService("Players")
getgenv().Autowin = true
while getgenv().Autowin do
   for _,v in pairs(Players:GetPlayers()) do
       if v.Character and v.Character:FindFirstChildOfClass("Humanoid") and v.Character.Humanoid.Health ~= 0 and v ~= Players.LocalPlayer then
           repeat
               Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
               task.wait(0.2)
           until v.Character.Humanoid.Health <= 0
       end
   end
   task.wait()
end
			end)
		else
			pcall(function()
                getgenv().Autowin = false
                game.Workspace.Gravity = 196.2
				print("disabled autowin")
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Only works with AnticheatDisabler"
})
local CustomFly = COB("Blatant", {
	["Name"] = "CustomBypassFly",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.CustomFly = true
				while task.wait() do
					if not ScriptSettings.CustomFly == true then return end
					game:GetService("Workspace").Gravity = 0
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
					task.wait(0.04)
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Climbing)
					task.wait(0.01)
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
				end
			end)
		else
			pcall(function()
				ScriptSettings.CustomFly = false
				game:GetService("Workspace").Gravity = 196.2
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Uses bypasses to fly"
})
local KitExploit = COB("Utility", {
	["Name"] = "KitExploit",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.KitExploit = true
				local kits = {
					["Axolotl"] = require(game:GetService("ReplicatedStorage").TS.games.bedwars.kit.kits.axolotl["axolotl-kit"]).AxolotlKit,
					["Beast"] = require(game:GetService("ReplicatedStorage").TS.games.bedwars.kit.kits["beast"]["beast-util"]).BeastKit,
					["Dasher"] = require(game:GetService("ReplicatedStorage").TS.games.bedwars.kit.kits.dasher["dasher-kit"]).DasherKit,
					["Fisherman"] = require(game:GetService("ReplicatedStorage").TS.games.bedwars.kit.kits["fisherman"]["fisherman-util"]).FishermanUtil,
					["IceQueen"] = require(game:GetService("ReplicatedStorage").TS.games.bedwars.kit.kits["ice-queen"]["ice-queen-kit"]).IceQueenKit,
					["Santa"] = require(game:GetService("ReplicatedStorage").TS.games.bedwars.kit.kits.santa["santa-util"]).SantaUtil,
				}
				kits["Axolotl"]["SWIM_TO_CHARACTER_TIME"] = 0.0000000000001
				kits["Axolotl"]["ACTIVE_COOLDOWN"] = 0.0000000000001
				kits["Beast"]["WALK_SPEED_MULTIPLIER"] = 5
				kits["Beast"]["KNOCKBACK_MULTIPLIER"] = 5
				kits["Dasher"]["DASH_COOLDOWN"] = 0.0000000000001
				kits["Dasher"]["CHARGE_TIME"] = 0.0000000000001
				kits["Dasher"]["CHARGE_TIME_BEFORE_CHARGING_STATE"] = 0.0000000000001
				kits["Dasher"]["TOTAL_CHARGE_TIME"] = 0.0000000000001
				kits["Fisherman"]["minigameDuration"] = 60
				kits["Fisherman"]["markerSize"] = UDim2.fromScale(0.05, 1)
				kits["Fisherman"]["totalDecaySpeedSec"] = 2
				kits["Fisherman"]["startingMarkerIncrementSpeed"] = 0.2
				kits["Fisherman"]["holdMinimumMarkerIncrementSpeed"] = 0.1
				kits["Fisherman"]["markerIncrementAmount"] = 0.025
				kits["Fisherman"]["fishZoneSize"] = UDim2.fromScale(0,5, 1)
				kits["Fisherman"]["fishZoneSpeedMultiplier"] = 5
				kits["Fisherman"]["fishZoneMoveCooldown"] = 10
				kits["Fisherman"]["fillAmount"] = 0.1
				kits["Fisherman"]["drainAmount"] = 0.0001
				kits["IceQueen"]["DAMAGE_REQUIREMENT"] = 0.0000000000001
				kits["IceQueen"]["PASSIVE_STACK_COOLDOWN"] = 0.0000000000001
				kits["IceQueen"]["PROC_COOLDOWN"] = 0.0000000000001
				kits["IceQueen"]["BAR_COUNT"] = 4
				kits["IceQueen"]["BASE_PASSIVE_DAMAGE"] = 0.1
				kits["IceQueen"]["BASE_SPEED_MULTIPLIER"] = 99
				kits["IceQueen"]["BASE_SLOW_LENGHT"] = 0.0000000000001
				kits["IceQueen"]["ICE_SWORD_PASSIVE_DAMAGE"] = 0.1
				kits["IceQueen"]["ICE_SWORD_SLOW_LENGTH"] = 0.0000000000001
				kits["IceQueen"]["ICE_SWORD_STUN_DURATION"] = 99
				kits["IceQueen"]["PASSIVE_EXPIRATION_TIME"] = 99
				kits["Santa"]["BOMB_DROP_DELAY"] = 0.0000000000001
				kits["Santa"]["TOTAL_BOMBS"] = 99
				kits["Santa"]["DROP_HEIGHT"] = 150
				kits["Santa"]["DROP_DELAY"] = 0.0000000000001
			end)
		else
			pcall(function()
				ScriptSettings.KitExploit = false
				infonotify("ItemExploit", "Unable to revert changes", "5")
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Exploits Axolotl, Beast, Dasher, Fisherman, IceQueen and Santa kit settings"
})
local MageAnimation = COB("Render", {
	["Name"] = "MageAnimation",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.MageAnimation = true
				local Animate = game:GetService("Players").LocalPlayer.Character.Animate
				Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=707742142"
				Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=707855907"
				Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=707897309"
				Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=707861613"
				Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=707853694"
				Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=707826056"
				Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=707829716"
			end)
		else
			pcall(function()
				ScriptSettings.MageAnimation = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Makes you get mage animation"
})
local AutobuyWool = COB("Utility", {
	["Name"] = "AutoBuyWool",
	["HoverText"] = "AutoBuys Wool",
	["Function"] = function(callback)
		if callback then
			getgenv().AutobuyWool = true;
			while wait() do
				if getgenv().AutobuyWool == true then
					game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.BedwarsPurchaseItem:InvokeServer({["shopItem"] = {["currency"] = "iron",["itemType"] = "wool_white",["amount"] = 16,["price"] = 8,["category"] = "Blocks"}})
				end
			end
		else
			getgenv().AutobuyWool = false;
		end
	end
})
Dash = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({    
    ["Name"] = "Item Givers", 
    ["Function"] = function(callback)
        if callback then
        end
    end,
    ["Default"] = false,
    ["HoverText"] = "Right Click To Wiew The ITEMS"
})


JadeGiver = Dash.CreateToggle({
                ["Name"] = "Jade Hammer [FE]",
                ["Function"] = function(callback)
                if callback then
for i,v in pairs(game.ReplicatedStorage.Inventories:GetChildren()) do
if string.match(v.Name, game.Players.LocalPlayer.Name) then
  local tobecloned = game.ReplicatedStorage.Items["jade_hammer"]:Clone()
  tobecloned.Parent = v
                            end
                        end
                    end
                end,
                ["HoverText"] = "Jade Giver",
                ["Default"] = false
            })
        RegentGiver = Dash.CreateToggle({
                ["Name"] = "Void Regent Hammer [FE]",
                ["Function"] = function(callback)
                if callback then
for i,v in pairs(game.ReplicatedStorage.Inventories:GetChildren()) do
if string.match(v.Name, game.Players.LocalPlayer.Name) then
  local tobecloned = game.ReplicatedStorage.Items["void_axe"]:Clone()
  tobecloned.Parent = v
                            end
                        end
                    end
                end,
                ["Default"] = false
            })
        DaoGiver = Dash.CreateToggle({
                ["Name"] = "Emerald Dao [CS]",
                ["Function"] = function(callback)
                if callback then
for i,v in pairs(game.ReplicatedStorage.Inventories:GetChildren()) do
if string.match(v.Name, game.Players.LocalPlayer.Name) then
  local tobecloned = game.ReplicatedStorage.Items["emerald_dao"]:Clone()
  tobecloned.Parent = v
                            end
                        end
                    end
                end,
                ["Default"] = false
            })
local Chat = COB("Render", {
	["Name"] = "Chat",
	["HoverText"] = "Changes Chat Position",
	["Function"] = function(callback)
		if callback then
			game:GetService("StarterGui"):SetCore('ChatWindowPosition', UDim2.new(0.0, 0, 0.0, 700))
		else
			game:GetService("StarterGui"):SetCore('ChatWindowPosition', UDim2.new(0.0, 0, 0.0, 0))
		end
	end
})
local anticheat = {["Enabled"] = false}
	anticheat = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
		["Name"] = "FloatCheckBypass",
		["HoverText"] = "Makes it for you can stay in the air longer.",
		["Function"] = function(callback)
			if callback then
                            print("Still working on this do not expect it to work.")
                            local players = game:GetService("Players")
			    local player = players.LocalPlayer
			    local character = player.Character or player.CharacterAdded:Wait()
			    local humanoid = character:WaitForChild("Humanoid")

			    for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
				 track:Stop()
                            end
			else
			    print("Disabled!")
			end
		end 
    })
local theyes = {["Enabled"] = false}
	theyes = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
		["Name"] = "ExplosionExploit",
		["HoverText"] = "Enable when TNT explodes then it should make you go 90 speed (Does not work with speed)",
		["Function"] = function(callback)
			if callback then
				getgenv().WalkSpeedValue = 90;
				local Player = game:service'Players'.LocalPlayer;
				Player.Character.Humanoid:GetPropertyChangedSignal'WalkSpeed':Connect(function()
				Player.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue;
				end)
				Player.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue;
			else
				getgenv().WalkSpeedValue = 20;
				local Player = game:service'Players'.LocalPlayer;
				Player.Character.Humanoid:GetPropertyChangedSignal'WalkSpeed':Connect(function()
				Player.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue;
				end)
				Player.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue;
			end
		end 
    })
local longjumpbound = false
	local longjumptimer = 0
	local longjumpup = 26
	local longjumpbodyvelo
	local longjumpmode = {["Value"] = "Inconsistent"}
	local longjumpval = {["Value"] = 5}
	local longjumpspeed = {["Value"] = 80}
	local longjumpdelay = {["Value"] = 0}
	local longjumpheight = {["Value"] = 15}
	local longjumpslowdown = {["Value"] = 13}
	local longjumpautodisable = {["Enabled"] = true}
	local longjumppotion = false
	local damagetimer = 0
	local gofast = false

	local function calculatepos(vec)
		local returned = vec
		if entity.isAlive then 
			local newray = workspace:Raycast(entity.character.HumanoidRootPart.Position, returned, blockraycast)
			if newray then returned = (newray.Position - entity.character.HumanoidRootPart.Position) end
		end
		return returned
	end

	local oldgrav
	longjump = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
		["Name"] = "FastFly",
		["Function"] = function(callback)
			if callback then
				longjumpvelo = Vector3.zero
				if (GuiLibrary["ObjectsThatCanBeSaved"]["Lobby CheckToggle"]["Api"]["Enabled"] == false or matchState ~= 0) then
					task.spawn(function()
						repeat task.wait() until shared.VapeFullyLoaded
						if longjump["Enabled"] then 
							if AnticheatBypass["Enabled"] == false and GuiLibrary["ObjectsThatCanBeSaved"]["Blatant modeToggle"]["Api"]["Enabled"] == false then
								AnticheatBypass["ToggleButton"](false)
							end
						end
					end)
					if entity.isAlive then
						task.spawn(function()
							local nomove = false
							local acallowed = false
							local damagetroll = false
							local funnytick = tick()
							RunLoops:BindToHeartbeat("LongJump", 1, function(time)
								disabletpcheck = damagetimer >= tick()
								local startlongjump = entity.isAlive and (not nomove) and acallowed
								if startlongjump and longjumpmode["Value"] == "AnticheatBypass" then 
									funnytick = tick() + 0.1
								end
								longjumpvelo = (startlongjump and entity.character.Humanoid.MoveDirection * (damagetimer >= tick() and 50 or (longjumpmode["Value"] == "Inconsistent" and gofast == false and 20 or (longjumpmode["Value"] == "AnticheatBypass" and 22 or (allowspeed == false and 20 or longjumpspeed["Value"])))) or Vector3.zero)
							end)
							repeat task.wait() until (longjumpmode["Value"] == "AnticheatBypass" or anticheatfunnyyes or GuiLibrary["ObjectsThatCanBeSaved"]["Blatant modeToggle"]["Api"]["Enabled"])
							task.wait(((longjumpdelay["Value"] - 1) / 10) + (damagetroll and 2 or 0))
							if longjump["Enabled"] then 
								local funnycheck = nomove
								if nomove then
									repeat task.wait() until damagetimer >= tick()
									nomove = false
								end
								if not entity.isAlive then
									longjump["ToggleButton"](false)
									return
								end
								oldgrav = workspace.Gravity
								workspace.Gravity = 15
								if shared.damageanim then 
									shared.damageanim()
									bedwars["SoundManager"]:playSound(bedwars["SoundList"]["DAMAGE_"..math.random(1, 3)])
								end
								if (entity.isAlive and longjump["Enabled"]) then
									entity.character.HumanoidRootPart.Velocity = vec3(entity.character.HumanoidRootPart.Velocity.X, longjumpheight["Value"], entity.character.HumanoidRootPart.Velocity.Z)
								end
								task.spawn(function()
									repeat
										task.wait()
										if funnytick <= tick() then break end
										if entity.isAlive then
											local ping = math.floor(tonumber(game:GetService("Stats"):FindFirstChild("PerformanceStats").Ping:GetValue()))
											local acbypassnum = (combatcheck and AnticheatBypassCombatCheck["Enabled"] and AnticheatBypassNumbers.TPCombat or (AnticheatBypassNumbers.TPSpeed))
											local tplerp = 2 * AnticheatBypassNumbers.TPLerp
											local tpspeed = 58 * acbypassnum
											for i = 1, 2 do 
												task.wait(i % 2 == 0 and 0.01 or 0.02)
												if entity.isAlive then 
													entity.character.HumanoidRootPart.CFrame = entity.character.HumanoidRootPart.CFrame + calculatepos(entity.character.Humanoid.MoveDirection * ((tplerp * (longjumpspeed["Value"] / 68))))
												end
											end
											task.wait(acbypassnum)
											if funnytick <= tick() then break end
											entity.character.HumanoidRootPart.CFrame = entity.character.HumanoidRootPart.CFrame + calculatepos(entity.character.Humanoid.MoveDirection * ((tpspeed * (longjumpspeed["Value"] / 68))))
										end
									until funnytick <= tick()
								end)
								for i = 1, longjumpval["Value"] do 
									acallowed = true
									if not (entity.isAlive and longjump["Enabled"]) then 
										break
									end
									if i == 3 and longjumpautodisable["Enabled"] then
										task.spawn(function()
											repeat
												task.wait()
												if entity.isAlive then
													local newray = workspace:Raycast(entity.character.HumanoidRootPart.Position, vec3(0, -32, 0), blockraycast)
													if newray then
														if longjump["Enabled"] then
															longjump["ToggleButton"](false)
														end
														break
													end
												end
											until (not longjump["Enabled"])
										end)
									end
									task.wait(0.25)
									longjumpticktimer = tick() + (i * (longjumpslowdown["Value"] / 10))
								end
								if longjump["Enabled"] then
									longjump["ToggleButton"](false)
								end
							end
						end)
					else
						if longjump["Enabled"] then
							longjump["ToggleButton"](false)
						end
					end
				else
					if longjump["Enabled"] then
						longjump["ToggleButton"](false)
					end
				end
			else
				workspace.Gravity = oldgrav or 192.6
				disabletpcheck = false
				pcall(function()
					RunLoops:UnbindFromHeartbeat("LongJump")
					createwarning("FastFly", "Cooldown please wait!", 3)
				end)
			end
		end, 
		["HoverText"] = "Lets you fly alot faster and only works with normal speed mode (Spamming can lead to lagbacks also this is basically the same as long jump)"
	})
	longjumpmode = longjump.CreateDropdown({
		["Name"] = "Mode",
		["List"] = {"Normal"},
		["Function"] = function() end
	})
	longjumpspeed = longjump.CreateSlider({
		["Name"] = "Speed",
		["Min"] = 1,
		["Max"] = 235,
		["Default"] = 235,
		["Function"] = function() end
	})
	longjumpval = longjump.CreateSlider({
		["Name"] = "Time",
		["Min"] = 1,
		["Max"] = 2,
		["Default"] = 1,
		["Function"] = function() end
	})
	longjumpheight = longjump.CreateSlider({
		["Name"] = "Height",
		["Min"] = 1,
		["Max"] = 25,
		["Default"] = 5,
		["Function"] = function() end
	})

createwarning("Central Custom V2", "Successfully Loaded! ", 10)