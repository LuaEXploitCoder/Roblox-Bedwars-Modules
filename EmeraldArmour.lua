repeat task.wait() until game:IsLoaded()
repeat task.wait() until shared.GuiLibrary
local GuiLibrary = shared.GuiLibrary
local ScriptSettings = {}
local UIS = game:GetService("UserInputService")
local COB = function(tab, argstable) 
    return GuiLibrary["ObjectsThatCanBeSaved"][tab.."Window"]["Api"].CreateOptionsButton(argstable)
end


function notify(text)
    local frame = GuiLibrary["CreateNotification"]("Azura Client Lite Notification", text, 5, "assets/WarningNotification.png")
    frame.Frame.Frame.ImageColor3 = Color3.fromRGB(255, 64, 64)
end
function boxnotify(text)
    if messagebox then
        messagebox(text, "Azura V4", 0)
     end
end
local EmeraldArmour = LIB("Utility", {
    Name = "Get Emerald Pack",
    Function = function(callback) 
        if callback then
		local lplr = game.Players.LocalPlayer

game.ReplicatedStorage.Items.emerald_sword:Clone().Parent = game.ReplicatedStorage.Inventories[lplr.Name]
game.ReplicatedStorage.Items.emerald_helmet:Clone().Parent = game.ReplicatedStorage.Inventories[lplr.Name]
game.ReplicatedStorage.Items.emerald_boots:Clone().Parent = game.ReplicatedStorage.Inventories[lplr.Name]
game.ReplicatedStorage.Items.emerald_chestplate:Clone().Parent = game.ReplicatedStorage.Inventories[lplr.Name]
        end
    end,
    Default = false,
    HoverText = "Gives you emerald tools and emerald armour."
})