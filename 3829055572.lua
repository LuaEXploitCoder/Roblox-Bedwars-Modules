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
local localmouse = lplr:GetMouse()
local requestfunc = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or getgenv().request or request
local getasset = getsynasset or getcustomasset

local RenderStepTable = {}
local StepTable = {}

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
	return (friendCheck(plr, true) and Color3.fromHSV(GuiLibrary["ObjectsThatCanBeSaved"]["Friends ColorSliderColor"]["Api"]["Hue"], GuiLibrary["ObjectsThatCanBeSaved"]["Friends ColorSliderColor"]["Api"]["Sat"], GuiLibrary["ObjectsThatCanBeSaved"]["Friends ColorSliderColor"]["Api"]["Value"]) or tostring(plr.TeamColor) ~= "White" and plr.TeamColor.Color)
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
		return plr and plr.Character and plr.Character.Parent ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Head") and plr.Character:FindFirstChild("Humanoid")
	end
	return lplr and lplr.Character and lplr.Character.Parent ~= nil and lplr.Character:FindFirstChild("HumanoidRootPart") and lplr.Character:FindFirstChild("Head") and lplr.Character:FindFirstChild("Humanoid")
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

local function GetAllNearestHumanoidToPosition(player, distance, amount)
	local returnedplayer = {}
	local currentamount = 0
    if isAlive() then
        for i, v in pairs(players:GetChildren()) do
            if isPlayerTargetable((player and v or nil), true, true) and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Head") and currentamount < amount then
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

local function GetNearestHumanoidToPosition(player, distance)
	local closest, returnedplayer = distance, nil
    if isAlive() then
        for i, v in pairs(players:GetChildren()) do
            if isPlayerTargetable((player and v or nil), true, true) and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Head") then
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

local function GetNearestHumanoidToMouse(player, distance, checkvis)
    local closest, returnedplayer = distance, nil
    if isAlive() then
        for i, v in pairs(players:GetChildren()) do
            if isPlayerTargetable((player and v or nil), true, true) and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Head") and (checkvis == false or checkvis and (vischeck(v.Character, "Head") or vischeck(v.Character, "HumanoidRootPart"))) then
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

local function checkTeam(player)
	player = player or lplr
	return lplr.Team
end

--[[
runcode(function()
	local BaseModule = {["Enabled"] = false}
	BaseModule = GuiLibrary["ObjectsThatCanBeSaved"]["CatV5Window"]["Api"].CreateOptionsButton({
		["Name"] = "BaseModule",
		["Function"] = function(callback)
			if callback then
				createwarning("CatV5","Disabled!",5)
			else
				createwarning("CatV5","Toggled!",5)
			end
		end,
		["HoverText"] = "This is a base module."
	})
end)
]]

