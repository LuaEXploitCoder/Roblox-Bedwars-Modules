-- Corrade Private Development By Corrade#4385
-- BedWars
loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main//CustomModules/6872274481.lua",true))()

game.StarterGui:SetCore("ChatMakeSystemMessage",  { Text = "[CORRADE PRIVATE] Update Log:", Color = Color3.fromRGB(123, 0, 123), Font = Enum.Font.Merriweather, FontSize = Enum.FontSize.Size24 } )
game.StarterGui:SetCore("ChatMakeSystemMessage",  { Text = "[CORRADE PRIVATE] Added Notifications", Color = Color3.fromRGB(0, 255, 255), Font = Enum.Font.Merriweather, FontSize = Enum.FontSize.Size24 } )
game.StarterGui:SetCore("ChatMakeSystemMessage",  { Text = "[CORRADE PRIVATE] Added BedTP", Color = Color3.fromRGB(0, 255, 255), Font = Enum.Font.Merriweather, FontSize = Enum.FontSize.Size24 } )
game.StarterGui:SetCore("ChatMakeSystemMessage",  { Text = "[CORRADE PRIVATE] Redesigned FPS & Ping Tracker", Color = Color3.fromRGB(0, 255, 255), Font = Enum.Font.Merriweather, FontSize = Enum.FontSize.Size24 } )
game.StarterGui:SetCore("ChatMakeSystemMessage",  { Text = "[CORRADE PRIVATE] Made a New Whitelist", Color = Color3.fromRGB(0, 255, 255), Font = Enum.Font.Merriweather, FontSize = Enum.FontSize.Size24 } )
game.StarterGui:SetCore("ChatMakeSystemMessage",  { Text = "[CORRADE PRIVATE] + More", Color = Color3.fromRGB(0, 255, 255), Font = Enum.Font.Merriweather, FontSize = Enum.FontSize.Size24 } )

local GuiLibrary = shared.GuiLibrary
local players = game:GetService("Players")
local textservice = game:GetService("TextService")
local repstorage = game:GetService("ReplicatedStorage")
local lplr = players.LocalPlayer
local lighting = game:GetService("Lighting")
local cam = workspace.CurrentCamera
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	cam = (workspace.CurrentCamera or workspace:FindFirstChild("Camera") or Instance.new("Camera"))
end)
local targetinfo = shared.VapeTargetInfo
local collectionservice = game:GetService("CollectionService")
local uis = game:GetService("UserInputService")
local mouse = lplr:GetMouse()
local bedwars = {}
local bedwarsblocks = {}
local blockraycast = RaycastParams.new()
blockraycast.FilterType = Enum.RaycastFilterType.Whitelist
local getfunctions
local oldchar
local oldcloneroot
local matchState = 0
local kit = ""
local antivoidypos = 0
local kills = 0
local beds = 0
local reported = 0
local lagbacks = 0
local otherlagbacks = 0
local matchstatetick = 0
local lagbackevent = Instance.new("BindableEvent")
local allowspeed = true
local antivoiding = false
local textchatservice = game:GetService("TextChatService")
local bettergetfocus = function()
	if KRNL_LOADED then
		-- krnl is so garbage, you literally cannot detect focused textbox with UIS
		if game:GetService("StarterGui"):GetCoreGuiEnabled(Enum.CoreGuiType.Chat) then
			if textchatservice and textchatservice.ChatVersion == Enum.ChatVersion.TextChatService then
				return ((game:GetService("CoreGui").ExperienceChat.appLayout.chatInputBar.Background.Container.TextContainer.TextBoxContainer.TextBox:IsFocused() or searchbar:IsFocused()) and true or nil)
			else
				return ((game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar:IsFocused() or searchbar:IsFocused()) and true or nil) 
			end
		end
	end
	return game:GetService("UserInputService"):GetFocusedTextBox()
end
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
local queueteleport = syn and syn.queue_on_teleport or queue_on_teleport
local getasset = getsynasset or getcustomasset or function(location) return "rbxasset://"..location end
local storedshahashes = {}
local blocktable
local inventories = {}
local currentinventory = {
	["inventory"] = {
		["items"] = {},
		["armor"] = {},
		["hand"] = nil
	}
}
local Reach = {["Enabled"] = false}
local Killaura = {["Enabled"] = false}
local flyspeed = {["Value"] = 40}
local nobob = {["Enabled"] = false}
local AnticheatBypass = {["Enabled"] = false}
local AnticheatBypassCombatCheck = {["Enabled"] = false}
local combatcheck = false
local combatchecktick = tick()
local disabletpcheck = false
local queueType = "bedwars_test"
local FastConsume = {["Enabled"] = false}
local oldchanneltab
local oldchannelfunc
local oldchanneltabs = {}
local connectionstodisconnect = {}
local anticheatfunnyyes = false
local tpstring
local networkownertick = tick()
local networkownerfunc = isnetworkowner or function(part)
	if gethiddenproperty(part, "NetworkOwnershipRule") == Enum.NetworkOwnership.Manual then 
		sethiddenproperty(part, "NetworkOwnershipRule", Enum.NetworkOwnership.Automatic)
		networkownertick = tick() + 8
	end
	return networkownertick <= tick()
end
local uninjectflag = false
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
local entity = shared.vapeentity
local WhitelistFunctions = shared.vapewhitelist
local AnticheatBypassNumbers = {
	TPSpeed = 0.1,
	TPCombat = 0.3,
	TPLerp = 0.39,
	TPCheck = 15
}

local RunLoops = {RenderStepTable = {}, StepTable = {}, HeartTable = {}}
do
	function RunLoops:BindToRenderStep(name, num, func)
		if RunLoops.RenderStepTable[name] == nil then
			RunLoops.RenderStepTable[name] = game:GetService("RunService").RenderStepped:Connect(func)
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
			RunLoops.StepTable[name] = game:GetService("RunService").Stepped:Connect(func)
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
			RunLoops.HeartTable[name] = game:GetService("RunService").Heartbeat:Connect(func)
		end
	end

	function RunLoops:UnbindFromHeartbeat(name)
		if RunLoops.HeartTable[name] then
			RunLoops.HeartTable[name]:Disconnect()
			RunLoops.HeartTable[name] = nil
		end
	end
end

--skidded off the devforum because I hate projectile math
-- Compute 2D launch angle
-- v: launch velocity
-- g: gravity (positive) e.g. 196.2
-- d: horizontal distance
-- h: vertical distance
-- higherArc: if true, use the higher arc. If false, use the lower arc.
local function LaunchAngle(v: number, g: number, d: number, h: number, higherArc: boolean)
	local v2 = v * v
	local v4 = v2 * v2
	local root = math.sqrt(v4 - g*(g*d*d + 2*h*v2))
	if not higherArc then root = -root end
	return math.atan((v2 + root) / (g * d))
end

-- Compute 3D launch direction from
-- start: start position
-- target: target position
-- v: launch velocity
-- g: gravity (positive) e.g. 196.2
-- higherArc: if true, use the higher arc. If false, use the lower arc.
local function LaunchDirection(start, target, v, g, higherArc: boolean)
	-- get the direction flattened:
	local horizontal = Vector3.new(target.X - start.X, 0, target.Z - start.Z)
	
	local h = target.Y - start.Y
	local d = horizontal.Magnitude
	local a = LaunchAngle(v, g, d, h, higherArc)
	
	-- NaN ~= NaN, computation couldn't be done (e.g. because it's too far to launch)
	if a ~= a then return nil end
	
	-- speed if we were just launching at a flat angle:
	local vec = horizontal.Unit * v
	
	-- rotate around the axis perpendicular to that direction...
	local rotAxis = Vector3.new(-horizontal.Z, 0, horizontal.X)
	
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
	
	return Vector3.new(goalX, goalY, goalZ)
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

runcode(function()
	local textlabel = Instance.new("TextLabel")
	textlabel.Size = UDim2.new(1, 0, 0, 36)
	textlabel.Text = "Moderators can ban you at any time, Always use alts."
	textlabel.BackgroundTransparency = 1
	textlabel.ZIndex = 10
	textlabel.TextStrokeTransparency = 0
	textlabel.TextScaled = true
	textlabel.Font = Enum.Font.SourceSans
	textlabel.TextColor3 = Color3.new(1, 1, 1)
	textlabel.Position = UDim2.new(0, 0, 0, -36)
	textlabel.Parent = GuiLibrary["MainGui"].ScaledGui.ClickGui
	task.spawn(function()
		repeat task.wait() until matchState ~= 0
		textlabel:Remove()
	end)
end)

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

