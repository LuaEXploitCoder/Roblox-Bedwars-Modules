repeat wait() until game:IsLoaded()

loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/CustomModules/6872274481.vape", true))()
--loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/b1b1ae0d43238a8a7334063160decdf613995e4f/AnyGame.vape", true))()
local VERSION = "Private/Custom VapeV4ForRoblox"


local GuiLibrary = shared.GuiLibrary
local players = game:GetService("Players")
local lplr = players.LocalPlayer
local workspace = game:GetService("Workspace")
local lighting = game:GetService("Lighting")
local cam = workspace.CurrentCamera
local targetinfo = shared.VapeTargetInfo
local collectionservice = game:GetService("CollectionService")
local uis = game:GetService("UserInputService")
local mouse = lplr:GetMouse()
local robloxfriends = {}
local bedwars = {}
local getfunctions
local origC0 = nil
local matchState = 0
local kit = ""
local antivoidypos = 0
local scaffoldypos = 0
local requestfunc = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or getgenv().request or request
local queueteleport = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport
local getasset = getsynasset or getcustomasset
local movementControls = require(game:GetService("Players").LocalPlayer.PlayerScripts.PlayerModule):GetControls()

local vertextsize = game:GetService("TextService"):GetTextSize(GuiLibrary["MainGui"].ScaledGui.ClickGui.Version.Text.." "..VERSION, 25, Enum.Font.SourceSans, Vector2.new(99999, 99999))
GuiLibrary["MainGui"].ScaledGui.ClickGui.Version.Text = GuiLibrary["MainGui"].ScaledGui.ClickGui.Version.Text.." "..VERSION
GuiLibrary["MainGui"].ScaledGui.ClickGui.Version.Position = UDim2.new(1, -(vertextsize.X) - 20, 1, -25)
GuiLibrary["MainGui"].ScaledGui.ClickGui.Version.Version.Text = GuiLibrary["MainGui"].ScaledGui.ClickGui.Version.Version.Text.." "..VERSION

local HeartbeatTable = {}

local function BindToHeartbeat(name, func)
    if HeartbeatTable[name] == nil then
        HeartbeatTable[name] = game:GetService("RunService").Heartbeat:connect(func)
    end
end

local function UnbindFromHeartbeat(name)
    if HeartbeatTable[name] then
        HeartbeatTable[name]:Disconnect()
        HeartbeatTable[name] = nil
    end
end

local RenderStepTable = {}
local function BindToRenderStep(name, func)
	if RenderStepTable[name] == nil then
		RenderStepTable[name] = game:GetService("RunService").RenderStepped:connect(func)
	end
end
local function UnbindFromRenderStep(name)
	if RenderStepTable[name] then
		RenderStepTable[name]:Disconnect()
		RenderStepTable[name] = nil
	end
end

local function addvectortocframe(cframe, vec)
	local x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = cframe:GetComponents()
	return CFrame.new(x + vec.X, y + vec.Y, z + vec.Z, R00, R01, R02, R10, R11, R12, R20, R21, R22)
end

local SteppedTable = {}
local function BindToStepped(name, func)
	if SteppedTable[name] == nil then
		SteppedTable[name] = game:GetService("RunService").Stepped:connect(func)
	end
end
local function UnbindFromStepped(name)
	if SteppedTable[name] then
		SteppedTable[name]:Disconnect()
		SteppedTable[name] = nil
	end
end

local function nilfunc()

end

--[[ local x = require(game:GetService("ReplicatedStorage").TS.games.bedwars.kit.kits.dasher["dasher-kit"]).DasherKit
x["DASH_COOLDOWN"] = 0
x["CHARGE_TIME"] = 0
x["CHARGE_TIME_BEFORE_CHARGING_STATE"] = 0
x["TOTAL_CHARGE_TIME"] = 0 ]]

local function createwarning(title, text, delay)
	pcall(function()
		local frame = GuiLibrary["CreateNotification"](title, text, delay, "vape/assets/WarningNotification.png")
		frame.Frame.BackgroundColor3 = Color3.fromRGB(236, 129, 44)
		frame.Frame.Frame.BackgroundColor3 = Color3.fromRGB(236, 129, 44)
	end)
end


local function createnotification(title, text, delay)
	pcall(function()
		local frame = GuiLibrary["CreateNotification"](title, text, delay, "vape/assets/InfoNotification.png")
		frame.Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		frame.Frame.Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	end)
end

local function getcustomassetfunc(path)
	if not isfile(path) then
		spawn(function()
			local textlabel = Instance.new("TextLabel")
			textlabel.Size = UDim2.new(1, 0, 0, 36)
			textlabel.Text = ""
			textlabel.BackgroundTransparency = 1
			textlabel.TextStrokeTransparency = 0
			textlabel.TextSize = 30
			textlabel.Font = Enum.Font.SourceSans
			textlabel.TextColor3 = Color3.new(1, 1, 1)
			textlabel.Position = UDim2.new(0, 0, 0, -36)
			textlabel.Parent = GuiLibrary["MainGui"]
			repeat wait() until isfile(path)
			textlabel:Remove()
		end)
		local req = requestfunc({
			Url = "https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/"..path:gsub("vape/assets", "assets"),
			Method = "GET"
		})
		writefile(path, req.Body)
	end
	return getasset(path) 
end

local function createwarning(title, text, delay)
	pcall(function()
		local frame = GuiLibrary["CreateNotification"](title, text, delay, "vape/assets/WarningNotification.png")
		frame.Frame.BackgroundColor3 = Color3.fromRGB(236, 129, 44)
		frame.Frame.Frame.BackgroundColor3 = Color3.fromRGB(236, 129, 44)
	end)
end

local function getItem(itemName)
	for i5, v5 in pairs(bedwars["getInventory"](lplr)["items"]) do
		if v5["itemType"] == itemName then
			return v5, i5
		end
	end
	return nil
end

local function getHotbarSlot(itemName)
	for i5, v5 in pairs(bedwars["ClientStoreHandler"]:getState().Inventory.observedInventory.hotbar) do
		if v5["item"] and v5["item"]["itemType"] == itemName then
			return i5 - 1
		end
	end
	return nil
end

local function getSword()
	for i5, v5 in pairs(bedwars["getInventory"](lplr)["items"]) do
		if v5["itemType"]:find("sword") or v5["itemType"]:find("blade") then
			return v5, i5
		end
	end
	return nil
