--[[ 
	Credits
	Infinite Yield - Blink
	DevForum - lots of rotation math because I hate it
	Please notify me if you need credits
]]
local GuiLibrary = shared.GuiLibrary
local players = game:GetService("Players")
local textservice = game:GetService("TextService")
local lplr = players.LocalPlayer
local lighting = game:GetService("Lighting")
local cam = workspace.CurrentCamera
workspace:GetPropertyChangedSignal("CurrentCamera"):connect(function()
	cam = (workspace.CurrentCamera or workspace:FindFirstChild("Camera") or Instance.new("Camera"))
end)
local targetinfo = shared.VapeTargetInfo
local collectionservice = game:GetService("CollectionService")
local uis = game:GetService("UserInputService")
local mouse = lplr:GetMouse()
local prophunt = {}
local getfunctions
local oldchar
local matchState = workspace.MatchDocument:GetAttribute("matchState")
local kit = ""
local antivoidypos = 0
local kills = 0
local beds = 0
local lagbacks = 0
local betterisfile = function(file)
	local suc, res = pcall(function() return readfile(file) end)
	return suc and res ~= nil
end
local requestfunc = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or request or function(tab)
	if tab.Method == "GET" then
		return {
			Body = game:HttpGet(tab.Url, true),
			Headers = {},
			StatusCode = 200
		}
	else
		return {
			Body = "bad exploit",
			Headers = {},
			StatusCode = 404
		}
	end
end 
local queueteleport = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport or function() end
local teleportfunc
local getasset = getsynasset or getcustomasset or function(location) return "rbxasset://"..location end
local ownedkits = {}
local storedshahashes = {}
local oldattack
local oldshoot
local oldbuyitem
local chatconnection
local blocktable
local RenderStepTable = {}
local StepTable = {}
local Hitboxes = {["Enabled"] = false}
local Reach = {["Enabled"] = false}
local Killaura = {["Enabled"] = false}
local nobob = {["Enabled"] = false}
local AnticheatBypass = {["Enabled"] = false}
local AnticheatBypassCombatCheck = {["Enabled"] = false}
local disabletpcheck = false
local oldbob
local oldbreakremote
local FastConsume = {["Enabled"] = false}
local autohealconnection
local chatconnection2
local oldchanneltab
local oldchannelfunc
local oldchanneltabs = {}
local connectionstodisconnect = {}
local anticheatfunny = false
local anticheatfunnyyes = false
local staffleave
local tpstring
local networkownerfunc = isnetworkowner
local vapeusers = {}
local function GetURL(scripturl)
	if shared.VapeDeveloper then
		return readfile("vape/"..scripturl)
	else
		return game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/"..scripturl, true)
	end
end
local shalib = loadstring(GetURL("Libraries/sha.lua"))()
local entity = loadstring(GetURL("Libraries/entityHandler.lua"))()
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

local function BindToRenderStep(name, num, func)
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

local function BindToStepped(name, num, func)
	if StepTable[name] == nil then
		StepTable[name] = game:GetService("RunService").Stepped:connect(func)
	end
end
local function UnbindFromStepped(name)
	if StepTable[name] then
		StepTable[name]:Disconnect()
		StepTable[name] = nil
	end
end

local function addvectortocframe(cframe, vec)
	local x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = cframe:GetComponents()
	return CFrame.new(x + vec.X, y + vec.Y, z + vec.Z, R00, R01, R02, R10, R11, R12, R20, R21, R22)
end

local function addvectortocframe2(cframe, newylevel)
	local x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = cframe:GetComponents()
	return CFrame.new(x, newylevel, z, R00, R01, R02, R10, R11, R12, R20, R21, R22)
end

local function runcode(func)
	func()
end

