runcode(function()
local BoostAirJump = {["Enabled"] = false}
BoostAirJump = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
    ["Name"] = "BoostAirJump",
    ["Function"] = function(callback)
        if callback then
            task.spawn(function()
                repeat
                    task.wait(0.1)
                    if BoostAirJump["Enabled"] == false then break end
                    entity.character.HumanoidRootPart.Velocity = entity.character.HumanoidRootPart.Velocity + Vector3.new(0,40,0)
                until BoostAirJump["Enabled"] == false
            end)
        end
    end,
    ["HoverText"] = "azurajustbetter"
})
end)