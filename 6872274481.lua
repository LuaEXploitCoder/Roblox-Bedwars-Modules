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
local entityLibrary = shared.vapeentity
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
		frame.Frame.Frame.ImageColor3 = Color3.fromRGB(205, 84, 75)
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
	local frame = GuiLibrary["CreateNotification"](title or "AutoWin", content or "(No Content Given)", duration or 5, "assets/WarningNotification.png")
	frame.Frame.Frame.ImageColor3 = Color3.fromRGB(255, 145, 0)
end
function infonotify(title, content, duration)
	local frame = GuiLibrary["CreateNotification"](title or "AutoWin", content or "(No Content Given)", duration or 5, "assets/InfoNotification.png")
	frame.Frame.Frame.ImageColor3 = Color3.fromRGB(255, 145, 0)
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

runcode(function()
local infJumpConnection
local infjump = {["Enabled"] = false}
infjump = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
    ["Name"] = "InfiniteJump",
    ["HoverText"] = "Jump without touching ground",
    ["Function"] = function(callback) 
        if callback then    
            infJumpConnection = uis.InputBegan:Connect(function(input)
                if input.KeyCode == Enum.KeyCode.Space and not uis:GetFocusedTextBox() then
                    if InfHold.Enabled and entity.isAlive then 
                        repeat 
                        lplr.Character:WaitForChild("Humanoid"):ChangeState("Jumping")
                        task.wait()
                        until not uis:IsKeyDown(Enum.KeyCode.Space) or not infjump.Enabled or not InfHold.Enabled or uis:GetFocusedTextBox()
                    else 
                        if entity.isAlive then 
                                lplr.Character:WaitForChild("Humanoid"):ChangeState("Jumping")
                            end 
                        end 
                    end
                end)
            else
                if infJumpConnection then
                    infJumpConnection:Disconnect()
                end
            end
        end
    })
    InfHold = infjump.CreateToggle({
        ["Name"] = "Hold",
        ["HoverText"] = "Hold down space to jump?",
        ["Function"] = function() end
    })
end)

runcode(function()
    local KillFeed = {["Enabled"] = false}
    local container

    KillFeed = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "KillFeed",
        ["HoverText"] = "Destroys the KillFeed",
        ["Function"] = function(callback)
            if callback then
                task.spawn(function()
                    if container == nil then
                        repeat
                            local suc, res = pcall(function() return lplr.PlayerGui.KillFeedGui.KillFeedContainer end)
                            if suc then
                                container = res
                            end
                            task.wait()
                        until container ~= nil
                    end
                    container.Visible = false
                end)
            else
                if container then
                    container.Visible = true
                end
            end
        end
    })
end)

runcode(function()
    local CFrameHighJump = {["Enabled"] = false}
    CFrameHighJump = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "CFrameHighJump",
        ["HoverText"] = "DISABLE GRAVITY",
        ["Function"] = function(callback)
            if callback then
                if entity.isAlive then
                    workspace.Gravity = 0
                    entity.character.HumanoidRootPart.CFrame -= Vector3.new(0, 2, 0)
                    task.spawn(function()
                        repeat
                            if not CFrameHighJump["Enabled"] then break end
                            if not entity.isAlive then break end
                            workspace.Gravity = 0
                            entity.character.HumanoidRootPart.CFrame += Vector3.new(0, 5, 0)
                            task.wait(0.05)
                            entity.character.HumanoidRootPart.CFrame += Vector3.new(0, 3, 0)
                        until not CFrameHighJump["Enabled"]
                    end)
                end
            else
                workspace.Gravity = 196.2
            end
        end
    })
end)

runcode(function()
    local NameHider = {["Enabled"] = true}
    local fakeplr = {["Name"] = "Piston", ["UserId"] = "239702688"}
    local otherfakeplayers = {["Name"] = "Skids", ["UserId"] = "1"}

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

    NameHider = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "NameHider",
        ["HoverText"] = "Disable TargetHud (And Don't Use Nametags)",
        ["Function"] = function(callback)
            if callback then
                for i,v in pairs(game:GetDescendants()) do
                    newobj(v)
                end
                game.DescendantAdded:connect(newobj, obj)
            else
                createwarning("Pistonware", "Join A New Match To Reset Your Name And Other Names.", 3)
            end
        end
    })
end)

