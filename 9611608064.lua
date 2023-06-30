--[[ 
	Credits
	Infinite Yield - Blink
	DevForum - lots of rotation math because I hate it
	Radical Loading Bar - ProximityPrompt render code
	Please notify me if you need credits
]]
local GuiLibrary = shared.GuiLibrary
local players = game:GetService("Players")
local textservice = game:GetService("TextService")
local repstorage = game:GetService("ReplicatedStorage")
local lplr = players.LocalPlayer
local workspace = game:GetService("Workspace")
local lighting = game:GetService("Lighting")
local collectionservice = game:GetService("CollectionService")
local cam = workspace.CurrentCamera
local targetinfo = shared.VapeTargetInfo
local uis = game:GetService("UserInputService")
local localmouse = lplr:GetMouse()
local requestfunc = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or getgenv().request or request
local getasset = getsynasset or getcustomasset
local chatconnection
local chatconnection2
local uninjectflag = false
local br = {}
local brpos = {}
local brvelo = {}
local storedshahashes = {}
local silentaimfire = false
local triggerbotfire = false
local NoSlowdown = {["Enabled"] = false}
local SilentAim = {["Enabled"] = false}
local SpinBot = {["Enabled"] = false}
local TriggerBot = {["Enabled"] = false}
local vec3 = Vector3.new
local cfnew = CFrame.new
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
local function GetURL(scripturl)
	if shared.VapeDeveloper then
		return readfile("vape/"..scripturl)
	else
		return game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/"..scripturl, true)
	end