local function CreateAutoHotbarGUI(children2, argstable)
	local buttonapi = {}
	buttonapi["Hotbars"] = {}
	buttonapi["CurrentlySelected"] = 1
	local currentanim
	local amount = #children2:GetChildren()
	local sortableitems = {
		{itemType = "swords", itemDisplayType = "diamond_sword"},
		{itemType = "pickaxes", itemDisplayType = "diamond_pickaxe"},
		{itemType = "axes", itemDisplayType = "diamond_axe"},
		{itemType = "shears", itemDisplayType = "shears"},
		{itemType = "wool", itemDisplayType = "wool_white"},
		{itemType = "iron", itemDisplayType = "iron"},
		{itemType = "diamond", itemDisplayType = "diamond"},
		{itemType = "emerald", itemDisplayType = "emerald"},
		{itemType = "bows", itemDisplayType = "wood_bow"},
	}
	local items = bedwars["ItemTable"]
	if items then
		for i2,v2 in pairs(items) do
			if (i2:find("axe") == nil or i2:find("void")) and i2:find("bow") == nil and i2:find("shears") == nil and i2:find("wool") == nil and v2.sword == nil and v2.armor == nil and v2["dontGiveItem"] == nil and bedwars["ItemTable"][i2] and bedwars["ItemTable"][i2].image then
				table.insert(sortableitems, {itemType = i2, itemDisplayType = i2})
			end
		end
	end
	local buttontext = Instance.new("TextButton")
	buttontext.AutoButtonColor = false
	buttontext.BackgroundTransparency = 1
	buttontext.Name = "ButtonText"
	buttontext.Text = ""
	buttontext.Name = argstable["Name"]
	buttontext.LayoutOrder = 1
	buttontext.Size = UDim2.new(1, 0, 0, 40)
	buttontext.Active = false
	buttontext.TextColor3 = Color3.fromRGB(162, 162, 162)
	buttontext.TextSize = 17
	buttontext.Font = Enum.Font.SourceSans
	buttontext.Position = UDim2.new(0, 0, 0, 0)
	buttontext.Parent = children2
	local toggleframe2 = Instance.new("Frame")
	toggleframe2.Size = UDim2.new(0, 200, 0, 31)
	toggleframe2.Position = UDim2.new(0, 10, 0, 4)
	toggleframe2.BackgroundColor3 = Color3.fromRGB(38, 37, 38)
	toggleframe2.Name = "ToggleFrame2"
	toggleframe2.Parent = buttontext
	local toggleframe1 = Instance.new("Frame")
	toggleframe1.Size = UDim2.new(0, 198, 0, 29)
	toggleframe1.BackgroundColor3 = Color3.fromRGB(26, 25, 26)
	toggleframe1.BorderSizePixel = 0
	toggleframe1.Name = "ToggleFrame1"
	toggleframe1.Position = UDim2.new(0, 1, 0, 1)
	toggleframe1.Parent = toggleframe2
	local addbutton = Instance.new("ImageLabel")
	addbutton.BackgroundTransparency = 1
	addbutton.Name = "AddButton"
	addbutton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	addbutton.Position = UDim2.new(0, 93, 0, 9)
	addbutton.Size = UDim2.new(0, 12, 0, 12)
	addbutton.ImageColor3 = Color3.fromRGB(5, 133, 104)
	addbutton.Image = getcustomassetfunc("vape/assets/AddItem.png")
	addbutton.Parent = toggleframe1
	local children3 = Instance.new("Frame")
	children3.Name = argstable["Name"].."Children"
	children3.BackgroundTransparency = 1
	children3.LayoutOrder = amount
	children3.Size = UDim2.new(0, 220, 0, 0)
	children3.Parent = children2
	local uilistlayout = Instance.new("UIListLayout")
	uilistlayout.Parent = children3
	uilistlayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		children3.Size = UDim2.new(1, 0, 0, uilistlayout.AbsoluteContentSize.Y)
	end)
	local uicorner = Instance.new("UICorner")
	uicorner.CornerRadius = UDim.new(0, 5)
	uicorner.Parent = toggleframe1
	local uicorner2 = Instance.new("UICorner")
	uicorner2.CornerRadius = UDim.new(0, 5)
	uicorner2.Parent = toggleframe2
	buttontext.MouseEnter:Connect(function()
		game:GetService("TweenService"):Create(toggleframe2, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {BackgroundColor3 = Color3.fromRGB(79, 78, 79)}):Play()
	end)
	buttontext.MouseLeave:Connect(function()
		game:GetService("TweenService"):Create(toggleframe2, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {BackgroundColor3 = Color3.fromRGB(38, 37, 38)}):Play()
	end)
	local ItemListBigFrame = Instance.new("Frame")
	ItemListBigFrame.Size = UDim2.new(1, 0, 1, 0)
	ItemListBigFrame.Name = "ItemList"
	ItemListBigFrame.BackgroundTransparency = 1
	ItemListBigFrame.Visible = false
	ItemListBigFrame.Parent = GuiLibrary["MainGui"]
	local ItemListFrame = Instance.new("Frame")
	ItemListFrame.Size = UDim2.new(0, 660, 0, 445)
	ItemListFrame.Position = UDim2.new(0.5, -330, 0.5, -223)
	ItemListFrame.BackgroundColor3 = Color3.fromRGB(26, 25, 26)
	ItemListFrame.Parent = ItemListBigFrame
	local ItemListExitButton = Instance.new("ImageButton")
	ItemListExitButton.Name = "ItemListExitButton"
	ItemListExitButton.ImageColor3 = Color3.fromRGB(121, 121, 121)
	ItemListExitButton.Size = UDim2.new(0, 24, 0, 24)
	ItemListExitButton.AutoButtonColor = false
	ItemListExitButton.Image = getcustomassetfunc("vape/assets/ExitIcon1.png")
	ItemListExitButton.Visible = true
	ItemListExitButton.Position = UDim2.new(1, -31, 0, 8)
	ItemListExitButton.BackgroundColor3 = Color3.fromRGB(26, 25, 26)
	ItemListExitButton.Parent = ItemListFrame
	local ItemListExitButtonround = Instance.new("UICorner")
	ItemListExitButtonround.CornerRadius = UDim.new(0, 16)
	ItemListExitButtonround.Parent = ItemListExitButton
	ItemListExitButton.MouseEnter:Connect(function()
		game:GetService("TweenService"):Create(ItemListExitButton, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {BackgroundColor3 = Color3.fromRGB(60, 60, 60), ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
	end)
	ItemListExitButton.MouseLeave:Connect(function()
		game:GetService("TweenService"):Create(ItemListExitButton, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {BackgroundColor3 = Color3.fromRGB(26, 25, 26), ImageColor3 = Color3.fromRGB(121, 121, 121)}):Play()
	end)
	ItemListExitButton.MouseButton1Click:Connect(function()
		ItemListBigFrame.Visible = false
		GuiLibrary["MainGui"].ScaledGui.ClickGui.Visible = true
	end)
	local ItemListFrameShadow = Instance.new("ImageLabel")
	ItemListFrameShadow.AnchorPoint = Vector2.new(0.5, 0.5)
	ItemListFrameShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	ItemListFrameShadow.Image = getcustomassetfunc("vape/assets/WindowBlur.png")
	ItemListFrameShadow.BackgroundTransparency = 1
	ItemListFrameShadow.ZIndex = -1
	ItemListFrameShadow.Size = UDim2.new(1, 6, 1, 6)
	ItemListFrameShadow.ImageColor3 = Color3.new(0, 0, 0)
	ItemListFrameShadow.ScaleType = Enum.ScaleType.Slice
	ItemListFrameShadow.SliceCenter = Rect.new(10, 10, 118, 118)
	ItemListFrameShadow.Parent = ItemListFrame
	local ItemListFrameText = Instance.new("TextLabel")
	ItemListFrameText.Size = UDim2.new(1, 0, 0, 41)
	ItemListFrameText.BackgroundTransparency = 1
	ItemListFrameText.Name = "WindowTitle"
	ItemListFrameText.Position = UDim2.new(0, 0, 0, 0)
	ItemListFrameText.TextXAlignment = Enum.TextXAlignment.Left
	ItemListFrameText.Font = Enum.Font.SourceSans
	ItemListFrameText.TextSize = 17
	ItemListFrameText.Text = "    New AutoHotbar"
	ItemListFrameText.TextColor3 = Color3.fromRGB(201, 201, 201)
	ItemListFrameText.Parent = ItemListFrame
	local ItemListBorder1 = Instance.new("Frame")
	ItemListBorder1.BackgroundColor3 = Color3.fromRGB(40, 39, 40)
	ItemListBorder1.BorderSizePixel = 0
	ItemListBorder1.Size = UDim2.new(1, 0, 0, 1)
	ItemListBorder1.Position = UDim2.new(0, 0, 0, 41)
	ItemListBorder1.Parent = ItemListFrame
	local ItemListFrameCorner = Instance.new("UICorner")
	ItemListFrameCorner.CornerRadius = UDim.new(0, 4)
	ItemListFrameCorner.Parent = ItemListFrame
	local ItemListFrame1 = Instance.new("Frame")
	ItemListFrame1.Size = UDim2.new(0, 112, 0, 113)
	ItemListFrame1.Position = UDim2.new(0, 10, 0, 71)
	ItemListFrame1.BackgroundColor3 = Color3.fromRGB(38, 37, 38)
	ItemListFrame1.Name = "ItemListFrame1"
	ItemListFrame1.Parent = ItemListFrame
	local ItemListFrame2 = Instance.new("Frame")
	ItemListFrame2.Size = UDim2.new(0, 110, 0, 111)
	ItemListFrame2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	ItemListFrame2.BorderSizePixel = 0
	ItemListFrame2.Name = "ItemListFrame2"
	ItemListFrame2.Position = UDim2.new(0, 1, 0, 1)
	ItemListFrame2.Parent = ItemListFrame1
	local ItemListFramePicker = Instance.new("ScrollingFrame")
	ItemListFramePicker.Size = UDim2.new(0, 495, 0, 220)
	ItemListFramePicker.Position = UDim2.new(0, 144, 0, 122)
	ItemListFramePicker.BorderSizePixel = 0
	ItemListFramePicker.ScrollBarThickness = 3
	ItemListFramePicker.ScrollBarImageTransparency = 0.8
	ItemListFramePicker.VerticalScrollBarInset = Enum.ScrollBarInset.None
	ItemListFramePicker.BackgroundTransparency = 1
	ItemListFramePicker.Parent = ItemListFrame
	local ItemListFramePickerGrid = Instance.new("UIGridLayout")
	ItemListFramePickerGrid.CellPadding = UDim2.new(0, 4, 0, 3)
	ItemListFramePickerGrid.CellSize = UDim2.new(0, 51, 0, 52)
	ItemListFramePickerGrid.Parent = ItemListFramePicker
	ItemListFramePickerGrid:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		ItemListFramePicker.CanvasSize = UDim2.new(0, 0, 0, ItemListFramePickerGrid.AbsoluteContentSize.Y * (1 / GuiLibrary["MainRescale"].Scale))
	end)
	local ItemListcorner = Instance.new("UICorner")
	ItemListcorner.CornerRadius = UDim.new(0, 5)
	ItemListcorner.Parent = ItemListFrame1
	local ItemListcorner2 = Instance.new("UICorner")
	ItemListcorner2.CornerRadius = UDim.new(0, 5)
	ItemListcorner2.Parent = ItemListFrame2
	local selectedslot = 1
	local hoveredslot = 0
	
	local refreshslots
	local refreshList
	refreshslots = function()
		local startnum = 144
		local oldhovered = hoveredslot
		for i2,v2 in pairs(ItemListFrame:GetChildren()) do
			if v2.Name:find("ItemSlot") then
				v2:Remove()
			end
		end
		for i3,v3 in pairs(ItemListFramePicker:GetChildren()) do
			if v3:IsA("TextButton") then
				v3:Remove()
			end
		end
		for i4,v4 in pairs(sortableitems) do
			local ItemFrame = Instance.new("TextButton")
			ItemFrame.Text = ""
			ItemFrame.BackgroundColor3 = Color3.fromRGB(31, 30, 31)
			ItemFrame.Parent = ItemListFramePicker
			ItemFrame.AutoButtonColor = false
			local ItemFrameIcon = Instance.new("ImageLabel")
			ItemFrameIcon.Size = UDim2.new(0, 32, 0, 32)
			ItemFrameIcon.Image = bedwars["getIcon"]({itemType = v4.itemDisplayType}, true) 
			ItemFrameIcon.ResampleMode = (bedwars["getIcon"]({itemType = v4.itemDisplayType}, true):find("rbxasset://") and Enum.ResamplerMode.Pixelated or Enum.ResamplerMode.Default)
			ItemFrameIcon.Position = UDim2.new(0, 10, 0, 10)
			ItemFrameIcon.BackgroundTransparency = 1
			ItemFrameIcon.Parent = ItemFrame
			local ItemFramecorner = Instance.new("UICorner")
			ItemFramecorner.CornerRadius = UDim.new(0, 5)
			ItemFramecorner.Parent = ItemFrame
			ItemFrame.MouseButton1Click:Connect(function()
				for i5,v5 in pairs(buttonapi["Hotbars"][buttonapi["CurrentlySelected"]]["Items"]) do
					if v5.itemType == v4.itemType then
						buttonapi["Hotbars"][buttonapi["CurrentlySelected"]]["Items"][tostring(i5)] = nil
					end
				end
				buttonapi["Hotbars"][buttonapi["CurrentlySelected"]]["Items"][tostring(selectedslot)] = v4
				refreshslots()
				refreshList()
			end)
		end
		for i = 1, 9 do
			local item = buttonapi["Hotbars"][buttonapi["CurrentlySelected"]]["Items"][tostring(i)]
			local ItemListFrame3 = Instance.new("Frame")
			ItemListFrame3.Size = UDim2.new(0, 55, 0, 56)
			ItemListFrame3.Position = UDim2.new(0, startnum - 2, 0, 380)
			ItemListFrame3.BackgroundTransparency = (selectedslot == i and 0 or 1)
			ItemListFrame3.BackgroundColor3 = Color3.fromRGB(35, 34, 35)
			ItemListFrame3.Name = "ItemSlot"
			ItemListFrame3.Parent = ItemListFrame
			local ItemListFrame4 = Instance.new("TextButton")
			ItemListFrame4.Size = UDim2.new(0, 51, 0, 52)
			ItemListFrame4.BackgroundColor3 = (oldhovered == i and Color3.fromRGB(31, 30, 31) or Color3.fromRGB(20, 20, 20))
			ItemListFrame4.BorderSizePixel = 0
			ItemListFrame4.AutoButtonColor = false
			ItemListFrame4.Text = ""
			ItemListFrame4.Name = "ItemListFrame4"
			ItemListFrame4.Position = UDim2.new(0, 2, 0, 2)
			ItemListFrame4.Parent = ItemListFrame3
			local ItemListImage = Instance.new("ImageLabel")
			ItemListImage.Size = UDim2.new(0, 32, 0, 32)
			ItemListImage.BackgroundTransparency = 1
			local img = (item and bedwars["getIcon"]({itemType = item.itemDisplayType}, true) or "")
			ItemListImage.Image = img
			ItemListImage.ResampleMode = (img:find("rbxasset://") and Enum.ResamplerMode.Pixelated or Enum.ResamplerMode.Default)
			ItemListImage.Position = UDim2.new(0, 10, 0, 10)
			ItemListImage.Parent = ItemListFrame4
			local ItemListcorner3 = Instance.new("UICorner")
			ItemListcorner3.CornerRadius = UDim.new(0, 5)
			ItemListcorner3.Parent = ItemListFrame3
			local ItemListcorner4 = Instance.new("UICorner")
			ItemListcorner4.CornerRadius = UDim.new(0, 5)
			ItemListcorner4.Parent = ItemListFrame4
			ItemListFrame4.MouseEnter:Connect(function()
				ItemListFrame4.BackgroundColor3 = Color3.fromRGB(31, 30, 31)
				hoveredslot = i
			end)
			ItemListFrame4.MouseLeave:Connect(function()
				ItemListFrame4.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
				hoveredslot = 0
			end)
			ItemListFrame4.MouseButton1Click:Connect(function()
				selectedslot = i
				refreshslots()
			end)
			ItemListFrame4.MouseButton2Click:Connect(function()
				buttonapi["Hotbars"][buttonapi["CurrentlySelected"]]["Items"][tostring(i)] = nil
				refreshslots()
				refreshList()
			end)
			startnum = startnum + 55
		end
	end	

	local function createHotbarButton(num, items)
		num = tonumber(num) or #buttonapi["Hotbars"] + 1
		local hotbarbutton = Instance.new("TextButton")
		hotbarbutton.Size = UDim2.new(1, 0, 0, 30)
		hotbarbutton.BackgroundTransparency = 1
		hotbarbutton.LayoutOrder = num
		hotbarbutton.AutoButtonColor = false
		hotbarbutton.Text = ""
		hotbarbutton.Parent = children3
		buttonapi["Hotbars"][num] = {["Items"] = items or {}, ["Object"] = hotbarbutton, ["Number"] = num}
		local hotbarframe = Instance.new("Frame")
		hotbarframe.BackgroundColor3 = (num == buttonapi["CurrentlySelected"] and Color3.fromRGB(54, 53, 54) or Color3.fromRGB(31, 30, 31))
		hotbarframe.Size = UDim2.new(0, 200, 0, 27)
		hotbarframe.Position = UDim2.new(0, 10, 0, 1)
		hotbarframe.Parent = hotbarbutton
		local uicorner3 = Instance.new("UICorner")
		uicorner3.CornerRadius = UDim.new(0, 5)
		uicorner3.Parent = hotbarframe
		local startpos = 11
		for i = 1, 9 do
			local item = buttonapi["Hotbars"][num]["Items"][tostring(i)]
			local hotbarbox = Instance.new("ImageLabel")
			hotbarbox.Name = i
			hotbarbox.Size = UDim2.new(0, 17, 0, 18)
			hotbarbox.Position = UDim2.new(0, startpos, 0, 5)
			hotbarbox.BorderSizePixel = 0
			hotbarbox.Image = (item and bedwars["getIcon"]({itemType = item.itemDisplayType}, true) or "")
			hotbarbox.ResampleMode = ((item and bedwars["getIcon"]({itemType = item.itemDisplayType}, true) or ""):find("rbxasset://") and Enum.ResamplerMode.Pixelated or Enum.ResamplerMode.Default)
			hotbarbox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
			hotbarbox.Parent = hotbarframe
			startpos = startpos + 18
		end
		hotbarbutton.MouseButton1Click:Connect(function()
			if buttonapi["CurrentlySelected"] == num then
				ItemListBigFrame.Visible = true
				GuiLibrary["MainGui"].ScaledGui.ClickGui.Visible = false
				refreshslots()
			end
			buttonapi["CurrentlySelected"] = num
			refreshList()
		end)
		hotbarbutton.MouseButton2Click:Connect(function()
			if buttonapi["CurrentlySelected"] == num then
				buttonapi["CurrentlySelected"] = (num == 2 and 0 or 1)
			end
			table.remove(buttonapi["Hotbars"], num)
			refreshList()
		end)
	end

	refreshList = function()
		local newnum = 0
		local newtab = {}
		for i3,v3 in pairs(buttonapi["Hotbars"]) do
			newnum = newnum + 1
			newtab[newnum] = v3
		end
		buttonapi["Hotbars"] = newtab
		for i,v in pairs(children3:GetChildren()) do
			if v:IsA("TextButton") then
				v:Remove()
			end
		end
		for i2,v2 in pairs(buttonapi["Hotbars"]) do
			createHotbarButton(i2, v2["Items"])
		end
		GuiLibrary["Settings"][children2.Name..argstable["Name"].."ItemList"] = {["Type"] = "ItemList", ["Items"] = buttonapi["Hotbars"], ["CurrentlySelected"] = buttonapi["CurrentlySelected"]}
	end
	buttonapi["RefreshList"] = refreshList

	buttontext.MouseButton1Click:Connect(function()
		createHotbarButton()
	end)

	GuiLibrary["Settings"][children2.Name..argstable["Name"].."ItemList"] = {["Type"] = "ItemList", ["Items"] = buttonapi["Hotbars"], ["CurrentlySelected"] = buttonapi["CurrentlySelected"]}
	GuiLibrary["ObjectsThatCanBeSaved"][children2.Name..argstable["Name"].."ItemList"] = {["Type"] = "ItemList", ["Items"] = buttonapi["Hotbars"], ["Api"] = buttonapi, ["Object"] = buttontext}

	return buttonapi
end

GuiLibrary["LoadSettingsEvent"].Event:Connect(function(res)
	for i,v in pairs(res) do
		local obj = GuiLibrary["ObjectsThatCanBeSaved"][i]
		if obj and v["Type"] == "ItemList" and obj.Api then
			obj["Api"]["Hotbars"] = v["Items"]
			obj["Api"]["CurrentlySelected"] = v["CurrentlySelected"]
			obj["Api"]["RefreshList"]()
		end
	end
end)

local function createwarning(title, text, delay)
	local suc, res = pcall(function()
		local frame = GuiLibrary["CreateNotification"](title, text, delay, "assets/WarningNotification.png")
		frame.Frame.Frame.ImageColor3 = Color3.fromRGB(236, 129, 44)
		return frame
	end)
	return (suc and res)
end

local function getItemNear(itemName, inv)
	for i5, v5 in pairs(inv or currentinventory.inventory.items) do
		if v5.itemType:find(itemName) then
			return v5, i5
		end
	end
	return nil
end

local function getItem(itemName, inv)
	for i5, v5 in pairs(inv or currentinventory.inventory.items) do
		if v5.itemType == itemName then
			return v5, i5
		end
	end
	return nil
end

local function getHotbarSlot(itemName)
	for i5, v5 in pairs(currentinventory.hotbar) do
		if v5["item"] and v5["item"].itemType == itemName then
			return i5 - 1
		end
	end
	return nil
end

local function getSword()
	local bestsword, bestswordslot, bestswordnum = nil, nil, 0
	for i5, v5 in pairs(currentinventory.inventory.items) do
		if bedwars["ItemTable"][v5.itemType]["sword"] then
			local swordrank = bedwars["ItemTable"][v5.itemType]["sword"]["damage"] or 0
			if swordrank > bestswordnum then
				bestswordnum = swordrank
				bestswordslot = i5
				bestsword = v5
			end
		end
	end
	return bestsword, bestswordslot
end

local function getBlock()
	for i5, v5 in pairs(currentinventory.inventory.items) do
		if bedwars["ItemTable"][v5.itemType]["block"] then
			return v5.itemType, v5.amount
		end
	end
	return
end

local function getSlotFromItem(item)
	for i,v in pairs(currentinventory.inventory.items) do
		if v.itemType == item.itemType then
			return i
		end
	end
	return nil
end

local function getShield(char)
	local shield = 0
	for i,v in pairs(char:GetAttributes()) do 
		if i:find("Shield") and type(v) == "number" then 
			shield = shield + v
		end
	end
	return shield
end

local function getAxe()
	local bestsword, bestswordslot, bestswordnum = nil, nil, 0
	for i5, v5 in pairs(currentinventory.inventory.items) do
		if v5.itemType:find("axe") and v5.itemType:find("pickaxe") == nil and v5.itemType:find("void") == nil then
			bestswordnum = swordrank
			bestswordslot = i5
			bestsword = v5
		end
	end
	return bestsword, bestswordslot
end

local function getPickaxe()
	return getItemNear("pick")
end

local function getBaguette()
	return getItemNear("baguette")
end

local function getwool()
	local wool = getItemNear("wool")
	return wool and wool.itemType, wool and wool.amount
end

local function isAliveOld(plr, alivecheck)
	if plr then
		return plr and plr.Character and plr.Character.Parent ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Head") and plr.Character:FindFirstChild("Humanoid")
	end
	return entity.isAlive
end

local function isAlive(plr, alivecheck)
	if plr then
		local ind, tab = entity.getEntityFromPlayer(plr)
		return ((not alivecheck) or tab and tab.Humanoid:GetState() ~= Enum.HumanoidStateType.Dead) and tab
	end
	return entity.isAlive
end

local function hashvec(vec)
	return {
		["value"] = vec
	}
end

local function getremote(tab)
	for i,v in pairs(tab) do
		if v == "Client" then
			return tab[i + 1]
		end
	end
	return ""
end

local function betterfind(tab, obj)
	for i,v in pairs(tab) do
		if v == obj or type(v) == "table" and v.hash == obj then
			return v
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

local function getWhitelistedBed(bed)
	for i,v in pairs(players:GetPlayers()) do
		if v:GetAttribute("Team") and bed and bed:GetAttribute("Team"..v:GetAttribute("Team").."NoBreak") and WhitelistFunctions:CheckWhitelisted(v) then
			return true
		end
	end
	return false
end

local OldClientGet 
local oldbreakremote
local oldbob
local localserverpos
local globalgroundtouchedtime = tick()
local otherserverpos = {}
runcode(function()
    getfunctions = function()
		local Flamework = require(repstorage["rbxts_include"]["node_modules"]["@flamework"].core.out).Flamework
        local KnitGotten, KnitClient
		repeat
			task.wait()
			KnitGotten, KnitClient = pcall(function()
				return debug.getupvalue(require(lplr.PlayerScripts.TS.knit).setup, 6)
			end)
		until KnitGotten
		repeat task.wait() until debug.getupvalue(KnitClient.Start, 1) == true
        local Client = require(repstorage.TS.remotes).default.Client
        local InventoryUtil = require(repstorage.TS.inventory["inventory-util"]).InventoryUtil
        OldClientGet = getmetatable(Client).Get
        getmetatable(Client).Get = function(Self, remotename)
			if uninjectflag then return OldClientGet(Self, remotename) end
			local res = OldClientGet(Self, remotename)
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
							if Reach["Enabled"] then
								local selfcheck = localserverpos or tab.validate.selfPosition.value
								if (selfcheck - (otherserverpos[plr] or tab.validate.targetPosition.value)).Magnitude > 18 then return res:SendToServer(tab) end
								local mag = (tab.validate.selfPosition.value - tab.validate.targetPosition.value).magnitude
								local newres = hashvec(tab.validate.selfPosition.value + (mag > 14.4 and (CFrame.lookAt(tab.validate.selfPosition.value, tab.validate.targetPosition.value).lookVector * 4) or Vector3.zero))
								tab.validate.selfPosition = newres
							end
						end
						return res:SendToServer(tab)
					end
				}
			end
            return res
        end
		bedwars = {
			["AnimationType"] = require(repstorage.TS.animation["animation-type"]).AnimationType,
			["AnimationUtil"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out["shared"].util["animation-util"]).AnimationUtil,
			["AngelUtil"] = require(repstorage.TS.games.bedwars.kit.kits.angel["angel-kit"]),
			["AppController"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out.client.controllers["app-controller"]).AppController,
			["AttackRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.SwordController)["attackEntity"])),
			["BatteryRemote"] = getremote(debug.getconstants(debug.getproto(debug.getproto(KnitClient.Controllers.BatteryController.KnitStart, 1), 1))),
			["BatteryEffectController"] = KnitClient.Controllers.BatteryEffectsController,
            ["BalloonController"] = KnitClient.Controllers.BalloonController,
			["BlockCPSConstants"] = require(repstorage.TS["shared-constants"]).CpsConstants,
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
            ["ClientHandlerDamageBlock"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out.shared.remotes).BlockEngineRemotes.Client,
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
			["LobbyClientEvents"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"].lobby.out.client["lobby-client"]).LobbyClientEvents,
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
			["ReportRemote"] = getremote(debug.getconstants(require(lplr.PlayerScripts.TS.controllers.global.report["report-controller"]).default.reportPlayer)),
            ["RavenTable"] = KnitClient.Controllers.RavenController,
			["RelicController"] = KnitClient.Controllers.RelicVotingController,
			["RespawnController"] = KnitClient.Controllers.BedwarsRespawnController,
			["RespawnTimer"] = require(lplr.PlayerScripts.TS.controllers.games.bedwars.respawn.ui["respawn-timer"]).RespawnTimerWrapper,
			["ResetRemote"] = getremote(debug.getconstants(debug.getproto(KnitClient.Controllers.ResetController.createBindable, 1))),
			["Roact"] = require(repstorage["rbxts_include"]["node_modules"]["@rbxts"]["roact"].src),
			["RuntimeLib"] = require(repstorage["rbxts_include"].RuntimeLib),
            ["Shop"] = require(repstorage.TS.games.bedwars.shop["bedwars-shop"]).BedwarsShop,
			["ShopItems"] = debug.getupvalue(debug.getupvalue(require(repstorage.TS.games.bedwars.shop["bedwars-shop"]).BedwarsShop.getShopItem, 1), 2),
            ["ShopRight"] = require(lplr.PlayerScripts.TS.controllers.games.bedwars.shop.ui["item-shop"]["shop-left"]["shop-left"]).BedwarsItemShopLeft,
			["SpawnRavenRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.RavenController).spawnRaven)),
            ["SoundManager"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out).SoundManager,
			["SoundList"] = require(repstorage.TS.sound["game-sound"]).GameSound,
            ["sprintTable"] = KnitClient.Controllers.SprintController,
			["StopwatchController"] = KnitClient.Controllers.StopwatchController,
            ["SwingSword"] = getmetatable(KnitClient.Controllers.SwordController).swingSwordAtMouse,
            ["SwingSwordRegion"] = getmetatable(KnitClient.Controllers.SwordController).swingSwordInRegion,
            ["SwordController"] = KnitClient.Controllers.SwordController,
            ["TreeRemote"] = getremote(debug.getconstants(debug.getprotos(debug.getprotos(KnitClient.Controllers.BigmanController.KnitStart)[3])[1])),
			["TrinityRemote"] = getremote(debug.getconstants(debug.getproto(getmetatable(KnitClient.Controllers.AngelController).onKitEnabled, 1))),
            ["VictoryScreen"] = require(lplr.PlayerScripts.TS.controllers["game"].match.ui["victory-section"]).VictorySection,
            ["ViewmodelController"] = KnitClient.Controllers.ViewmodelController,
			["VehicleController"] = KnitClient.Controllers.VehicleController,
			["WeldTable"] = require(repstorage.TS.util["weld-util"]).WeldUtil
        }
		oldbob = bedwars["ViewmodelController"]["playAnimation"]
        bedwars["ViewmodelController"]["playAnimation"] = function(Self, id, ...)
            if id == 19 and nobob["Enabled"] and entity.isAlive then
                id = 11
            end
            return oldbob(Self, id, ...)
        end
		blocktable = bedwars["BlockController2"].new(bedwars["BlockEngine"], getwool())
		bedwars["placeBlock"] = function(newpos, customblock)
			if getItem(customblock) then
				blocktable.blockType = customblock
				return blocktable:placeBlock(Vector3.new(newpos.X / 3, newpos.Y / 3, newpos.Z / 3))
			end
		end
		task.spawn(function()
			local postable = {}
			local postable2 = {}
			repeat
				task.wait()
				if entity.isAlive then
					table.insert(postable, entity.character.HumanoidRootPart.Position)
					if #postable > 60 then 
						table.remove(postable, 1)
					end
					localserverpos = postable[46] or entity.character.HumanoidRootPart.Position
					if entity.character.Humanoid.FloorMaterial ~= Enum.Material.Air then 
						globalgroundtouchedtime = tick()
					end
				end
				for i,v in pairs(entity.entityList) do 
					if postable2[v.Player] == nil then 
						postable2[v.Player] = v.RootPart.Position
					end
					otherserverpos[v.Player] = v.RootPart.Position + ((v.RootPart.Position - postable2[v.Player]) * 3)
					postable2[v.Player] = v.RootPart.Position
				end
			until uninjectflag
		end)
		bedwarsblocks = collectionservice:GetTagged("block")
		connectionstodisconnect[#connectionstodisconnect + 1] = collectionservice:GetInstanceAddedSignal("block"):Connect(function(v) table.insert(bedwarsblocks, v) blockraycast.FilterDescendantsInstances = bedwarsblocks end)
		connectionstodisconnect[#connectionstodisconnect + 1] = collectionservice:GetInstanceRemovedSignal("block"):Connect(function(v) local found = table.find(bedwarsblocks, v) if found then table.remove(bedwarsblocks, found) end blockraycast.FilterDescendantsInstances = bedwarsblocks end)
		blockraycast.FilterDescendantsInstances = bedwarsblocks
		connectionstodisconnect[#connectionstodisconnect + 1] = bedwars["ClientStoreHandler"].changed:connect(function(p3, p4)
			if p3.Game ~= p4.Game then 
				matchState = p3.Game.matchState
				queueType = p3.Game.queueType or "bedwars_test"
			end
			if p3.Kit ~= p4.Kit then 	
				bedwars["BountyHunterTarget"] = p3.Kit.bountyHunterTarget
			end
			if p3.Bedwars ~= p4.Bedwars then 
				kit = p3.Bedwars.kit ~= "none" and p3.Bedwars.kit or ""
			end
			if p3.Inventory ~= p4.Inventory then
				currentinventory = p3.Inventory.observedInventory
			end
        end)
		local clientstorestate = bedwars["ClientStoreHandler"]:getState()
        matchState = clientstorestate.Game.matchState or 0
        kit = clientstorestate.Bedwars.kit ~= "none" and clientstorestate.Bedwars.kit or ""
		queueType = clientstorestate.Game.queueType or "bedwars_test"
		currentinventory = clientstorestate.Inventory.observedInventory
		if not shared.vapebypassed then
			local fakeremote = Instance.new("RemoteEvent")
			fakeremote.Name = "GameAnalyticsError"
			local realremote = repstorage:WaitForChild("GameAnalyticsError")
			realremote.Parent = nil
			fakeremote.Parent = repstorage
			game:GetService("ScriptContext").Error:Connect(function(p1, p2, p3)
				if not p3 then
					return;
				end;
				local u2 = nil;
				local v4, v5 = pcall(function()
					u2 = p3:GetFullName();
				end);
				if not v4 then
					return;
				end;
				if p3.Parent == nil then
					return;
				end
				realremote:FireServer(p1, p2, u2);
			end)
			shared.vapebypassed = true
		end

		task.spawn(function()
			local chatsuc, chatres = pcall(function() return game:GetService("HttpService"):JSONDecode(readfile("vape/Profiles/bedwarssettings.json")) end)
			if chatsuc then
				if chatres.crashed and (not chatres.said) then
					pcall(function()
						createwarning("Vape", "either ur poor or its a exploit moment", 10)
						createwarning("Vape", "getconnections crashed, chat hook not loaded.", 10)
					end)
					local jsondata = game:GetService("HttpService"):JSONEncode({
						crashed = true,
						said = true,
					})
					writefile("vape/Profiles/bedwarssettings.json", jsondata)
				end
				if chatres.crashed then
					return nil
				else
					local jsondata = game:GetService("HttpService"):JSONEncode({
						crashed = true,
						said = false,
					})
					writefile("vape/Profiles/bedwarssettings.json", jsondata)
				end
			else
				local jsondata = game:GetService("HttpService"):JSONEncode({
					crashed = true,
					said = false,
				})
				writefile("vape/Profiles/bedwarssettings.json", jsondata)
			end
			repeat task.wait() until WhitelistFunctions.Loaded
			for i3,v3 in pairs(WhitelistFunctions.WhitelistTable.chattags) do
				if v3.NameColor then
					v3.NameColor = Color3.fromRGB(v3.NameColor.r, v3.NameColor.g, v3.NameColor.b)
				end
				if v3.ChatColor then
					v3.ChatColor = Color3.fromRGB(v3.ChatColor.r, v3.ChatColor.g, v3.ChatColor.b)
				end
				if v3.Tags then
					for i4,v4 in pairs(v3.Tags) do
						if v4.TagColor then
							v4.TagColor = Color3.fromRGB(v4.TagColor.r, v4.TagColor.g, v4.TagColor.b)
						end
					end
				end
			end
			if getconnections then 
				for i,v in pairs(getconnections(repstorage.DefaultChatSystemChatEvents.OnNewMessage.OnClientEvent)) do
					if v.Function and #debug.getupvalues(v.Function) > 0 and type(debug.getupvalues(v.Function)[1]) == "table" and getmetatable(debug.getupvalues(v.Function)[1]) and getmetatable(debug.getupvalues(v.Function)[1]).GetChannel then
						oldchanneltab = getmetatable(debug.getupvalues(v.Function)[1])
						oldchannelfunc = getmetatable(debug.getupvalues(v.Function)[1]).GetChannel
						getmetatable(debug.getupvalues(v.Function)[1]).GetChannel = function(Self, Name)
							local tab = oldchannelfunc(Self, Name)
							if tab and tab.AddMessageToChannel then
								local addmessage = tab.AddMessageToChannel
								if oldchanneltabs[tab] == nil then
									oldchanneltabs[tab] = tab.AddMessageToChannel
								end
								tab.AddMessageToChannel = function(Self2, MessageData)
									if MessageData.FromSpeaker and players[MessageData.FromSpeaker] then
										local plrtype = WhitelistFunctions:CheckPlayerType(players[MessageData.FromSpeaker])
										local hash = WhitelistFunctions:Hash(players[MessageData.FromSpeaker].Name..players[MessageData.FromSpeaker].UserId)
										if plrtype == "VAPE PRIVATE" then
											MessageData.ExtraData = {
												NameColor = players[MessageData.FromSpeaker].Team == nil and Color3.new(0, 1, 1) or players[MessageData.FromSpeaker].TeamColor.Color,
												Tags = {
													table.unpack(MessageData.ExtraData.Tags),
													{
														TagColor = Color3.new(0.7, 0, 1),
														TagText = "VAPE PRIVATE"
													}
												}
											}
										end
										if plrtype == "VAPE OWNER" then
											MessageData.ExtraData = {
												NameColor = players[MessageData.FromSpeaker].Team == nil and Color3.new(1, 0, 0) or players[MessageData.FromSpeaker].TeamColor.Color,
												Tags = {
													table.unpack(MessageData.ExtraData.Tags),
													{
														TagColor = Color3.new(1, 0.3, 0.3),
														TagText = "VAPE OWNER"
													}
												}
											}
										end
										if clients.ClientUsers[tostring(players[MessageData.FromSpeaker])] then
											MessageData.ExtraData = {
												NameColor = players[MessageData.FromSpeaker].Team == nil and Color3.new(1, 0, 0) or players[MessageData.FromSpeaker].TeamColor.Color,
												Tags = {
													table.unpack(MessageData.ExtraData.Tags),
													{
														TagColor = Color3.new(1, 1, 0),
														TagText = clients.ClientUsers[tostring(players[MessageData.FromSpeaker])]
													}
												}
											}
										end
										if WhitelistFunctions.WhitelistTable.chattags[hash] then
											local newdata = {
												NameColor = players[MessageData.FromSpeaker].Team == nil and WhitelistFunctions.WhitelistTable.chattags[hash].NameColor or players[MessageData.FromSpeaker].TeamColor.Color,
												Tags = WhitelistFunctions.WhitelistTable.chattags[hash].Tags
											}
											MessageData.ExtraData = newdata
										end
									end
									return addmessage(Self2, MessageData)
								end
							end
							return tab
						end
					end
				end
			end
			local jsondata = game:GetService("HttpService"):JSONEncode({
				crashed = false,
				said = false,
			})
			writefile("vape/Profiles/bedwarssettings.json", jsondata)
		end)
    end
end)

GuiLibrary["SelfDestructEvent"].Event:Connect(function()
	uninjectflag = true
	if OldClientGet then
		getmetatable(bedwars["ClientHandler"]).Get = OldClientGet
	end
	if oldbob then bedwars["ViewmodelController"]["playAnimation"] = oldbob end
	if blocktable then blocktable:disable() end
	if oldchannelfunc and oldchanneltab then oldchanneltab.GetChannel = oldchannelfunc end
	for i2,v2 in pairs(oldchanneltabs) do i2.AddMessageToChannel = v2 end
	for i3,v3 in pairs(connectionstodisconnect) do
		if v3.Disconnect then pcall(function() v3:Disconnect() end) continue end
		if v3.disconnect then pcall(function() v3:disconnect() end) continue end
	end
end)

task.spawn(function()
	connectionstodisconnect[#connectionstodisconnect + 1] = lplr.PlayerGui:WaitForChild("Chat").Frame.ChatChannelParentFrame["Frame_MessageLogDisplay"].Scroller.ChildAdded:Connect(function(text)
		local textlabel2 = text:WaitForChild("TextLabel")
		if WhitelistFunctions:IsSpecialIngame() then
			local args = textlabel2.Text:split(" ")
			local client = clients.ChatStrings1[#args > 0 and args[#args] or tab.Message]
			if textlabel2.Text:find("You are now chatting") or textlabel2.Text:find("You are now privately chatting") then
				text.Size = UDim2.new(0, 0, 0, 0)
				text:GetPropertyChangedSignal("Size"):Connect(function()
					text.Size = UDim2.new(0, 0, 0, 0)
				end)
			end
			if client then
				if textlabel2.Text:find(clients.ChatStrings2[client]) then
					text.Size = UDim2.new(0, 0, 0, 0)
					text:GetPropertyChangedSignal("Size"):Connect(function()
						text.Size = UDim2.new(0, 0, 0, 0)
					end)
				end
			end
			textlabel2:GetPropertyChangedSignal("Text"):Connect(function()
				local args = textlabel2.Text:split(" ")
				local client = clients.ChatStrings1[#args > 0 and args[#args] or tab.Message]
				if textlabel2.Text:find("You are now chatting") or textlabel2.Text:find("You are now privately chatting") then
					text.Size = UDim2.new(0, 0, 0, 0)
					text:GetPropertyChangedSignal("Size"):Connect(function()
						text.Size = UDim2.new(0, 0, 0, 0)
					end)
				end
				if client then
					if textlabel2.Text:find(clients.ChatStrings2[client]) then
						text.Size = UDim2.new(0, 0, 0, 0)
						text:GetPropertyChangedSignal("Size"):Connect(function()
							text.Size = UDim2.new(0, 0, 0, 0)
						end)
					end
				end
			end)
		end
	end)
end)

connectionstodisconnect[#connectionstodisconnect + 1] = lplr.OnTeleport:Connect(function(State)
    if State == Enum.TeleportState.Started then
		local clientstorestate = bedwars["ClientStoreHandler"] and bedwars["ClientStoreHandler"]:getState() or {Party = {members = 0}}
		local queuedstring = ''
		if clientstorestate.Party and clientstorestate.Party.members and #clientstorestate.Party.members > 0 then
        	queuedstring = queuedstring..'shared.vapeteammembers = '..#clientstorestate.Party.members..'\n'
		end
		if tpstring then
			queuedstring = queuedstring..'shared.vapeoverlay = "'..tpstring..'"\n'
		end
		queueteleport(queuedstring)
    end
end)

local function getblock(pos)
	local blockpos = bedwars["BlockController"]:getBlockPosition(pos)
	return bedwars["BlockController"]:getStore():getBlockAt(blockpos), blockpos
end

getfunctions()

local function getNametagString(plr)
	local nametag = ""
	local hash = WhitelistFunctions:Hash(plr.Name..plr.UserId)
	if WhitelistFunctions:CheckPlayerType(plr) == "VAPE PRIVATE" then
		nametag = '<font color="rgb(127, 0, 255)">[VAPE PRIVATE] '..(plr.Name)..'</font>'
	end
	if WhitelistFunctions:CheckPlayerType(plr) == "VAPE OWNER" then
		nametag = '<font color="rgb(255, 80, 80)">[VAPE OWNER] '..(plr.DisplayName or plr.Name)..'</font>'
	end
	if clients.ClientUsers[tostring(plr)] then
		nametag = '<font color="rgb(255, 255, 0)">['..clients.ClientUsers[tostring(plr)]..'] '..(plr.DisplayName or plr.Name)..'</font>'
	end
	if WhitelistFunctions.WhitelistTable.chattags[hash] then
		local data = WhitelistFunctions.WhitelistTable.chattags[hash]
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

local function Cape(char, texture)
	for i,v in pairs(char:GetDescendants()) do
		if v.Name == "Cape" then
			v:Remove()
		end
	end
	local hum = char:WaitForChild("Humanoid")
	local torso = nil
	if hum.RigType == Enum.HumanoidRigType.R15 then
	torso = char:WaitForChild("UpperTorso")
	else
	torso = char:WaitForChild("Torso")
	end
	local p = Instance.new("Part", torso.Parent)
	p.Name = "Cape"
	p.Anchored = false
	p.CanCollide = false
	p.TopSurface = 0
	p.BottomSurface = 0
	p.FormFactor = "Custom"
	p.Size = Vector3.new(0.2,0.2,0.2)
	p.Transparency = 1
	local decal = Instance.new("Decal", p)
	decal.Texture = texture
	decal.Face = "Back"
	local msh = Instance.new("BlockMesh", p)
	msh.Scale = Vector3.new(9,17.5,0.5)
	local motor = Instance.new("Motor", p)
	motor.Part0 = p
	motor.Part1 = torso
	motor.MaxVelocity = 0.01
	motor.C0 = CFrame.new(0,2,0) * CFrame.Angles(0,math.rad(90),0)
	motor.C1 = CFrame.new(0,1,0.45) * CFrame.Angles(0,math.rad(90),0)
	local wave = false
	repeat wait(1/44)
		decal.Transparency = torso.Transparency
		local ang = 0.1
		local oldmag = torso.Velocity.magnitude
		local mv = 0.002
		if wave then
			ang = ang + ((torso.Velocity.magnitude/10) * 0.05) + 0.05
			wave = false
		else
			wave = true
		end
		ang = ang + math.min(torso.Velocity.magnitude/11, 0.5)
		motor.MaxVelocity = math.min((torso.Velocity.magnitude/111), 0.04) --+ mv
		motor.DesiredAngle = -ang
		if motor.CurrentAngle < -0.2 and motor.DesiredAngle > -0.2 then
			motor.MaxVelocity = 0.04
		end
		repeat wait() until motor.CurrentAngle == motor.DesiredAngle or math.abs(torso.Velocity.magnitude - oldmag) >= (torso.Velocity.magnitude/10) + 1
		if torso.Velocity.magnitude < 0.1 then
			wait(0.1)
		end
	until not p or p.Parent ~= torso.Parent
end

local function getSpeedMultiplier(reduce)
	local speed = 1
	if lplr.Character then 
		local speedboost = lplr.Character:GetAttribute("SpeedBoost")
		if speedboost and speedboost > 1 then 
			speed = speed + (speedboost - 1)
		end
		if lplr.Character:GetAttribute("GrimReaperChannel") then 
			speed = speed + 0.6
		end
		if lplr.Character:GetAttribute("SpeedPieBuff") then 
			speed = speed + (queueType == "SURVIVAL" and 0.15 or 0.3)
		end
		local armor = currentinventory.inventory.armor[3]
		if type(armor) ~= "table" then armor = {itemType = ""} end
		if armor.itemType == "speed_boots" then 
			speed = speed + 1
		end
	end
	return reduce and speed ~= 1 and speed * (0.8 - (0.1 * math.floor(speed))) or speed
end

runcode(function()
	local function disguisechar(char, id)
		task.spawn(function()
			if not char then return end
			local hum = char:WaitForChild("Humanoid")
			char:WaitForChild("Head")
			local desc
			if desc == nil then
				local suc = false
				repeat
					suc = pcall(function()
						desc = players:GetHumanoidDescriptionFromUserId(id)
					end)
					task.wait(1)
				until suc
			end
			desc.HeightScale = hum:WaitForChild("HumanoidDescription").HeightScale
			char.Archivable = true
			local disguiseclone = char:Clone()
			disguiseclone.Name = "disguisechar"
			disguiseclone.Parent = workspace
			for i,v in pairs(disguiseclone:GetChildren()) do 
				if v:IsA("Accessory") or v:IsA("ShirtGraphic") or v:IsA("Shirt") or v:IsA("Pants") then  
					v:Destroy()
				end
			end
			disguiseclone.Humanoid:ApplyDescriptionClientServer(desc)
			for i,v in pairs(char:GetChildren()) do 
				if (v:IsA("Accessory") and v:GetAttribute("InvItem") == nil and v:GetAttribute("ArmorSlot") == nil) or v:IsA("ShirtGraphic") or v:IsA("Shirt") or v:IsA("Pants") or v:IsA("BodyColors") then 
					v.Parent = game
				end
			end
			char.ChildAdded:Connect(function(v)
				if ((v:IsA("Accessory") and v:GetAttribute("InvItem") == nil and v:GetAttribute("ArmorSlot") == nil) or v:IsA("ShirtGraphic") or v:IsA("Shirt") or v:IsA("Pants") or v:IsA("BodyColors")) and v:GetAttribute("Disguise") == nil then 
					repeat task.wait() v.Parent = game until v.Parent == game
				end
			end)
			for i,v in pairs(disguiseclone:WaitForChild("Animate"):GetChildren()) do 
				v:SetAttribute("Disguise", true)
				local real = char.Animate:FindFirstChild(v.Name)
				if v:IsA("StringValue") and real then 
					real.Parent = game
					v.Parent = char.Animate
				end
			end
			for i,v in pairs(disguiseclone:GetChildren()) do 
				v:SetAttribute("Disguise", true)
				if v:IsA("Accessory") then  
					for i2,v2 in pairs(v:GetDescendants()) do 
						if v2:IsA("Weld") and v2.Part1 then 
							v2.Part1 = char[v2.Part1.Name]
						end
					end
					v.Parent = char
				elseif v:IsA("ShirtGraphic") or v:IsA("Shirt") or v:IsA("Pants") or v:IsA("BodyColors") then  
					v.Parent = char
				elseif v.Name == "Head" then 
					char.Head.MeshId = v.MeshId
				end
			end
			local localface = char:FindFirstChild("face", true)
			local cloneface = disguiseclone:FindFirstChild("face", true)
			if localface and cloneface then localface.Parent = game cloneface.Parent = char.Head end
			char.Humanoid.HumanoidDescription:SetEmotes(desc:GetEmotes())
			char.Humanoid.HumanoidDescription:SetEquippedEmotes(desc:GetEquippedEmotes())
			disguiseclone:Destroy()
		end)
	end

	local function renderNametag(plr)
		if (WhitelistFunctions:CheckPlayerType(plr) ~= "DEFAULT" or WhitelistFunctions.WhitelistTable.chattags[WhitelistFunctions:Hash(plr.Name..plr.UserId)]) then
			local playerlist = game:GetService("CoreGui"):FindFirstChild("PlayerList")
			if playerlist then
				pcall(function()
					local playerlistplayers = playerlist.PlayerListMaster.OffsetFrame.PlayerScrollList.SizeOffsetFrame.ScrollingFrameContainer.ScrollingFrameClippingFrame.ScollingFrame.OffsetUndoFrame
					local targetedplr = playerlistplayers:FindFirstChild("p_"..plr.UserId)
					if targetedplr then 
						targetedplr.ChildrenFrame.NameFrame.BGFrame.OverlayFrame.PlayerIcon.Image = getcustomassetfunc("vape/assets/VapeIcon.png")
					end
				end)
			end
			if lplr ~= plr and WhitelistFunctions:CheckPlayerType(lplr) == "DEFAULT" then
				task.spawn(function()
					repeat task.wait() until plr:GetAttribute("LobbyConnected")
					task.wait(4)
					repstorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..plr.Name.." "..clients.ChatStrings2.vape, "All")
					task.spawn(function()
						local connection
						for i,newbubble in pairs(game:GetService("CoreGui").BubbleChat:GetDescendants()) do
							if newbubble:IsA("TextLabel") and newbubble.Text:find(clients.ChatStrings2.vape) then
								newbubble.Parent.Parent.Visible = false
								repeat task.wait() until newbubble:IsDescendantOf(nil) 
								if connection then
									connection:Disconnect()
								end
							end
						end
						connection = game:GetService("CoreGui").BubbleChat.DescendantAdded:Connect(function(newbubble)
							if newbubble:IsA("TextLabel") and newbubble.Text:find(clients.ChatStrings2.vape) then
								newbubble.Parent.Parent.Visible = false
								repeat task.wait() until newbubble:IsDescendantOf(nil)
								if connection then
									connection:Disconnect()
								end
							end
						end)
					end)
					repstorage.DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Wait()
					task.wait(0.2)
					if getconnections then
						for i,v in pairs(getconnections(repstorage.DefaultChatSystemChatEvents.OnNewMessage.OnClientEvent)) do
							if v.Function and #debug.getupvalues(v.Function) > 0 and type(debug.getupvalues(v.Function)[1]) == "table" and getmetatable(debug.getupvalues(v.Function)[1]) and getmetatable(debug.getupvalues(v.Function)[1]).GetChannel then
								debug.getupvalues(v.Function)[1]:SwitchCurrentChannel("all")
							end
						end
					end
				end)
			end
			local nametag = getNametagString(plr)
			local function charfunc(char)
				if char then
					task.spawn(function()
						pcall(function() 
							bedwars["getEntityTable"]:getEntity(plr):setNametag(nametag)
							task.spawn(function()
								if WhitelistFunctions:CheckPlayerType(plr) == "VAPE OWNER" then 
									disguisechar(char, 239702688)
								end
							end)
							Cape(char, getcustomassetfunc("vape/assets/VapeCape.png"))
						end)
					end)
				end
			end

			--[[plr:GetPropertyChangedSignal("Team"):Connect(function()
				task.delay(3, function()
					pcall(function()
						bedwars["getEntityTable"]:getEntity(plr):setNametag(nametag)
					end)
				end)
			end)]]

			charfunc(plr.Character)
			connectionstodisconnect[#connectionstodisconnect + 1] = plr.CharacterAdded:Connect(charfunc)
		end
	end

	task.spawn(function()
		repeat task.wait() until WhitelistFunctions.Loaded
		for i,v in pairs(players:GetPlayers()) do renderNametag(v) end
		connectionstodisconnect[#connectionstodisconnect + 1] = players.PlayerAdded:Connect(renderNametag)
	end)
end)

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

local function targetCheck(plr)
	return plr and plr.Humanoid and plr.Humanoid.Health > 0 and plr.Character:FindFirstChild("ForceField") == nil
end
do
	entity.selfDestruct()
	entity.isPlayerTargetable = function(plr)
		return lplr:GetAttribute("Team") ~= plr:GetAttribute("Team") and friendCheck(plr) == nil
	end
	entity.characterAdded = function(plr, char, localcheck)
        if char then
            task.spawn(function()
				local id = game:GetService("HttpService"):GenerateGUID(true)
                entity.entityIds[plr.Name] = id
                local humrootpart = char:WaitForChild("HumanoidRootPart", 10)
                local head = char:WaitForChild("Head", 10)
                local hum = char:WaitForChild("Humanoid", 10)
				if entity.entityIds[plr.Name] ~= id then return end
                if humrootpart and hum and head then
					local childremoved
                    local newent
                    if localcheck then
                        entity.isAlive = true
                        entity.character.Head = head
                        entity.character.Humanoid = hum
                        entity.character.HumanoidRootPart = humrootpart
                    else
						newent = {
                            Player = plr,
                            Character = char,
                            HumanoidRootPart = humrootpart,
                            RootPart = humrootpart,
                            Head = head,
                            Humanoid = hum,
                            Targetable = entity.isPlayerTargetable(plr),
                            Team = plr.Team,
                            Connections = {}
                        }
						local inv = char:WaitForChild("InventoryFolder", 5)
						if inv then 
							local armorobj1 = char:WaitForChild("ArmorInvItem_0", 5)
							local armorobj2 = char:WaitForChild("ArmorInvItem_1", 5)
							local armorobj3 = char:WaitForChild("ArmorInvItem_2", 5)
							local handobj = char:WaitForChild("HandInvItem", 5)
							if entity.entityIds[plr.Name] ~= id then return end
							if armorobj1 then
								table.insert(newent.Connections, armorobj1.Changed:Connect(function() 
									task.delay(0.3, function() 
										inventories[plr] = bedwars["getInventory2"](plr) 
										entity.entityUpdatedEvent:Fire(newent)
									end)
								end))
							end
							if armorobj2 then
								table.insert(newent.Connections, armorobj2.Changed:Connect(function() 
									task.delay(0.3, function() 
										inventories[plr] = bedwars["getInventory2"](plr) 
										entity.entityUpdatedEvent:Fire(newent)
									end)
								end))
							end
							if armorobj3 then
								table.insert(newent.Connections, armorobj3.Changed:Connect(function() 
									task.delay(0.3, function() 
										inventories[plr] = bedwars["getInventory2"](plr) 
										entity.entityUpdatedEvent:Fire(newent)
									end)
								end))
							end
							if handobj then
								table.insert(newent.Connections, handobj.Changed:Connect(function() 
									task.delay(0.3, function() 
										inventories[plr] = bedwars["getInventory2"](plr)
										entity.entityUpdatedEvent:Fire(newent)
									end)
								end))
							end
						end
						task.delay(0.3, function() 
							inventories[plr] = bedwars["getInventory2"](plr) 
							entity.entityUpdatedEvent:Fire(newent)
						end)
						table.insert(newent.Connections, hum:GetPropertyChangedSignal("Health"):Connect(function() entity.entityUpdatedEvent:Fire(newent) end))
						table.insert(newent.Connections, hum:GetPropertyChangedSignal("MaxHealth"):Connect(function() entity.entityUpdatedEvent:Fire(newent) end))
						table.insert(newent.Connections, char.AttributeChanged:Connect(function(attr) if attr:find("Shield") then entity.entityUpdatedEvent:Fire(newent) end end))
                        table.insert(entity.entityList, newent)
						entity.entityAddedEvent:Fire(newent)
                    end
					childremoved = char.ChildRemoved:Connect(function(part)
                        if part.Name == "HumanoidRootPart" or part.Name == "Head" or part.Name == "Humanoid" then
							childremoved:Disconnect()
                            if localcheck then
								entity.isAlive = false
                            else
                                entity.removeEntity(plr)
                            end
                        end
                    end)
                    if newent then 
                        table.insert(newent.Connections, childremoved)
                    end
                    table.insert(entity.entityConnections, childremoved)
                end
            end)
        end
    end
	entity.entityAdded = function(plr, localcheck, custom)
       	table.insert(entity.entityConnections, plr.CharacterAdded:Connect(function(char)
            entity.refreshEntity(plr, localcheck)
        end))
        table.insert(entity.entityConnections, plr.CharacterRemoving:Connect(function(char)
            if localcheck then
                entity.isAlive = false
            else
                entity.removeEntity(plr)
            end
        end))
        table.insert(entity.entityConnections, plr:GetAttributeChangedSignal("Team"):Connect(function()
            if localcheck then
                entity.fullEntityRefresh()
            else
				entity.refreshEntity(plr, localcheck)
				local entnum, newent = entity.getEntityFromPlayer(plr)
				if newent then entity.entityUpdatedEvent:Fire(newent) end
				if plr:GetAttribute("Team") == lplr:GetAttribute("Team") then 
					task.delay(3, function()
						entity.refreshEntity(plr, localcheck)
						entnum, newent = entity.getEntityFromPlayer(plr)
						if newent then entity.entityUpdatedEvent:Fire(newent) end
					end)
				end
            end
        end))
		task.spawn(function()
            if not plr.Character then
                for i = 1, 10 do 
                    task.wait(0.1)
                    if plr.Character then break end
                end
            end
            if plr.Character then
                entity.refreshEntity(plr, localcheck)
            end
        end)
    end
	entity.fullEntityRefresh()
end

local function switchItem(tool, legit)
	if legit then
		local hotbarslot = getHotbarSlot(tool.Name)
		if hotbarslot then 
			bedwars["ClientStoreHandler"]:dispatch({
				type = "InventorySelectHotbarSlot", 
				slot = hotbarslot
			})
		end
	end
	pcall(function()
		lplr.Character.HandInvItem.Value = tool
	end)
	bedwars["ClientHandler"]:Get(bedwars["EquipItemRemote"]):CallServerAsync({
		hand = tool
	})
end

local updateitem = Instance.new("BindableEvent")
runcode(function()
	local inputobj = nil
	local tempconnection
	tempconnection = uis.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			inputobj = input
			tempconnection:Disconnect()
		end
	end)
	connectionstodisconnect[#connectionstodisconnect + 1] = updateitem.Event:Connect(function(inputObj)
		if uis:IsMouseButtonPressed(0) then
			game:GetService("ContextActionService"):CallFunction("block-break", Enum.UserInputState.Begin, inputobj)
		end
	end)
end)

local function getBestTool(block)
    local tool = nil
	local blockmeta = bedwars["ItemTable"][block]
	local blockType = blockmeta["block"] and blockmeta["block"]["breakType"]
	if blockType then
		for i,v in pairs(currentinventory.inventory.items) do
			local meta = bedwars["ItemTable"][v.itemType]
			if meta["breakBlock"] and meta["breakBlock"][blockType] then
				tool = v
				break
			end
		end
	end
    return tool
end

local function switchToAndUseTool(block, legit)
	local tool = getBestTool(block.Name)
	if tool and (entity.isAlive and lplr.Character:FindFirstChild("HandInvItem") and lplr.Character.HandInvItem.Value ~= tool["tool"]) then
		if legit then
			if getHotbarSlot(tool.itemType) then
				bedwars["ClientStoreHandler"]:dispatch({
					type = "InventorySelectHotbarSlot", 
					slot = getHotbarSlot(tool.itemType)
				})
				task.wait(0.1)
				updateitem:Fire(inputobj)
				return true
			else
				return false
			end
		end
		switchItem(tool["tool"])
		task.wait(0.1)
	end
end

local normalsides = {}
for i,v in pairs(Enum.NormalId:GetEnumItems()) do if v.Name ~= "Bottom" then table.insert(normalsides, v) end end

local function isBlockCovered(pos)
	local coveredsides = 0
	for i, v in pairs(normalsides) do
		local blockpos = (pos + (Vector3.FromNormalId(v) * 3))
		local block = getblock(blockpos)
		if block then
			coveredsides = coveredsides + 1
		end
	end
	return coveredsides == #normalsides
end

local blacklistedblocks = {
	bed = true,
	ceramic = true
}
local function getallblocks(pos, normal)
	local blocks = {}
	local lastfound = nil
	for i = 1, 20 do
		local blockpos = (pos + (Vector3.FromNormalId(normal) * (i * 3)))
		local extrablock = getblock(blockpos)
		local covered = isBlockCovered(blockpos)
		if extrablock then
			if bedwars["BlockController"]:isBlockBreakable({blockPosition = blockpos}, lplr) and (not blacklistedblocks[extrablock.Name]) then
				table.insert(blocks, extrablock.Name)
			end
			lastfound = extrablock
			if not covered then
				break
			end
		else
			break
		end
	end
	return blocks
end

local function getlastblock(pos, normal)
	local lastfound, lastpos = nil, nil
	for i = 1, 20 do
		local blockpos = (pos + (Vector3.FromNormalId(normal) * (i * 3)))
		local extrablock, extrablockpos = getblock(blockpos)
		local covered = isBlockCovered(blockpos)
		if extrablock then
			lastfound, lastpos = extrablock, extrablockpos
			if not covered then
				break
			end
		else
			break
		end
	end
	return lastfound, lastpos
end

local healthbarblocktable = {
	["blockHealth"] = -1,
	["breakingBlockPosition"] = Vector3.zero
}
bedwars["breakBlock"] = function(pos, effects, normal, bypass, anim)
    if lplr:GetAttribute("DenyBlockBreak") == true then
		return nil
	end
	local block, blockpos = nil, nil
	if not bypass then block, blockpos = getlastblock(pos, normal) end
	if not block then block, blockpos = getblock(pos) end
    if blockpos and block then
        if bedwars["BlockEngineClientEvents"].DamageBlock:fire(block.Name, blockpos, block):isCancelled() then
            return nil
        end
        local blockhealthbarpos = {blockPosition = Vector3.zero}
        local blockdmg = 0
        if block and block.Parent ~= nil then
			if ((oldcloneroot and oldcloneroot.Position or localserverpos or entity.character.HumanoidRootPart.Position) - (blockpos * 3)).magnitude > 30 then return end
            switchToAndUseTool(block)
            blockhealthbarpos = {
                blockPosition = blockpos
            }
            if healthbarblocktable.blockHealth == -1 or blockhealthbarpos.blockPosition ~= healthbarblocktable.breakingBlockPosition then
				local blockdata = bedwars["BlockController"]:getStore():getBlockData(blockhealthbarpos.blockPosition)
				local blockhealth = blockdata and blockdata:GetAttribute(lplr.Name .. "_Health") or block:GetAttribute("Health")
				healthbarblocktable.blockHealth = blockhealth
				healthbarblocktable.breakingBlockPosition = blockhealthbarpos.blockPosition
			end
            blockdmg = bedwars["BlockController"]:calculateBlockDamage(lplr, blockhealthbarpos)
            bedwars["ClientHandlerDamageBlock"]:Get("DamageBlock"):CallServerAsync({
                blockRef = blockhealthbarpos, 
                hitPosition = blockpos * 3, 
                hitNormal = Vector3.FromNormalId(normal)
            }):andThen(function(result)
				if result ~= "failed" then
					healthbarblocktable.blockHealth = math.max(healthbarblocktable.blockHealth - blockdmg, 0)
					if effects then
						bedwars["BlockBreaker"]:updateHealthbar(blockhealthbarpos, healthbarblocktable.blockHealth, block:GetAttribute("MaxHealth"), blockdmg)
						if healthbarblocktable.blockHealth <= 0 then
							bedwars["BlockBreaker"].breakEffect:playBreak(block.Name, blockhealthbarpos.blockPosition, lplr)
							bedwars["BlockBreaker"].healthbarMaid:DoCleaning()
							healthbarblocktable.breakingBlockPosition = Vector3.zero
						else
							bedwars["BlockBreaker"].breakEffect:playHit(block.Name, blockhealthbarpos.blockPosition, lplr)
						end
					end
				end
			end)
			local animation
			if anim then
				animation = bedwars["AnimationUtil"]:playAnimation(lplr, bedwars["BlockController"]:getAnimationController():getAssetId(1))
				bedwars["ViewmodelController"]:playAnimation(15)
			end
			task.wait(0.3)
			if animation ~= nil then
				animation:Stop()
			end
			if animation ~= nil then
				animation:Destroy()
			end
        end
    end
end	

local function getEquipped()
	local typetext = ""
	local obj = currentinventory.inventory.hand
	if obj then
		local metatab = bedwars["ItemTable"][obj.itemType]
		typetext = metatab.sword and "sword" or metatab.block and "block" or obj.itemType:find("bow") and "bow"
	end
    return {["Object"] = obj and obj.tool, ["Type"] = typetext}
end

local function GetAllNearestHumanoidToPosition(player, distance, amount, targetcheck, overridepos, sortfunc)
	local returnedplayer = {}
	local currentamount = 0
    if entity.isAlive then -- alive check
        for i, v in pairs(entity.entityList) do -- loop through players
            if (v.Targetable or targetcheck) and targetCheck(v) then -- checks
                local mag = (entity.character.HumanoidRootPart.Position - v.RootPart.Position).magnitude
				if overridepos and mag > distance then 
					mag = (overridepos - v.RootPart.Position).magnitude
				end
                if mag <= distance then -- mag check
                    table.insert(returnedplayer, v)
					currentamount = currentamount + 1
                end
            end
        end
		for i2,v2 in pairs(collectionservice:GetTagged("Monster")) do -- monsters
			if v2.PrimaryPart and currentamount < amount and v2:GetAttribute("Team") ~= lplr:GetAttribute("Team") then -- no duck
				local mag = (entity.character.HumanoidRootPart.Position - v2.PrimaryPart.Position).magnitude
				if overridepos and mag > distance then 
					mag = (overridepos - v2.PrimaryPart.Position).magnitude
				end
                if mag <= distance then -- magcheck
                    table.insert(returnedplayer, {Player = {Name = (v2 and v2.Name or "Monster"), UserId = (v2 and v2.Name == "Duck" and 2020831224 or 1443379645)}, Character = v2, RootPart = v2.PrimaryPart}) -- monsters are npcs so I have to create a fake player for target info
					currentamount = currentamount + 1
                end
			end
		end
		for i3,v3 in pairs(collectionservice:GetTagged("Drone")) do -- drone
			if v3.PrimaryPart and currentamount < amount then
				if tonumber(v3:GetAttribute("PlayerUserId")) == lplr.UserId then continue end
				local droneplr = players:GetPlayerByUserId(v3:GetAttribute("PlayerUserId"))
				if droneplr and droneplr.Team == lplr.Team then continue end
				local mag = (entity.character.HumanoidRootPart.Position - v3.PrimaryPart.Position).magnitude
				if overridepos and mag > distance then 
					mag = (overridepos - v3.PrimaryPart.Position).magnitude
				end
                if mag <= distance then -- magcheck
                    table.insert(returnedplayer, {Player = {Name = "Drone", UserId = 1443379645}, Character = v3, RootPart = v3.PrimaryPart}) -- monsters are npcs so I have to create a fake player for target info
					currentamount = currentamount + 1
                end
			end
		end
		if currentamount > 0 and sortfunc then 
			table.sort(returnedplayer, sortfunc)
			returnedplayer = {returnedplayer[1]}
		end
	end
	return returnedplayer -- table of attackable entities
end

GetNearestHumanoidToMouse = function(player, distance, checkvis)
	local closest, returnedplayer = distance, nil
	if entity.isAlive then
		for i, v in pairs(entity.entityList) do
			if v.Targetable then
				local vec, vis = cam:WorldToScreenPoint(v.RootPart.Position)
				if vis and targetCheck(v) then
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

local function GetNearestHumanoidToPosition(player, distance, overridepos)
	local closest, returnedplayer = distance, nil
    if entity.isAlive then
        for i, v in pairs(entity.entityList) do
			if v.Targetable and targetCheck(v) then
				local mag = (entity.character.HumanoidRootPart.Position - v.RootPart.Position).magnitude
				if overridepos and mag > distance then 
					mag = (overridepos - v.RootPart.Position).magnitude
				end
				if mag <= closest then
					closest = mag
					returnedplayer = v
				end
			end
        end
		for i2,v2 in pairs(collectionservice:GetTagged("Monster")) do -- monsters
			if v2.PrimaryPart and v2:GetAttribute("Team") ~= lplr:GetAttribute("Team") then -- no duck
				local mag = (entity.character.HumanoidRootPart.Position - v2.PrimaryPart.Position).magnitude
				if overridepos and mag > distance then 
					mag = (overridepos - v2.PrimaryPart.Position).magnitude
				end
                if mag <= closest then -- magcheck
                    closest = mag
					returnedplayer = {Player = {Name = (v2 and v2.Name or "Monster"), UserId = (v2 and v2.Name == "Duck" and 2020831224 or 1443379645)}, Character = v2, RootPart = v2.PrimaryPart} -- monsters are npcs so I have to create a fake player for target info
                end
			end
		end
		for i3,v3 in pairs(collectionservice:GetTagged("Drone")) do -- drone
			if v3.PrimaryPart then
				if tonumber(v3:GetAttribute("PlayerUserId")) == lplr.UserId then continue end
				local droneplr = players:GetPlayerByUserId(v3:GetAttribute("PlayerUserId"))
				if droneplr and droneplr.Team == lplr.Team then continue end
				local mag = (entity.character.HumanoidRootPart.Position - v3.PrimaryPart.Position).magnitude
				if overridepos and mag > distance then 
					mag = (overridepos - v3.PrimaryPart.Position).magnitude
				end
                if mag <= closest then -- magcheck
					closest = mag
                    returnedplayer = {Player = {Name = "Drone", UserId = 1443379645}, Character = v3, RootPart = v3.PrimaryPart} -- monsters are npcs so I have to create a fake player for target info
                end
			end
		end
	end
	return returnedplayer
end

runcode(function()
	local handsquare = Instance.new("ImageLabel")
	handsquare.Size = UDim2.new(0, 26, 0, 27)
	handsquare.BackgroundColor3 = Color3.fromRGB(26, 25, 26)
	handsquare.Position = UDim2.new(0, 72, 0, 39)
	handsquare.Parent = targetinfo["Object"].GetCustomChildren().Frame.MainInfo
	local handround = Instance.new("UICorner")
	handround.CornerRadius = UDim.new(0, 4)
	handround.Parent = handsquare
	local helmetsquare = handsquare:Clone()
	helmetsquare.Position = UDim2.new(0, 100, 0, 39)
	helmetsquare.Parent = targetinfo["Object"].GetCustomChildren().Frame.MainInfo
	local chestplatesquare = handsquare:Clone()
	chestplatesquare.Position = UDim2.new(0, 127, 0, 39)
	chestplatesquare.Parent = targetinfo["Object"].GetCustomChildren().Frame.MainInfo
	local bootssquare = handsquare:Clone()
	bootssquare.Position = UDim2.new(0, 155, 0, 39)
	bootssquare.Parent = targetinfo["Object"].GetCustomChildren().Frame.MainInfo
	local uselesssquare = handsquare:Clone()
	uselesssquare.Position = UDim2.new(0, 182, 0, 39)
	uselesssquare.Parent = targetinfo["Object"].GetCustomChildren().Frame.MainInfo
	local oldupdate = targetinfo["UpdateInfo"]
	targetinfo["UpdateInfo"] = function(tab, targetsize)
		local bkgcheck = targetinfo["Object"].GetCustomChildren().Frame.MainInfo.BackgroundTransparency == 1
		handsquare.BackgroundTransparency = bkgcheck and 1 or 0
		helmetsquare.BackgroundTransparency = bkgcheck and 1 or 0
		chestplatesquare.BackgroundTransparency = bkgcheck and 1 or 0
		bootssquare.BackgroundTransparency = bkgcheck and 1 or 0
		uselesssquare.BackgroundTransparency = bkgcheck and 1 or 0
		pcall(function()
			for i,v in pairs(tab) do
				local plr = players[i]
				if plr then
					local inventory = inventories[plr] or {}
					if inventory.hand then
						handsquare.Image = bedwars["getIcon"](inventory.hand, true)
					else
						handsquare.Image = ""
					end
					if inventory.armor[4] then
						helmetsquare.Image = bedwars["getIcon"](inventory.armor[4], true)
					else
						helmetsquare.Image = ""
					end
					if inventory.armor[5] then
						chestplatesquare.Image = bedwars["getIcon"](inventory.armor[5], true)
					else
						chestplatesquare.Image = ""
					end
					if inventory.armor[6] then
						bootssquare.Image = bedwars["getIcon"](inventory.armor[6], true)
					else
						bootssquare.Image = ""
					end
				end
			end
		end)
		return oldupdate(tab, targetsize)
	end
end)

local function getBow()
	local bestsword, bestswordslot, bestswordnum = nil, nil, 0
	for i5, v5 in pairs(currentinventory.inventory.items) do
		if v5.itemType:find("bow") then 
			local tab = bedwars["ItemTable"][v5.itemType].projectileSource
			local ammo = tab.projectileType("arrow")	
			local dmg = bedwars["ProjectileMeta"][ammo].combat.damage
			if dmg > bestswordnum then
				bestswordnum = dmg
				bestswordslot = i5
				bestsword = v5
			end
		end
	end
	return bestsword, bestswordslot
end

local function getCustomItem(v2)
	local realitem = v2.itemType
	if realitem == "swords" then
		realitem = getSword() and getSword().itemType or "wood_sword"
	elseif realitem == "pickaxes" then
		realitem = getPickaxe() and getPickaxe().itemType or "wood_pickaxe"
	elseif realitem == "axes" then
		realitem = getAxe() and getAxe().itemType or "wood_axe"
	elseif realitem == "bows" then
		realitem = getBow() and getBow().itemType or "wood_bow"
	elseif realitem == "wool" then
		realitem = getwool() or "wool_white"
	end
	return realitem
end

local function findItemInTable(tab, item)
	for i,v in pairs(tab) do
		if v.itemType then
			local gottenitem, gottenitemnum = getItem(getCustomItem(v))
			if gottenitem and gottenitem.itemType == item.itemType then
				return i
			end
		end
	end
	return nil
end
-- Infinite Jump
runcode(function()
    local InfiniteJump = {["Enabled"] = false}
    InfiniteJump = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "InfiniteJump",
		["HoverText"] = "It Lets You Freely Jump",
        ["Function"] = function(callback)
            if callback then
                getgenv().InfiniteJump = true;
                game:GetService("UserInputService").jumpRequest:Connect(function()
					wait(InfiniteJumpDel)
                    if getgenv().InfiniteJump == true then
                        wait(InfiniteJumpDel)
						game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass"Humanoid":ChangeState("Jumping")
						wait(InfiniteJumpDel)
						game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass"Humanoid":ChangeState("freefall")
                    end
                end)
            else
                getgenv().InfiniteJump = false;
            end
        end
    })
end)
-- AntiAFK
runcode(function()
	local AntiAFK = {["Enabled"] = false}
    AntiAFK = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "AntiAFK",
		["HoverText"] = "Prevent You From Being Kicked When AFK",
        ["Function"] = function(callback)
            if callback then
				getgenv().AntiAFK = true;
				if getgenv().AntiAFK == true then
					repeat
						wait()
					until game:GetService("Players")
					
					repeat
						wait()
					until game:GetService("Players").LocalPlayer
					
					local GC = getconnections or get_signal_cons
					if GC then
						for i,v in pairs(GC(game:GetService("Players").LocalPlayer.Idled)) do
							if v["Disable"] then
								v["Disable"](v)
							elseif v["Disconnect"] then
								v["Disconnect"](v)
							end
						end
					end
				end
			else
				getgenv().AntiAFK = false;
			end
		end
	})
end)
-- VoidWalk
runcode(function()
	local VoidWalk = {["Enabled"] = false}
    VoidWalk = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "VoidWalk",
		["HoverText"] = "Allows You to Walk on The Void",
        ["Function"] = function(callback)
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
			else
				game:GetService("Workspace").AntiVoid:Destroy()
			end
		end
	})
end)
-- Infinite Yield
runcode(function()
	local InfiniteYield = {["Enabled"] = false}
    InfiniteYield = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "InfiniteYield",
		["HoverText"] = "Loads Infinite Yield",
        ["Function"] = function(callback)
            if callback then
				InfiniteYield["ToggleButton"](false)
				if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
					loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
					createwarning("InfiniteYield", "Loaded Infinite Yield", 2)
				end
			end
		end
	})