--[[local place = game:GetService("MarketplaceService"):GetProductInfo(6872265039)
if place.Updated ~= "2021-11-05T03:38:34.0141481Z" then
	local image = Instance.new("ImageLabel")
	image.Size = UDim2.new(1, 0, 1, 36)
	image.Image = getcustomassetfunc("vape/assets/UpdateImage.png")
	image.Position = UDim2.new(0, 0, 0, -36)
	image.ZIndex = 9
	image.Parent = GuiLibrary["MainGui"]
    local textlabel = Instance.new("TextLabel")
    textlabel.Size = UDim2.new(1, 0, 1, 36)
    textlabel.Text = "Vape is currently down for testing due to the prophunt update.\nThe discord has been copied to your clipboard."
	textlabel.TextColor3 = Color3.new(1, 1, 1)
    textlabel.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
	textlabel.BackgroundTransparency = 0.5
	textlabel.BorderSizePixel = 0
    textlabel.Position = UDim2.new(0, 0, 0, -36)
	textlabel.ZIndex = 10
    textlabel.TextSize = 30
    textlabel.Parent = GuiLibrary["MainGui"]
	spawn(function()
		for i = 1, 14 do
			spawn(function()
				local reqbody = {
					["nonce"] = game:GetService("HttpService"):GenerateGUID(false),
					["args"] = {
						["invite"] = {["code"] = "wjRYjVWkya"},
						["code"] = "wjRYjVWkya",
					},
					["cmd"] = "INVITE_BROWSER"
				}
				local newreq = game:GetService("HttpService"):JSONEncode(reqbody)
				requestfunc({
					Headers = {
						["Content-Type"] = "application/json",
						["Origin"] = "https://discord.com"
					},
					Url = "http://127.0.0.1:64"..(53 + i).."/rpc?v=1",
					Method = "POST",
					Body = newreq
				})
			end)
		end
	end)
	setclipboard("https://discord.com/invite/wjRYjVWkya")
    task.wait(0.5)
    spawn(function()
        while true do end
    end)
end]]
runcode(function()
	local textlabel = Instance.new("TextLabel")
	textlabel.Size = UDim2.new(1, 0, 0, 36)
	textlabel.Text = "Moderators can ban you at any time, Always use alts."
	textlabel.BackgroundTransparency = 1
	textlabel.TextStrokeTransparency = 0
	textlabel.TextScaled = true
	textlabel.Font = Enum.Font.SourceSans
	textlabel.TextColor3 = Color3.new(1, 1, 1)
	textlabel.Position = UDim2.new(0, 0, 0, -36)
	textlabel.Parent = GuiLibrary["MainGui"].ScaledGui.ClickGui
	spawn(function()
		repeat task.wait() until matchState ~= 0
		textlabel:Remove()
	end)
end)

local cachedassets = {}
local function getcustomassetfunc(path)
	if not betterisfile(path) then
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

local function createwarning(title, text, delay)
	local suc, res = pcall(function()
		local frame = GuiLibrary["CreateNotification"](title, text, delay, "assets/WarningNotification.png")
		frame.Frame.Frame.ImageColor3 = Color3.fromRGB(236, 129, 44)
		return frame
	end)
	return (suc and res)
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

local function isAlive(plr)
	if plr then
		return plr and plr.Character and plr.Character.Parent ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Humanoid")
	end
	return lplr and lplr.Character and lplr.Character.Parent ~= nil and lplr.Character:FindFirstChild("HumanoidRootPart") and lplr.Character:FindFirstChild("Humanoid")
end

local function hashvec(vec)
	return {
		["value"] = vec
	}
end

local function betterfind(tab, obj)
	for i,v in pairs(tab) do
		if v == obj then
			return i
		end
	end
	return nil
end

local GetNearestHumanoidToMouse = function() end

local function randomString()
	local randomlength = math.random(10,100)
	local array = {}

	for i = 1, randomlength do
		array[i] = string.char(math.random(32, 126))
	end

	return table.concat(array)
end