end
local shalib = loadstring(GetURL("Libraries/sha.lua"))()
local whitelisted = {
	players = {
		"edbf7c4bd824bb17954c0fee8f108b6263a23d58e1dc500157513409cd9c55433ad43ea5c8bb121602fcd0eb0137d64805aaa8c597521298f5b53d69fa82014b", 
        "94a10e281a721c62346185156c15dcc62a987aa9a73c482db4d1b0f2b4673261ec808040fb70886bf50453c7af97903ffe398199b43fccf5d8b619121493382d",
        "a91361a785c34c433f33386ef224586b7076e1e10ebb8189fdc39b7e37822eb6c79a7d810e0d2d41e000db65f8c539ffe2144e70d48e6d3df7b66350d4699c36",
        "cd41b8c39abf4b186f611f3afd13e5d0a2e5d65540b0dab93eed68a68f3891e0448d87dbba0937395ab1b7c3d4b6aed4025caad2b90b2cdbf4ca69441644d561",
        "28f1c2514aea620a23ef6a1f084e86a993e2585110c1ddd7f98cc6b3bd331251382c0143f7520153c91a368be5683d3406e06c9e35fba61f8bd2ac811c05f46b",
        "8b6c2833fa6e3a7defdeb8ffb4dcd6d4c652e6d02621c054df7c44ebaf94858ac5cbed6a6aadf0270c07d7054b7a2dd1ebf49ab20ffbc567213376c7848b8b90",
        "6662a5dfbb5311ee66af25cf9b6255c8b70f977022fcaed8fa9e6bcb4fe0159c148835d7c3b599a5f92f9a67455e0158f8977f33e9306dd4cee3efceb0b75441",
        "bdf4e13afb63148ad68cf75e25ec6f0cf11e0c4a597e8bdd5c93724a44bde2ce12eee46549a90ae4390bbfa36f8c662b7634600c552ca21d093004d473f9b23f",
        "6f3e2567502502ac053f72a3ad27eead7aeef4f0ad7b1695150040c36de8868b045ac0ac7e75dab8b9e973fea0561ad1f9fa4ea9f57bfee6ad59ff6b440640ff",
        "96fdd47dbac073243048420c583ff9ef999f5d009dcac2b40e16fb8ec08269eba30bb94c830ce82ef7711a2cd18fc43d2a495fb9ba37d42c5047fe4f1c7315a6",
        "cc5ec617693d5c0b67c591adbc3560e2b4ee11ec87a625c5a026d8d1b57d82a3965ea4874a4deabee7015c9a5a1d52d0d75e2821c36a5b5ea21f0f72e100cbb7",
        "a650c02f7ae2a15303926b520213a7b74382c0be925e649733ab9d2e028462af51cec91357647907a76029951910e9fcb524fdb8f78c6c2df4e6d56d3b215ddd",
        "ae55a45820f801cfb2e0539c079dec830f0765b2a431eaa26957bf17054e0d93fbf28e9538c812d0b79cd20bd2862a8fd930b8d4f838c1cd135344e2d6f0e85e",
        "6ff2157b9f16703f12a08980cff9f23a56e20de493b38c816dbe36f519155eb27751d1aabb10b8859850c88d8921b49fbac13d67cbfba3cca36f31afd1d4db85",
        "33cc2e81258d38699b3638e9888e0263904ae3ee5ea1f14bab25c52dc1f0eb7212bb9ea3bcb2c45a1f577286a0319ac9952f4181908161276af6db22f49901a3",
        "4316131222bddc978cea052e43b958c689190f7fc1308da43dccfc04f0cb0637c0cc328e130406993e83a1b2f63c4b2a5267080b6c344282a5314b0be6c6b79e",
        "cf22724d1d4368338f59bab33321c1ded4fdbefc5f254d832d68db49a861e9fc546049a1e7b63076e5fef2c29faf127156396433ca3c73bb6630420d6e4e4e4f",
        "75967edb96b649fdc44d81c7d1085b72cc3c638d564d7cd3cded4c1713fc7d7e8e286dcc8e2b8858634e807aa760311af077840d0a6b3a6d7a90a8d2bd3ac171",
        "34664958478e9c40b1befa4a73dac9e16d8b1e3ffe2f7a0b25f2defb1b1f8a469116970b2fc720540903b240abc9b3986fe91ef9333d4fab26945535a4af1dcd",
        "2892f7112427bcd09afbc6e57a8152839641ecf932134bb90eb0bdd730afdb6dc99829b78e2380977f529afc50d3cbca30d224b8f13dd60e465c120ef10ab651",
        "9dc7a3fd30ef6c7d68da21b8a0c954c49c78710079118892d85aac93f12025fed982a4c2184fff001c616d8f59a034d70c3d85677be383c300ed95a6984e42ac",
        "edc25420a498cac15a3c38d298765a948ddae5007c15c77fbc5aa6c65149c968ce20eb916024ddd4c6e47aeaae9b10d13e1d0b245089f04db2902b1eda643cbc",
        "95520901447cb29c4a8b0c6376e5a10d8a05cc2225e0a64789ce917e27db891cd9c1aa3cd27869941ef797492fab2e3dd903db8100e57e0842577cfb35f45848",
        "7141c96de6ca4e94f407b1b4803f32fe72322213d94310445b69c11be913d6ceb3777e04e19ab8ff76c12260e6705035311e673b68b0763ebff2a3d67a06f90d",
        "3b84ce0a89a50a01299cf4582fd0ed164a8cb24289ac3a4afc3a652e9aacad0a9e17caa2c787cd3cd6a3e7a79a31f2f2c4f6f54a58ae1c53d03226134070f5b9"
	},
	owners = {
		"66ed442039083616d035cd09a9701e6c225bd61278aaad11a759956172144867ed1b0dc1ecc4f779e6084d7d576e49250f8066e2f9ad86340185939a7e79b30f",
        "55273f4b0931f16c1677680328f2784842114d212498a657a79bb5086b3929c173c5e3ca5b41fa3301b62cccf1b241db68a85e3cd9bbe5545b7a8c6422e7f0d2",
        "389b0e57c452ceb5e7c71fa20a75fd11147cef40adef9935f10abf5982d21e2ff01b7357f22855b5ea6536d4b841a337c0e52cfb614049bf47b175addc4f905e"
	},
	chattags = {
		["55273f4b0931f16c1677680328f2784842114d212498a657a79bb5086b3929c173c5e3ca5b41fa3301b62cccf1b241db68a85e3cd9bbe5545b7a8c6422e7f0d2"] = {
			NameColor = {r = 255, g = 0, b = 0},
			Tags = {
				{
					TagColor = {r = 255, g = 0, b = 0},
					TagText = "okay"
				}
			}
		}
	}
}
pcall(function()
	whitelisted = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/whitelists/main/whitelist2.json", true))
end)

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

local function createwarning(title, text, delay)
	pcall(function()
		local frame = GuiLibrary["CreateNotification"](title, text, delay, "assets/WarningNotification.png")
		frame.Frame.BackgroundColor3 = Color3.fromRGB(236, 129, 44)
		frame.Frame.Frame.BackgroundColor3 = Color3.fromRGB(236, 129, 44)
	end)
end

local function friendCheck(plr, recolor)
	return (recolor and GuiLibrary["ObjectsThatCanBeSaved"]["Recolor visualsToggle"]["Api"]["Enabled"] or (not recolor)) and GuiLibrary["ObjectsThatCanBeSaved"]["Use FriendsToggle"]["Api"]["Enabled"] and table.find(GuiLibrary["ObjectsThatCanBeSaved"]["FriendsListTextCircleList"]["Api"]["ObjectList"], plr.Name) and GuiLibrary["ObjectsThatCanBeSaved"]["FriendsListTextCircleList"]["Api"]["ObjectListEnabled"][table.find(GuiLibrary["ObjectsThatCanBeSaved"]["FriendsListTextCircleList"]["Api"]["ObjectList"], plr.Name)]