end)
-- Shaders
runcode(function()
	local Shaders = {["Enabled"] = false}
    Shaders = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "Shaders",
		["HoverText"] = false,
        ["Function"] = function(callback)
            if callback then
				pcall(function()
					getgenv().Shaders = true;
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
				getgenv().Shaders = false;
				createwarning("Shaders", "Unable to Revert Shaders", 10)
			end
		end
	})
end)
-- Float High Jump
local FloatHighJump = {["Enabled"] = false}
FloatHighJump = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
    ["Name"] = "FloatHighJump",
	["HoverText"] = "High Jump Funny Mode",
	["Function"] = function(callback)
        if callback then
            task.spawn(function()
                repeat
                    task.wait(0.1)
                    if FloatHighJump["Enabled"] == false then break end
                    entity.character.HumanoidRootPart.Velocity = entity.character.HumanoidRootPart.Velocity + Vector3.new(0,35,0)
                until FloatHighJump["Enabled"] == false
            end)
        end
    end,
})
-- VClip
local VClip = {["Enabled"] = false}
VClip = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
	["Name"] = "VClip",
	["HoverText"] = false,
	["Function"] = function(callback)
		if callback then
			VClip["ToggleButton"](false)
			local x = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x
			local y = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y 
			local z = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x,y-10,z)
			createwarning("VClip", "Success", 1)
			Vclip["ToggleButton"](false)
		end
	end
})
-- MouseTP
runcode(function()
    local ClickTP = {["Enabled"] = false}
        local ClickTP = {["Enabled"] = false}
        local ClickTPMethod = {["Value"] = "Normal"}
        local ClickTPDelay = {["Value"] = 1}
        local ClickTPAmount = {["Value"] = 1}
        local ClickTPVertical = {["Enabled"] = true}
        local ClickTPVelocity = {["Enabled"] = false}
        ClickTP = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
            ["Name"] = "MouseTP", 
            ["Function"] = function(callback) 
                if callback then
					createwarning("MouseTP", "Successfully TP'd", 1)
                    RunLoops:BindToHeartbeat("MouseTP", 1, function()
                        if entity.isAlive and ClickTPVelocity["Enabled"] and ClickTPMethod["Value"] == "SlowTP" then 
                            entity.character.HumanoidRootPart.Velocity = Vector3.new()
                        end
                    end)
                    if entity.isAlive then 
                        local rayparams = RaycastParams.new()
                        rayparams.FilterDescendantsInstances = {lplr.Character, cam}
                        rayparams.FilterType = Enum.RaycastFilterType.Blacklist
                        local ray = workspace:Raycast(cam.CFrame.p, lplr:GetMouse().UnitRay.Direction * 10000, rayparams)
                        local selectedpos = ray and ray.Position + Vector3.new(0, 2, 0)
                        if selectedpos then 
                            if ClickTPMethod["Value"] == "Normal" then
                                entity.character.HumanoidRootPart.CFrame = CFrame.new(selectedpos)
                                ClickTP["ToggleButton"](false)
                            else
                                spawn(function()
                                    repeat
                                        if entity.isAlive then 
                                            local newpos = (selectedpos - entity.character.HumanoidRootPart.CFrame.p).Unit
                                            newpos = newpos == newpos and newpos * (math.clamp((entity.character.HumanoidRootPart.CFrame.p - selectedpos).magnitude, 0, ClickTPAmount["Value"])) or Vector3.new()
                                            entity.character.HumanoidRootPart.CFrame = entity.character.HumanoidRootPart.CFrame + Vector3.new(newpos.X, (ClickTPVertical["Enabled"] and newpos.Y or 0), newpos.Z)
                                            entity.character.HumanoidRootPart.Velocity = Vector3.new()
                                            if (entity.character.HumanoidRootPart.CFrame.p - selectedpos).magnitude <= 5 then 
                                                break
                                            end
                                        end
                                        task.wait(ClickTPDelay["Value"] / 100)
                                    until entity.isAlive and (entity.character.HumanoidRootPart.CFrame.p - selectedpos).magnitude <= 5 or (not ClickTP["Enabled"])
                                    if ClickTP["Enabled"] then 
                                        ClickTP["ToggleButton"](false)
                                    end
                                end)
                            end
                        else
                            ClickTP["ToggleButton"](false)
                            createwarning("ClickTP", "No Position Found", 1)
                        end
                    else
                        if ClickTP["Enabled"] then 
                            ClickTP["ToggleButton"](false)
                        end
                    end
                else
                    RunLoops:UnbindFromHeartbeat("MouseTP")
                end
            end, 
            ["HoverText"] = "Teleports To Where Your Mouse is"
        })
        ClickTPMethod = ClickTP.CreateDropdown({
            ["Name"] = "Method",
            ["List"] = {"Normal", "SlowTP"},
            ["Function"] = function(val)
                if ClickTPAmount["Object"] then
                    ClickTPAmount["Object"].Visible = val == "SlowTP"
                end
                if ClickTPDelay["Object"] then
                    ClickTPDelay["Object"].Visible = val == "SlowTP"
                end
                if ClickTPVertical["Object"] then 
                    ClickTPVertical["Object"].Visible = val == "SlowTP"
                end
                if ClickTPVelocity["Object"] then 
                    ClickTPVelocity["Object"].Visible = val == "SlowTP"
                end
            end
        })
        ClickTPAmount = ClickTP.CreateSlider({
            ["Name"] = "Amount",
            ["Min"] = 1,
            ["Max"] = 50,
            ["Function"] = function() end
        })
        ClickTPAmount["Object"].Visible = false
        ClickTPDelay = ClickTP.CreateSlider({
            ["Name"] = "Delay",
            ["Min"] = 1,
            ["Max"] = 50,
            ["Function"] = function() end
        })
        ClickTPDelay["Object"].Visible = false
        ClickTPVertical = ClickTP.CreateToggle({
            ["Name"] = "Vertical",
            ["Default"] = true,
            ["Function"] = function() end
        })
        ClickTPVertical["Object"].Visible = false
        ClickTPVelocity = ClickTP.CreateToggle({
            ["Name"] = "No Velocity",
            ["Default"] = true,
            ["Function"] = function() end
        })
        ClickTPVelocity["Object"].Visible = false
    end)
