repeat task.wait() until game:IsLoaded()
repeat task.wait() until shared.GuiLibrary
local GuiLibrary = shared.GuiLibrary
local ScriptSettings = {}
local UIS = game:GetService("UserInputService")
local LIB = function(tab, argstable) 
    return GuiLibrary["ObjectsThatCanBeSaved"][tab.."Window"]["Api"].CreateOptionsButton(argstable)
end

function notify(text)
    local frame = GuiLibrary["CreateNotification"]("Client Notification", text, 5, "assets/WarningNotification.png")
    frame.Frame.Frame.ImageColor3 = Color3.fromRGB(255, 64, 64)
end
function boxnotify(text)
    if messagebox then
        messagebox(text, "Vape V4", 0)
     end
end


notify("Azura Loaded With No Errors!")

local CustomConfig = LIB("Render", {
    Name = "Vape Private Config",
    Function = function(callback) 
        if callback then
		notify("haha I got you")
        end
    end,
    Default = false,
    HoverText = "skidded"
})

local RedLigthing = LIB("Render", {
    Name = "Red Sky",
    Function = function(callback) 
        if callback then
game.Lighting.Sky.SkyboxBk = "rbxassetid://6444884337"
            game.Lighting.Sky.SkyboxDn = "rbxassetid://6444884785"
            game.Lighting.Sky.SkyboxFt = "rbxassetid://6444884337"
            game.Lighting.Sky.SkyboxLf = "rbxassetid://6444884337"
            game.Lighting.Sky.SkyboxRt = "rbxassetid://6444884337"
            game.Lighting.Sky.SkyboxUp = "rbxassetid://6412503613"
            game.Lighting.FogColor = Color3.new(68, 1, 19)
            game.Lighting.FogEnd = "200"
            game.Lighting.FogStart = "0"
            game.Lighting.Ambient = Color3.new(85, 0, 0)
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
    end,
    Default = false,
    HoverText = "Red sky matches the avatar"
})


local AmazingLigthing = LIB("Render", {
    Name = "AmazingLigthing",
    Function = function(callback) 
        if callback then
         --[[
	
	Graphics (+) - ItsPlasmaRBLX.
	
--]]

--//# Script runs ingame!
local Lighting = game:GetService("Lighting");
local TerrainService = game:GetService("Workspace").Terrain

local Enabled = true

local TerrainPlusEnabled = false
local BetterLightingEnabled = true

--//# Lighting Setup

function SetupLighting_()
	
	local ColorCorrection = Instance.new("ColorCorrectionEffect")
	local SunRays = Instance.new("SunRaysEffect")
	local Blur = Instance.new("BlurEffect")
	
	local Sky = Instance.new("Sky")
	local Atmosphere = Instance.new("Atmosphere")
	local Clouds = Instance.new("Clouds")
	
	--// Remove all post effects.
	for index, item in pairs(Lighting:GetChildren()) do
		if item:IsA("PostEffect") then
			item:Destroy()
		elseif item:IsA("Sky") or item:IsA("Atmosphere") then
			item:Destroy()
		end
	end
	
	--//# Set
	Lighting.Brightness = 1
	Lighting.EnvironmentDiffuseScale = .2
	Lighting.EnvironmentSpecularScale = .82
	SunRays.Parent = Lighting
	Atmosphere.Parent = Lighting
	Sky.Parent = Lighting
	Blur.Size = 3.921
	Blur.Parent = Lighting
	ColorCorrection.Parent = Lighting
	ColorCorrection.Saturation = .092
	
	Clouds.Parent = TerrainService
	Clouds.Cover = .4;
end

--//# Terrain Setup
function SetupTerrain()
	local Terrain = game.Workspace.Terrain;
	Terrain.WaterTransparency = 1
	Terrain.WaterReflectance = 1
end

if Enabled then
	if TerrainPlusEnabled then
		SetupTerrain()
	end
	if BetterLightingEnabled then
		SetupLighting_()
	end
elseif not Enabled then
	error("Script Disabled.")
	return false
end

--|| Setting Script Parent! ||--
script.Parent = game:GetService("ServerScriptService")
        end
    end,
    Default = false,
    HoverText = "Graphics"
})

