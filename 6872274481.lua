local GuiLibrary = shared.GuiLibrary
local blockraycast = RaycastParams.new()
blockraycast.FilterType = Enum.RaycastFilterType.Whitelist
local players = game:GetService("Players")
local getasset = getsynasset or getcustomasset or function(location) return "rbxasset://"..location end
local textservice = game:GetService("TextService")
local repstorage = game:GetService("ReplicatedStorage")
local lplr = players.LocalPlayer
local workspace = game:GetService("Workspace")
local lighting = game:GetService("Lighting")
local cam = workspace.CurrentCamera
local chatconnection
local modules = {}
local targetinfo = shared.VapeTargetInfo
local uis = game:GetService("UserInputService")
local mouse = lplr:GetMouse()
local remotes = {}
local bedwars = {}
local inventories = {}
local lagbackevent = Instance.new("BindableEvent")
local vec3 = Vector3.new
local cfnew = CFrame.new
local entity = shared.vapeentity
local uninjectflag = false
local matchstatetick = 0
local queueteleport = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport or function() end
local teleportfunc
local clients = {
	ChatStrings1 = {
		["KVOP25KYFPPP4"] = "vape",
		["IO12GP56P4LGR"] = "future",
		["RQYBPTYNURYZC"] = "rektsky"
	},
	ChatStrings2 = {
		["vape"] = "KVOP25KYFPPP4",
		["future"] = "IO12GP56P4LGR",
		["rektsky"] = "RQYBPTYNURYZC"
	},
	ClientUsers = {}
}
local requestfunc = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or getgenv().request or request
local checkpublicreponum = 0
local checkpublicrepo
checkpublicrepo = function(id)
	local suc, req = pcall(function() return requestfunc({
		Url = "https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/CustomModules/6872274481.lua",
		Method = "GET"
	}) end)
	if not suc then
		checkpublicreponum = checkpublicreponum + 1
		spawn(function()
			local textlabel = Instance.new("TextLabel")
			textlabel.Size = UDim2.new(1, 0, 0, 36)
			textlabel.Text = "Loading CustomModule Failed!, Attempts : "..checkpublicreponum
			textlabel.BackgroundTransparency = 1
			textlabel.TextStrokeTransparency = 0
			textlabel.TextSize = 30
			textlabel.Font = Enum.Font.SourceSans
			textlabel.TextColor3 = Color3.new(1, 1, 1)
			textlabel.Position = UDim2.new(0, 0, 0, -36)
			textlabel.Parent = GuiLibrary["MainGui"]
			task.wait(2)
			textlabel:Remove()
		end)
		task.wait(2)
		return checkpublicrepo(id)
	end
	if req.StatusCode == 200 then
		return req.Body
	end
	return nil
end
local publicrepo = checkpublicrepo(game.PlaceId)
if publicrepo then
    loadstring(publicrepo)()
end


local function createwarning(title, text, delay)
	local suc, res = pcall(function()
		local frame = GuiLibrary["CreateNotification"](title, text, delay, "assets/WarningNotification.png")
		frame.Frame.Frame.ImageColor3 = Color3.fromRGB(201, 126, 14)
		return frame
	end)
	return (suc and res)
end

createwarning("Azura", "Azura loaded thanks for buying ", 5)


		local cachedassets = {}
local function getcustomassetfunc(path)
	if not betterisfile(path) then
		task.spawn(function()
			local textlabel = Instance.new("TextLabel")
			textlabel.Size = UDim2.new(1, 0, 0, 36)
			textlabel.Text = "Downloading "..path
			textlabel.BackgroundTransparency = 1
			textlabel.TextStrokeTransparency = 0
			textlabel.TextSize = 30
			textlabel.Font = Enum.Font.SourceSans
			textlabel.TextColor3 = Color3.new(1, 1, 1)
			textlabel.Position = UDim2.new(0, 0, 0, -36)
			textlabel.Parent = GuiLibrary["MainGui"]
			repeat task.wait() until betterisfile(path)
			textlabel:Remove()
		end)
		local req = requestfunc({
			Url = "https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/"..path:gsub("vape/assets", "assets"),
			Method = "GET"
		})
		writefile(path, req.Body)
	end
	if cachedassets[path] == nil then
		cachedassets[path] = getasset(path) 
	end
	return cachedassets[path]
end

local function getremote(tab)
	for i,v in pairs(tab) do
		if v == "Client" then
			return tab[i + 1]
		end
	end
	return ""
end
local function runcode(func)
	func()
end	
	
local function createwarning(title, text, delay)
	local suc, res = pcall(function()
		local frame = GuiLibrary["CreateNotification"](title, text, delay, "assets/WarningNotification.png")
		frame.Frame.Frame.ImageColor3 = Color3.fromRGB(201, 126, 14)
		return frame
	end)
	return (suc and res)
end

local function targetCheck(plr)
	return plr and plr.Humanoid and plr.Humanoid.Health > 0 and plr.Character:FindFirstChild("ForceField") == nil
end


local function targetCheck(plr)
	return plr and plr.Humanoid and plr.Humanoid.Health > 0 and plr.Character:FindFirstChild("ForceField") == nil
end

local function isAliveOld(plr, alivecheck)
	if plr then
		return plr and plr.Character and plr.Character.Parent ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Head") and plr.Character:FindFirstChild("Humanoid")
	end
	return entity.isAlive
end



local betterisfile = function(file)
	local suc, res = pcall(function() return readfile(file) end)
	return suc and res ~= nil
end