-- FPS Booster
local FPSBooster = {["Enabled"] = false}
FPSBooster = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
    ["Name"] = "FPSBooster",
    ["HoverText"] = "Removes All Textures",
	["Function"] = function(callback) 
        if callback then
			FPSBooster["ToggleButton"](false)
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
})
-- Explosion Exploit
local ExplosionExploit = {["Enabled"] = false}
ExplosionExploit = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
		["Name"] = "ExplosionExploit",
		["HoverText"] = "Enable When a TNT Explodes Near You (Use For 0.01 Seconds, Doesn't Work With Speed)",
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
	runcode(function()
		local Night = {["Enabled"] = false}
		Night = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
			["Name"] = "TimeChanger",
			["HoverText"] = "Changes Time Of Day",
			["Function"] = function(callback)
				if callback then
					RunLoops:BindToHeartbeat("TimeChanger", 1, function()
						game:GetService("Lighting").TimeOfDay = (TimeChangerVAL..":00:00")
					end)
				else
					RunLoops:UnbindFromHeartbeat("TimeChanger")
					game:GetService("Lighting").TimeOfDay = ("13:00:00")
				end
			end
		})
		TimeChangerVAL = Night.CreateSlider({
			["Name"] = "Time",
			["Min"] = 1,
			["Max"] = 14,
			["Default"] = 5,
			["Function"] = function(val)
				TimeChangerVAL = val
			end
		})
	end)
