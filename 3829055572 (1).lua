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

local function Cape(char, image)
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
	decal.Texture = getcustomassetfunc("vape/assets/FemboyCape.png")
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
local function score(team)
	local c1 = workspace.Flags.FlagBlue.Base:Clone()
	local c2 = workspace.Flags.FlagRed.Base:Clone()
	local cf1 = c1.CFrame
	local cf2 = c2.CFrame
	local flag1 = workspace.Flags.FlagBlue.Base
	local flag2 = workspace.Flags.FlagRed.Base
	flag1.Transparency = 1
	flag1.CanCollide = false
	flag1.CFrame = lplr.Character.HumanoidRootPart.CFrame
	task.wait(.0001)
	flag1.CFrame = cf1
	flag1.CanCollide = true
	flag1.Transparency = 0
	flag2.Transparency = 1
	flag2.CanCollide = false
	flag2.CFrame = lplr.Character.HumanoidRootPart.CFrame
	task.wait(.0001)
	flag2.CFrame = cf2
	flag2.CanCollide = true
	flag2.Transparency = 0
end
runcode(function()
    local AutoFarm = {["Enabled"] = false}
    AutoFarm = GuiLibrary["ObjectsThatCanBeSaved"]["WorldWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "FlagAutoFarm",
        ["Function"] = function(callback)
            if callback then
                pcall(function()

                    RunLoops:BindToStepped("FlagAutoFarm",1,function()
                        if lplr.Character.Humanoid.Health > 0 then
                            score("a")
                        end
                   end) -- old autofarm before they patched :sob:
                end)
            else
                RunLoops:UnbindFromStepped("FlagAutoFarm")
            end
        end,
        ["HoverText"] = "Teleport to the other team's flag"
    })
