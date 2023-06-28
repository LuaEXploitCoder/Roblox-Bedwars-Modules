repeat task.wait() until shared.GuiLibrary
local GuiLibrary = shared.GuiLibrary
local COB = function(tab, argstable) 
    return GuiLibrary["ObjectsThatCanBeSaved"][tab.."Window"]["Api"].CreateOptionsButton(argstable)
end

COB("Render", {
    Name = "Void",
    HoverText = "Void theme",
    Function = function(v)
        if v then
            game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=9851144466"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=9851144249"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=9851144099"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=9851143942"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=9851143761"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=9851143257"
            game.Lighting.FogColor = Color3.new(236, 88, 241)
            game.Lighting.FogEnd = "200"
            game.Lighting.FogStart = "0"
            game.Lighting.Ambient = Color3.new(0.5, 0, 1)
        else
            game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=6334928194"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=7018689553"
            game.Lighting.FogColor = Color3.new(1, 1, 1)
            game.Lighting.FogEnd = "10000"
            game.Lighting.FogStart = "0"
            game.Lighting.Ambient = Color3.new(0, 0, 0)
        end
    end
})