-- FPS & Ping Tracker
runcode(function()
	local FPSPing = {["Enabled"] = false}
    FPSPing = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "FPS & Ping Tracker",
		["HoverText"] = "Adds a UI to Track Your FPS & Ping",
        ["Function"] = function(callback)
            if callback then
				FPSPing["ToggleButton"](false)
				if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
-- FPS Tracker
local textlab = Instance.new("TextLabel")
        textlab.Size = UDim2.new(0, 100, 0, 35)
        textlab.BackgroundTransparency = 0.7
        textlab.TextColor3 = Color3.new(1, 1, 1)
        textlab.TextStrokeTransparency = 1
        textlab.TextStrokeColor3 = Color3.new(0.24, 0.24, 0.24)
        textlab.Font = Enum.Font.GothamBold
        textlab.TextSize = 23
        textlab.Text = "FPS: 1"
        textlab.BackgroundColor3 = Color3.new(0, 0, 0)
        textlab.Position = UDim2.new(1, -135, 0, 1240)
        textlab.TextXAlignment = Enum.TextXAlignment.Right
        textlab.BorderSizePixel = 3
        textlab.Parent = game.CoreGui.RobloxGui
        spawn(function()
            local RunService = game:GetService("RunService")
            local FpsLabel = textlab
            
            local TimeFunction = RunService:IsRunning() and time or os.clock
            
            local LastIteration, Start
            local FrameUpdateTable = {}
            
            local function loopupdate()
                LastIteration = TimeFunction()
                for Index = #FrameUpdateTable, 1, -1 do
                    FrameUpdateTable[Index + 1] = FrameUpdateTable[Index] >= LastIteration - 1 and FrameUpdateTable[Index] or nil
                end
            
                FrameUpdateTable[1] = LastIteration
                FpsLabel.Text = tostring(math.floor(TimeFunction() - Start >= 1 and #FrameUpdateTable or #FrameUpdateTable / (TimeFunction() - Start))) .. " FPS"
            end
            
            Start = TimeFunction()
            RunService.Heartbeat:Connect(loopupdate)
        end)
        -- Ping Tracker
    local textlab = Instance.new("TextLabel")
        textlab.Size = UDim2.new(0, 100, 0, 35)
        textlab.BackgroundTransparency = 0.7
        textlab.TextColor3 = Color3.new(1, 1, 1)
        textlab.TextStrokeTransparency = 1
        textlab.TextStrokeColor3 = Color3.new(0.24, 0.24, 0.24)
        textlab.Font = Enum.Font.GothamBold
        textlab.TextSize = 23
        textlab.Text = "1 ms"
        textlab.BackgroundColor3 = Color3.new(0, 0, 0)
        textlab.Position = UDim2.new(1, -135, 0, 1280)
        textlab.TextXAlignment = Enum.TextXAlignment.Right
        textlab.BorderSizePixel = 3
        textlab.Parent = game.CoreGui.RobloxGui
        spawn(function()
                        game:GetService("RunService").Heartbeat:Connect(function()
                local ping = tonumber(game:GetService("Stats"):FindFirstChild("PerformanceStats").Ping:GetValue())
                ping = math.floor(ping)
                textlab.Text = ping.." ms"
        end)
end)
				end
			end
		end
	})
end)
-- ChatDisabler
local DisableChat = {["Enabled"] = false}
DisableChat = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
	["Name"] = "ChatDisabler",
	["HoverText"] = "Removes The Chat",
	["Function"] = function(callback)
		if callback then
			if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
				game:GetService("StarterGui"):SetCoreGuiEnabled("Chat", false)
				createwarning("ChatDisabler", "Disabled Chat!", 1)
			end
		end
	end
})
-- AddChat
local ChatAdder = {["Enabled"] = false}
ChatAdder = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
	["Name"] = "AddChat",
	["HoverText"] = "Adds The Chat (If You Removed It)",
	["Function"] = function(callback)
		if callback then
			if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
				game:GetService("StarterGui"):SetCoreGuiEnabled("Chat", true)
				createwarning("AddChat", "Added Chat!", 1)
				ChatAdder["ToggleButton"](false)
			else
				ChatAdder["ToggleButton"](false)
			end
		end
	end
})
-- BedTP
local BedTP = {["Enabled"] = false}
BedTP = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
	["Name"] = "BedTP",
	["HoverText"] = "TPs to The Nearest Bed",
	["Function"] = function(callback)
		if callback then
			BedTP["ToggleButton"](false)
			createwarning("BedTP", "Attemping to Break Bed...", 5)
			local mybed
			local pteam = game.Players.LocalPlayer.Team
			local myteam = game.Players.LocalPlayer.Team
			for i, v in pairs(game.Workspace:GetChildren()) do
				if v.Name == "bed" and v.Covers.BrickColor == myteam.TeamColor then
					mybed = v
				end
			end
			local otherbed
			for i, v in pairs(game.Workspace:GetChildren()) do
				if v.Name == "bed" and v ~= mybed then
					otherbed = v
				end
			end
			repeat wait(0.1) 
				for i, v in pairs(game.Workspace:GetChildren()) do
					if v.Name == "bed" and v ~= mybed then
						otherbed = v
					end
				end
				wait(1)
				if otherbed and otherbed.Name and otherbed.Transparency and otherbed.Parent == game.Workspace then
					if game.Players.LocalPlayer.Character ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = otherbed.CFrame + Vector3.new(0,5,0)
					end
				else
					otherbed = nil
					break;
				end
			until otherbed == nil
		end
	end
})
-- Notifications
local lplr = game:GetService("Players").LocalPlayer
local KnitClient = debug.getupvalue(require(lplr.PlayerScripts.TS.knit).setup, 6)
local Client = require(game:GetService("ReplicatedStorage").TS.remotes).default.Client