local cachedassets = {}
local function getcustomassetfunc(path)
	if not betterisfile(path) then
		task.spawn(function()
			local textlabel = Instance.new("TextLabel")
			textlabel.Size = UDim2.new(1, 0, 0, 36)
			textlabel.Text = "Downloading "..path
			textlabel.BackgroundTransparency = 1
			textlabel.TextStrokeTransparency = 0
			textlabel.TextSize = 30
			textlabel.Font = Enum.Font.SourceSans
			textlabel.TextColor3 = Color3.new(1, 1, 1)
			textlabel.Position = UDim2.new(0, 0, 0, -36)
			textlabel.Parent = GuiLibrary["MainGui"]
			repeat task.wait() until betterisfile(path)
			textlabel:Remove()
		end)
		local req = requestfunc({
			Url = "https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/"..path:gsub("vape/assets", "assets"),
			Method = "GET"
		})
		writefile(path, req.Body)
	end
	if cachedassets[path] == nil then
		cachedassets[path] = getasset(path) 
	end
	return cachedassets[path]
end


local RunLoops = {RenderStepTable = {}, StepTable = {}, HeartTable = {}}
do
	function RunLoops:BindToRenderStep(name, num, func)
		if RunLoops.RenderStepTable[name] == nil then
			RunLoops.RenderStepTable[name] = game:GetService("RunService").RenderStepped:connect(func)
		end
	end

	function RunLoops:UnbindFromRenderStep(name)
		if RunLoops.RenderStepTable[name] then
			RunLoops.RenderStepTable[name]:Disconnect()
			RunLoops.RenderStepTable[name] = nil
		end
	end

	function RunLoops:BindToStepped(name, num, func)
		if RunLoops.StepTable[name] == nil then
			RunLoops.StepTable[name] = game:GetService("RunService").Stepped:connect(func)
		end
	end

	function RunLoops:UnbindFromStepped(name)
		if RunLoops.StepTable[name] then
			RunLoops.StepTable[name]:Disconnect()
			RunLoops.StepTable[name] = nil
		end
	end

	function RunLoops:BindToHeartbeat(name, num, func)
		if RunLoops.HeartTable[name] == nil then
			RunLoops.HeartTable[name] = game:GetService("RunService").Heartbeat:connect(func)
		end
	end

	function RunLoops:UnbindFromHeartbeat(name)
		if RunLoops.HeartTable[name] then
			RunLoops.HeartTable[name]:Disconnect()
			RunLoops.HeartTable[name] = nil
		end
	end
end


repeat task.wait() until game:IsLoaded()
repeat task.wait() until shared.GuiLibrary
local GuiLibrary = shared.GuiLibrary
local vec3 = Vector3.new
local lplr = game:GetService("Players")
local ScriptSettings = {}
local UIS = game:GetService("UserInputService")
local COB = function(tab, argstable) 
    return GuiLibrary["ObjectsThatCanBeSaved"][tab.."Window"]["Api"].CreateOptionsButton(argstable)
end
local RbHotbar = COB("Render", {
    Name = "Rainbow HotBar",
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
    HoverText = "Rainbow Hotbar."
})

local AutoWin = COB("Utility", {
	["Name"] = "SkyWars AutoWin ",
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
	["HoverText"] = "Turn On Disabler + MutiAura"
})
local currentinventory = {
	["inventory"] = {
		["items"] = {},
		["armor"] = {},
		["hand"] = nil
	}
}
local repstorage = game:GetService("ReplicatedStorage")
local client = {}
local Client = require(repstorage.TS.remotes).default.Client
local function getremote(tab)
	for i,v in pairs(tab) do
		if v == "Client" then
			return tab[i + 1]
		end
	end
	return ""
end
local function runcode(func)
	func()
end	
local bedwars = {}
local arrowdodgedata
local getfunctions
						local OldClientGet 