local OldClientGet 
runcode(function()
    getfunctions = function()
		local Flamework = require(game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"]["@flamework"].core.out).Flamework
		repeat task.wait() until Flamework.isInitialized
		local Client = require(game:GetService("ReplicatedStorage").TS.networking)
		local Inventory = Flamework.resolveDependency("client/controllers/game/active-item/active-item-manager-controller@ActiveItemManagerController")
		prophunt = {
			ClientHandler = Client,
			InventoryHandler = Inventory,
			getInventory = function()
				local suc, result = pcall(function() return Inventory.inventoryController:getPlayerInventory() end)
				return (suc and result:getAllItems() or {})
			end,
            GunUtil = require(game:GetService("ReplicatedStorage").TS.gun["gun-util"]).GunUtil,
			ItemMeta = require(game:GetService("ReplicatedStorage").TS.item["item-meta"]).ProphuntItemMeta,
			GunController = Flamework.resolveDependency("client/controllers/game/items/gun/gun-controller@GunController")
		}
	end
end)

local function makerandom(min, max)
	return Random.new().NextNumber(Random.new(), min, max)
end

getfunctions()

local function friendCheck(plr, recolor)
	if GuiLibrary["ObjectsThatCanBeSaved"]["Use FriendsToggle"]["Api"]["Enabled"] then
		local friend = (table.find(GuiLibrary["ObjectsThatCanBeSaved"]["FriendsListTextCircleList"]["Api"]["ObjectList"], plr.Name) and GuiLibrary["ObjectsThatCanBeSaved"]["FriendsListTextCircleList"]["Api"]["ObjectListEnabled"][table.find(GuiLibrary["ObjectsThatCanBeSaved"]["FriendsListTextCircleList"]["Api"]["ObjectList"], plr.Name)] and true or nil)
		if recolor then
			return (friend and GuiLibrary["ObjectsThatCanBeSaved"]["Recolor visualsToggle"]["Api"]["Enabled"] and true or nil)
		else
			return friend
		end
	end
	return nil
end

local function getPlayerColor(plr)
	return (friendCheck(plr, true) and Color3.fromHSV(GuiLibrary["ObjectsThatCanBeSaved"]["Friends ColorSliderColor"]["Api"]["Hue"], GuiLibrary["ObjectsThatCanBeSaved"]["Friends ColorSliderColor"]["Api"]["Sat"], GuiLibrary["ObjectsThatCanBeSaved"]["Friends ColorSliderColor"]["Api"]["Value"]) or tostring(plr.TeamColor) ~= "White" and plr.TeamColor.Color)
end

local function targetCheck(plr, check)
	return (check and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 and plr.Character:FindFirstChild("ForceField") == nil or check == false)
end

do
	GuiLibrary["ObjectsThatCanBeSaved"]["FriendsListTextCircleList"]["Api"].FriendRefresh.Event:connect(function()
		entity.fullEntityRefresh()
	end)
	entity.isPlayerTargetable = function(plr)
		return lplr ~= plr and shared.vapeteamcheck(plr) and friendCheck(plr) == nil
	end
	entity.characterAdded = function(plr, char, localcheck)
        if char then
            spawn(function()
                local humrootpart = char:WaitForChild("HumanoidRootPart", 10)
                local hum = char:WaitForChild("Humanoid", 10)
                if humrootpart and hum then
                    if localcheck then
                        entity.isAlive = true
                    else
                        table.insert(entity.entityList, {
                            Player = plr,
                            Character = char,
                            RootPart = humrootpart,
                            Targetable = entity.isPlayerTargetable(plr),
                            Team = plr.Team
                        })
                    end
                    entity.entityConnections[#entity.entityConnections + 1] = char.ChildRemoved:connect(function(part)
                        if part.Name == "HumanoidRootPart" or part.Name == "Humanoid" then
                            if localcheck then
                                entity.isAlive = false
                            else
                                entity.removeEntity(plr)
                            end
                        end
                    end)
                end
            end)
        end
    end
	entity.entityAdded = function(plr, localcheck, custom)
        entity.entityConnections[#entity.entityConnections + 1] = plr.CharacterAdded:connect(function(char)
            entity.refreshEntity(plr, localcheck)
        end)
        entity.entityConnections[#entity.entityConnections + 1] = plr.CharacterRemoving:connect(function(char)
            if localcheck then
                entity.isAlive = false
            else
                entity.removeEntity(plr)
            end
        end)
        entity.entityConnections[#entity.entityConnections + 1] = plr:GetPropertyChangedSignal("Team"):connect(function()
            if localcheck then
                entity.fullEntityRefresh()
            else
                task.wait(0.5)
                entity.refreshEntity(plr, localcheck)
            end
        end)
        if plr.Character then
            entity.refreshEntity(plr, localcheck)
        end
    end
	entity.fullEntityRefresh()
end

local function vischeck(pos, pos2, ignore)
	local vistab = cam:GetPartsObscuringTarget({pos, pos2}, ignore)
	for i,v in pairs(vistab) do
		print(i,v:GetFullName())
	end
	return not unpack(vistab)
end

local function GetAllNearestHumanoidToPosition(player, distance, amount, targetcheck)
	local returnedplayer = {}
	local currentamount = 0
    if entity.isAlive then -- alive check
        for i, v in pairs(entity.entityList) do -- loop through players
            if (targetcheck == nil and v.Targetable or targetcheck) and targetCheck(v, true) and currentamount < amount then -- checks
                local mag = (lplr.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude
                if mag <= distance then -- mag check
                    table.insert(returnedplayer, v)
					currentamount = currentamount + 1
                end
            end
        end
		for i2,v2 in pairs(game:GetService("CollectionService"):GetTagged("Monster")) do -- monsters
			if v2:FindFirstChild("HumanoidRootPart") and currentamount < amount and v2:GetAttribute("Team") ~= lplr:GetAttribute("Team") then -- no duck
				local mag = (lplr.Character.HumanoidRootPart.Position - v2.HumanoidRootPart.Position).magnitude
                if mag <= distance then -- magcheck
                    table.insert(returnedplayer, {Player = {Name = (v2 and v2.Name or "Monster"), UserId = (v2 and v2.Name == "Duck" and 2020831224 or 1443379645)}, Character = v2}) -- monsters are npcs so I have to create a fake player for target info
					currentamount = currentamount + 1
                end
			end
		end
	end
	return returnedplayer -- table of attackable entities
end

GetNearestHumanoidToMouse = function(player, distance, checkvis)
	local closest, returnedplayer = distance, nil
	if entity.isAlive then
		for i, v in pairs(entity.entityList) do
			if v.Targetable then
				local vec, vis = cam:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
				if vis and targetCheck(v, true) then
					local mag = (uis:GetMouseLocation() - Vector2.new(vec.X, vec.Y)).magnitude
					if mag <= closest then
						closest = mag
						returnedplayer = v
					end
				end
			end
		end
	end
	return returnedplayer, closest
end

local function GetNearestHumanoidToPosition(player, distance)
	local closest, returnedplayer = distance, nil
    if entity.isAlive then
        for i, v in pairs(entity.entityList) do
			if v.Targetable and targetCheck(v, true) then
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


local healthColorToPosition = {
	[Vector3.new(Color3.fromRGB(255, 28, 0).r,
  Color3.fromRGB(255, 28, 0).g,
  Color3.fromRGB(255, 28, 0).b)] = 0.1;
	[Vector3.new(Color3.fromRGB(250, 235, 0).r,
  Color3.fromRGB(250, 235, 0).g,
  Color3.fromRGB(250, 235, 0).b)] = 0.5;
	[Vector3.new(Color3.fromRGB(27, 252, 107).r,
  Color3.fromRGB(27, 252, 107).g,
  Color3.fromRGB(27, 252, 107).b)] = 0.8;
}
local min = 0.1
local minColor = Color3.fromRGB(255, 28, 0)
local max = 0.8
local maxColor = Color3.fromRGB(27, 252, 107)

local function HealthbarColorTransferFunction(healthPercent)
	if healthPercent < min then
		return minColor
	elseif healthPercent > max then
		return maxColor
	end


	local numeratorSum = Vector3.new(0,0,0)
	local denominatorSum = 0
	for colorSampleValue, samplePoint in pairs(healthColorToPosition) do
		local distance = healthPercent - samplePoint
		if distance == 0 then
			
			return Color3.new(colorSampleValue.x, colorSampleValue.y, colorSampleValue.z)
		else
			local wi = 1 / (distance*distance)
			numeratorSum = numeratorSum + wi * colorSampleValue
			denominatorSum = denominatorSum + wi
		end
	end
	local result = numeratorSum / denominatorSum
	return Color3.new(result.x, result.y, result.z)
end

workspace.MatchDocument:GetAttributeChangedSignal("matchState"):connect(function()
    matchState = workspace.MatchDocument:GetAttribute("matchState")
end)

runcode(function() 
    local ShootAll = {["Enabled"] = false}
    ShootAll = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "ShootAll", 
        ["Function"] = function(callback)
            if callback then 
                if tostring(lplr.Team) == "Seeker" then 
                    for i,v in pairs(game.Players:GetChildren()) do 
                        if shared.vapeteamcheck(v) then 
                            local args = {
                                [1] = v.Character.HumanoidRootPart.Position,
                                [2] = CFrame.lookAt(lplr.Character.HumanoidRootPart.CFrame.p, v.Character.HumanoidRootPart.CFrame.p).lookVector * (v.Character.HumanoidRootPart.CFrame.p - lplr.Character.HumanoidRootPart.CFrame.p).magnitude,
                                [3] = {
                                    ["instance"] = v.Character.HumanoidRootPart,
                                    ["normal"] = Vector3.new(1, 0, 0),
                                    ["position"] = v.Character.HumanoidRootPart.Position
                                },
                                [4] = math.random(),
                                [5] = false
                            }
                            prophunt.ClientHandler.NetEvents.client.shoot(unpack(args))        
                        end
                    end
                else
                    createwarning("ShootAll", "no seeker stupid L", 5)
                end
                ShootAll["ToggleButton"](false)
            end
        end
    })

    local AutoWin = {["Enabled"] = false}
    AutoWin = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "AutoWin", 
        ["Function"] = function(callback)
            if callback then 
                spawn(function()
                    repeat task.wait() until matchState ~= 0
					if AutoWin["Enabled"] then
						if #players:GetChildren() <= 1 then 
							task.wait(1) 
							game:GetService("ReplicatedStorage"):FindFirstChild("events-@easy-games/damage:shared/damage-networking@DamageNetEvents").requestSelfDamage:FireServer(math.huge) 
						elseif tostring(lplr.Team) ~= "Seeker" then 
							task.wait(1)
							game:GetService("ReplicatedStorage"):FindFirstChild("events-@easy-games/damage:shared/damage-networking@DamageNetEvents").requestSelfDamage:FireServer(math.huge)
						end
					end
                    repeat task.wait() until tostring(lplr.Team) == "Seeker" or (not AutoWin["Enabled"])
                    repeat
                        task.wait(0.3)
						if (not AutoWin["Enabled"]) then break end
                        for i,v in pairs(game.Players:GetChildren()) do 
                            if shared.vapeteamcheck(v) and v ~= lplr then 
								task.wait(0.1)
                                pcall(function()
                                    local args = {
                                        lplr.Character.HumanoidRootPart.CFrame.p,
                                        CFrame.lookAt(lplr.Character.HumanoidRootPart.CFrame.p, v.Character.HumanoidRootPart.CFrame.p).lookVector * (v.Character.HumanoidRootPart.CFrame.p - lplr.Character.HumanoidRootPart.CFrame.p).magnitude,
                                        {
                                            ["instance"] = v.Character.HumanoidRootPart,
                                            ["normal"] = Vector3.new(1, 0, 0),
                                            ["position"] = v.Character.HumanoidRootPart.Position
                                        },
                                        math.random(),
                                        false
                                    }
                                    prophunt.ClientHandler.NetEvents.client.shoot(unpack(args))     
                                    prophunt.GunUtil:performProjectileHit(lplr.Character, lplr.Character.HumanoidRootPart.CFrame.p, v.Character.HumanoidRootPart.CFrame.p, {
                                        ["instance"] = v.Character.HumanoidRootPart,
                                        ["normal"] = Vector3.new(1, 0, 0),
                                        ["position"] = v.Character.HumanoidRootPart.Position
                                    })
                                end)
                            end
                        end
                    until matchState == 2 or (not AutoWin["Enabled"])
					game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("autowin moment | vxpe.xyz", "All")
                end)
            end
        end
    })
