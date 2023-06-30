game:GetService("StarterGui"):SetCore("SendNotification", { 
        Title = "Bojoware";
        Text = "bojoware v5 is Loading..";
        Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150"})
    Duration = 20;

game:GetService("StarterGui"):SetCore("SendNotification", { 
        Title = "Bojoware";
        Text = "bojoware Has been loaded!";
        Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150"})
    Duration = 226;
repeat task.wait() until game:IsLoaded()
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
function warnnotify(title, content, duration)
	local frame = GuiLibrary["CreateNotification"](title or "Windows", content or "(No Content Given)", duration or 5, "assets/WarningNotification.png")
	frame.Frame.Frame.ImageColor3 = Color3.fromRGB(255, 64, 64)
end
function infonotify(title, content, duration)
	local frame = GuiLibrary["CreateNotification"](title or "Windows", content or "(No Content Given)", duration or 5, "assets/InfoNotification.png")
	frame.Frame.Frame.ImageColor3 = Color3.fromRGB(255, 64, 64)
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

GuiLibrary["MainGui"].ScaledGui.ClickGui.Version.Text = "Windows custom | v1.0.1"
GuiLibrary["MainGui"].ScaledGui.ClickGui.MainWindow.TextLabel.Text = "Windows custom | v1.0.1"
GuiLibrary["MainGui"].ScaledGui.ClickGui.Version.Version.Text = "Windows custom | v1.0.1"
GuiLibrary["MainGui"].ScaledGui.ClickGui.Version.Position = UDim2.new(1, -175 - 20, 1, -25)
infonotify("Windows custom", "Loaded successfully!", 5)




local AutoWin = COB("Utility", {
	["Name"] = "AutoWin",
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
	["HoverText"] = "iz work with disabler"
})

local CustomFly = COB("Blatant", {
	["Name"] = "CustomClimbFly",
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
	["HoverText"] = "Uses bypasses to fly lagbacks"
})

local lobbyball = COB("Utility", {
	["Name"] = "lobby ball",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.lobbyball = true
				while task.wait() do
					if not ScriptSettings.lobbyball == true then return end
					game:GetService("Workspace").Gravity = 0
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
				end
			end)
		else
			pcall(function()
				ScriptSettings.lobbyball = false
				game:GetService("Workspace").Gravity = 196.2
				game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Alive)
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "lob bypass"
})
local cflyswim = COB("Blatant", {
	["Name"] = "CustomFlySwim",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.cflyswim = true
				while task.wait() do
					if not ScriptSettings.cflyswim == true then return end
					game:GetService("Workspace").Gravity = 0
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
					task.wait(0.04)
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
					task.wait(0.01)
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
				end
			end)
		else
			pcall(function()
				ScriptSettings.cflyswim = false
				game:GetService("Workspace").Gravity = 196.2
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "best custom fly"
})
local opCustomFly = COB("Blatant", {
	["Name"] = "opfly",
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
					task.wait(0.01)
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
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
	["HoverText"] = "fly but op"
})
local float = COB("Blatant", {
	["Name"] = "Float",
	["Function"] = function(callback)
		if callback then
			pcall(function()
			game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
			wait(0.15)
				ScriptSettings.float = true
				while task.wait() do
					if not ScriptSettings.CustomFly == true then return end
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
				end
			end)
		else
			pcall(function()
				ScriptSettings.float = false
				game:GetService("Workspace").Gravity = 196.2
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "float/fly"
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
local ItemExploit = COB("Utility", {
	["Name"] = "ItemExploit",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.ItemExploit = true
				local SW = require(game:GetService("ReplicatedStorage").TS.games.bedwars.items.stopwatch["stopwatch-constants"]).StopwatchConstants
				local TB = require(game:GetService("ReplicatedStorage").TS.games.bedwars.items.twirlblade["twirlblade-util"]).TwirlbladeUtil
				local CS = require(game:GetService("ReplicatedStorage").TS.games.bedwars["charge-shield"]["charge-shield-util"]).ChargeShieldUtil
				local GH = require(game:GetService("ReplicatedStorage").TS["grappling-hook"]["grappling-hook-util"])
				local HM = require(game:GetService("ReplicatedStorage").TS.vehicle.helicopter["helicopter-missile"])
				SW["DURATION"] = 60
				SW["EFFECT_DURATION"] = 60
				TB["SPIN_DAMAGE"] = 100
				CS["CHARGE_SHIELD_COOLDOWN_SEC"] = 0.0000000000001
				CS["CHARGE_DURATION"] = 10
				CS["CHARGE_SPEED_MULTIPLIER"] = 5
				CS["MAX_HIT_DISTANCE"] = 50
				CS["MAX_HIT_ANGLE"] = 360
				CS["MAX_HIT_HEIGHT"] = 100
				CS["HIT_DAMAGE"] = 100
				CS["VERTICAL_KNOCKBACK"] = 5
				CS["HORIZONTAL_KNOCKBACK"] = 5
				GH["SPEED"] = 5000
				GH["FIRE_COOLDOWN"] = 0.0000000000001
				GH["HIT_PLAYER_COOLDOWN"] = 0.0000000000001
				GH["HIT_BLOCK_COOLDOWN"] = 0.0000000000001
				HM["MISSLE_FIRE_RATE"] = 0.0000000000001
			end)
		else
			pcall(function()
				ScriptSettings.ItemExploit = false
				infonotify("ItemExploit", "Unable to revert changes", "5")
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Exploits like 5 item settings settings"
})
local InfJump = COB("Utility", {
	["Name"] = "InfJump",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.InfJump = true
				game:GetService("UserInputService").JumpRequest:connect(function()
					if not ScriptSettings.InfJump == true then return end
					if not ScriptSettings.InfJump_Alr then
					    game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
					    ScriptSettings.InfJump_Alr = true
					    task.wait(0.125)
					    ScriptSettings.InfJump_Alr = false
					else
					    task.wait()
					end
				end)
			end)
		else
			pcall(function()
				ScriptSettings.InfJump = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Makes you can jump infinetly"
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
	["HoverText"] = "Makes you get mage animation (FE) for pvp"
})
local AnimDisabler = COB("Utility", {
	["Name"]  = "AnimDisabler",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.AnimDisabler = true
				game:GetService("Players").LocalPlayer.Character.Animate.Disabled = true
				while task.wait(1.5) do
					if not ScriptSettings.AnimDisabler == true then return end
					repeat task.wait() until game:GetService("Players").LocalPlayer.Character.Animate
					game:GetService("Players").LocalPlayer.Character.Animate.Disabled = true
				end
			end)
		else
			pcall(function()
				ScriptSettings.AnimDisabler = false
				game:GetService("Players").LocalPlayer.Character.Animate.Disabled = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Disables your animation"
})
local CollectAllDrops = COB("Utility", {
	["Name"]  = "CollectAllDrops broken",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.CollectAllDrops = true
				while task.wait() do
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
	["HoverText"] = "Collect drops broken"
})
local Shaders = COB("Render", {
	["Name"] = "Shaders",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				print("shaders enabled")
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
				print("shaders disabled")
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "shade"
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
	["HoverText"] = "Requires you to be host to let it work"
})
local Crosshair = COB("Render", {
	["Name"] = "Crosshair",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.Crosshair = true
				local mouse = game:GetService("Players").LocalPlayer:GetMouse()
				mouse.Icon = "rbxassetid://9943168532"
				mouse:GetPropertyChangedSignal("Icon"):Connect(function()
				    if not ScriptSettings.Crosshair == true then return end
				    mouse.Icon = "rbxassetid://9943168532"
				end)
			end)
		else
			pcall(function()
				ScriptSettings.Crosshair = false
				local mouse = game:GetService("Players").LocalPlayer:GetMouse()
				mouse.Icon = ""
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Custom crosshair"
})
local Reinject = COB("Utility", {
	["Name"] = "Reinject",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.Reinject = true
				infonotify("Reinject", "Please disable reinject to use.", 5)
			end)
		else
			pcall(function()
				ScriptSettings.Reinject = false
				GuiLibrary["SelfDestruct"]()
				if shared.DogV4Private_AutoExec then shared.Restart_Vape() else infonotify("Reinject", "You do not have Dog V4 Reinject supported.", "5") end
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Reinjects vape"
})
local Night = COB("Render", {
	["Name"] = "Night",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.Night = true
				game:GetService("Lighting").TimeOfDay = "00:00:00"
				while task.wait(5) do
					if not ScriptSettings.Night == true then return end
					game:GetService("Lighting").TimeOfDay = "00:00:00"
				end
			end)
		else
			pcall(function()
				ScriptSettings.Night = false
				game:GetService("Lighting").TimeOfDay = "13:00:00"
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "this mid af ngl"
})
local ChatCrasher = COB("Utility", {
	["Name"] = "ChatCrasher",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.ChatCrasher = true
				while task.wait() do
					if not ScriptSettings.ChatCrasher == true then return end
					game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼", "All")
				end
			end)
		else
			pcall(function()
				ScriptSettings.ChatCrasher = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "cool"
})
local AntiAFK = COB("Render", {
	["Name"] = "antikick",
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
	["Default"] = true"
})
local CustomAntivoid = COB("Utility", {
	["Name"] = "CustomAntivoid",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.CustomAntivoid = true
				--repeat task.wait(0.3) until getstate() == 1
				local part = Instance.new("Part")
				part.Name = "AVOID_PART"
				part.Anchored = true
				part.Color = Color3.fromRGB(255,65,65)
				part.Size = Vector3.new(5000,3,5000)
				part.Parent = game:GetService("Workspace")
				part.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame - Vector3.new(0,20,0)
				ScriptSettings.CustomAntivoid_Part = part
				part.Touched:Connect(function(v)
					if v.Parent:FindFirstChild("Humanoid") and v.Parent.Parent.Name == game:GetService("Players").LocalPlayer.Name and not v.Parent:FindFirstChild("Humanoid").Health == 0 then
						game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
						task.wait(0.12)
						game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
						task.wait(0.12)
						game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
						task.wait(0.12)
						game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
						--[[
							local tptimes = 0
							repeat
								task.wait()
								tptimes = tptimes + 1
								game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame / 2
							until tptimes = 10
						]]--
					end
				end)
			end)
		else
			pcall(function()
				ScriptSettings.CustomAntivoid = false
				ScriptSettings.CustomAntivoid_Part:Destroy()
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "stud antivoid (risky)"
})
local RagdollDisabler = COB("Utility", {
	["Name"]  = "ragdolldisabler",
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
local LandmindeAura = COB("Blatant", {
	["Name"]  = "LandmindeAura",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.LandmindeAura = true
				while task.wait(0.15) do
					if not ScriptSettings.LandmindeAura == true then return end
					for i,v in pairs(game:GetService("Players"):GetChildren()) do
						if not v.Name == game:GetService("Players").LocalPlayer.Name then
							local mag = (v.Character:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Position).magnitude
							if mag > 11 then
								if not v.Team.BrickColor == game:GetService("Players").LocalPlayer.Team.BrickColor then
									if not v.Team.Name == game:GetService("Players").LocalPlayer.Team.Name then
										game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged["landmineremote"]:FireServer({
											["invisibleLandmine"] = v.Character:FindFirstChild("Head")
										})
									end
								end
							end
						end
					end
				end
			end)
		else
			pcall(function()
				ScriptSettings.LandmindeAura = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "troll with this hehe"
})
local BiMode_Blur 
local BiMode = COB("Render", {
	["Name"]  = "BiMode",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.BiMode = true
				game:GetService("Lighting").Ambient = Color3.fromRGB(130, 12, 110)
				game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(130, 12, 110)
				game:GetService("Lighting").ColorShift_Bottom = Color3.fromRGB(130, 12, 110)
				game:GetService("Lighting").ColorShift_Top = Color3.fromRGB(130, 12, 110)
				game:GetService("Lighting").TimeOfDay = "03:00:00"
				game:GetService("Lighting").FogColor = Color3.fromRGB(130, 12, 110)
				game:GetService("Lighting").FogStart = 500
				game:GetService("Lighting").FogEnd = 100000
				game:GetService("Lighting").ExposureCompensation = 1
				BiMode_Blur = Instance.new("Blur")
				local blurx = BiMode_Blur
				blurx.Size = 4
				blurx.Name = game:GetService("HttpService"):GenerateGUID(true)
			end)
		else
			pcall(function()
				ScriptSettings.BiMode = false
				game:GetService("Lighting").Ambient = Color3.fromRGB(165, 165, 165)
				game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(104, 104, 104)
				game:GetService("Lighting").ColorShift_Bottom = Color3.fromRGB(146, 190, 255)
				game:GetService("Lighting").ColorShift_Top = Color3.fromRGB(228, 249, 255)
				game:GetService("Lighting").TimeOfDay = "13:00:00"
				game:GetService("Lighting").FogColor = Color3.fromRGB(255, 255, 255)
				game:GetService("Lighting").FogStart = 0
				game:GetService("Lighting").FogEnd = 100000
				game:GetService("Lighting").ExposureCompensation = 0
				if BiMode_Blur then BiMode_Blur:Destroy() end
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "fem boy"
})
local SlowAutoWin = COB("Utility", {
	["Name"]  = "safezone",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.SlowAutoWin = true
				local char = game:GetService("Players").LocalPlayer.Character
				char:FindFirstChild("HumanoidRootPart").CFrame = char:FindFirstChild("HumanoidRootPart").CFrame + Vector3.new(0,99,0)
				char:FindFirstChild("Head").Anchored = true
				char:FindFirstChild("UpperTorso").Anchored = true
				char:FindFirstChild("UpperTorso").Anchored = true
				char:FindFirstChild("HumanoidRootPart"):Destroy()
			end)
		else
			pcall(function()
				ScriptSettings.SlowAutoWin = false
				infonotify("SlowAutoWin", "Unable to revert changes", "5")
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "advanced hrp destroyer broken?"
})
local InviteCrash = COB("Utility", {
	["Name"] = "InviteCrash",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.InviteCrash = true
				while task.wait() do
					if not ScriptSettings.InviteCrash == true then return end
					for i,v in pairs(game:GetService("Players"):GetChildren()) do
						if not v.Name == game:GetService("Players").LocalPlayer.Name then
							game:GetService("ReplicatedStorage")["events-@easy-games/lobby:shared/event/lobby-events@getEvents.Events"].inviteToParty:FireServer({["player"] = game:GetService("Players")[v.Name],})
						end
					end
				end
			end)
		else
			pcall(function()
				ScriptSettings.InviteCrash = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Spam invites other players"
})