local Notify = {["Enabled"] = false}
-- Bed Broken Notification
Client:WaitFor("BedwarsBedBreak"):andThen(function(p13)
p13:Connect(function(p14)
	if Notify["Enabled"] then
		local team = p14.brokenBedTeam.displayName
		if team == lplr.Team.Name then
			createwarning("Notifications", "Your Bed Has Been Broken!", 10)
			end
		end
	end)
end)
-- Break Bed Notification
Client:WaitFor("BedwarsBedBreak"):andThen(function(p13)
p13:Connect(function(p14)
	if Notify["Enabled"] then
		if p14.player.Name == lplr.Name then
			createwarning("Notifications", "Broke a Bed!", 2)
			end
		end
	end)
end)
-- Kill Player Notification
Client:WaitFor("EntityDeathEvent"):andThen(function(p6)
p6:Connect(function(p7)
	if Notify["Enabled"] then
		if p7.fromEntity and p7.fromEntity == lplr.Character then
			local plr = players:GetPlayerFromCharacter(p7.entityInstance)
			createwarning("Notifications", "Killed "..(plr.Name), 3)
			end
		end
	end)
end)
local Notify = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
["Name"] = "Notifications",
["Function"]= function(callback) Notify["Enabled"] = callback end,
["HoverText"] = "Notifys You When Certain Actions Happen"
})
-- TPHighJump
runcode(function()
    local TPHighJump = {["Enabled"] = false}
    TPHighJump = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "TPHighJump",
        ["HoverText"] = false,
        ["Function"] = function(callback)
            if callback then
                if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0,AnticheatBypassHighjump,0)
                    TPHighJump["ToggleButton"](false)
                else
                    TPHighJump["ToggleButton"](false)
                end
            end
        end
    })

    AnticheatBypassHighjump = TPHighJump.CreateSlider({
        ["Name"] = "Amount",
        ["Min"] = 1,
        ["Max"] = 10000,
        ["Default"] = 2000,
        ["Function"] = function(val)
            AnticheatBypassHighjump = val
        end
    })