end)
--[[runcode(function()
	local clone
	local bypassing = false
	local TPValue = {["Value"] = 9}
	local AnticheatBypass = {["Enabled"] = false}
	AnticheatBypass = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
		["Name"] = "AnticheatBypass",
		["Function"] = function(callback)
			if callback then
				bypassing = true
				lplr.Character.Archivable = true
				clone = lplr.Character:Clone()
				clone.Parent = workspace
				clone.Name = "AnticheatBypass"
				workspace.Camera.CameraSubject = clone.Humanoid
				game:GetService("Players").LocalPlayer.Character = clone
				lplr.Character = clone
				game.Players.LocalPlayer.Character = clone
				clone.Animate.Disabled = true
				local tpval = TPValue["Value"] / 100
				repeat
					clone.Animate.Disabled = false
					if not bypassing then return end
					task.wait(tpval)
					if not bypassing then return end
					workspace[lplr.Name].HumanoidRootPart.CFrame = clone.HumanoidRootPart.CFrame
					for i,v in pairs(workspace[lplr.Name]:GetChildren()) do
						if v:IsA("BasePart") then
							v.Transparency = 1
						end
						if v:IsA("Accessory") then
							v.Handle.Transparency = 1
						end
						if v.Name == "HumanoidRootPart" then
							v.Transparency = 0.75
						end
					end
					if not bypassing then return end
				until not bypassing
			else
				bypassing = false
				task.wait(.25)
				for i,v in pairs(workspace[lplr.Name]:GetChildren()) do
					if v:IsA("BasePart") then
						v.Transparency = 0
					end
					if v:IsA("Accessory") then
						v.Handle.Transparency = 0
					end
					if v.Name == "HumanoidRootPart" then
						v.Transparency = 1
					end
				end
				game:GetService("Players").LocalPlayer.Character = workspace[lplr.Name]
				lplr.Character = workspace[lplr.Name]
				game.Players.LocalPlayer.Character = workspace[lplr.Name]
				clone:Destroy()
				workspace.Camera.CameraSubject = lplr.Character.Humanoid
			end
		end,
		["HoverText"] = "This is a base module."
	})
	TPValue = AnticheatBypass.CreateSlider({
		["Name"] = "Requests",
		["Min"] = 0,
		["Max"] = 100,
		["Function"] = function(val) end
	})
end)]]
runcode(function()
	local targetstrafe = {["Enabled"] = false}
	local targetstrafespeed = {["Value"] = 40}
	local targetstrafejump = {["Value"] = 40}
	local targetstrafedistance = {["Value"] = 12}
	local targetstrafenum = 0
	local targetstrafepos = Vector3.zero
	local flip = false
	local lastreal
	local old = nil
	local oldmove2
	local part
	local raycastparameters = RaycastParams.new()
	raycastparameters.FilterType = Enum.RaycastFilterType.Whitelist
	targetstrafe = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
		["Name"] = "TargetStrafe",
		["Function"] = function(callback)
			if callback then
				local controlmodule = require(lplr.PlayerScripts.PlayerModule).controls
				oldmove2 = controlmodule.moveFunction
				controlmodule.moveFunction = function(self, movedir, facecam, ...)
					if targetstrafing and targetstrafepos and isAlive() then 
						movedir = (targetstrafepos - lplr.Character.HumanoidRootPart.Position).Unit
						facecam = false
					end
					return oldmove2(self, movedir, facecam, ...)
				end
				task.spawn(function()
					repeat
						task.wait(0.1)
						if (not targetstrafe["Enabled"]) then break end
						local plr = GetNearestHumanoidToPosition(true, 18)
						targetstrafing = false
						if isAlive() and plr and (not GuiLibrary["ObjectsThatCanBeSaved"]["LongJumpOptionsButton"]["Api"]["Enabled"]) and (not GuiLibrary["ObjectsThatCanBeSaved"]["FlyOptionsButton"]["Api"]["Enabled"]) then
							local veryoldpos = lplr.Character.HumanoidRootPart.CFrame.p
							if plr ~= old then
								old = plr
								local otherone2 = CFrame.lookAt(plr.Character.HumanoidRootPart.Position, lplr.Character.HumanoidRootPart.Position)
								local num = -math.atan2(otherone2.LookVector.Z, otherone2.LookVector.X) + math.rad(-90)
								targetstrafenum = math.deg(num)
							end
							raycastparameters.FilterDescendantsInstances = {workspace.GameBase.Map}
							targetstrafing = false
							lastreal = plr.Character.HumanoidRootPart.Position
							local playerpos = Vector3.new(plr.Character.HumanoidRootPart.Position.X, lplr.Character.HumanoidRootPart.Position.Y, plr.Character.HumanoidRootPart.Position.Z)
							local newpos = playerpos + CFrame.Angles(0, math.rad(targetstrafenum), 0).LookVector * targetstrafedistance["Value"]
							local working = true
							local newray3 = workspace:Raycast(playerpos, CFrame.Angles(0, math.rad(targetstrafenum), 0).LookVector * targetstrafedistance["Value"], raycastparameters)
							newpos = newray3 and (playerpos - newray3.Position) * 0.8 or newpos
							local newray2 = workspace:Raycast(newpos, Vector3.new(0, -15, 0), raycastparameters)
							if newray2 == nil then 
								newray2 = workspace:Raycast(playerpos + (playerpos - newpos) * 0.4, Vector3.new(0, -15, 0), raycastparameters)
								if newray2 then 
									newpos = playerpos + ((playerpos - newpos) * 0.4)
								end
							end
							if newray2 ~= nil then
								local newray4 = workspace:Raycast(lplr.Character.HumanoidRootPart.Position, (lplr.Character.HumanoidRootPart.Position - newpos), raycastparameters)
								if newray4 then 
									flip = not flip
								else
									targetstrafepos = newpos
									targetstrafing = true
								end
							else
								flip = not flip
							end
							if working then
								targetstrafenum = (flip and targetstrafenum - targetstrafespeed["Value"] or targetstrafenum + targetstrafespeed["Value"])
								if targetstrafenum >= 999999 then
									targetstrafenum = 0
								end
								if targetstrafenum < -999999 then
									targetstrafenum = 0
								end
							end
						else
							targetstrafing = false
							old = nil
							lastreal = nil
						end
					until (not targetstrafe["Enabled"])
				end)
			else
				targetstrafing = false
				local controlmodule = require(lplr.PlayerScripts.PlayerModule).controls
				controlmodule.moveFunction = oldmove2
			end
		end,
		["HoverText"] = "Automatically moves around attacking players"
	})
	targetstrafespeed = targetstrafe.CreateSlider({
		["Name"] = "Speed",
		["Min"] = 1,
		["Max"] = 80,
		["Default"] = 80,
		["Function"] = function() end
	})
	targetstrafejump = targetstrafe.CreateSlider({
		["Name"] = "Jump Height",
		["Min"] = 1,
		["Max"] = 20,
		["Default"] = 20,
		["Function"] = function() end
	})
	targetstrafedistance = targetstrafe.CreateSlider({
		["Name"] = "Distance",
		["Min"] = 1,
		["Max"] = 12,
		["Default"] = 8,
		["Function"] = function() end
	})
end)