runcode(function()
    local Lowhop = {["Enabled"] = false}
    Lowhop = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "LowhopSpeed",
        ["HoverText"] = "Use With Vape Speed",
        ["Function"] = function(callback)
        if callback then
            task.spawn(function()           
                repeat
					task.wait()
                    if not Lowhop["Enabled"] then break end
                    if not entity.isAlive then
						continue
					end
                    if longjumping or (GuiLibrary["ObjectsThatCanBeSaved"]["SpeedAutoJumpToggle"]["Api"]["Enabled"] and (shared.killauranear or GuiLibrary["ObjectsThatCanBeSaved"]["SpeedAlways JumpToggle"]["Api"]["Enabled"])) or GuiLibrary["ObjectsThatCanBeSaved"]["ScaffoldOptionsButton"]["Api"]["Enabled"] or GuiLibrary["ObjectsThatCanBeSaved"]["FlyOptionsButton"]["Api"]["Enabled"] then
						continue
					end
					entity.character.HumanoidRootPart.CFrame += Vector3.new(0, 0.45, 0)
					task.wait(0.16)
                until not Lowhop["Enabled"]
            end)
        else
            workspace.Gravity = 196.2
      	end
      end
    })
end)

runcode(function()
local pack = {["Enabled"] = false}
pack = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
   ["Name"] = "TexturePack",
   ["HoverText"] = "Leaked Snoopy Pack",
   ["Function"] = function(callback)
   if callback then
      --// services
      local Players = game:GetService("Players")
      local ReplicatedStorage = game:GetService("ReplicatedStorage")
      local Workspace = game:GetService("Workspace")

      --// importing the textures
      local objs = game:GetObjects("rbxassetid://13664669847")
      local import = objs[1]

      import.Parent = game:GetService("ReplicatedStorage")

      --// very epic index
      index = {

         {
            name = "wood_sword",
            offset = CFrame.Angles(math.rad(0),math.rad(-100),math.rad(-90)),
            model = import:WaitForChild("Wood_Sword"),
         },

         {
            name = "stone_sword",
            offset = CFrame.Angles(math.rad(0),math.rad(-100),math.rad(-90)),
            model = import:WaitForChild("Stone_Sword"),
         },

         {
            name = "iron_sword",
            offset = CFrame.Angles(math.rad(0),math.rad(-100),math.rad(-90)),
            model = import:WaitForChild("Iron_Sword"),
         },

         {
            name = "diamond_sword",
            offset = CFrame.Angles(math.rad(0),math.rad(-100),math.rad(-90)),
            model = import:WaitForChild("Diamond_Sword"),
         },

         {
            name = "emerald_sword",
            offset = CFrame.Angles(math.rad(0),math.rad(-100),math.rad(-90)),
            model = import:WaitForChild("Emerald _Sword"),
         },


      }

      --// main viewmodel renderer
      local func = Workspace:WaitForChild("Camera").Viewmodel.ChildAdded:Connect(function(tool)

      if(not tool:IsA("Accessory")) then return end

      for i,v in pairs(index) do

         if(v.name == tool.Name) then

            for i,v in pairs(tool:GetDescendants()) do

               if(v:IsA("Part") or v:IsA("MeshPart") or v:IsA("UnionOperation")) then

                  v.Transparency = 1

               end

            end

            local model = v.model:Clone()
            model.CFrame = tool:WaitForChild("Handle").CFrame * v.offset
            model.CFrame *= CFrame.Angles(math.rad(0),math.rad(-50),math.rad(0))
            model.Parent = tool

            local weld = Instance.new("WeldConstraint",model)
            weld.Part0 = model
            weld.Part1 = tool:WaitForChild("Handle")

            local tool2 = Players.LocalPlayer.Character:WaitForChild(tool.Name)

            for i,v in pairs(tool2:GetDescendants()) do

               if(v:IsA("Part") or v:IsA("MeshPart") or v:IsA("UnionOperation")) then

                  v.Transparency = 1

               end

            end

            local model2 = v.model:Clone()
            model2.Anchored = false
            model2.CFrame = tool2:WaitForChild("Handle").CFrame * v.offset
            model2.CFrame *= CFrame.Angles(math.rad(0),math.rad(-50),math.rad(0))
            model2.CFrame *= CFrame.new(1,0,-.9)
            model2.Parent = tool2

            local weld2 = Instance.new("WeldConstraint",model)
            weld2.Part0 = model2
            weld2.Part1 = tool2:WaitForChild("Handle")

         end

      end

      end)
   end
end
})
end)