end

local function getPlayerColor(plr)
	return (friendCheck(plr, true) and Color3.fromHSV(GuiLibrary["ObjectsThatCanBeSaved"]["Friends ColorSliderColor"]["Api"]["Hue"], GuiLibrary["ObjectsThatCanBeSaved"]["Friends ColorSliderColor"]["Api"]["Sat"], GuiLibrary["ObjectsThatCanBeSaved"]["Friends ColorSliderColor"]["Api"]["Value"]) or plr:GetAttribute("teamId") == lplr:GetAttribute("teamId") and plr.TeamColor.Color)
end

local function getcustomassetfunc(path)
	if not isfile(path) then
		spawn(function()
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

shared.vapeteamcheck = function(plr)
	return (GuiLibrary["ObjectsThatCanBeSaved"]["Teams by colorToggle"]["Api"]["Enabled"] and (plr.Team ~= lplr.Team or (lplr.Team == nil or #lplr.Team:GetPlayers() == #game:GetService("Players"):GetChildren())) or GuiLibrary["ObjectsThatCanBeSaved"]["Teams by colorToggle"]["Api"]["Enabled"] == false)
end

local function targetCheck(plr, check)
	return (check and plr.Character.Humanoid.Health > 0 and plr.Character:FindFirstChild("ForceField") == nil or check == false)
end

local function isAlive(plr)
	if plr then
		local char = br["ChickynoidClient"].characters[plr.UserId]
		char = char and char.characterModel and char.characterModel.model
		local humroot = char and char:FindFirstChild("HumanoidRootPart")
		local head = char and char:FindFirstChild("Head")
		local hum = char and char:FindFirstChild("Humanoid")
		return char and humroot and head and char 
	end
	local char = br["ChickynoidClient"].characterModel and br["ChickynoidClient"].characterModel.model
	local humroot = char and char:FindFirstChild("HumanoidRootPart")
	local head = char and char:FindFirstChild("Head")
	local hum = char and char:FindFirstChild("Humanoid")
	return char and humroot and head and char
end

local function isPlayerTargetable(plr, target, friend)
    return plr ~= lplr and plr and (friend and friendCheck(plr) == nil or (not friend)) and isAlive(plr) and targetCheck(plr, target) and shared.vapeteamcheck(plr)
end

local function vischeck(char, part)
	return not unpack(cam:GetPartsObscuringTarget({lplr.Character[part].Position, char[part].Position}, {lplr.Character, char}))
end

local function runcode(func)
	func()
end

local rayparams = RaycastParams.new()
rayparams.FilterType = Enum.RaycastFilterType.Blacklist
local function getAttackable()
	local tab = {}
	for i,v in pairs(players:GetPlayers()) do 
		if v ~= lplr and v:GetAttribute("teamId") ~= lplr:GetAttribute("teamId") then
			local char = isAlive(v)
			if char then 
				table.insert(tab, {Player = v, Character = char})
			end
		end
	end
	return tab
end

local function getTeammates()
	local tab = {}
	for i,v in pairs(players:GetPlayers()) do 
		if v ~= lplr and v:GetAttribute("teamId") == lplr:GetAttribute("teamId") then
			local char = isAlive(v)
			if char then 
				table.insert(tab, {Player = v, Character = char})
			end
		end
	end
	return tab
end

local function getBattleRoyaleEntity(plr)
	for i,v in pairs(collectionservice:GetTagged("royale-entity")) do 
		if v:GetAttribute("userId") == plr.UserId then 
			return v
		end
	end
end
local function getLivingEntity(plr)
	for i,v in pairs(collectionservice:GetTagged("living-entity-component")) do 
		if v:GetAttribute("userId") == plr.UserId then 
			return v
		end
	end
end

local function GetNearestHumanoidToMouse(player, distance, checkvis, origin, part)
    local closest, returnedplayer = distance, nil
	for i, v in pairs(getAttackable()) do
		local vec, vis = cam:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
		if vis then
			local mag = (uis:GetMouseLocation() - Vector2.new(vec.X, vec.Y)).magnitude
			if mag <= closest then
				if checkvis then 
					rayparams.FilterDescendantsInstances = {lplr.Character}
					local campos = origin or cam.CFrame.p
					local res = br["GameQueryUtil"]:raycast(campos, CFrame.lookAt(campos, v.Character[part or "Head"]:GetRenderCFrame().p).lookVector * 1000, rayparams)
					if res == nil or res.Instance and res.Instance:IsDescendantOf(v.Character) ~= true then continue end
				end
				closest = mag
				returnedplayer = v
			end
		end
	end
    return returnedplayer
end

local function GetNearestHumanoidToPosition(player, distance, checkvis)
    local closest, returnedplayer = distance, nil
	local localchar = isAlive()
	if localchar then
		for i, v in pairs(getTeammates()) do
			local mag = (localchar.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude
			if mag <= closest then
				if checkvis then 
					rayparams.FilterDescendantsInstances = {lplr.Character}
					local res = br["GameQueryUtil"]:raycast(cam.CFrame.p, CFrame.lookAt(cam.CFrame.p, v.Character.Head:GetRenderCFrame().p).lookVector * 1000, rayparams)
					if res == nil or res.Instance and res.Instance:IsDescendantOf(v.Character) ~= true then continue end
				end
				closest = mag
				returnedplayer = v
			end
		end
	end
    return returnedplayer
end

local function CalculateObjectPosition(pos)
	local newpos = cam:WorldToViewportPoint(cam.CFrame:pointToWorldSpace(cam.CFrame:pointToObjectSpace(pos)))
	return Vector2.new(newpos.X, newpos.Y)
end

local function CalculateLine(startVector, endVector, obj)
	local Distance = (startVector - endVector).Magnitude
	obj.Size = UDim2.new(0, Distance, 0, 2)
	obj.Position = UDim2.new(0, (startVector.X + endVector.X) / 2, 0, ((startVector.Y + endVector.Y) / 2) - 36)
	obj.Rotation = math.atan2(endVector.Y - startVector.Y, endVector.X - startVector.X) * (180 / math.pi)
end

local function findTouchInterest(tool)
	for i,v in pairs(tool:GetDescendants()) do
		if v:IsA("TouchTransmitter") then
			return v
		end
	end
	return nil
end

local function betterfind(tab, obj)
	for i,v in pairs(tab) do
		if v == obj or type(v) == "table" and v.hash == obj then
			return v
		end
	end
	return nil
end

local OldGenerateCommand
runcode(function()
	local Flamework = require(repstorage.rbxts_include.node_modules["@flamework"].core.out.flamework).Flamework
	repeat task.wait() until Flamework.isInitialized
	br = {
		["ActiveItemController"] = require(lplr.PlayerScripts.TS.controllers.global["held-item"]["active-item-controller"]).ActiveItemController,
		["ClientStoreController"] = Flamework.resolveDependency("client/controllers/global/rodux/rodux-controller@RoduxController"),
		["CrosshairController"] = Flamework.resolveDependency("client/controllers/global/crosshair/crosshair-controller@CrosshairController"),
		["CheckWhitelisted"] = function(plr, ownercheck)
			local plrstr = br["HashFunction"](plr.Name..plr.UserId)
			local localstr = br["HashFunction"](lplr.Name..lplr.UserId)
			return ((ownercheck == nil and (betterfind(whitelisted.players, plrstr) or betterfind(whitelisted.owners, plrstr)) or ownercheck and betterfind(whitelisted.owners, plrstr))) and betterfind(whitelisted.owners, localstr) == nil and true or false
		end,
		["CheckPlayerType"] = function(plr)
			local plrstr = br["HashFunction"](plr.Name..plr.UserId)
			local playertype, playerattackable = "DEFAULT", true
			local private = betterfind(whitelisted.players, plrstr)
			local owner = betterfind(whitelisted.owners, plrstr)
			if private then
				playertype = "VAPE PRIVATE"
				playerattackable = not (type(private) == "table" and private.invulnerable or false)
			end
			if owner then
				playertype = "VAPE OWNER"
				playerattackable = not (type(owner) == "table" and owner.invulnerable or false)
			end
			return playertype, playerattackable
		end,
		["ChickynoidClient"] = require(repstorage.rbxts_include.node_modules.chickynoid.src).ChickynoidClient,
		["DamageEvents"] = repstorage["events-@easy-games/damage:shared/damage-networking@getEvents.Events"],
		["EntityService"] = Flamework.resolveDependency("@easy-games/damage:server/services/entity/entity-service@EntityService"),
		["GameQueryUtil"] = require(repstorage.rbxts_include.node_modules["@easy-games"]["game-core"].out).GameQueryUtil,
		["GunController"] = Flamework.resolveDependency("client/controllers/global/gun/gun-controller@GunController"),
		["GunUtil"] = require(repstorage.TS.gun["gun-util"]).GunUtil,
		["HashFunction"] = function(str)
			if storedshahashes[tostring(str)] == nil then
				storedshahashes[tostring(str)] = shalib.sha512(tostring(str).."SelfReport")
			end
			return storedshahashes[tostring(str)]
		end,
		["IsVapePrivateIngame"] = function()
			for i,v in pairs(players:GetChildren()) do 
				local plrstr = br["HashFunction"](v.Name..v.UserId)
				if br["CheckPlayerType"](v) ~= "DEFAULT" or whitelisted.chattags[plrstr] then 
					return true
				end
			end
			return false
		end,
		["ItemPickupController"] = Flamework.resolveDependency("client/controllers/global/ground-item/item-pickup-controller@ItemPickupController"),
		["ItemTable"] = require(repstorage.TS.item["item-meta"]).RoyaleItemMeta,
		["ItemRarityTable"] = debug.getupvalue(require(repstorage.TS.item.rarity["item-rarity-meta"]).getItemRarityMeta, 1),
		["ItemHolderController"] = Flamework.resolveDependency("client/controllers/global/held-item/item-holder-controller@ItemHolderController"),
		["InventoryController"] = Flamework.resolveDependency("client/controllers/global/inventory/inventory-controller@InventoryController"),
		["KillFeedController"] = Flamework.resolveDependency("client/controllers/game/kill-feed/kill-feed-controller@KillFeedController"),
		["LobbyClientEvents"] = require(repstorage.rbxts_include.node_modules["@easy-games"].lobby.out.client.events).LobbyClientEvents,
		["MatchManagerController"] = Flamework.resolveDependency("@easy-games/minigame-engine:client/controllers/match/match-manager-controller@MatchManagerController"),
		["Networking"] = require(repstorage.TS.networking),
		["PivotController"] = Flamework.resolveDependency("client/controllers/global/pivot/pivot-controller@PivotController"),
		["ProjectileNetFunctions"] = require(game.ReplicatedStorage.rbxts_include.node_modules["@easy-games"].projectile.out.shared["projectile-networking"]).ProjectileNetFunctions,
		["sprintTable"] = Flamework.resolveDependency("client/controllers/global/movement/sprint-controller@SprintController"),
		["ShiftLockController"] = Flamework.resolveDependency("client/controllers/global/camera/shift-lock-controller@ShiftLockController"),
		["SprintMoveType"] = require(game.ReplicatedStorage.TS.chickynoid["move-type"]["sprint-move-type"]).SprintMoveType,
		["BaseGun"] = require(repstorage.TS.gun.guns["base-gun"])
	}
end)

runcode(function()
	local KillAll = {["Enabled"] = false}
	KillAll = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
		["Name"] = "KillAll",
		["Function"] = function(callback)
			if callback then 
				local player = GetNearestHumanoidToMouse(true, 1000, false)
				if player then 
					game:GetService("ReplicatedStorage"):FindFirstChild("functions-@easy-games/projectile:shared/projectile-networking@getFunctions.Functions"):FindFirstChild("s:fireProjectile"):FireServer(1, "grenade", player.Character.HumanoidRootPart.Position - Vector3.new(0, 2, 0), Vector3.new(0, -60, 0))
				end
				KillAll["ToggleButton"](false)
			end
		end
	})

	local LaunchAll = {["Enabled"] = false}
	LaunchAll = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
		["Name"] = "LaunchAll",
		["Function"] = function(callback)
			if callback then 
				local player = GetNearestHumanoidToMouse(true, 1000, false)
				if player then 
					game:GetService("ReplicatedStorage"):FindFirstChild("functions-@easy-games/projectile:shared/projectile-networking@getFunctions.Functions"):FindFirstChild("s:fireProjectile"):FireServer(1, "launch_pad", player.Character.HumanoidRootPart.Position - Vector3.new(0, 2, 0), Vector3.new(0, -60, 0))
				end
				LaunchAll["ToggleButton"](false)
			end
		end
	})
end)

runcode(function()
	local Dupe = {["Enabled"] = false}
	Dupe = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
		["Name"] = "Dupe",
		["Function"] = function(callback)
			if callback then 
				local helditem =  br["ItemHolderController"]:getActiveItemType()
				local helditemslot =  br["ItemHolderController"]:getItemHolderComponent():getActiveItemSlot()
				game:GetService("ReplicatedStorage"):FindFirstChild("events-shared/networking@NetEvents").dropItem:FireServer(helditem, "default", helditemslot, -math.huge)
				Dupe["ToggleButton"](false)
			end
		end
	})
end)

br["ItemHolderController"]:getActiveItemType()