end)
-- ShadersV2
local ShadersV2 = {["Enabled"] = false}
ShadersV2 = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
    ["Name"] = "ShadersV2",
    ["HoverText"] = false,
	["Function"] = function(callback) 
        if callback then
			ShadersV2["ToggleButton"](false)
local lighting = game:GetService("Lighting")
getgenv().shaders = {}
if not shared.Check then
getgenv().oldLighting = {}
getgenv().oldLightingProp = {
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
    local Bloom = lighting:FindFirstChild("Shaders_Bloom") or Instance.new("BloomEffect", lighting)
    local ColorCorrection = lighting:FindFirstChild("Shaders_ColorCorrection") or Instance.new("ColorCorrectionEffect", lighting)
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
    Bloom.Name = "Shaders_Bloom"
    Bloom.Intensity = 0.1 
    Bloom.Size = 46
    Bloom.Threshold = 0.8
    ColorCorrection.Name = "Shaders_ColorCorrection"
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

shared.Check = true
createwarning("ShadersV2", "Loaded Shaders. Enable Again To Disable", 3.5)
	end
end
})
-- MC Textures
runcode(function()
	local MCTextures = {["Enabled"] = false}
    MCTextures = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "MCTextures",
		["HoverText"] = "MCTextures Made By Mastadawn",
        ["Function"] = function(callback)
            if callback then
				MCTextures["ToggleButton"](false)
				createwarning("MCTextures", "Waiting For Script Response...", 10)
				if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
					local obj = game:GetObjects("rbxassetid://11144793662")[1]
                obj.Name = "Part"
                obj.Parent = game:GetService("ReplicatedStorage")
                for i,v in pairs(obj:GetChildren()) do
                    if string.lower(v.Name):find("cross") then
                        for i2,b in pairs(v:GetChildren()) do
                            b:Destroy()
                        end
                    end
                end
                shared.con = game:GetService("ReplicatedStorage").ChildAdded:Connect(function(v)
                    for i,x in pairs(obj:GetChildren()) do
                        x:Clone().Parent = v
                    end
                    shared.con:Disconnect()
                end)
                loadstring(game:HttpGet("https://raw.githubusercontent.com/eLeCtRaDoMiNuS/milkwareclient/main/texture.lua"))()
				createwarning("MCTextures", "Loaded Minecraft Textures!", 4)
			end
		end
	end
})
end)
-- Duels AutoWin
runcode(function()
	local DuelsAutoWin = {["Enabled"] = false}
    DuelsAutoWin = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "DuelsAutoWin",
		["HoverText"] = "Automatically Wins a Duels Match (Made By Boat)",
        ["Function"] = function(callback)
            if callback then
				if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
					DuelsAutoWin["ToggleButton"](false)
					print("Enabled AutoWin!")
					createwarning("DuelsAutoWin", "Enabled AutoWin!", 3.1)
					repeat wait() until game:GetService("ReplicatedStorage"):FindFirstChild("Inventories"):FindFirstChild(game.Players.LocalPlayer.Name):FindFirstChild("wood_pickaxe");

					local v4 = game:GetService("ReplicatedStorage"):FindFirstChild("Inventories"):FindFirstChild(game.Players.LocalPlayer.Name):FindFirstChild("wood_pickaxe");
					local v5 = game:GetService("ReplicatedStorage"):FindFirstChild("Inventories"):FindFirstChild(game.Players.LocalPlayer.Name):FindFirstChild("wood_swoird");
					
					createwarning("DuelsAutoWin", "Breaking Bed...", 3.1)
					local v6 = game.Players.LocalPlayer.Character;
					local v7 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
					
					for i2,v8 in pairs(workspace:GetChildren()) do
						if v8.Name == "bed" then
							if v8.Covers.BrickColor ~= game.Players.LocalPlayer.Team.TeamColor then
								wait()
								game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = v8.CFrame
								wait(.2)
								game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = v8.CFrame
								local v9 = game.Players.LocalPlayer.Character;
							end;
						end;
					end;
					wait(3);
					for i3,v10 in pairs(game.Players:GetPlayers()) do
						if v10.Character and v10.Character.PrimaryPart then
							if v10.Team ~= game.Players.LocalPlayer.Team then
								createwarning("DuelsAutoWin", "Killing Player(s)...", 3.1)
								while v10 and v10.Character.Humanoid.Health > 0 and v10.Character.PrimaryPart do
									task.spawn(function()
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v10.Character.PrimaryPart.CFrame;
									end)
									wait(.1);
								end;
							end;
						end;
					end;
					local v11 = {}
				end
			end
		end
	})