end

local function getBaguette()
	for i5, v5 in pairs(bedwars["getInventory"](lplr)["items"]) do
		if v5["itemType"]:find("baguette") then
			return v5
		end
	end
	return nil
end

local function getwool()
	for i5, v5 in pairs(bedwars["getInventory"](lplr)["items"]) do
		if v5["itemType"]:match("wool") then
			return v5["itemType"], v5["amount"], v5["tool"]
		end
	end	
	return nil
end

local function getmineralamount(arg)
	for i5, v5 in pairs(bedwars["getInventory"](lplr)["items"]) do
		if v5["itemType"]:match(arg) then
			return v5["amount"]
		end
	end	
	return nil
end


local function getBed(color)
	for i,v in pairs(bedwars["BedTable"]) do
		if v and v:FindFirstChild("Covers") and v.Covers.BrickColor == color then
			return v
		end
	end
	return nil
end

local function getArmor()
	for i5, v5 in pairs(bedwars["getInventory"](lplr)["items"]) do
		if v5["itemType"]:match("helmet") or v5["itemType"]:match("chestplate") or v5["itemType"]:match("boots") then
			return v5["itemType"]
		end
	end	
	return nil
end

local function teamsAreAlive()
	local alive = false
	for i,v in pairs(game.Teams:GetChildren()) do
		if v.Name ~= "Spectators" and v.Name ~= "Neutral" and v ~= lplr.Team and #v:GetPlayers() > 0 then
			alive = true
		end
	end
	return alive
end

local function func1(cframe, pos2)
	local x, y, z, RR00, RR01, RR02, RR10, RR11, RR12, RR20, RR21, RR22 = cframe:GetComponents()
	local xx2, yy2, zz2 = pos2.X, pos2.Y, pos2.Z
	return CFrame.new(x + xx2, y + yy2, z + zz2, RR00, RR01, RR02, RR10, RR11, RR12, RR20, RR21, RR22)
end