runcode(function()
	local clone
	local target
	local teamcheck = {["Enabled"] = false}
	local retarded = false
	local method = {["Value"] = "Normal"}
	local tt = {
		["Wait"] = 1,
		["After"] = 0.5
	}
	local TPAura = {["Enabled"] = false}
	TPAura = GuiLibrary["ObjectsThatCanBeSaved"]["CatV5Window"]["Api"].CreateOptionsButton({
		["Name"] = "TPAura",
		["Function"] = function(callback)
			if callback then
				lplr.Character.Archivable = true
				clone = lplr.Character:Clone()
				clone.Parent = workspace
				workspace.Camera.CameraSubject = clone.Humanoid
				pcall(function()
					if method["Value"] == "Normal" then
						repeat
							target = players[math.random(#players)]
							if teamcheck then
								if target.Team == lplr.Team then
									repeat target = players[math.random(#players)] task.wait(0.01) until target.Team == not lplr.Team
								end
							end
							if target.Name == lplr.Name then
								repeat target = players[math.random(#players)] task.wait(0.01) until target.Name == not lplr.Name
							end
							lplr.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
							task.wait(tt["After"])
							lplr.Character.HumanoidRootPart.CFrame = clone.HumanoidRootPart.CFrame
							task.wait(tt["Wait"])
						until not retarded
					else
						BindToStepped("TPAura",1,function()
							target = players[math.random(#players)]
							if teamcheck then
								if target.Team == lplr.Team then
									repeat target = players[math.random(#players)] task.wait(0.01) until target.Team == not lplr.Team
								end
							end
							if target.Name == lplr.Name then
								repeat target = players[math.random(#players)] task.wait(0.01) until target.Name == not lplr.Name
							end
							lplr.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
							task.wait(tt["After"])
							lplr.Character.HumanoidRootPart.CFrame = clone.HumanoidRootPart.CFrame
							task.wait(tt["Wait"])
						end)
					end
				end)
			else
				workspace.Camera.CameraSubject = lplr.Character.Humanoid
				if method["Value"] == "Normal" then
					retarded = false
				else
					UnbindFromStepped("TPaura")
				end
				clone:Destroy()
			end
		end,
		["HoverText"] = "This is a base module."
	})
end)

runcode(function()
	local FlagDelay = {["Enabled"] = false}
	local toggled = false
	FlagDelay = GuiLibrary["ObjectsThatCanBeSaved"]["CatV5Window"]["Api"].CreateOptionsButton({
		["Name"] = "FlagCooldownDetector",
		["Function"] = function(callback)
			if callback then
				local teamd
				toggled = true
				if checkTeam() == "Red Team" then
					teamd = "FlagRed"
				else
					teamd = "FlagBlue"
				end
				workspace.Flags[teamd].Base.Touched:Connect(function(char)
					if char.Parent.Name == lplr.Name then
						if char.Parent:FindFirstChild("FlagTook") then
							if toggled then
								createwarning("CatV5","Flag Cooldown",5)
							end
						end
					end
				end)
			else
				local teamd
				if checkTeam() == "Red Team" then
					teamd = "FlagRed"
				else
					teamd = "FlagBlue"
				end
				toggled = false
			end
		end,
		["HoverText"] = "Detects how much longer until\nyou can capture a flag again."
	})
end)

runcode(function()
	local BaseModule = {["Enabled"] = false}
	BaseModule = GuiLibrary["ObjectsThatCanBeSaved"]["CatV5Window"]["Api"].CreateOptionsButton({
		["Name"] = "FlagTP",
		["Function"] = function(callback)
			if callback then
				lplr.Character.Archivable = true
				local clone = lplr.Character:Clone()
				local teamf
				if checkTeam() == "Red Team" then
					teamf = "FlagBlue"
				else
					teamf = "FlagRed"
				end
				lplr.Character.HumanoidRootPart.CFrame = workspace.Flags[teamf].Base.CFrame
				wait(.1)
				lplr.Character.HumanoidRootPart.CFrame = clone.HumanoidRootPart.CFrame
				clone:Destroy()
				BaseModule["ToggleButton"](false)
				createwarning("CatV5","Teleported!",5)
			end
		end,
		["HoverText"] = "Teleport to the other team's flag"
	})
end)

runcode(function()
	local AutoFarm = {["Enabled"] = false}
	local ez = false
	AutoFarm = GuiLibrary["ObjectsThatCanBeSaved"]["CatV5Window"]["Api"].CreateOptionsButton({
		["Name"] = "FlagAutoFarm",
		["Function"] = function(callback)
			if callback then
				ez = true
				pcall(function()
					repeat
						createwarning("CatV5","Starting Autofarm!",1)
						local teamf
						if checkTeam() == "Red Team" then
							teamf = "FlagBlue"
						else
							teamf = "FlagRed"
						end
						local teamg
						if checkTeam() == "Red Team" then
							teamg = "FlagRed"
						else
							teamg = "FlagBlue"
						end
						local clone1 = workspace.Flags[teamg].Base:Clone()
						local clone2 = workspace.Flags[teamf].Base:Clone()
						clone1.Parent = nil
						clone2.Parent = nil
						workspace.Flags[teamf].Base.CanCollide = false
						workspace.Flags[teamf].Base.CFrame = lplr.Character.HumanoidRootPart.CFrame
						wait(.1)
						workspace.Flags[teamf].Base.CanCollide = true
						workspace.Flags[teamf].Base.CFrame = clone2.CFrame
						createwarning("CatV5","Teleported to flag!",1)
						wait(7)
						workspace.Flags[teamg].Base.CanCollide = false
						workspace.Flags[teamg].Base.CFrame = lplr.Character.HumanoidRootPart.CFrame
						wait(.1)
						workspace.Flags[teamg].Base.CanCollide = true
						workspace.Flags[teamg].Base.CFrame = clone1.CFrame
						createwarning("CatV5","Teleported to flag!",1)
						wait(5)
					until ez == false
				end)
			else
				workspace.Flags.FlagRed.Base.CanCollide = true
				workspace.Flags.FlagBlue.Base.CanCollide = true
				ez = false
			end
		end,
		["HoverText"] = "Teleport to the other team's flag"
	})
end)