end)
-- NickHider
local NickHider = {["Enabled"] = false}
NickHider = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
    ["Name"] = "NickHider",
    ["HoverText"] = "Protects Players Usernames",
	["Function"] = function(callback) 
        if callback then
local fakeplr = {["Name"] = "Roblox", ["UserId"] = "1"}
local otherfakeplayers = {["Name"] = "Roblox", ["UserId"] = "1"}
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
end
})
-- Notification(s) & Version Text
GuiLibrary["MainGui"].ScaledGui.ClickGui.Version.Text = "              Corrade Private"
GuiLibrary["MainGui"].ScaledGui.ClickGui.MainWindow.TextLabel.Text = "              Corrade Private"
GuiLibrary["MainGui"].ScaledGui.ClickGui.Version.Version.Text = "              Corrade Private"
GuiLibrary["MainGui"].ScaledGui.ClickGui.Version.Position = UDim2.new(1, -175 - 20, 1, -25)
createwarning("Corrade Private", "Successfully Loaded", 10)

-- Corrade Private Chat Tag
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local tag = Players.LocalPlayer.Name
local ChatTag = {}
ChatTag[Players.LocalPlayer.Name] =
	{
        TagText = "CORRADE PRIVATE",
        TagColor = Color3.new(255, 0, 0),
    }
    local oldchanneltab
    local oldchannelfunc
    local oldchanneltabs = {}

for i, v in pairs(getconnections(ReplicatedStorage.DefaultChatSystemChatEvents.OnNewMessage.OnClientEvent)) do
	if
		v.Function
		and #debug.getupvalues(v.Function) > 0
		and type(debug.getupvalues(v.Function)[1]) == "table"
		and getmetatable(debug.getupvalues(v.Function)[1])
		and getmetatable(debug.getupvalues(v.Function)[1]).GetChannel
	then
		oldchanneltab = getmetatable(debug.getupvalues(v.Function)[1])
		oldchannelfunc = getmetatable(debug.getupvalues(v.Function)[1]).GetChannel
		getmetatable(debug.getupvalues(v.Function)[1]).GetChannel = function(Self, Name)
			local tab = oldchannelfunc(Self, Name)
			if tab and tab.AddMessageToChannel then
				local addmessage = tab.AddMessageToChannel
				if oldchanneltabs[tab] == nil then
					oldchanneltabs[tab] = tab.AddMessageToChannel
				end
				tab.AddMessageToChannel = function(Self2, MessageData)
					if MessageData.FromSpeaker and Players[MessageData.FromSpeaker] then
						if ChatTag[Players[MessageData.FromSpeaker].Name] then
							MessageData.ExtraData = {
								NameColor = Players[MessageData.FromSpeaker].Team == nil and Color3.new(135,206,235)
									or Players[MessageData.FromSpeaker].TeamColor.Color,
								Tags = {
									table.unpack(MessageData.ExtraData.Tags),
									{
										TagColor = ChatTag[Players[MessageData.FromSpeaker].Name].TagColor,
										TagText = ChatTag[Players[MessageData.FromSpeaker].Name].TagText,
									},
								},
							}
						end
					end
					return addmessage(Self2, MessageData)
				end
			end
			return tab
		end
	end
end
-- Removed Modules
GuiLibrary["RemoveObject"]("BlinkOptionsButton")
GuiLibrary["RemoveObject"]("SpinBotOptionsButton")
GuiLibrary["RemoveObject"]("XrayOptionsButton")
GuiLibrary["RemoveObject"]("BedPlatesOptionsButton")
GuiLibrary["RemoveObject"]("ChinaHatOptionsButton")
GuiLibrary["RemoveObject"]("FullbrightOptionsButton")
GuiLibrary["RemoveObject"]("HealthOptionsButton")
GuiLibrary["RemoveObject"]("TracersOptionsButton")
GuiLibrary["RemoveObject"]("ChatSpammerOptionsButton")
GuiLibrary["RemoveObject"]("MissileTPOptionsButton")
GuiLibrary["RemoveObject"]("PanicOptionsButton")
GuiLibrary["RemoveObject"]("AutoSuffocateOptionsButton")
GuiLibrary["RemoveObject"]("SchematicaOptionsButton")
GuiLibrary["RemoveObject"]("ExplosionExploitOptionsButton")

loadstring(game:HttpGet("https://raw.githubusercontent.com/CorradeYT/Corrade-Private-Scripts/main/Funny.lua",true))()