local function scanforbeds()
	local blocktab = game.Workspace.Map.Blocks:GetChildren()
	bedwars["BedTable"] = {}
	for i = 1, #blocktab do
		local obj = blocktab[i]
		if obj.Name == "bed" then
			bedwars["BedTable"][#bedwars["BedTable"] + 1] = obj
			if antivoidypos == 0 then
				antivoidypos = obj.Position.Y
			end
		end
	end  
end

local function randomString()
	local randomlength = math.random(10,100)
	local array = {}

	for i = 1, randomlength do
		array[i] = string.char(math.random(32, 126))
	end

	return table.concat(array)
end

local function getremote(tab)
    for i,v in pairs(tab) do
        if v == "Client" then
            return tab[i + 1]
        end
    end
    return ""
end

local newupdate = game.Players.LocalPlayer.PlayerScripts.TS:FindFirstChild("ui") and true or false
local Flamework = require(game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"]["@flamework"].core.out).Flamework
repeat task.wait() until Flamework.isInitialized
local KnitClient = debug.getupvalue(require(lplr.PlayerScripts.TS.knit).setup, 6)
local InventoryUtil = require(game:GetService("ReplicatedStorage").TS.inventory["inventory-util"]).InventoryUtil

bedwars = {
	--["AppController"] = require(game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].client.controllers["app-controller"]).AppController,
	["BalloonController"] = KnitClient.Controllers.BalloonController,
	["BlockController"] = require(game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out).BlockEngine,
	["BlockController2"] = require(game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out.client.placement["block-placer"]).BlockPlacer,
	["BlockTryController"] = getrenv()._G[game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out.client.placement["block-placer"]],
	["BlockEngine"] = require(lplr.PlayerScripts.TS.lib["block-engine"]["client-block-engine"]).ClientBlockEngine,
	["BlockEngineClientEvents"] = require(game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out.client["block-engine-client-events"]).BlockEngineClientEvents,
	["BedwarsKits"] = require(game:GetService("ReplicatedStorage").TS.games.bedwars.kit["bedwars-kit-shop"]).BedwarsKitShop,
	["BlockBreaker"] = KnitClient.Controllers.BlockBreakController.blockBreaker,
	["BowTable"] = KnitClient.Controllers.ProjectileController,
	["ShootProjectile"] = getremote(debug.getconstants(debug.getupvalues(KnitClient.Controllers.ProjectileController["launchProjectileWithValues"])[2])),
	["ChestController"] = KnitClient.Controllers.ChestController,
	--["ClickHold"] = require(game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].client.ui.lib.util["click-hold"]).ClickHold,
	["ClientHandler"] = Client,
	["ClientHandlerDamageBlock"] = require(game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out.remotes).BlockEngineRemotes.Client,
	["ClientStoreHandler"] = (newupdate and require(game.Players.LocalPlayer.PlayerScripts.TS.ui.store).ClientStore or require(lplr.PlayerScripts.TS.rodux.rodux).ClientStore),
	["ClientHandlerSyncEvents"] = require(lplr.PlayerScripts.TS["client-sync-events"]).ClientSyncEvents,
	["CombatConstant"] = require(game:GetService("ReplicatedStorage").TS.combat["combat-constant"]).CombatConstant,
	["CombatController"] = KnitClient.Controllers.CombatController,
	["ConsumeSoulRemote"] = getremote(debug.getconstants(KnitClient.Controllers.GrimReaperController.consumeSoul)),
	--["ConstantManager"] = require(game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"]["@easy-games"]["game-util"].out.constant["constant-manager"]).ConstantManager,
	["CooldownController"] = KnitClient.Controllers.CooldownController,
	["damageTable"] = KnitClient.Controllers.DamageController,
	["DetonateRavenRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.RavenController).detonateRaven)),
	["DropItem"] = getmetatable(KnitClient.Controllers.ItemDropController).dropItemInHand,
	["DropItemRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.ItemDropController).dropItemInHand)),
	["EatRemote"] = getremote(debug.getconstants(debug.getproto(getmetatable(KnitClient.Controllers.ConsumeController).onEnable, 1))),
	["EquipItemRemote"] = getremote(debug.getconstants(debug.getprotos(shared.oldequipitem or require(game:GetService("ReplicatedStorage").TS.entity.entities["inventory-entity"]).InventoryEntity.equipItem)[3])),
	["FishermanTable"] = KnitClient.Controllers.FishermanController,
	["GameAnimationUtil"] = require(game:GetService("ReplicatedStorage").TS.animation["animation-util"]).GameAnimationUtil,
	["getEntityTable"] = require(game:GetService("ReplicatedStorage").TS.entity["entity-util"]).EntityUtil,
	["getIcon"] = function(item, showinv)
		local itemmeta = bedwars["getItemMetadata"](item["itemType"])
		if itemmeta and showinv then
			return itemmeta.image
		end
		return ""
	end,
	["getInventory"] = function(plr)
		local suc, result = pcall(function() return InventoryUtil.getInventory(plr) end)
		return (suc and result or {
			["items"] = {},
			["armor"] = {},
			["hand"] = nil
		})
	end,
	["getItemMetadata"] = require(game:GetService("ReplicatedStorage").TS.item["item-meta"]).getItemMeta,
	["GrimReaperController"] = KnitClient.Controllers.GrimReaperController,
	["ItemTable"] = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.item["item-meta"]).getItemMeta, 1),
	["KnockbackTable"] = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.damage["knockback-util"]).KnockbackUtil.calculateKnockbackVelocity, 1),
	["KnockbackTable2"] = require(game:GetService("ReplicatedStorage").TS.damage["knockback-util"]).KnockbackUtil,
	--["LobbyClientEvents"] = (newupdate and require(game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"]["@easy-games"].lobby.client.events).LobbyClientEvents),
	["MissileController"] = KnitClient.Controllers.GuidedProjectileController,
	["PickupRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.ItemDropController).checkForPickup)),
	["PlayerUtil"] = require(game:GetService("ReplicatedStorage").TS.player["player-util"]).GamePlayerUtil,
	["prepareHashing"] = require(game:GetService("ReplicatedStorage").TS["remote-hash"]["remote-hash-util"]).RemoteHashUtil.prepareHashVector3,
	["RavenTable"] = KnitClient.Controllers.RavenController,
	["ShieldController"] = KnitClient.Controllers.InfernalShieldController,
	["RuntimeLib"] = require(game:GetService("ReplicatedStorage")["rbxts_include"].RuntimeLib),
	--["ShieldRemote"] = getremote(debug.getconstants(KnitClient.Controllers.InfernalShield)),
	["Shop"] = require(game:GetService("ReplicatedStorage").TS.games.bedwars.shop["bedwars-shop"]).BedwarsShop,
	["ShopItems"] = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.games.bedwars.shop["bedwars-shop"]).BedwarsShop.getShopItem, 2),
	--["ShopRight"] = require(lplr.PlayerScripts.TS.controllers.games.bedwars.shop.ui["item-shop"].right["shop-right"]).BedwarsItemShopRight,
	["SpawnRavenRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.RavenController).spawnRaven)),
	--["SoundManager"] = (newupdate and require(game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"]["@easy-games"]["game-core"]).SoundManager or require(game:GetService("ReplicatedStorage").TS.sound["sound-manager"]).SoundManager),
	["SoundList"] = require(game:GetService("ReplicatedStorage").TS.sound["game-sound"]).GameSound,
	["sprintTable"] = KnitClient.Controllers.SprintController,
	["StopwatchController"] = KnitClient.Controllers.StopwatchController,
	["SwingSword"] = getmetatable(KnitClient.Controllers.SwordController).swingSwordAtMouse,
	["SwingSwordRegion"] = getmetatable(KnitClient.Controllers.SwordController).swingSwordInRegion,
	["SwordController"] = KnitClient.Controllers.SwordController,
	["TreeRemote"] = getremote(debug.getconstants(debug.getprotos(debug.getprotos(KnitClient.Controllers.BigmanController.KnitStart)[2])[1])),
	--["TripleShotMeta"] = require(game:GetService("ReplicatedStorage").TS.kit["triple-shot"]["triple-shot"]).TripleShot,
	["VictoryScreen"] = require(lplr.PlayerScripts.TS.controllers["game"].match.ui["victory-section"]).VictorySection,
	["ViewmodelController"] = KnitClient.Controllers.ViewmodelController,
	["WeldTable"] = require(game:GetService("ReplicatedStorage").TS.util["weld-util"]).WeldUtil,
	["GameSound"] = require(game:GetService("ReplicatedStorage").TS.sound["game-sound"]).GameSound,
    ["Assets"] = game:GetService("ReplicatedStorage"):WaitForChild("Assets"),
	["Sound"] = require(game:GetService("ReplicatedStorage").TS.sound["game-sound"]),
	["CannonBlockHandler"] = require(game:GetService("ReplicatedStorage").TS["shared-modules"].game["block-engine"].handlers["cannon-block-handler"]).CannonBlockHandler,
	["KatanaRemote"] = getremote(debug.getconstants(debug.getprotos(KnitClient.Controllers.DaoController.onEnable)[4]))
}

local function getkatana()
	if getItem("emerald_dao") then
		return getItem("emerald_dao").itemType
	elseif getItem("diamond_dao") then
			return getItem("diamond_dao").itemType
	elseif getItem("iron_dao") then
		return getItem("iron_dao").itemType
	elseif getItem("stone_dao") then
		return getItem("stone_dao").itemType
	elseif getItem("wood_dao") then
		return getItem("wood_dao").itemType
	end
end

local function runcode(func)
	func()
end

local function makerandom(min, max)
	return Random.new().NextNumber(Random.new(), min, max)
end

local function getblock(pos)
	return bedwars["BlockEngine2"]:getStore():getBlockAt(bedwars["BlockEngine2"]:getBlockPosition(pos))
end

local function gotopos(posyes1)
	lplr.Character.HumanoidRootPart.CFrame = posyes1
end

local function friendCheck(plr, recolor)
	return (recolor and GuiLibrary["ObjectsThatCanBeSaved"]["Recolor visualsToggle"]["Api"]["Enabled"] or (not recolor)) and GuiLibrary["ObjectsThatCanBeSaved"]["Use FriendsToggle"]["Api"]["Enabled"] and table.find(GuiLibrary["ObjectsThatCanBeSaved"]["FriendsListTextList"]["Api"]["ObjectList"], plr.Name)
end

local function getPlayerColor(plr)
	return (friendCheck(plr, true) and Color3.fromHSV(GuiLibrary["ObjectsThatCanBeSaved"]["Friends ColorSliderColor"]["Api"]["Value"], 1, 1) or tostring(plr.TeamColor) ~= "White" and plr.TeamColor.Color)
end

shared.vapeteamcheck = function(plr)
	return (GuiLibrary["ObjectsThatCanBeSaved"]["Teams by colorToggle"]["Api"]["Enabled"] and bedwars["PlayerUtil"].getGamePlayer(lplr):getTeamId() ~= bedwars["PlayerUtil"].getGamePlayer(plr):getTeamId() or GuiLibrary["ObjectsThatCanBeSaved"]["Teams by colorToggle"]["Api"]["Enabled"] == false)
end

local function targetCheck(plr, check)
	return (check and plr.Character.Humanoid.Health > 0 and plr.Character:FindFirstChild("ForceField") == nil or check == false)
end

local function isAlive(plr)
	if plr then
		return plr and plr.Character and plr.Character.Parent ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Head") and plr.Character:FindFirstChild("Humanoid")
	end
	return lplr and lplr.Character and lplr.Character.Parent ~= nil and lplr.Character:FindFirstChild("HumanoidRootPart") and lplr.Character:FindFirstChild("Head") and lplr.Character:FindFirstChild("Humanoid")
end

local localentity = bedwars["getEntityTable"]["getLocalPlayerEntity"]()

local function switchItem(tool)
	lplr.Character.HandInvItem.Value = tool
	bedwars["ClientHandler"]:Get(bedwars["changeItem"]):CallServerAsync({
		hand = tool
	})
end

local function switchToAndUseTool(block, legit)
	local tool = nil
	local toolnum = 0
	local blockmeta = bedwars["getItemMetadata"](block.Name)
	local blockType = ""
	if blockmeta["block"] and blockmeta["block"]["breakType"] then
		blockType = blockmeta["block"]["breakType"]
	end
	for i,v in pairs(bedwars["getInventory"](lplr)["items"]) do
		local meta = bedwars["getItemMetadata"](v["itemType"])
		if meta["breakBlock"] and meta["breakBlock"][blockType] then
			tool = v
			break
		end
	end
	if tool and (isAlive() and lplr.Character:FindFirstChild("HandInvItem") and lplr.Character.HandInvItem.Value ~= tool["tool"]) then
		if legit then
			bedwars["ClientStoreHandler"]:dispatch({
				type = "InventorySelectHotbarSlot", 
				slot = getHotbarSlot(tool["itemType"])
			})
		end
		switchItem(tool["tool"])
	end
end

local function getlastblock(pos, normal)
	local lastfound = nil
	for i = 1, 20 do
		local extrablock = getblock(pos + (Vector3.FromNormalId(normal) * (i * 3)))
		if extrablock and extrablock.Parent ~= nil then
			lastfound = extrablock
		else
			break
		end
	end
	return lastfound
end

local healthbarblocktable = {
	["blockHealth"] = -1,
	["breakingBlockPosition"] = Vector3.new(0, 0, 0)
}
bedwars["breakBlock"] = function(pos, effects, normal)
	local block = (getlastblock(pos, Enum.NormalId[normal]) or getblock(pos))
	local olditem = lplr.Character.HandInvItem.Value
	local blockhealthbarpos = {blockPosition = Vector3.new(0, 0, 0)}
	local blockdmg = 0
	if block and block.Parent ~= nil then
		switchToAndUseTool(block)
		blockhealthbarpos = {
			blockPosition = bedwars["BlockEngine2"]:getBlockPosition(block.Position)
		}
		if healthbarblocktable.blockHealth == -1 or blockhealthbarpos.blockPosition ~= healthbarblocktable.breakingBlockPosition then
			healthbarblocktable.blockHealth = block:GetAttribute("Health")
			healthbarblocktable.breakingBlockPosition = blockhealthbarpos.blockPosition
		end
		blockdmg = bedwars["BlockEngine2"]:calculateBlockDamage(lplr, blockhealthbarpos)
		healthbarblocktable.blockHealth = healthbarblocktable.blockHealth - blockdmg
		if healthbarblocktable.blockHealth < 0 then
			healthbarblocktable.blockHealth = 0
		end
		if effects then
			bedwars["BlockHealthbar"]["updateHealthbar"](bedwars["BlockHealthbar2"], blockhealthbarpos, healthbarblocktable.blockHealth, block:GetAttribute("MaxHealth"), blockdmg)
		end
		bedwars["ClientHandlerDamageBlock"]:Get("DamageBlock"):CallServerAsync({
			blockRef = blockhealthbarpos, 
			hitPosition = block.Position, 
			hitNormal = Vector3.FromNormalId(Enum.NormalId[normal])
		}):andThen(function(p9)
			if olditem then
				switchToAndUseTool(olditem)
			end
		end)
		if effects then
			if healthbarblocktable.blockHealth <= 0 then
				bedwars["BlockHealthbar2"].breakEffect:playBreak(block.Name, blockhealthbarpos.blockPosition, lplr)
				bedwars["BlockHealthbar2"].healthbarMaid:DoCleaning()
			else
				bedwars["BlockHealthbar2"].breakEffect:playHit(block.Name, blockhealthbarpos.blockPosition, lplr)
			end
		end
	end
	wait(0.3)
end	

local function getEquipped()
	local type = ""
	local obj = (isAlive() and lplr.Character:FindFirstChild("HandInvItem") and lplr.Character.HandInvItem.Value or nil)
	if obj then
		if obj.Name:find("sword") or obj.Name:find("blade") or obj.Name:find("baguette") then
			type = "sword"
		end
		if obj.Name:find("wool") then
			type = "block"
		end
		if obj.Name:find("bow") then
			type = "bow"
		end
	end
    return {["Object"] = obj, ["Type"] = type}
end

local function nakedcheck(plr)
	local inventory = bedwars["getInventory"](plr)
	return inventory["armor"][4] ~= nil and inventory["armor"][5] ~= nil and inventory["armor"][6] ~= nil
end

local function isPlayerTargetable(plr, target, friend, team)
    return plr ~= lplr and plr and isAlive(plr) and targetCheck(plr, target) and ((team and plr.Team == lplr.Team) or (team == nil and shared.vapeteamcheck(plr)))
end

local function vischeck(pos, pos2, ignore)
	local vistab = cam:GetPartsObscuringTarget({pos, pos2}, ignore)
	for i,v in pairs(vistab) do
		print(i,v:GetFullName())
	end
	return not unpack(vistab)
end

local function isJumping()
	if lplr.Character.Humanoid.Jump then
		return true
	else
		return false
	end
end

local function GetAllNearestHumanoidToPosition(distance, amount)
	local returnedplayer = {}
	local currentamount = 0
    if isAlive() then
        for i, v in pairs(players:GetChildren()) do
            if isPlayerTargetable(v, true, true) and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Head") and currentamount < amount then
                local mag = (lplr.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude
                if mag <= distance then
                    table.insert(returnedplayer, v)
					currentamount = currentamount + 1
                end
            end
        end
	end
	return returnedplayer
end

local function GetAllNearestHumanoidToPosition2(distance, amount, teamcheck)
	local returnedplayer = {}
	local currentamount = 0
    if isAlive() then
        for i, v in pairs(players:GetChildren()) do
            if (teamcheck and (v ~= lplr and v.Character) or isPlayerTargetable(v, true, true)) and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Head") and currentamount < amount then
                local mag = (lplr.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude
                if mag <= distance then
                    table.insert(returnedplayer, v)
					currentamount = currentamount + 1
                end
            end
        end
	end
	return returnedplayer
end


local function GetNearestHumanoidToPosition(distance)
	local closest, returnedplayer = distance, nil
    if isAlive() then
        for i, v in pairs(players:GetChildren()) do
            if isPlayerTargetable(v, true, false) and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Head") then
                local mag = (lplr.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude
                if mag <= closest then
                    closest = mag
                    returnedplayer = v
                end
            end
        end
	end
	return returnedplayer
end

local function blockPos(pos)
	for i,v in pairs(bedwars["CannonBlockHandler"]:getContainedPositions(pos)) do
		return v
	end
end

local function GetNearestHumanoidToMouse(distance, checkvis)
    local closest, returnedplayer = distance, nil
    if isAlive() then
        for i, v in pairs(players:GetChildren()) do
            if isPlayerTargetable(v, true, true) and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Head") and (checkvis == false or checkvis and (vischeck(v.Character, "Head") or vischeck(v.Character, "HumanoidRootPart"))) then
                local vec, vis = cam:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
                if vis then
                    local mag = (uis:GetMouseLocation() - Vector2.new(vec.X, vec.Y)).magnitude
                    if mag <= closest then
                        closest = mag
                        returnedplayer = v
                    end
                end
            end
        end
    end
    return returnedplayer
end

function getClosestOutOfTwo(closestTo, one, two)
	local mag1 = (closestTo - one).Magnitude
	local mag2 = (closestTo - two).Magnitude
	if mag1 < 0 then mag1 = -mag1 end
	if mag2 < 0 then mag2 = -mag2 end
	if mag2 > mag1 then
		return one
	else
		return two
	end
end

function getAllBeds()
	local t={}
	for i,v in pairs(game.Workspace.Map.Blocks:GetChildren()) do
		if v.Name == "bed" and v:FindFirstChild("Covers").BrickColor ~= lplr.TeamColor then 
			table.insert(t, v)
		end
	end
	return t
end

local alarmzones = game:GetService("Workspace"):FindFirstChild("BedAlarmZones")
if alarmzones then
    for i,v in pairs(alarmzones:GetChildren()) do
		v:Remove()
	end
end


local function preparetp()
	for i = 1,2 do
		lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-27)
		wait(0.2)
	end
	wait(0.6)
	gotopos(lplr.Character.HumanoidRootPart.CFrame * CFrame.new(10,0,0))
	wait(0.1)
	gotopos(CFrame.new(0,0,0))
	wait(2.8)
end

local function preparetp1()
	for i = 1,2 do
		lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-15)
		wait(0.2)
	end
end
runcode(function()
	local oldsounds = bedwars["GameSound"]
	local newsounds = bedwars["GameSound"]
	newsounds.DAMAGE_1 = "rbxassetid://6361963422"
	newsounds.DAMAGE = "rbxassetid://6361963422"
	newsounds.DAMAGE_2 = "rbxassetid://6361963422"
	newsounds.DAMAGE_3 = "rbxassetid://6361963422"
	newsounds.KILL = "rbxassetid://1053296915"
	newsounds.STATIC_HIT = "rbxassetid://6361963422"
	newsounds.UI_CLICK = "rbxassetid://535716488"
	newsounds.WOOL_BREAK = "rbxassetid://6496157434"
	local sounds = {["Enabled"] = false}
	sounds = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
		["Name"] = "Sounds",
		["HoverText"] = "Redos some sounds.",
		["Function"] = function(callback)
			if callback then
				bedwars["Sound"].GameSound = newsounds
			else
				bedwars["Sound"].GameSound = oldsounds
			end
		end,
	})
end)
local function GetURL(scripturl)
	if shared.VapeDeveloper then
		return readfile("vape/"..scripturl)
	else
		return game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/"..scripturl, true)
	end
end
local entity = loadstring(GetURL("Libraries/entityHandler.lua"))()
runcode(function()
	local jumpdelay = .015
	local toggled = false
	local infinitejump = {["Enabled"] = false}
	infinitejump = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
		["Name"] = "InfiniteJump",
		["hovertext"] = "jumps inf times",
		["Function"] = function(callback)
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
	})
	jumpdelay = infinitejump.CreateSlider({
		["Name"] = "Delay between jumps",
		["Min"] = 0,
		["Max"] = 100,
		["Function"] = function(val)
			jumpdelay = val / 10
		end,
	})
end)
runcode(function()
	local skyColor
	local clone
	local avatar = false
	local femboyconnection
	local lightingsettings = {}
	local lightingconnection
	local lightingchanged = false
	local FemboyMode = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
		["Name"] = "FemboyMode",
		["HoverText"] = "Makes the world look more aesthetic",
		["Function"] = function(callback)
			if callback then
				lightingsettings["Brightness"] = lighting.Brightness
				lightingsettings["ClockTime"] = lighting.ClockTime
				lightingsettings["FogEnd"] = lighting.FogEnd
				lightingsettings["GlobalShadows"] = lighting.GlobalShadows
				lightingsettings["OutdoorAmbient"] = lighting.OutdoorAmbient
				lightingchanged = false
				lighting.Brightness = 2
				lighting.ClockTime = 14
				lighting.FogEnd = 100000
				lighting.GlobalShadows = false
				lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
				lightingchanged = true
				lightingconnection = lighting.Changed:connect(function()
					if not lightingchanged then
						lightingsettings["Brightness"] = lighting.Brightness
						lightingsettings["ClockTime"] = lighting.ClockTime
						lightingsettings["FogEnd"] = lighting.FogEnd
						lightingsettings["GlobalShadows"] = lighting.GlobalShadows
						lightingsettings["OutdoorAmbient"] = lighting.OutdoorAmbient
						lightingchanged = true
						lighting.Brightness = 2
						lighting.ClockTime = 14
						lighting.FogEnd = 100000
						lighting.GlobalShadows = false
						lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
						lightingchanged = false
					end
				end)
				spawn(function()
					for i,v in pairs(game:GetService("Lighting"):GetChildren()) do
						if v:IsA("Atmosphere") or v:IsA("Sky") or v:IsA("PostEffect") then
							v:Remove()
						end
					end
					local sky = Instance.new("Sky")
					sky.StarCount = 5000
					sky.SkyboxUp = "rbxassetid://8139676647"
					sky.SkyboxLf = "rbxassetid://8139676988"
					sky.SkyboxFt = "rbxassetid://8139677111"
					sky.SkyboxBk = "rbxassetid://8139677359"
					sky.SkyboxDn = "rbxassetid://8139677253"
					sky.SkyboxRt = "rbxassetid://8139676842"
					sky.SunTextureId = "rbxassetid://6196665106"
					sky.SunAngularSize = 11
					sky.MoonTextureId = "rbxassetid://8139665943"
					sky.MoonAngularSize = 30
					sky.Parent = game:GetService("Lighting")
					local sunray = Instance.new("SunRaysEffect")
					sunray.Intensity = 0.03
					sunray.Parent = game:GetService("Lighting")
					local bloom = Instance.new("BloomEffect")
					bloom.Threshold = 2
					bloom.Intensity = 1
					bloom.Size = 2
					bloom.Parent = game:GetService("Lighting")
					local atmosphere = Instance.new("Atmosphere")
					atmosphere.Density = 0.3
					atmosphere.Offset = 0.25
					atmosphere.Color = Color3.fromRGB(198, 198, 198)
					atmosphere.Decay = Color3.fromRGB(104, 112, 124)
					atmosphere.Glare = 0
					atmosphere.Haze = 0
					atmosphere.Parent = game:GetService("Lighting")
					skyColor = Instance.new("ColorCorrectionEffect",lighting)
					skyColor.TintColor = Color3.fromRGB(240,144,217)
				end)
				spawn(function()
					local snowpart = Instance.new("Part")
					snowpart.Size = Vector3.new(240, 0.5, 240)
					snowpart.Name = "SnowParticle"
					snowpart.Transparency = 1
					snowpart.CanCollide = false
					snowpart.Position = Vector3.new(0, 120, 286)
					snowpart.Anchored = true
					snowpart.Parent = workspace
					local snow = Instance.new("ParticleEmitter")
					snow.RotSpeed = NumberRange.new(300)
					snow.VelocitySpread = 35
					snow.Rate = 28
					snow.Texture = "rbxassetid://8158344433"
					snow.Rotation = NumberRange.new(110)
					snow.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.16939899325371,0),NumberSequenceKeypoint.new(0.23365999758244,0.62841498851776,0.37158501148224),NumberSequenceKeypoint.new(0.56209099292755,0.38797798752785,0.2771390080452),NumberSequenceKeypoint.new(0.90577298402786,0.51912599802017,0),NumberSequenceKeypoint.new(1,1,0)})
					snow.Lifetime = NumberRange.new(8,14)
					snow.Speed = NumberRange.new(8,18)
					snow.EmissionDirection = Enum.NormalId.Bottom
					snow.SpreadAngle = Vector2.new(35,35)
					snow.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.039760299026966,1.3114800453186,0.32786899805069),NumberSequenceKeypoint.new(0.7554469704628,0.98360699415207,0.44038599729538),NumberSequenceKeypoint.new(1,0,0)})
					snow.Parent = snowpart
					local windsnow = Instance.new("ParticleEmitter")
					windsnow.Acceleration = Vector3.new(0,0,1)
					windsnow.RotSpeed = NumberRange.new(100)
					windsnow.VelocitySpread = 35
					windsnow.Rate = 28
					windsnow.Texture = "rbxassetid://8158344433"
					windsnow.EmissionDirection = Enum.NormalId.Bottom
					windsnow.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.16939899325371,0),NumberSequenceKeypoint.new(0.23365999758244,0.62841498851776,0.37158501148224),NumberSequenceKeypoint.new(0.56209099292755,0.38797798752785,0.2771390080452),NumberSequenceKeypoint.new(0.90577298402786,0.51912599802017,0),NumberSequenceKeypoint.new(1,1,0)})
					windsnow.Lifetime = NumberRange.new(8,14)
					windsnow.Speed = NumberRange.new(8,18)
					windsnow.Rotation = NumberRange.new(110)
					windsnow.SpreadAngle = Vector2.new(35,35)
					windsnow.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.039760299026966,1.3114800453186,0.32786899805069),NumberSequenceKeypoint.new(0.7554469704628,0.98360699415207,0.44038599729538),NumberSequenceKeypoint.new(1,0,0)})
					windsnow.Parent = snowpart
					for i = 1, 30 do
						for i2 = 1, 30 do
							local clone = snowpart:Clone()
							clone.Position = Vector3.new(240 * (i - 1), 120, 240 * (i2 - 1))
							clone.Parent = workspace
						end
					end
				end)
			else
				for name,thing in pairs(lightingsettings) do 
					lighting[name] = thing 
				end
				lightingconnection:Disconnect() 
				for i,v in pairs(game:GetService("Lighting"):GetChildren()) do
					if v:IsA("Atmosphere") or v:IsA("Sky") or v:IsA("PostEffect") then
						v:Remove()
					end
				end
				for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
					if v.Name == "SnowParticle" then
						v:Remove()
					end
				end
			end
		end,
	})