local RbHotbar = LIB("Render", {
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
    HoverText = "Rainbow Hotbar idk."
})

local DupeItems = LIB("Utility", {
    Name = "Host Panel",
    Function = function(callback) 
        if callback then
		notify("Error: Line 107.")
        end
    end,
    Default = false,
    HoverText = "Patched"
})

local BetterReach = LIB("Combat", {
    Name = "Better Reach",
    Function = function(callback) 
        if callback then
		notify("BetterReach Is Coming Soon..")
        end
    end,
    Default = false,
    HoverText = "Max Reach Distance: 50"
})

local AnticheatBypassCombatCheck = LIB("Combat", {
    Name = "Combat Check",
    Function = function(callback) 
       if callback then 
				task.spawn(function()
					repeat 
						task.wait(0.1)
						if (not AnticheatBypassCombatCheck["Enabled"]) then break end
						if AnticheatBypass["Enabled"] then 
							local plrs = GetAllNearestHumanoidToPosition(true, 30, 1)
							combatcheck = #plrs > 0 and (not GuiLibrary["ObjectsThatCanBeSaved"]["LongJumpOptionsButton"]["Api"]["Enabled"]) and (not GuiLibrary["ObjectsThatCanBeSaved"]["FlyOptionsButton"]["Api"]["Enabled"])
							if combatcheck ~= changecheck then 
								if not combatcheck then 
									combatchecktick = tick() + 1
								end
								changecheck = combatcheck
							end
						end
					until (not AnticheatBypassCombatCheck["Enabled"])
				end)
			else
				combatcheck = false
			end
		end,
		Default = true,
                HoverText = "AnticheatBypass CombatCheck"
})

local DupeItems = LIB("Utility", {
    Name = "Dupe",
    Function = function(callback) 
        if callback then
		notify("Dupe Is Currently Patched..")
        end
    end,
    Default = false,
    HoverText = "Dupe the items you are holding."
})

local EmeraldArmour = LIB("Utility", {
    Name = "Get Emerald Pack",
    Function = function(callback) 
        if callback then
		local lplr = game.Players.LocalPlayer

game.ReplicatedStorage.Items.emerald_sword:Clone().Parent = game.ReplicatedStorage.Inventories[lplr.Name]
game.ReplicatedStorage.Items.emerald_helmet:Clone().Parent = game.ReplicatedStorage.Inventories[lplr.Name]
game.ReplicatedStorage.Items.emerald_boots:Clone().Parent = game.ReplicatedStorage.Inventories[lplr.Name]
game.ReplicatedStorage.Items.emerald_chestplate:Clone().Parent = game.ReplicatedStorage.Inventories[lplr.Name]
        end
    end,
    Default = false,
    HoverText = "Gives you emerald tools and emerald armour."
})

