-- Credits to Inf Yield & all the other scripts that helped me make bypasses
local GuiLibrary = shared.GuiLibrary
local players = game:GetService("Players")
local textservice = game:GetService("TextService")
local lplr = players.LocalPlayer
local workspace = game:GetService("Workspace")
local lighting = game:GetService("Lighting")
local cam = workspace.CurrentCamera
local targetinfo = shared.VapeTargetInfo
local uis = game:GetService("UserInputService")
local mouse = lplr:GetMouse()
local robloxfriends = {}
local bedwars = {}
local getfunctions
local origC0 = nil
local queueteleport = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport or function() end
local teleportfunc
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
local getasset = getsynasset or getcustomasset
local storedshahashes = {}
local oldchanneltab
local oldchannelfunc
local oldchanneltabs = {}

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
		"94a10e281a721c62346185156c15dcc62a987aa9a73c482db4d1b0f2b4673261ec808040fb70886bf50453c7af97903ffe398199b43fccf5d8b619121493382d",
		"a91361a785c34c433f33386ef224586b7076e1e10ebb8189fdc39b7e37822eb6c79a7d810e0d2d41e000db65f8c539ffe2144e70d48e6d3df7b66350d4699c36",
		"cd41b8c39abf4b186f611f3afd13e5d0a2e5d65540b0dab93eed68a68f3891e0448d87dbba0937395ab1b7c3d4b6aed4025caad2b90b2cdbf4ca69441644d561",
		"28f1c2514aea620a23ef6a1f084e86a993e2585110c1ddd7f98cc6b3bd331251382c0143f7520153c91a368be5683d3406e06c9e35fba61f8bd2ac811c05f46b",
		"8b6c2833fa6e3a7defdeb8ffb4dcd6d4c652e6d02621c054df7c44ebaf94858ac5cbed6a6aadf0270c07d7054b7a2dd1ebf49ab20ffbc567213376c7848b8b90",
		"6662a5dfbb5311ee66af25cf9b6255c8b70f977022fcaed8fa9e6bcb4fe0159c148835d7c3b599a5f92f9a67455e0158f8977f33e9306dd4cee3efceb0b75441",
		"bdf4e13afb63148ad68cf75e25ec6f0cf11e0c4a597e8bdd5c93724a44bde2ce12eee46549a90ae4390bbfa36f8c662b7634600c552ca21d093004d473f9b23f"
	},
	owners = {
		"66ed442039083616d035cd09a9701e6c225bd61278aaad11a759956172144867ed1b0dc1ecc4f779e6084d7d576e49250f8066e2f9ad86340185939a7e79b30f",
		"55273f4b0931f16c1677680328f2784842114d212498a657a79bb5086b3929c173c5e3ca5b41fa3301b62cccf1b241db68a85e3cd9bbe5545b7a8c6422e7f0d2"
	},
	chattags = {
		["a"] = {
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

local RenderStepTable = {}
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

local function runcode(func)
	func()
end


local function betterfind(tab, obj)
	for i,v in pairs(tab) do
		if v == obj then
			return i
		end
	end
	return nil
end

local function addvectortocframe(cframe, vec)
	local x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = cframe:GetComponents()
	return CFrame.new(x + vec.X, y + vec.Y, z + vec.Z, R00, R01, R02, R10, R11, R12, R20, R21, R22)
end

local function getremote(tab)
	for i,v in pairs(tab) do
		if v == "Client" then
			return tab[i + 1]
		end
	end
	return ""
end

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
	return getasset(path) 
end

local function isAlive(plr)
	if plr then
		return plr and plr.Character and plr.Character.Parent ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Head") and plr.Character:FindFirstChild("Humanoid")
	end
	return lplr and lplr.Character and lplr.Character.Parent ~= nil and lplr.Character:FindFirstChild("HumanoidRootPart") and lplr.Character:FindFirstChild("Head") and lplr.Character:FindFirstChild("Humanoid")
end

local function createwarning(title, text, delay)
	local suc, res = pcall(function()
		local frame = GuiLibrary["CreateNotification"](title, text, delay, "assets/WarningNotification.png")
		frame.Frame.Frame.ImageColor3 = Color3.fromRGB(236, 129, 44)
		return frame
	end)
	return (suc and res)
end

local newupdate = game.Players.LocalPlayer.PlayerScripts.TS:WaitForChild("ui", 3) and true or false

runcode(function()
    local flaggedremotes = {"SelfReport"}

    getfunctions = function()
        local Flamework = require(game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"]["@flamework"].core.out).Flamework
		repeat task.wait() until Flamework.isInitialized
		local KnitClient = debug.getupvalue(require(lplr.PlayerScripts.TS.knit).setup, 6)
        local Client = require(game:GetService("ReplicatedStorage").TS.remotes).default.Client
        local OldClientGet = getmetatable(Client).Get
		local OldClientWaitFor = getmetatable(Client).WaitFor
        bedwars = {
			["AnimationType"] = require(game:GetService("ReplicatedStorage").TS.animation["animation-type"]).AnimationType,
			["BedwarsKits"] = require(game:GetService("ReplicatedStorage").TS.games.bedwars.kit["bedwars-kit-shop"]).BedwarsKitShop,
            ["ClientHandler"] = Client,
            ["ClientStoreHandler"] = (newupdate and require(game.Players.LocalPlayer.PlayerScripts.TS.ui.store).ClientStore or require(lplr.PlayerScripts.TS.rodux.rodux).ClientStore),
			["EquipItemRemote"] = getremote(debug.getconstants(debug.getprotos(shared.oldequipitem or require(game:GetService("ReplicatedStorage").TS.entity.entities["inventory-entity"]).InventoryEntity.equipItem)[3])),
			["KitMeta"] = require(game:GetService("ReplicatedStorage").TS.games.bedwars.kit["bedwars-kit-meta"]).BedwarsKitMeta,
			["LobbyClientEvents"] = (newupdate and require(game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"]["@easy-games"].lobby.out.client.events).LobbyClientEvents),
            ["sprintTable"] = KnitClient.Controllers.SprintController,
			["WeldTable"] = require(game:GetService("ReplicatedStorage").TS.util["weld-util"]).WeldUtil,
			["QueueMeta"] = require(game:GetService("ReplicatedStorage").TS.game["queue-meta"]).QueueMeta,
			["CheckWhitelisted"] = function(plr, ownercheck)
				local plrstr = bedwars["HashFunction"](plr.Name..plr.UserId)
				local localstr = bedwars["HashFunction"](lplr.Name..lplr.UserId)
				return ((ownercheck == nil and (betterfind(whitelisted.players, plrstr) or betterfind(whitelisted.owners, plrstr)) or ownercheck and betterfind(whitelisted.owners, plrstr))) and betterfind(whitelisted.players, localstr) == nil and betterfind(whitelisted.owners, localstr) == nil and true or false
			end,
			["CheckPlayerType"] = function(plr)
				local plrstr = bedwars["HashFunction"](plr.Name..plr.UserId)
				local playertype = "DEFAULT"
				if betterfind(whitelisted.players, plrstr) then
					playertype = "VAPE PRIVATE"
				end
				if betterfind(whitelisted.owners, plrstr) then
					playertype = "VAPE OWNER"
				end
				return playertype
			end,
			
			["HashFunction"] = function(str)
				if storedshahashes[tostring(str)] == nil then
					storedshahashes[tostring(str)] = shalib.sha512(tostring(str).."SelfReport")
				end
				return storedshahashes[tostring(str)]
			end,
			["getEntityTable"] = require(game:GetService("ReplicatedStorage").TS.entity["entity-util"]).EntityUtil,
			["GameAnimationUtil"] = require(game:GetService("ReplicatedStorage").TS.animation["animation-util"]).GameAnimationUtil,
        }
	end
end)
getfunctions()

GuiLibrary["SelfDestructEvent"].Event:connect(function()
	if chatconnection then
		chatconnection:Disconnect()
	end
	if teleportfunc then
		teleportfunc:Disconnect()
	end
	if oldchannelfunc and oldchanneltab then
		oldchanneltab.GetChannel = oldchannelfunc
	end
	for i2,v2 in pairs(oldchanneltabs) do
		i2.AddMessageToChannel = v2
	end
end)

local function getNametagString(plr)
	local nametag = ""
	if bedwars["CheckPlayerType"](plr) == "VAPE PRIVATE" then
		nametag = '<font color="rgb(127, 0, 255)">[VAPE PRIVATE] '..(plr.DisplayName or plr.Name)..'</font>'
	end
	if bedwars["CheckPlayerType"](plr) == "VAPE OWNER" then
		nametag = '<font color="rgb(255, 80, 80)">[VAPE OWNER] '..(plr.DisplayName or plr.Name)..'</font>'
	end
	if whitelisted.chattags[bedwars["HashFunction"](plr.Name..plr.UserId)] then
		local data = whitelisted.chattags[bedwars["HashFunction"](plr.Name..plr.UserId)]
		local newnametag = ""
		if data.Tags then
			for i2,v2 in pairs(data.Tags) do
				newnametag = newnametag..'<font color="rgb('..math.floor(v2.TagColor.r * 255)..', '..math.floor(v2.TagColor.g * 255)..', '..math.floor(v2.TagColor.b * 255)..')">['..v2.TagText..']</font> '
			end
		end
		nametag = newnametag..(newnametag.NameColor and '<font color="rgb('..math.floor(newnametag.NameColor.r * 255)..', '..math.floor(newnametag.NameColor.g * 255)..', '..math.floor(newnametag.NameColor.b * 255)..')">' or '')..(plr.DisplayName or plr.Name)..(newnametag.NameColor and '</font>' or '')
	end
	return nametag
end


runcode(function()
	local function findplayers(arg)
		for i,v in pairs(game:GetService("Players"):GetChildren()) do if v.Name:lower():sub(1, arg:len()) == arg:lower() then return v end end
		return nil
	end

	local PlayerCrasher = {["Enabled"] = false}
	local PlayerCrasherPower = {["Value"] = 2}
	local PlayerCrasherDelay = {["Value"] = 2}
	local PlayerCrasherBox = {["Value"] = ""}
	local targetedplayer	
	PlayerCrasher = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
		["Name"] = "PlayerCrasher",
		["Function"] = function(callback)
			if callback then
				for i,v in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
					if (v.Name:find("arty") or v.Name:find("otification"))and v:IsA("RemoteEvent") then
						for i2,v2 in pairs(getconnections(v.OnClientEvent)) do 
							v2:Disable()
						end
					end
				end
				spawn(function()
					repeat
						task.wait(3)
						createwarning("PlayerCrasher", targetedplayer and "Crashing "..(targetedplayer.DisplayName or targetedplayer.Name) or "Player not found", 3)
					until (not PlayerCrasher["Enabled"])
				end)
				spawn(function()
					repeat
						task.wait(PlayerCrasherDelay["Value"] == 0 and nil or PlayerCrasherDelay["Value"] / 10)
						local plr = findplayers(PlayerCrasherBox["Value"])
						targetedplayer = plr
						if plr then
							spawn(function()
								for i = 1, PlayerCrasherPower["Value"] do 
									bedwars["LobbyClientEvents"].inviteToParty({
										player = plr
									})
									bedwars["LobbyClientEvents"].leaveParty()
								end
							end)
						end
					until (not PlayerCrasher["Enabled"])
				end)
			end
		end
	})
	PlayerCrasherBox = PlayerCrasher.CreateTextBox({
		["Name"] = "Player",
		["TempText"] = "player target",
		["FocusLost"] = function(enter) end
	})
	PlayerCrasherPower = PlayerCrasher.CreateSlider({
		["Name"] = "Requests per second",
		["Min"] = 1,
		["Max"] = 10,
		["Default"] = 2,
		["Function"] = function() end
	})
	PlayerCrasherDelay = PlayerCrasher.CreateSlider({
		["Name"] = "Seconds per request",
		["Min"] = 0,
		["Max"] = 10,
		["Default"] = 0,
		["Function"] = function() end
	})
end)

runcode(function()
	local function getaccessories()
		local count = 0
		if isAlive() then 
			for i,v in pairs(lplr.Character:GetChildren()) do 
				if v:IsA("Accessory") then 
					count = count + 1
				end
			end
		end
		return count
	end

	local AntiCrash = {["Enabled"] = false}
	AntiCrash = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
		["Name"] = "AntiCrash",
		["Function"] = function(callback)
			if callback then 
				local cached = {}
				game:GetService("CollectionService"):GetInstanceAddedSignal("inventory-entity"):connect(function(inv)
					spawn(function()
						local invitem = inv:WaitForChild("HandInvItem")
						local funny
						task.wait(0.2)
						for i,v in pairs(getconnections(invitem.Changed)) do 
							funny = v.Function
							v:Disable()
						end
						if funny then
							invitem.Changed:connect(function(item)
								if cached[inv] == nil then cached[inv] = 0 end
								if cached[inv] >= 6 then return end
								cached[inv] = cached[inv] + 1
								task.delay(1, function() cached[inv] = cached[inv] - 1 end)
								funny(item)
							end)
						end
					end)
				end)
				for i2,inv in pairs(game:GetService("CollectionService"):GetTagged("inventory-entity")) do 
					spawn(function()
						local invitem = inv:WaitForChild("HandInvItem")
						local funny
						task.wait(0.2)
						for i,v in pairs(getconnections(invitem.Changed)) do 
							funny = v.Function
							v:Disable()
						end
						if funny then
							invitem.Changed:connect(function(item)
								if cached[inv] == nil then cached[inv] = 0 end
								if cached[inv] >= 6 then return end
								cached[inv] = cached[inv] + 1
								task.delay(1, function() cached[inv] = cached[inv] - 1 end)
								funny(item)
							end)
						end
					end)
				end
			end
		end
	})

	local Crasher = {["Enabled"] = false}
	local CrasherAutoEnable = {["Enabled"] = false}
	local oldcrash
	local oldplay
	Crasher = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
		["Name"] = "ClientCrasher",
		["Function"] = function(callback)
			if callback then
				oldcrash = bedwars["GameAnimationUtil"].playAnimation
				oldplay = bedwars["SoundManager"].playSound
				bedwars["GameAnimationUtil"].playAnimation = function(lplr, anim, ...)
					if anim == bedwars["AnimationType"].EQUIP_1 then 
						return
					end
					return oldcrash(lplr, anim, ...)
				end
				bedwars["SoundManager"].playSound = function(self, num, ...)
					if num == bedwars["SoundList"].EQUIP_DEFAULT or num == bedwars["SoundList"].EQUIP_SWORD or num == bedwars["SoundList"].EQUIP_BOW then 
						return
					end
					return oldplay(self, num, ...)	
				end
				local remote = bedwars["ClientHandler"]:Get(bedwars["EquipItemRemote"])["instance"]
				local slowmode = false
				local suc 
				task.spawn(function()
					repeat
						task.wait(slowmode and 2 or 15)
						slowmode = not slowmode
					until (not Crasher["Enabled"])
				end)
				task.spawn(function()
					repeat
						task.wait(0.2)
						suc = pcall(function()
							local inv = lplr.Character.InventoryFolder.Value:GetChildren()
							local item = inv[1]
							local item2 = inv[2]
							if item then
								task.spawn(function()
									for i = 1, (slowmode and 0 or 35) do
										game:GetService("RunService").Heartbeat:Wait()
										task.spawn(function() 
											remote:InvokeServer({
												hand = item
											})
										end)
										task.spawn(function() 
											remote:InvokeServer({
												hand = item2 or false
											})
										end)
									end
								end)
							end
						end)
					until (not Crasher["Enabled"])
				end)
			else
				bedwars["GameAnimationUtil"].playAnimation = oldcrash
				bedwars["SoundManager"].playSound = oldplay
				slowmode = false
			end
		end
	})
end)