end)
local beds = {}
--[[for i,v in pairs(workspace.Map.Blocks:GetChildren()) do
	if v.Name == "bed" then
		beds.insert(v.Covers.BrickColor.." Bed")
	end
end]]
runcode(function()
	local anticrash = {["Enabled"] = false}
	anticrash = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
		["Name"] = "AntiCrash",
		["HoverText"] = "Prevents being crashed from shields",
		["Function"] = function(callback)
			if callback then
				bedwars["ShieldController"].playEffects = function() end
			else
				bedwars["ShieldController"].playEffects = function() end
			end
		end 
	})
end)
runcode(function()
	local times = 39999
	local crasher = {["Enabled"] = false}
	crasher = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
		["Name"] = "Crasher",
		["HoverText"] = "Crashes the server using shields",
		["Function"] = function(callback)
			if callback then
				for i = 1,times do
					local args = {
						[1] = {
							["raised"] = true
						}
					}
					
					game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.UseInfernalShield:FireServer(unpack(args))					
				end
			else
				local args = {
					[1] = {
						["raised"] = false
					}
				}
				
				game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.UseInfernalShield:FireServer(unpack(args))				
			end
		end 
	})
	times = crasher.CreateSlider({
		["Name"] = "Times",
		["HoverText"] = "Times to raise shield",
		["Min"] = 5000,
		["Max"] = 39999,
		["Default"] = 39999,
		["Function"] = function(val)
			times = val
		end,
	})
