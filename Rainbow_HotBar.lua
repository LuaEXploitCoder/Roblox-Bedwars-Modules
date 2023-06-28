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
local RbHotbar = LIB("Render", {
    Name = "Rainbow Hotbar",
    Function = function(callback) 
        if callback then
		function SmokeRB(X) return math.acos(math.cos(X*math.pi))/math.pi end

counter = 0

while wait(0.1)do
 game.Players.LocalPlayer.PlayerGui.hotbar['1'].HotbarHealthbarContainer.HealthbarProgressWrapper['1'].BackgroundColor3 = Color3.fromHSV(SmokeRB(counter),1,1)
 
 counter = counter + 0.01
end
    end,
    Default = false,
    HoverText = "Rainbow Hotbar."
})