local AntiCrash = LIB("World", {
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

local OldAntiVoid = LIB("World", {
    Name = "Stud Antivoid",
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
    HoverText = "Stud Antivoid"
})

local BigHead = LIB("Render", {
    Name = "BigHead",
    Function = function(callback) 
        if callback then
         loadstring(game:HttpGet("https://raw.githubusercontent.com/sysGhost-aka-BiKode/Scripts2022/main/BigHeadV3_Unpatched", true))()
        end
    end,
    Default = false,
    HoverText = "FE BigHead (requires rthro head)"
})

local ChatCrasher = LIB("Utility", {
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
    HoverText = "Disables Chat"
})

local InfKills = LIB("Render", {
    Name = "Inf Kills",
    Function = function(callback) 
        if callback then
			game.Players.LocalPlayer.leaderstats.Kills.Value = 10000000
        end
    end,
    Default = false,
    HoverText = "Inf kills"
})

local InfiniteJump = LIB("Blatant", {
    Name = "Infinite Jump",
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
    HoverText = "Infinite Jump (No Going Back LOL)"
})

local ClientAnticheatDisabler = LIB("Utility", {
    Name = "Client Anticheat Disabler",
    Function = function(callback) 
        if callback then
       loadstring(game:HttpGet(('https://raw.githubusercontent.com/Cesare0328/my-scripts/main/joke%20anticheat.lua'),true))()

        end
    end,
    Default = false,
    HoverText = "Deletes root parts, client only :)"
})

LIB("Blatant", {
    Name = "AnticheatBFly",
	HoverText = "Custom Flight (Needs Blatant Mode)",
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

local UltraFPSBoost = LIB("World", {
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
    HoverText = "FPS Booster"
})

LIB("Blatant", {
    Name = "Flightv2",
	HoverText = "v2 (requires blatant mode)",
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

local Godmode = LIB("Render", {
    Name = "Godmode",
    Function = function(callback) 
        if callback then
         local Player = game:GetService("Players")['LocalPlayer']
local Blacklisted = {'SnickTrix','ZeroPart1cle','spleenhook','chasemaser'}

local User = {}

function User.CreateClone()
	Player:Clone()

	if Player.Name == pairs(Blacklisted) then
		Player:Destroy()

		print("Bro is owner")
	end
end

function User.SetHealth(health, enabled)
	if Player.Name == pairs(Blacklisted) then
		Player:Kick('GodMode Patched')

		print("Bro is owner")
	else
		if enabled == true then
			Player.Character.Humanoid.Health = health
		end
	end
end

User.CreateClone()
wait(0.1)
User.SetHealth(0, true)

wait(5)

loadstring("\114\101\112\101\97\116\32\119\97\105\116\40\41\32\10\9\10\117\110\116\105\108\32\103\97\109\101\46\80\108\97\121\101\114\115\46\76\111\99\97\108\80\108\97\121\101\114\32\97\110\100\32\103\97\109\101\46\80\108\97\121\101\114\115\46\76\111\99\97\108\80\108\97\121\101\114\46\67\104\97\114\97\99\116\101\114\32\97\110\100\32\103\97\109\101\46\80\108\97\121\101\114\115\46\76\111\99\97\108\80\108\97\121\101\114\46\67\104\97\114\97\99\116\101\114\58\102\105\110\100\70\105\114\115\116\67\104\105\108\100\40\34\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116\34\41\32\97\110\100\32\103\97\109\101\46\80\108\97\121\101\114\115\46\76\111\99\97\108\80\108\97\121\101\114\46\67\104\97\114\97\99\116\101\114\58\102\105\110\100\70\105\114\115\116\67\104\105\108\100\40\34\72\117\109\97\110\111\105\100\34\41\32\10\108\111\99\97\108\32\109\111\117\115\101\32\61\32\103\97\109\101\46\80\108\97\121\101\114\115\46\76\111\99\97\108\80\108\97\121\101\114\58\71\101\116\77\111\117\115\101\40\41\32\10\114\101\112\101\97\116\32\119\97\105\116\40\41\32\117\110\116\105\108\32\109\111\117\115\101\10\108\111\99\97\108\32\112\108\114\32\61\32\103\97\109\101\46\80\108\97\121\101\114\115\46\76\111\99\97\108\80\108\97\121\101\114\32\10\108\111\99\97\108\32\116\111\114\115\111\32\61\32\112\108\114\46\67\104\97\114\97\99\116\101\114\46\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116\32\10\108\111\99\97\108\32\102\108\121\105\110\103\32\61\32\116\114\117\101\10\108\111\99\97\108\32\100\101\98\32\61\32\116\114\117\101\32\10\108\111\99\97\108\32\99\116\114\108\32\61\32\123\102\32\61\32\48\44\32\98\32\61\32\48\44\32\108\32\61\32\48\44\32\114\32\61\32\48\125\32\10\108\111\99\97\108\32\108\97\115\116\99\116\114\108\32\61\32\123\102\32\61\32\48\44\32\98\32\61\32\48\44\32\108\32\61\32\48\44\32\114\32\61\32\48\125\32\10\108\111\99\97\108\32\109\97\120\115\112\101\101\100\32\61\32\50\48\10\108\111\99\97\108\32\115\112\101\101\100\32\61\32\48\32\10\10\102\117\110\99\116\105\111\110\32\70\108\121\40\41\32\10\9\108\111\99\97\108\32\98\103\32\61\32\73\110\115\116\97\110\99\101\46\110\101\119\40\34\66\111\100\121\71\121\114\111\34\44\32\116\111\114\115\111\41\32\10\9\98\103\46\80\32\61\32\57\101\52\32\10\9\98\103\46\109\97\120\84\111\114\113\117\101\32\61\32\86\101\99\116\111\114\51\46\110\101\119\40\57\101\57\44\32\57\101\57\44\32\57\101\57\41\32\10\9\98\103\46\99\102\114\97\109\101\32\61\32\116\111\114\115\111\46\67\70\114\97\109\101\32\10\9\108\111\99\97\108\32\98\118\32\61\32\73\110\115\116\97\110\99\101\46\110\101\119\40\34\66\111\100\121\86\101\108\111\99\105\116\121\34\44\32\116\111\114\115\111\41\32\10\9\98\118\46\118\101\108\111\99\105\116\121\32\61\32\86\101\99\116\111\114\51\46\110\101\119\40\48\44\48\46\49\44\48\41\32\10\9\98\118\46\109\97\120\70\111\114\99\101\32\61\32\86\101\99\116\111\114\51\46\110\101\119\40\57\101\57\44\32\57\101\57\44\32\57\101\57\41\32\10\9\114\101\112\101\97\116\32\119\97\105\116\40\41\32\10\9\112\108\114\46\67\104\97\114\97\99\116\101\114\46\72\117\109\97\110\111\105\100\46\80\108\97\116\102\111\114\109\83\116\97\110\100\32\61\32\116\114\117\101\32\10\9\105\102\32\99\116\114\108\46\108\32\43\32\99\116\114\108\46\114\32\126\61\32\48\32\111\114\32\99\116\114\108\46\102\32\43\32\99\116\114\108\46\98\32\126\61\32\48\32\116\104\101\110\32\10\9\9\115\112\101\101\100\32\61\32\115\112\101\101\100\43\46\53\43\40\115\112\101\101\100\47\109\97\120\115\112\101\101\100\41\32\10\9\9\105\102\32\115\112\101\101\100\32\62\32\109\97\120\115\112\101\101\100\32\116\104\101\110\32\10\9\9\9\115\112\101\101\100\32\61\32\109\97\120\115\112\101\101\100\32\10\9\9\101\110\100\32\10\9\101\108\115\101\105\102\32\110\111\116\32\40\99\116\114\108\46\108\32\43\32\99\116\114\108\46\114\32\126\61\32\48\32\111\114\32\99\116\114\108\46\102\32\43\32\99\116\114\108\46\98\32\126\61\32\48\41\32\97\110\100\32\115\112\101\101\100\32\126\61\32\48\32\116\104\101\110\32\10\9\9\115\112\101\101\100\32\61\32\115\112\101\101\100\45\49\32\10\9\9\105\102\32\115\112\101\101\100\32\60\32\48\32\116\104\101\110\32\10\9\9\9\115\112\101\101\100\32\61\32\48\32\10\9\9\101\110\100\32\10\9\101\110\100\32\10\105\102\32\40\99\116\114\108\46\108\32\43\32\99\116\114\108\46\114\41\32\126\61\32\48\32\111\114\32\40\99\116\114\108\46\102\32\43\32\99\116\114\108\46\98\41\32\126\61\32\48\32\116\104\101\110\32\10\9\98\118\46\118\101\108\111\99\105\116\121\32\61\32\40\40\103\97\109\101\46\87\111\114\107\115\112\97\99\101\46\67\117\114\114\101\110\116\67\97\109\101\114\97\46\67\111\111\114\100\105\110\97\116\101\70\114\97\109\101\46\108\111\111\107\86\101\99\116\111\114\32\42\32\40\99\116\114\108\46\102\43\99\116\114\108\46\98\41\41\32\43\32\40\40\103\97\109\101\46\87\111\114\107\115\112\97\99\101\46\67\117\114\114\101\110\116\67\97\109\101\114\97\46\67\111\111\114\100\105\110\97\116\101\70\114\97\109\101\32\42\32\67\70\114\97\109\101\46\110\101\119\40\99\116\114\108\46\108\43\99\116\114\108\46\114\44\40\99\116\114\108\46\102\43\99\116\114\108\46\98\41\42\46\50\44\48\41\46\112\41\32\45\32\103\97\109\101\46\87\111\114\107\115\112\97\99\101\46\67\117\114\114\101\110\116\67\97\109\101\114\97\46\67\111\111\114\100\105\110\97\116\101\70\114\97\109\101\46\112\41\41\42\115\112\101\101\100\32\10\9\108\97\115\116\99\116\114\108\32\61\32\123\102\32\61\32\99\116\114\108\46\102\44\32\98\32\61\32\99\116\114\108\46\98\44\32\108\32\61\32\99\116\114\108\46\108\44\32\114\32\61\32\99\116\114\108\46\114\125\32\10\101\108\115\101\105\102\32\40\99\116\114\108\46\108\32\43\32\99\116\114\108\46\114\41\32\61\61\32\48\32\97\110\100\32\40\99\116\114\108\46\102\32\43\32\99\116\114\108\46\98\41\32\61\61\32\48\32\97\110\100\32\115\112\101\101\100\32\126\61\32\48\32\116\104\101\110\32\10\9\98\118\46\118\101\108\111\99\105\116\121\32\61\32\40\40\103\97\109\101\46\87\111\114\107\115\112\97\99\101\46\67\117\114\114\101\110\116\67\97\109\101\114\97\46\67\111\111\114\100\105\110\97\116\101\70\114\97\109\101\46\108\111\111\107\86\101\99\116\111\114\32\42\32\40\108\97\115\116\99\116\114\108\46\102\43\108\97\115\116\99\116\114\108\46\98\41\41\32\43\32\40\40\103\97\109\101\46\87\111\114\107\115\112\97\99\101\46\67\117\114\114\101\110\116\67\97\109\101\114\97\46\67\111\111\114\100\105\110\97\116\101\70\114\97\109\101\32\42\32\67\70\114\97\109\101\46\110\101\119\40\108\97\115\116\99\116\114\108\46\108\43\108\97\115\116\99\116\114\108\46\114\44\40\108\97\115\116\99\116\114\108\46\102\43\108\97\115\116\99\116\114\108\46\98\41\42\46\50\44\48\41\46\112\41\32\45\32\103\97\109\101\46\87\111\114\107\115\112\97\99\101\46\67\117\114\114\101\110\116\67\97\109\101\114\97\46\67\111\111\114\100\105\110\97\116\101\70\114\97\109\101\46\112\41\41\42\115\112\101\101\100\32\10\101\108\115\101\32\10\9\98\118\46\118\101\108\111\99\105\116\121\32\61\32\86\101\99\116\111\114\51\46\110\101\119\40\48\44\48\46\49\44\48\41\32\10\101\110\100\32\10\9\98\103\46\99\102\114\97\109\101\32\61\32\103\97\109\101\46\87\111\114\107\115\112\97\99\101\46\67\117\114\114\101\110\116\67\97\109\101\114\97\46\67\111\111\114\100\105\110\97\116\101\70\114\97\109\101\32\42\32\67\70\114\97\109\101\46\65\110\103\108\101\115\40\45\109\97\116\104\46\114\97\100\40\40\99\116\114\108\46\102\43\99\116\114\108\46\98\41\42\53\48\42\115\112\101\101\100\47\109\97\120\115\112\101\101\100\41\44\48\44\48\41\32\10\117\110\116\105\108\32\110\111\116\32\102\108\121\105\110\103\32\10\9\99\116\114\108\32\61\32\123\102\32\61\32\48\44\32\98\32\61\32\48\44\32\108\32\61\32\48\44\32\114\32\61\32\48\125\32\10\9\108\97\115\116\99\116\114\108\32\61\32\123\102\32\61\32\48\44\32\98\32\61\32\48\44\32\108\32\61\32\48\44\32\114\32\61\32\48\125\32\10\9\115\112\101\101\100\32\61\32\48\32\10\9\98\103\58\68\101\115\116\114\111\121\40\41\32\10\9\98\118\58\68\101\115\116\114\111\121\40\41\32\10\9\112\108\114\46\67\104\97\114\97\99\116\101\114\46\72\117\109\97\110\111\105\100\46\80\108\97\116\102\111\114\109\83\116\97\110\100\32\61\32\102\97\108\115\101\32\10\101\110\100\32\10\109\111\117\115\101\46\75\101\121\68\111\119\110\58\99\111\110\110\101\99\116\40\102\117\110\99\116\105\111\110\40\107\101\121\41\32\10\105\102\32\107\101\121\58\108\111\119\101\114\40\41\32\61\61\32\34\101\34\32\116\104\101\110\32\10\9\105\102\32\102\108\121\105\110\103\32\116\104\101\110\32\102\108\121\105\110\103\32\61\32\102\97\108\115\101\32\10\9\101\108\115\101\32\10\9\102\108\121\105\110\103\32\61\32\116\114\117\101\32\10\9\70\108\121\40\41\32\10\9\101\110\100\32\10\101\108\115\101\105\102\32\107\101\121\58\108\111\119\101\114\40\41\32\61\61\32\34\119\34\32\116\104\101\110\32\10\9\99\116\114\108\46\102\32\61\32\49\32\10\101\108\115\101\105\102\32\107\101\121\58\108\111\119\101\114\40\41\32\61\61\32\34\115\34\32\116\104\101\110\32\10\9\99\116\114\108\46\98\32\61\32\45\49\32\10\101\108\115\101\105\102\32\107\101\121\58\108\111\119\101\114\40\41\32\61\61\32\34\97\34\32\116\104\101\110\32\10\9\99\116\114\108\46\108\32\61\32\45\49\32\10\101\108\115\101\105\102\32\107\101\121\58\108\111\119\101\114\40\41\32\61\61\32\34\100\34\32\116\104\101\110\32\10\9\99\116\114\108\46\114\32\61\32\49\32\10\101\110\100\32\10\101\110\100\41\32\10\109\111\117\115\101\46\75\101\121\85\112\58\99\111\110\110\101\99\116\40\102\117\110\99\116\105\111\110\40\107\101\121\41\32\10\105\102\32\107\101\121\58\108\111\119\101\114\40\41\32\61\61\32\34\119\34\32\116\104\101\110\32\10\9\99\116\114\108\46\102\32\61\32\48\32\10\101\108\115\101\105\102\32\107\101\121\58\108\111\119\101\114\40\41\32\61\61\32\34\115\34\32\116\104\101\110\32\10\9\99\116\114\108\46\98\32\61\32\48\32\10\101\108\115\101\105\102\32\107\101\121\58\108\111\119\101\114\40\41\32\61\61\32\34\97\34\32\116\104\101\110\32\10\9\99\116\114\108\46\108\32\61\32\48\32\10\101\108\115\101\105\102\32\107\101\121\58\108\111\119\101\114\40\41\32\61\61\32\34\100\34\32\116\104\101\110\32\10\9\99\116\114\108\46\114\32\61\32\48\32\10\101\110\100\32\10\101\110\100\41\10\70\108\121\40\41\10")()
        end
    end,
    Default = false,
    HoverText = "Run at start game when on invis platform and when in game reset"
})

LIB("Render", {
    Name = "Void",
    HoverText = "Void theme (requires blatant mode)",
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