end)

runcode(function()
	local anticheat = {["Enabled"] = false}
	anticheat = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
		["Name"] = "AnticheatDisabler",
		["HoverText"] = "anticheatdisbaler funny lol",
		["Function"] = function(callback)
			if callback then
			    print ("stupid ac disabler worked")
			else
				print ("why disable it? :(")
			end
		end 
	})
end)
runcode(function()
	local anticheat222 = {["Enabled"] = false}
	anticheat222 = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
		["Name"] = "/DIE (works)",
		["HoverText"] = "/die real command",
		["Function"] = function(callback)
			if callback then
				wait(0.001)
				local x = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x
local y = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y 
local z = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x,y-10,z)
			else
				print ("u died ig skill issue moment ??")
			end
		end 
	})
end)
runcode(function()
	local anticheat2227889 = {["Enabled"] = false}
	anticheat2227889 = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
		["Name"] = "/DIE (Loop)",
		["HoverText"] = "/loopdie real command",
		["Function"] = function(callback)
			if callback then
				wait(0.1)
				while( true )
				do
				local x = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x
				   local y = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y 
				   local z = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x,y-10,z)
				   wait(0.3)
				   local x = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x
				   local y = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y 
				   local z = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x,y-10,z)
				end
			else
				print ("u died ig skill issue moment ??")
			end
		end 
	})
