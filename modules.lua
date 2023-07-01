-- This custom was made by ixvi
-- i dont like how i skided the Cob thing so it  will prob be recoded
-- i also dont like how the notifications are skided so that will prob be recoded to


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





local skybox = COB("World", {
	["Name"] = "Purple Skybox",
	["HoverText"] = "Skybox",
	["Function"] = function(callback)
		if callback then
			local sky = Instance.new("Sky",game.Lighting)
			sky.MoonAngularSize = "0"
			sky.MoonTextureId = "rbxassetid://6444320592"
			sky.SkyboxBk = "rbxassetid://8107841671"
			sky.SkyboxDn = "rbxassetid://6444884785"
			sky.SkyboxFt = "rbxassetid://8107841671"
			sky.SkyboxLf = "rbxassetid://8107841671"
			sky.SkyboxRt = "rbxassetid://8107841671"
			sky.SkyboxUp = "rbxassetid://8107849791"
			sky.SunTextureId = "rbxassetid://6196665106"
		else
			local sky2 = Instance.new("Sky",game.Lighting)
			sky2.MoonAngularSize = "11"
			sky2.MoonTextureId = "rbxasset://sky/moon.jpg"
			sky2.SkyboxBk = "rbxassetid://7018684000"
			sky2.SkyboxDn = "rbxassetid://6334928194"
			sky2.SkyboxFt = "rbxassetid://7018684000"
			sky2.SkyboxLf = "rbxassetid://7018684000"
			sky2.SkyboxRt = "rbxassetid://7018684000"
			sky2.SkyboxUp = "rbxassetid://7018689553"
			sky2.SunTextureId = "rbxasset://sky/sun.jpg"
			sky2.SunAngularSize = "21"
		end
	end
})

local Chat = COB("Render", {
	["Name"] = "Chat",
	["HoverText"] = "Changes Chat Position",
	["Function"] = function(callback)
		if callback then
			game:GetService("StarterGui"):SetCore('ChatWindowPosition', UDim2.new(0.0, 0, 0.0, 700))
		else
			game:GetService("StarterGui"):SetCore('ChatWindowPosition', UDim2.new(0.0, 0, 0.0, 0))
		end
	end
})


local Fly2 = COB("Blatant", {
	["Name"] = "TpFly",
	["HoverText"] = "Requires Ac Disabler",
	["Function"] = function(callback)
		if callback then
			getgenv().TpFly = true;
			while wait() do
				if getgenv().TpFly == true then
					game.Workspace.Gravity = 0
					wait(2)
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * 5.0
				end
			end
		else
			game.Workspace.Gravity = 192.6
			wait(0.1)
			getgenv().TpFly = false;
		end
	end
})


local AutobuyWool = COB("Utility", {
	["Name"] = "AutoBuyWool",
	["HoverText"] = "AutoBuys Wool",
	["Function"] = function(callback)
		if callback then
			getgenv().AutobuyWool = true;
			while wait() do
				if getgenv().AutobuyWool == true then
					game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.BedwarsPurchaseItem:InvokeServer({["shopItem"] = {["currency"] = "iron",["itemType"] = "wool_white",["amount"] = 16,["price"] = 8,["category"] = "Blocks"}})
				end
			end
		else
			getgenv().AutobuyWool = false;
		end
	end
})

local Vcip = COB("Blatant", {
	["Name"] = "Vclip",
	["HoverText"] = "Vclip",
	["Function"] = function(callback)
		if callback then
			local x = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x
			local y = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y 
			local z = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x,y-10,z)
		end
	end
})

local Kills = COB("Render", {
	["Name"] = "Kills = 69",
	["HoverText"] = "Changes Kill Amount (Dk if fe)",
	["Function"] = function(callback)
		if callback then
			game.Players.LocalPlayer.leaderstats.Kills.Value = 69
		else
			game.Players.LocalPlayer.leaderstats.Kills.Value = 0
		end
	end
})

local Trolled = COB("Utility", {
	["Name"] = "YouveBeenTrolled",
	["HoverText"] = "Says Youve Been Trolled by Antony C  Ps.Reapeats it",
	["Function"] = function(callback)
		if callback then
			getgenv().Trolled = true;
			while wait() do
				if getgenv().Trolled == true then
					game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("You've been trolled, you've been trolled","All")
                    wait(3)
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Yes, you've probably been told","All")
                    wait(3)
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Don't reply to this guy","All")
                    wait(3)
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("He's just trying to get a rise","All")
                    wait(3)
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Out of you, yes, it's true","All")
                    wait(3)
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("You respond and that's his cue","All")
                    wait(3)
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("To start trouble on the double","All")
                    wait(3)
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("While he strokes his manly stubble","All")
                    wait(3)
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("You've been trolled, you've been trolled","All")
                    wait(3)
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("You should probably just fold","All")
                    wait(3)
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("When the only winning move is not to play","All")
                    wait(3)
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("And yet you keep on trying, mindlessly replying","All")
                    wait(3)
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("You've been trolled, you've been trolled, have a nice day","All")
				end
			end
		else
			getgenv().Trolled = false;
		end
	end
})

local night = COB("World", {
	["Name"] = "Night",
	["Hovertext"] = "Changes Day to night",
	["Function"] = function(callback)
		if callback then
			game.Lighting.TimeOfDay = "1:00:00"
		else
			game.Lighting.TimeOfDay = "14:00:00"
		end
	end
})



GuiLibrary["MainGui"].ScaledGui.ClickGui.Version.Text = "Ape v6"
GuiLibrary["MainGui"].ScaledGui.ClickGui.MainWindow.TextLabel.Text = "Ape v6"
GuiLibrary["MainGui"].ScaledGui.ClickGui.Version.Version.Text = "Ape v6"
GuiLibrary["MainGui"].ScaledGui.ClickGui.Version.Position = UDim2.new(1, -175 - 20, 1, -25)
warnnotify("Ape V6","Loaded Modules", 5)