local oldbreakremote
local oldbob
runcode(function()
    getfunctions = function()
		local Flamework = require(repstorage["rbxts_include"]["node_modules"]["@flamework"].core.out).Flamework
		repeat task.wait() until Flamework.isInitialized
        local KnitClient = debug.getupvalue(require(lplr.PlayerScripts.TS.knit).setup, 6)
        local Client = require(repstorage.TS.remotes).default.Client
        local InventoryUtil = require(repstorage.TS.inventory["inventory-util"]).InventoryUtil
        OldClientGet = getmetatable(Client).Get
        getmetatable(Client).Get = function(Self, remotename)
			local res = OldClientGet(Self, remotename)
			if uninjectflag then return res end
			if remotename == "DamageBlock" then
				return {
					["CallServerAsync"] = function(Self, tab)
						local block = bedwars["BlockController"]:getStore():getBlockAt(tab.blockRef.blockPosition)
						if block and block.Name == "bed" then
							if getWhitelistedBed(block) then
								return {andThen = function(self, func) 
									func("failed")
								end}
							end
						end
						return res:CallServerAsync(tab)
					end,
					["CallServer"] = function(Self, tab)
						local block = bedwars["BlockController"]:getStore():getBlockAt(tab.blockRef.blockPosition)
						if block and block.Name == "bed" then
							if getWhitelistedBed(block) then
								return {andThen = function(self, func) 
									func("failed")
								end}
							end
						end
						return res:CallServer(tab)
					end
				}
			elseif remotename == bedwars["AttackRemote"] then
				return {
					["instance"] = res["instance"],
					["SendToServer"] = function(Self, tab)
						local suc, plr = pcall(function() return players:GetPlayerFromCharacter(tab.entityInstance) end)
						if suc and plr then
							local playertype, playerattackable = WhitelistFunctions:CheckPlayerType(plr)
							if not playerattackable then 
								return nil
							end
						end
						if Reach["Enabled"] then
							local mag = (tab.validate.selfPosition.value - tab.validate.targetPosition.value).magnitude
							local newres = hashvec(tab.validate.selfPosition.value + (mag > 14.4 and (CFrame.lookAt(tab.validate.selfPosition.value, tab.validate.targetPosition.value).lookVector * 4) or Vector3.zero))
							tab.validate.selfPosition = newres
						end
						return res:SendToServer(tab)
					end
				}
			end
            return res
        end
		bedwars = {
			["AnimationUtil"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out["shared"].util["animation-util"]).AnimationUtil,
			["AngelUtil"] = require(repstorage.TS.games.bedwars.kit.kits.angel["angel-kit"]),
			["AppController"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out.client.controllers["app-controller"]).AppController,
			["AttackRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.SwordController)["attackEntity"])),
			["BatteryRemote"] = getremote(debug.getconstants(debug.getproto(debug.getproto(KnitClient.Controllers.BatteryController.KnitStart, 1), 1))),
			["BatteryEffectController"] = KnitClient.Controllers.BatteryEffectsController,
            ["BalloonController"] = KnitClient.Controllers.BalloonController,
            ["BlockController"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out).BlockEngine,
            ["BlockController2"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out.client.placement["block-placer"]).BlockPlacer,
            ["BlockEngine"] = require(lplr.PlayerScripts.TS.lib["block-engine"]["client-block-engine"]).ClientBlockEngine,
            ["BlockEngineClientEvents"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out.client["block-engine-client-events"]).BlockEngineClientEvents,
			["BlockPlacementController"] = KnitClient.Controllers.BlockPlacementController,
            ["BedwarsKits"] = require(repstorage.TS.games.bedwars.kit["bedwars-kit-shop"]).BedwarsKitShop,
            ["BlockBreaker"] = KnitClient.Controllers.BlockBreakController.blockBreaker,
            ["BowTable"] = KnitClient.Controllers.ProjectileController,
			["BowConstantsTable"] = debug.getupvalue(KnitClient.Controllers.ProjectileController.enableBeam, 5),
			["ChestController"] = KnitClient.Controllers.ChestController,
			["ClickHold"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out.client.ui.lib.util["click-hold"]).ClickHold,
            ["ClientHandler"] = Client,
			["SharedConstants"] = require(repstorage.TS["shared-constants"]),
            ["ClientHandlerDamageBlock"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out.remotes).BlockEngineRemotes.Client,
            ["ClientStoreHandler"] = require(lplr.PlayerScripts.TS.ui.store).ClientStore,
			["ClientHandlerSyncEvents"] = require(lplr.PlayerScripts.TS["client-sync-events"]).ClientSyncEvents,
            ["CombatConstant"] = require(repstorage.TS.combat["combat-constant"]).CombatConstant,
			["CombatController"] = KnitClient.Controllers.CombatController,
			["ConsumeSoulRemote"] = getremote(debug.getconstants(KnitClient.Controllers.GrimReaperController.consumeSoul)),
			["ConstantManager"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out["shared"].constant["constant-manager"]).ConstantManager,
			["CooldownController"] = KnitClient.Controllers.CooldownController,
            ["damageTable"] = KnitClient.Controllers.DamageController,
			["DinoRemote"] = getremote(debug.getconstants(debug.getproto(KnitClient.Controllers.DinoTamerController.KnitStart, 3))),
			["DaoRemote"] = getremote(debug.getconstants(debug.getprotos(KnitClient.Controllers.DaoController.onEnable)[4])),
			["DamageController"] = KnitClient.Controllers.DamageController,
			["DamageIndicator"] = KnitClient.Controllers.DamageIndicatorController.spawnDamageIndicator,
			["DamageIndicatorController"] = KnitClient.Controllers.DamageIndicatorController,
			["DetonateRavenRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.RavenController).detonateRaven)),
            ["DropItem"] = getmetatable(KnitClient.Controllers.ItemDropController).dropItemInHand,
            ["DropItemRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.ItemDropController).dropItemInHand)),
            ["EatRemote"] = getremote(debug.getconstants(debug.getproto(getmetatable(KnitClient.Controllers.ConsumeController).onEnable, 1))),
            ["EquipItemRemote"] = getremote(debug.getconstants(debug.getprotos(shared.oldequipitem or require(repstorage.TS.entity.entities["inventory-entity"]).InventoryEntity.equipItem)[3])),
			["FishermanTable"] = KnitClient.Controllers.FishermanController,
			["FovController"] = KnitClient.Controllers.FovController,
			["GameAnimationUtil"] = require(repstorage.TS.animation["animation-util"]).GameAnimationUtil,
			["GamePlayerUtil"] = require(repstorage.TS.player["player-util"]).GamePlayerUtil,
            ["getEntityTable"] = require(repstorage.TS.entity["entity-util"]).EntityUtil,
            ["getIcon"] = function(item, showinv)
                local itemmeta = bedwars["ItemTable"][item.itemType]
                if itemmeta and showinv then
                    return itemmeta.image
                end
                return ""
            end,
			["getInventory2"] = function(plr)
                local suc, result = pcall(function() 
					return InventoryUtil.getInventory(plr) 
				end)
                return (suc and result or {
                    ["items"] = {},
                    ["armor"] = {},
                    ["hand"] = nil
                })
            end,
            ["getItemMetadata"] = require(repstorage.TS.item["item-meta"]).getItemMeta,
			["GrimReaperController"] = KnitClient.Controllers.GrimReaperController,
			["GuitarHealRemote"] = getremote(debug.getconstants(KnitClient.Controllers.GuitarController.performHeal)),
			["HangGliderController"] = KnitClient.Controllers.HangGliderController,
			["HighlightController"] = KnitClient.Controllers.EntityHighlightController,
            ["ItemTable"] = debug.getupvalue(require(repstorage.TS.item["item-meta"]).getItemMeta, 1),
			["JuggernautRemote"] = getremote(debug.getconstants(debug.getprotos(debug.getprotos(KnitClient.Controllers.JuggernautController.KnitStart)[1])[4])),
			["KatanaController"] = KnitClient.Controllers.DaoController,
			["KatanaRemote"] = getremote(debug.getconstants(debug.getproto(KnitClient.Controllers.DaoController.onEnable, 4))),
            ["KnockbackTable"] = debug.getupvalue(require(repstorage.TS.damage["knockback-util"]).KnockbackUtil.calculateKnockbackVelocity, 1),
			["LobbyClientEvents"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"].lobby.out.client.events).LobbyClientEvents,
			["MapMeta"] = require(repstorage.TS.game.map["map-meta"]),
			["MissileController"] = KnitClient.Controllers.GuidedProjectileController,
			["MinerRemote"] = getremote(debug.getconstants(debug.getprotos(debug.getproto(getmetatable(KnitClient.Controllers.MinerController).onKitEnabled, 1))[2])),
			["MinerController"] = KnitClient.Controllers.MinerController,
			["ProdAnimations"] = require(repstorage.TS.animation.definitions["prod-animations"]).ProdAnimations,
            ["PickupRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.ItemDropController).checkForPickup)),
            ["PlayerUtil"] = require(repstorage.TS.player["player-util"]).GamePlayerUtil,
			["ProjectileMeta"] = require(repstorage.TS.projectile["projectile-meta"]).ProjectileMeta,
			["QueueMeta"] = require(repstorage.TS.game["queue-meta"]).QueueMeta,
			["QueueCard"] = require(lplr.PlayerScripts.TS.controllers.global.queue.ui["queue-card"]).QueueCard,
			["QueryUtil"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out).GameQueryUtil,
			["PaintRemote"] = getremote(debug.getconstants(KnitClient.Controllers.PaintShotgunController.fire)),
            ["prepareHashing"] = require(repstorage.TS["remote-hash"]["remote-hash-util"]).RemoteHashUtil.prepareHashVector3,
			["ProjectileRemote"] = getremote(debug.getconstants(debug.getupvalues(getmetatable(KnitClient.Controllers.ProjectileController)["launchProjectileWithValues"])[2])),
			["ProjectileHitRemote"] = getremote(debug.getconstants(debug.getproto(KnitClient.Controllers.ProjectileController.createLocalProjectile, 1))),
            ["RavenTable"] = KnitClient.Controllers.RavenController,
			["RespawnController"] = KnitClient.Controllers.BedwarsRespawnController,
			["RespawnTimer"] = require(lplr.PlayerScripts.TS.controllers.games.bedwars.respawn.ui["respawn-timer"]).RespawnTimerWrapper,
			["ResetRemote"] = getremote(debug.getconstants(debug.getproto(KnitClient.Controllers.ResetController.createBindable, 1))),
			["Roact"] = require(repstorage["rbxts_include"]["node_modules"]["roact"].src),
			["RuntimeLib"] = require(repstorage["rbxts_include"].RuntimeLib),
            ["Shop"] = require(repstorage.TS.games.bedwars.shop["bedwars-shop"]).BedwarsShop,
			["ShopItems"] = debug.getupvalue(require(repstorage.TS.games.bedwars.shop["bedwars-shop"]).BedwarsShop.getShopItem, 2),
            ["ShopRight"] = require(lplr.PlayerScripts.TS.controllers.games.bedwars.shop.ui["item-shop"]["shop-left"]["shop-left"]).BedwarsItemShopLeft,
			["SpawnRavenRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.RavenController).spawnRaven)),
            ["SoundManager"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out).SoundManager,
			["SoundList"] = require(repstorage.TS.sound["game-sound"]).GameSound,
            ["sprintTable"] = KnitClient.Controllers.SprintController,
			["StopwatchController"] = KnitClient.Controllers.StopwatchController,
            ["SwingSword"] = getmetatable(KnitClient.Controllers.SwordController).swingSwordAtMouse,
            ["SwingSwordRegion"] = getmetatable(KnitClient.Controllers.SwordController).swingSwordInRegion,
            ["SwordController"] = KnitClient.Controllers.SwordController,
            ["TreeRemote"] = getremote(debug.getconstants(debug.getprotos(debug.getprotos(KnitClient.Controllers.BigmanController.KnitStart)[2])[1])),
			["TrinityRemote"] = getremote(debug.getconstants(debug.getproto(getmetatable(KnitClient.Controllers.AngelController).onKitEnabled, 1))),
            ["VictoryScreen"] = require(lplr.PlayerScripts.TS.controllers["game"].match.ui["victory-section"]).VictorySection,
            ["ViewmodelController"] = KnitClient.Controllers.ViewmodelController,
			["VehicleController"] = KnitClient.Controllers.VehicleController,
			["WeldTable"] = require(repstorage.TS.util["weld-util"]).WeldUtil,
        }
	end
end)

				
-- Compute 3D launch direction from
-- start: start position
-- target: target position
-- v: launch velocity
-- g: gravity (positive) e.g. 196.2
-- higherArc: if true, use the higher arc. If false, use the lower arc.
local function LaunchDirection(start, target, v, g, higherArc: boolean)
-- get the direction flattened:
local horizontal = vec3(target.X - start.X, 0, target.Z - start.Z)

local h = target.Y - start.Y
local d = horizontal.Magnitude
local a = LaunchAngle(v, g, d, h, higherArc)

-- NaN ~= NaN, computation couldn't be done (e.g. because it's too far to launch)
if a ~= a then return nil end

-- speed if we were just launching at a flat angle:
local vec = horizontal.Unit * v

-- rotate around the axis perpendicular to that direction...
local rotAxis = vec3(-horizontal.Z, 0, horizontal.X)

-- ...by the angle amount
return CFrame.fromAxisAngle(rotAxis, a) * vec
end

local function FindLeadShot(targetPosition: Vector3, targetVelocity: Vector3, projectileSpeed: Number, shooterPosition: Vector3, shooterVelocity: Vector3, gravity: Number)
local distance = (targetPosition - shooterPosition).Magnitude

local p = targetPosition - shooterPosition
local v = targetVelocity - shooterVelocity
local a = Vector3.zero

local timeTaken = (distance / projectileSpeed)

if gravity > 0 then
local timeTaken = projectileSpeed/gravity+math.sqrt(2*distance/gravity+projectileSpeed^2/gravity^2)
end

local goalX = targetPosition.X + v.X*timeTaken + 0.5 * a.X * timeTaken^2
local goalY = targetPosition.Y + v.Y*timeTaken + 0.5 * a.Y * timeTaken^2
local goalZ = targetPosition.Z + v.Z*timeTaken + 0.5 * a.Z * timeTaken^2

return vec3(goalX, goalY, goalZ)
end

local function addvectortocframe(cframe, vec)
local x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = cframe:GetComponents()
return cfnew(x + vec.X, y + vec.Y, z + vec.Z, R00, R01, R02, R10, R11, R12, R20, R21, R22)
end

local function addvectortocframe2(cframe, newylevel)
local x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = cframe:GetComponents()
return cfnew(x, newylevel, z, R00, R01, R02, R10, R11, R12, R20, R21, R22)
end
local oldcloneroot
function notify(text)
    local frame = GuiLibrary["CreateNotification"]("Azura Client Lite Notification", text, 5, "assets/WarningNotification.png")
    frame.Frame.Frame.ImageColor3 = Color3.fromRGB(255, 64, 64)
end
function boxnotify(text)
    if messagebox then
        messagebox(text, "Azura V4", 0)
     end
end

local clone

local oldchar
AnticheatBypassArrowDodge = GuiLibrary["ObjectsThatCanBeSaved"]["AnticheatBypassOptionsButton"]["Api"].CreateToggle({
        ["Name"] = "Arrow Dodge",
        ["Function"] = function(callback)
            if callback then
                Client = {
                    WaitFor = function(self6, remote)
                task.spawn(function()
                    oldcloneroot = entity.character.HumanoidRootPart
lplr.Character.Parent = game
clone = oldcloneroot:Clone()
clone.Parent = lplr.Character
oldcloneroot.Parent = cam
bedwars["QueryUtil"]:setQueryIgnored(oldcloneroot, true)
oldcloneroot.Transparency = 1
clone.CFrame = oldcloneroot.CFrame

lplr.Character.PrimaryPart = clone
lplr.Character.Parent = workspace
                    bedwars["ClientHandler"]:WaitFor("ProjectileLaunch"):andThen(function(p6)
                        arrowdodgeconnection = p6:Connect(function(data)
                            if oldchar and clone and GuiLibrary["ObjectsThatCanBeSaved"]["AnticheatBypassOptionsButton"]["Api"]["Enabled"] and (arrowdodgedata == nil or arrowdodgedata.launchVelocity ~= data.launchVelocity) and entity.isAlive and tostring(data.projectile):find("arrow") then
                                arrowdodgedata = data
                                local projmetatab = bedwars["ProjectileMeta"][tostring(data.projectile)]
                                local prediction = (projmetatab.predictionLifetimeSec or projmetatab.lifetimeSec or 3)
                                local gravity = (projmetatab.gravitationalAcceleration or 196.2)
                                local multigrav = gravity
                                local offsetshootpos = data.position
                                local pos = (oldchar.HumanoidRootPart.Position + vec3(0, 0.8, 0)) 
                                local calculated2 = FindLeadShot(pos, Vector3.zero, (Vector3.zero - data.launchVelocity).magnitude, offsetshootpos, Vector3.zero, multigrav) 
                                local calculated = LaunchDirection(offsetshootpos, pos, (Vector3.zero - data.launchVelocity).magnitude, gravity, false)
                                local initialvelo = calculated--(calculated - offsetshootpos).Unit * launchvelo
                                local initialvelo2 = (calculated2 - offsetshootpos).Unit * (Vector3.zero - data.launchVelocity).magnitude
                                local calculatedvelo = vec3(initialvelo2.X, (initialvelo and initialvelo.Y or initialvelo2.Y), initialvelo2.Z).Unit * (Vector3.zero - data.launchVelocity).magnitude
                                if (calculatedvelo - data.launchVelocity).magnitude <= 20 then 
                                    oldchar.HumanoidRootPart.CFrame = oldchar.HumanoidRootPart.CFrame:lerp(clone.HumanoidRootPart.CFrame, 0.6)
                                end
                            end
                        end)
                    end)
                end)
            end
            }
            end
        end,
        ["Default"] = true,
        ["HoverText"] = "Dodge arrows (tanqr moment)"
})

local function getWhitelistedBed(bed)
	for i,v in pairs(players:GetChildren()) do
		if v:GetAttribute("Team") and bed and bed:GetAttribute("Team"..v:GetAttribute("Team").."NoBreak") and bedwars["CheckWhitelisted"](v) then
			return true
		end
	end
	return false
end
local getfunctions
local OldClientGet 
local oldbreakremote
local oldbob
runcode(function()
    getfunctions = function()
		local Flamework = require(repstorage["rbxts_include"]["node_modules"]["@flamework"].core.out).Flamework
		repeat task.wait() until Flamework.isInitialized
        local KnitClient = debug.getupvalue(require(lplr.PlayerScripts.TS.knit).setup, 6)
        local Client = require(repstorage.TS.remotes).default.Client
        local InventoryUtil = require(repstorage.TS.inventory["inventory-util"]).InventoryUtil
        OldClientGet = getmetatable(Client).Get
        getmetatable(Client).Get = function(Self, remotename)
			local res = OldClientGet(Self, remotename)
			if uninjectflag then return res end
			if remotename == "DamageBlock" then
				return {
					["CallServerAsync"] = function(Self, tab)
						local block = bedwars["BlockController"]:getStore():getBlockAt(tab.blockRef.blockPosition)
						if block and block.Name == "bed" then
							if getWhitelistedBed(block) then
								return {andThen = function(self, func) 
									func("failed")
								end}
							end
						end
						return res:CallServerAsync(tab)
					end,
					["CallServer"] = function(Self, tab)
						local block = bedwars["BlockController"]:getStore():getBlockAt(tab.blockRef.blockPosition)
						if block and block.Name == "bed" then
							if getWhitelistedBed(block) then
								return {andThen = function(self, func) 
									func("failed")
								end}
							end
						end
						return res:CallServer(tab)
					end
				}
			elseif remotename == bedwars["AttackRemote"] then
				return {
					["instance"] = res["instance"],
					["SendToServer"] = function(Self, tab)
						local suc, plr = pcall(function() return players:GetPlayerFromCharacter(tab.entityInstance) end)
						if suc and plr then
							local playertype, playerattackable = bedwars["CheckPlayerType"](plr)
							if not playerattackable then 
								return nil
							end
						end
						if Reach["Enabled"] then
							local mag = (tab.validate.selfPosition.value - tab.validate.targetPosition.value).magnitude
							local newres = hashvec(tab.validate.selfPosition.value + (mag > 14.4 and (CFrame.lookAt(tab.validate.selfPosition.value, tab.validate.targetPosition.value).lookVector * 4) or Vector3.zero))
							tab.validate.selfPosition = newres
						end
						return res:SendToServer(tab)
					end
				}
			end
            return res
        end

		bedwars = {
			["AnimationUtil"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out["shared"].util["animation-util"]).AnimationUtil,
			["AngelUtil"] = require(repstorage.TS.games.bedwars.kit.kits.angel["angel-kit"]),
			["AppController"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out.client.controllers["app-controller"]).AppController,
			["AttackRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.SwordController)["attackEntity"])),
			["BatteryRemote"] = getremote(debug.getconstants(debug.getproto(debug.getproto(KnitClient.Controllers.BatteryController.KnitStart, 1), 1))),
			["BatteryEffectController"] = KnitClient.Controllers.BatteryEffectsController,
            ["BalloonController"] = KnitClient.Controllers.BalloonController,
            ["BlockController"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out).BlockEngine,
            ["BlockController2"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out.client.placement["block-placer"]).BlockPlacer,
            ["BlockEngine"] = require(lplr.PlayerScripts.TS.lib["block-engine"]["client-block-engine"]).ClientBlockEngine,
            ["BlockEngineClientEvents"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out.client["block-engine-client-events"]).BlockEngineClientEvents,
			["BlockPlacementController"] = KnitClient.Controllers.BlockPlacementController,
            ["BedwarsKits"] = require(repstorage.TS.games.bedwars.kit["bedwars-kit-shop"]).BedwarsKitShop,
            ["BlockBreaker"] = KnitClient.Controllers.BlockBreakController.blockBreaker,
            ["BowTable"] = KnitClient.Controllers.ProjectileController,
			["BowConstantsTable"] = debug.getupvalue(KnitClient.Controllers.ProjectileController.enableBeam, 5),
			["ChestController"] = KnitClient.Controllers.ChestController,
			["ClickHold"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out.client.ui.lib.util["click-hold"]).ClickHold,
            ["ClientHandler"] = Client,
			["SharedConstants"] = require(repstorage.TS["shared-constants"]),
            ["ClientHandlerDamageBlock"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out.remotes).BlockEngineRemotes.Client,
            ["ClientStoreHandler"] = require(lplr.PlayerScripts.TS.ui.store).ClientStore,
			["ClientHandlerSyncEvents"] = require(lplr.PlayerScripts.TS["client-sync-events"]).ClientSyncEvents,
            ["CombatConstant"] = require(repstorage.TS.combat["combat-constant"]).CombatConstant,
			["CombatController"] = KnitClient.Controllers.CombatController,
			["ConsumeSoulRemote"] = getremote(debug.getconstants(KnitClient.Controllers.GrimReaperController.consumeSoul)),
			["ConstantManager"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out["shared"].constant["constant-manager"]).ConstantManager,
			["CooldownController"] = KnitClient.Controllers.CooldownController,
            ["damageTable"] = KnitClient.Controllers.DamageController,
			["DinoRemote"] = getremote(debug.getconstants(debug.getproto(KnitClient.Controllers.DinoTamerController.KnitStart, 3))),
			["DaoRemote"] = getremote(debug.getconstants(debug.getprotos(KnitClient.Controllers.DaoController.onEnable)[4])),
			["DamageController"] = KnitClient.Controllers.DamageController,
			["DamageIndicator"] = KnitClient.Controllers.DamageIndicatorController.spawnDamageIndicator,
			["DamageIndicatorController"] = KnitClient.Controllers.DamageIndicatorController,
			["DetonateRavenRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.RavenController).detonateRaven)),
            ["DropItem"] = getmetatable(KnitClient.Controllers.ItemDropController).dropItemInHand,
            ["DropItemRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.ItemDropController).dropItemInHand)),
            ["EatRemote"] = getremote(debug.getconstants(debug.getproto(getmetatable(KnitClient.Controllers.ConsumeController).onEnable, 1))),
            ["EquipItemRemote"] = getremote(debug.getconstants(debug.getprotos(shared.oldequipitem or require(repstorage.TS.entity.entities["inventory-entity"]).InventoryEntity.equipItem)[3])),
			["FishermanTable"] = KnitClient.Controllers.FishermanController,
			["FovController"] = KnitClient.Controllers.FovController,
			["GameAnimationUtil"] = require(repstorage.TS.animation["animation-util"]).GameAnimationUtil,
			["GamePlayerUtil"] = require(repstorage.TS.player["player-util"]).GamePlayerUtil,
            ["getEntityTable"] = require(repstorage.TS.entity["entity-util"]).EntityUtil,
            ["getIcon"] = function(item, showinv)
                local itemmeta = bedwars["ItemTable"][item.itemType]
                if itemmeta and showinv then
                    return itemmeta.image
                end
                return ""
            end,
			["getInventory2"] = function(plr)
                local suc, result = pcall(function() 
					return InventoryUtil.getInventory(plr) 
				end)
                return (suc and result or {
                    ["items"] = {},
                    ["armor"] = {},
                    ["hand"] = nil
                })
            end,
            ["getItemMetadata"] = require(repstorage.TS.item["item-meta"]).getItemMeta,
			["GrimReaperController"] = KnitClient.Controllers.GrimReaperController,
			["GuitarHealRemote"] = getremote(debug.getconstants(KnitClient.Controllers.GuitarController.performHeal)),
			["HangGliderController"] = KnitClient.Controllers.HangGliderController,
			["HighlightController"] = KnitClient.Controllers.EntityHighlightController,
            ["ItemTable"] = debug.getupvalue(require(repstorage.TS.item["item-meta"]).getItemMeta, 1),
			["JuggernautRemote"] = getremote(debug.getconstants(debug.getprotos(debug.getprotos(KnitClient.Controllers.JuggernautController.KnitStart)[1])[4])),
			["KatanaController"] = KnitClient.Controllers.DaoController,
			["KatanaRemote"] = getremote(debug.getconstants(debug.getproto(KnitClient.Controllers.DaoController.onEnable, 4))),
            ["KnockbackTable"] = debug.getupvalue(require(repstorage.TS.damage["knockback-util"]).KnockbackUtil.calculateKnockbackVelocity, 1),
			["LobbyClientEvents"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"].lobby.out.client.events).LobbyClientEvents,
			["MapMeta"] = require(repstorage.TS.game.map["map-meta"]),
			["MissileController"] = KnitClient.Controllers.GuidedProjectileController,
			["MinerRemote"] = getremote(debug.getconstants(debug.getprotos(debug.getproto(getmetatable(KnitClient.Controllers.MinerController).onKitEnabled, 1))[2])),
			["MinerController"] = KnitClient.Controllers.MinerController,
			["ProdAnimations"] = require(repstorage.TS.animation.definitions["prod-animations"]).ProdAnimations,
            ["PickupRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.ItemDropController).checkForPickup)),
            ["PlayerUtil"] = require(repstorage.TS.player["player-util"]).GamePlayerUtil,
			["ProjectileMeta"] = require(repstorage.TS.projectile["projectile-meta"]).ProjectileMeta,
			["QueueMeta"] = require(repstorage.TS.game["queue-meta"]).QueueMeta,
			["QueueCard"] = require(lplr.PlayerScripts.TS.controllers.global.queue.ui["queue-card"]).QueueCard,
			["QueryUtil"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out).GameQueryUtil,
			["PaintRemote"] = getremote(debug.getconstants(KnitClient.Controllers.PaintShotgunController.fire)),
            ["prepareHashing"] = require(repstorage.TS["remote-hash"]["remote-hash-util"]).RemoteHashUtil.prepareHashVector3,
			["ProjectileRemote"] = getremote(debug.getconstants(debug.getupvalues(getmetatable(KnitClient.Controllers.ProjectileController)["launchProjectileWithValues"])[2])),
			["ProjectileHitRemote"] = getremote(debug.getconstants(debug.getproto(KnitClient.Controllers.ProjectileController.createLocalProjectile, 1))),
            ["RavenTable"] = KnitClient.Controllers.RavenController,
			["RespawnController"] = KnitClient.Controllers.BedwarsRespawnController,
			["RespawnTimer"] = require(lplr.PlayerScripts.TS.controllers.games.bedwars.respawn.ui["respawn-timer"]).RespawnTimerWrapper,
			["ResetRemote"] = getremote(debug.getconstants(debug.getproto(KnitClient.Controllers.ResetController.createBindable, 1))),
			["Roact"] = require(repstorage["rbxts_include"]["node_modules"]["roact"].src),
			["RuntimeLib"] = require(repstorage["rbxts_include"].RuntimeLib),
            ["Shop"] = require(repstorage.TS.games.bedwars.shop["bedwars-shop"]).BedwarsShop,
			["ShopItems"] = debug.getupvalue(require(repstorage.TS.games.bedwars.shop["bedwars-shop"]).BedwarsShop.getShopItem, 2),
            ["ShopRight"] = require(lplr.PlayerScripts.TS.controllers.games.bedwars.shop.ui["item-shop"]["shop-left"]["shop-left"]).BedwarsItemShopLeft,
			["SpawnRavenRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.RavenController).spawnRaven)),
            ["SoundManager"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out).SoundManager,
			["SoundList"] = require(repstorage.TS.sound["game-sound"]).GameSound,
            ["sprintTable"] = KnitClient.Controllers.SprintController,
			["StopwatchController"] = KnitClient.Controllers.StopwatchController,
            ["SwingSword"] = getmetatable(KnitClient.Controllers.SwordController).swingSwordAtMouse,
            ["SwingSwordRegion"] = getmetatable(KnitClient.Controllers.SwordController).swingSwordInRegion,
            ["SwordController"] = KnitClient.Controllers.SwordController,
            ["TreeRemote"] = getremote(debug.getconstants(debug.getprotos(debug.getprotos(KnitClient.Controllers.BigmanController.KnitStart)[2])[1])),
			["TrinityRemote"] = getremote(debug.getconstants(debug.getproto(getmetatable(KnitClient.Controllers.AngelController).onKitEnabled, 1))),
            ["VictoryScreen"] = require(lplr.PlayerScripts.TS.controllers["game"].match.ui["victory-section"]).VictorySection,
            ["ViewmodelController"] = KnitClient.Controllers.ViewmodelController,
			["VehicleController"] = KnitClient.Controllers.VehicleController,
			["WeldTable"] = require(repstorage.TS.util["weld-util"]).WeldUtil,
        }
	end
end)
local lplr = game:GetService("Players").LocalPlayer
local queueType = "bedwars_test"
local currentinventory = {
	["inventory"] = {
		["items"] = {},
		["armor"] = {},
		["hand"] = nil
	}
}

local AutoWin = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
    ["Name"] = "AnticheatBFly",
    ["Function"] = function(v)
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

local Godmode = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
    ["Name"] = "Godmode",
    ["Function"] = function(callback) 
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
})

local EmeraldArmour = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
    ["Name"] = "Get Emerald Pack",
    ["Function"] = function(callback) 
        if callback then
        local lplr = game.Players.LocalPlayer

game.ReplicatedStorage.Items.emerald_sword:Clone().Parent = game.ReplicatedStorage.Inventories[lplr.Name]
game.ReplicatedStorage.Items.emerald_helmet:Clone().Parent = game.ReplicatedStorage.Inventories[lplr.Name]
game.ReplicatedStorage.Items.emerald_boots:Clone().Parent = game.ReplicatedStorage.Inventories[lplr.Name]
game.ReplicatedStorage.Items.emerald_chestplate:Clone().Parent = game.ReplicatedStorage.Inventories[lplr.Name]
        end
    end,

})

repeat task.wait() until game:IsLoaded()
repeat task.wait() until shared.GuiLibrary
local GuiLibrary = shared.GuiLibrary
local ScriptSettings = {}
local UIS = game:GetService("UserInputService")
local COB = function(tab, argstable) 
    return GuiLibrary["ObjectsThatCanBeSaved"][tab.."Window"]["Api"].CreateOptionsButton(argstable)
end


local CustomAntivoid = COB("World", {
	["Name"] = "PurpleAntivoid",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.CustomAntivoid = true
				local part = Instance.new("Part")
				part.Name = "AVOID_PART"
				part.Anchored = true
				part.Color = Color3.fromRGB(107,50,124)
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
})

local void = GuiLibrary["ObjectsThatCanBeSaved"]["WorldWindow"]["Api"].CreateOptionsButton({
    ["Name"] = "Void",
    ["Function"] = function(v)
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

local RagdollDisabler = COB("Utility", {
	["Name"]  = "75% Disabler",
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
				ScriptSettings.SlowDisabler = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Ragdolls to bypass ac"
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

local AnticheatDisabler = COB("Blatant", {
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
    HoverText = "Risky Inf Jump"
})

chatmove = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
    ["Name"] = "Chat mover",
    ["Function"] = function(callback)
        if callback then
			repeat
				task.wait()				
local StarterGui = game:GetService("StarterGui")
repeat wait() until StarterGui:GetCore("ChatWindowSize") ~= nil
local chatWindowSize = StarterGui:GetCore("ChatWindowSize")
StarterGui:SetCore("ChatWindowPosition", UDim2.new(0, 0, (1 - chatWindowSize.Y.Scale), 0))
			until chatmove["Enabled"] == false
		else
			local StarterGui = game:GetService("StarterGui")
repeat wait() until StarterGui:GetCore("ChatWindowSize") ~= nil
local chatWindowSize = StarterGui:GetCore("ChatWindowSize")
StarterGui:SetCore("ChatWindowPosition", UDim2.new(0, 0, 0))
            end
        end
    })