end)
repeat task.wait() until shared.GuiLibrary
local GuiLibrary = shared.GuiLibrary
local COB = function(tab, argstable) 
    return GuiLibrary["ObjectsThatCanBeSaved"][tab.."Window"]["Api"].CreateOptionsButton(argstable)
end

COB("Utility", {
    Name = "rektsky",
    Function = function(callback) 
        if callback then
            pcall(function() 
                loadstring(game:HttpGet("https://raw.githubusercontent.com/8pmX8/rektsky4roblox/main/mainscript.lua"))()
            end) 
        end
    end,
    HoverText = "loads rektsky"
})

COB("Utility", {
    Name = "future",
    Function = function(callback) 
        if callback then
            pcall(function() 
                loadstring(game:HttpGet('https://raw.githubusercontent.com/joeengo/Future/main/loadstring.lua', true))() 
            end) 
        end
    end,
    HoverText = "loads future"
})

COB("World", {
    Name = "Night",
    Function = function(v)
        if v then
            game.Lighting.TimeOfDay = "00:00:00"
        else
            game.Lighting.TimeOfDay = "13:00:00"
        end
    end
})

COB("World", {
    Name = "Blood",
    Function = function(v)
        if v then
            game.Lighting.Ambient = Color3.fromRGB(255,0,0)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
        else
            game.Lighting.Ambient = Color3.fromRGB(91, 91, 91)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(201, 201, 201)
        end
    end
})