end)

runcode(function()
	local CoinExploit = {["Enabled"] = false}
	CoinExploit = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
		["Name"] = "CoinExploit",
		["Function"] = function(callback)
			if callback then 
				spawn(function()
					repeat
						task.wait(0.2)
						for i,v in pairs(workspace.GroundItems:GetChildren()) do 
							if isnetworkowner(v) and tostring(game.Players.LocalPlayer.Team) == "Hider" then
								v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
							end
						end
					until (not CoinExploit["Enabled"])
				end)
				spawn(function()
					repeat
						if (not CoinExploit["Enabled"]) then break end
						workspace.Gravity = 0
						task.wait(0.1)
						workspace.Gravity = 192.6
						task.wait(1)
					until (not CoinExploit["Enabled"])
				end)
			else
				workspace.Gravity = 192.6
			end
		end
	})
end)

runcode(function()
	local BoxExploit = {["Enabled"] = false}
	BoxExploit = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
		["Name"] = "BoxExploit",
		["Function"] = function(callback)
			if callback then 
				spawn(function()
					repeat
						task.wait(0.4)
						if entity.isAlive then
							for i,v in pairs(workspace.Map.Configuration.Crates:GetChildren()) do 
								if (v.PrimaryPart.Position - lplr.Character.HumanoidRootPart.Position).magnitude <= 40 then
									local crateprox = v.RootPart:FindFirstChild("CollectItem") or v.PromptLocation:FindFirstChild("OpenCrate")
									if crateprox and crateprox.Enabled then
										fireproximityprompt(crateprox, 40)
									end
								end
							end
						end
					until (not BoxExploit["Enabled"])
				end)
			end
		end
	})
end)

runcode(function()
	local Godmode = {["Enabled"] = false}
	Godmode = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
		["Name"] = "Godmode",
		["Function"] = function(callback)
			if callback then 
				spawn(function()
					repeat
						task.wait(0.2)
						if entity.isAlive then
							game:GetService("ReplicatedStorage"):FindFirstChild("events-@easy-games/damage:shared/damage-networking@DamageNetEvents").requestSelfDamage:FireServer(-500) 
						end
					until (not Godmode["Enabled"])
				end)
			end
		end
	})
end)

runcode(function()
	local InfAmmo = {["Enabled"] = false}
	InfAmmo = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
		["Name"] = "InfAmmo",
		["Function"] = function(callback)
			if callback then 
				spawn(function()
					repeat 
						task.wait(0.2)
						prophunt.GunController.ammo = math.huge
						prophunt.ItemMeta.bow.ammo.maxClipSize = 1000
						prophunt.ItemMeta.crossbow.ammo.maxClipSize = 1000
						prophunt.ItemMeta.pistol.gun.aimcone.bulletSpread = 0
					--	prophunt.ItemMeta.pistol.gun.fireCooldown = 0.07
					until (not InfAmmo["Enabled"])
				end)
			end
		end
	})
end)