COB("World", {
    Name = "Ocean",
    Function = function(v)
        if v then
            game.Lighting.Ambient = Color3.fromRGB(0,0,255)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
        else
            game.Lighting.Ambient = Color3.fromRGB(91, 91, 91)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(201, 201, 201)
        end
    end
})

COB("World", {
    Name = "Both X And Z Fly",
    Function = function(v)
        longjumpval = v
        if longjumpval then
            workspace.Gravity = 0
            spawn(function()
                repeat
                    if (not longjumpval) then return end
                    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
					wait(0.5)
					local x = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x
					local y = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y 
					local z = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x+10,y,z)
					wait(0.000001)
                    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Running)
					wait(0.5)
					local x = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x
					local y = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y 
					local z = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x+10,y,z)
					wait(0.000001)
                    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Climbing)
					wait(0.5)
					local x = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x
					local y = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y 
					local z = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x+10,y,z)
					wait(0.000001)
                    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
					wait(0.5)
					local x = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x
					local y = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y 
					local z = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x+10,y,z)
					wait(0.000001)
					lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
					wait(0.5)
					local x = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x
					local y = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y 
					local z = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x+10,y,z)
					wait(0.000001)
                    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
					wait(0.5)
					local x = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x
					local y = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y 
					local z = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x+10,y,z)
					wait(0.000001)
					lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
					wait(0.5)
					local x = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x
					local y = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y 
					local z = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x+10,y,z-3)
					wait(0.000001)
					lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
					wait(0.5)
					local x = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x
					local y = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y 
					local z = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x+10,y,z-3)
					wait(0.000001)
					lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
					wait(0.000001)
                    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
					wait(0.000001)
					lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
					wait(0.000001)
					lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
					wait(0.000001)
					lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
					wait(0.000001)
					lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
					wait(0.000001)
					lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
				    wait(0.000001)
					lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
					wait(0.000001)
                until (not longjumpval)
            end)
        else
            workspace.Gravity = 196.19999694824
            return
        end
    end
})

COB("Blatant", {
    Name = "HypixelFLY",
	HoverText = "Vape Private FLY (Funny...)",
    Function = function(v)
        longjumpval = v
        if longjumpval then
			workspace.Gravity = 55
            spawn(function()
                repeat
                    if (not longjumpval) then return end
                    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
					wait(0.000000000000001)
                    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Running)
					wait(0.000000000000001)
                    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Climbing)
					wait(0.000000000000001)
                    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
					wait(0.000000000000001)
					lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
					wait(0.000000000000001)
                    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
					wait(0.000000000000001)
					lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
					wait(0.000000000000001)
					lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
					wait(0.000000000000001)
					lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
					wait(0.000000000000001)
                    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
					wait(0.000000000000001)
					lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
					wait(0.000000000000001)
					lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
					wait(0.000000000000001)
					lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
					wait(0.000000000000001)
					lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
					wait(0.000000000000001)
					lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
					wait(0.000000000000001)
					lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
					wait(0.000000000000001)
					lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Running)
					wait(0.000000000000001)
					lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Running)
					wait(0.000000000000001)
					lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
					wait(0.000000000000001)
					lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
					wait(0.000000000000001)
					lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
					wait(0.000000000000001)
					lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Running)
					wait(0.000000000000001)
					lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
					wait(0.000000000000001)
                until (not longjumpval)
            end)
        else
            workspace.Gravity = 196.19999694824
            return
        end
    end
})

GuiLibrary["RemoveObject"]("SafeWalkOptionsButton")
GuiLibrary["RemoveObject"]("SwimOptionsButton")
GuiLibrary["RemoveObject"]("SpinBotOptionsButton")
GuiLibrary["RemoveObject"]("ScaffoldOptionsButton")
GuiLibrary["RemoveObject"]("XrayOptionsButton")
GuiLibrary["RemoveObject"]("PanicOptionsButton")
GuiLibrary["RemoveObject"]("ChatSpammerOptionsButton")
GuiLibrary["RemoveObject"]("GravityOptionsButton")
GuiLibrary["RemoveObject"]("BlinkOptionsButton")
GuiLibrary["RemoveObject"]("AimAssistOptionsButton")
GuiLibrary["RemoveObject"]("BedProtectorOptionsButton")
GuiLibrary["RemoveObject"]("AutoSuffocateOptionsButton")
GuiLibrary["RemoveObject"]("FreecamOptionsButton")
GuiLibrary["RemoveObject"]("ArrowsOptionsButton")
GuiLibrary["RemoveObject"]("HealthOptionsButton")
GuiLibrary["RemoveObject"]("SearchOptionsButton")
GuiLibrary["RemoveObject"]("TracersOptionsButton")
GuiLibrary["RemoveObject"]("FishermanExploitOptionsButton")
GuiLibrary["RemoveObject"]("OpenEnderchestOptionsButton")
GuiLibrary["RemoveObject"]("ChamsOptionsButton")
GuiLibrary["RemoveObject"]("ESPOptionsButton")
GuiLibrary["RemoveObject"]("BreadcrumbsOptionsButton")
GuiLibrary["RemoveObject"]("FPSBoostOptionsButton")
GuiLibrary["RemoveObject"]("ChinaHatOptionsButton")
GuiLibrary["RemoveObject"]("AutoBalloonOptionsButton")
GuiLibrary["RemoveObject"]("AutoJuggernautOptionsButton")
GuiLibrary["RemoveObject"]("AutoKitOptionsButton")
GuiLibrary["RemoveObject"]("FastConsumeOptionsButton")
GuiLibrary["RemoveObject"]("FullbrightOptionsButton")
GuiLibrary["RemoveObject"]("NoSlowdownOptionsButton")
GuiLibrary["RemoveObject"]("ShopTierBypassOptionsButton")
GuiLibrary["RemoveObject"]("AutoToolOptionsButton")
GuiLibrary["RemoveObject"]("SchematicaOptionsButton")
GuiLibrary["RemoveObject"]("AutoHealOptionsButton")
GuiLibrary["RemoveObject"]("AutoHotbarOptionsButton")
GuiLibrary["RemoveObject"]("LongJumpOptionsButton")

runcode(function()
	local Z = {["Enabled"] = false}
	Z = GuiLibrary["ObjectsThatCanBeSaved"]["WorldWindow"]["Api"].CreateOptionsButton({
		["Name"] = "Loop -Z Walk",
		["HoverText"] = "broken ass stupid code lol.",
		["Function"] = function(callback)
			if callback then
				wait(0.1)
				while( true )
				do
				local x = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x
				   local y = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y 
				   local z = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x,y+1,z-10)
				   wait(0.4)
				   local x = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x
				   local y = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y 
				   local z = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x,y+1,z-10)
 				end
			else
				print ("idk if broken i dont really care lmao")
			end
		end 
	})
end)
runcode(function()
	local Z1 = {["Enabled"] = false}
	Z1 = GuiLibrary["ObjectsThatCanBeSaved"]["WorldWindow"]["Api"].CreateOptionsButton({
		["Name"] = "Loop +Z Walk",
		["HoverText"] = "broken ass stupid code lol.",
		["Function"] = function(callback)
			if callback then
				wait(0.1)
				while( true )
				do
				local x = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x
				   local y = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y 
				   local z = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x,y+1,z+10)
				   wait(0.4)
				   local x = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x
				   local y = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y 
				   local z = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x,y+1,z+10)
 				end
			else
				print ("idk if broken i dont really care lmao")
			end
		end 
	})
end)
runcode(function()
	local X = {["Enabled"] = false}
	X = GuiLibrary["ObjectsThatCanBeSaved"]["WorldWindow"]["Api"].CreateOptionsButton({
		["Name"] = "Loop -X Walk",
		["HoverText"] = "broken ass stupid code lol.",
		["Function"] = function(callback)
			if callback then
				wait(0.1)
				while( true )
				do
				local x = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x
				   local y = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y 
				   local z = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x-10,y+1,z)
				   wait(0.6)
				   local x = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x
				   local y = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y 
				   local z = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x-10,y+1,z)
				end	
			else
				print ("idk if broken i dont really care lmao")
			end
		end 
	})
end)
runcode(function()
	local X1 = {["Enabled"] = false}
	X1 = GuiLibrary["ObjectsThatCanBeSaved"]["WorldWindow"]["Api"].CreateOptionsButton({
		["Name"] = "Loop +X Walk",
		["HoverText"] = "broken ass stupid code lol.",
		["Function"] = function(callback)
			if callback then
				wait(0.1)
				while( true )
				do
				local x = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x
				   local y = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y 
				   local z = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x+10,y+1,z)
				   wait(0.6)
				   local x = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x
				   local y = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y 
				   local z = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z
				   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x+10,y+1,z)
				end	
			else
				print ("idk if broken i dont really care lmao")
			end
		end 
	})
end)