repeat task.wait() until shared.GuiLibrary
local GuiLibrary = shared.GuiLibrary
local COB = function(tab, argstable) 
    return GuiLibrary["ObjectsThatCanBeSaved"][tab.."Window"]["Api"].CreateOptionsButton(argstable)
end

COB("Utility", {
    Name = "FPSBOOSTREAL",
    Function = _G.Settings = {
		Players = {
			["Ignore Me"] = true, -- Ignore your Character
			["Ignore Others"] = true -- Ignore other Characters
		},
		Meshes = {
			Destroy = false, -- Destroy Meshes
			LowDetail = true -- Low detail meshes (NOT SURE IT DOES ANYTHING)
		},
		Images = {
			Invisible = true, -- Invisible Images
			LowDetail = false, -- Low detail images (NOT SURE IT DOES ANYTHING)
			Destroy = false, -- Destroy Images
		},
		["No Particles"] = true, -- Disables all ParticleEmitter, Trail, Smoke, Fire and Sparkles
		["No Camera Effects"] = true, -- Disables all PostEffect's (Camera/Lighting Effects)
		["No Explosions"] = true, -- Makes Explosion's invisible
		["No Clothes"] = true, -- Removes Clothing from the game
		["Low Water Graphics"] = true, -- Removes Water Quality
		["No Shadows"] = true, -- Remove Shadows
		["Low Rendering"] = true, -- Lower Rendering
		["Low Quality Parts"] = true -- Lower quality parts
	}
	local Players = game:GetService("Players")
	local BadInstances = {"DataModelMesh", "FaceInstance", "ParticleEmitter", "Trail", "Smoke", "Fire", "Sparkles", "PostEffect", "Explosion", "Clothing", "BasePart"}
	local CanBeEnabled = {"ParticleEmitter", "Trail", "Smoke", "Fire", "Sparkles", "PostEffect"}
	local function PartOfCharacter(Instance)
		for i, v in pairs(Players:GetPlayers()) do
			if v.Character and Instance:IsDescendantOf(v.Character) then
				return true
			end
		end
		return false
	end
	local function ReturnDescendants()
		local Descendants = {}
		WaitNumber = 5000
		if _G.Settings.Players["Ignore Others"] then
			for i, v in pairs(game:GetDescendants()) do
				if not v:IsDescendantOf(Players) and not PartOfCharacter(v) then
					for i2, v2 in pairs(BadInstances) do
						if v:IsA(v2) then
							table.insert(Descendants, v)
						end
					end
				end
				if i == WaitNumber then
					task.wait()
					WaitNumber = WaitNumber + 5000
				end
			end
		elseif _G.Settings.Players["Ignore Me"] then
			for i, v in pairs(game:GetDescendants()) do
				if not v:IsDescendantOf(Players) and not v:IsDescendantOf(ME.Character) then
					for i2, v2 in pairs(BadInstances) do
						if v:IsA(v2) then
							table.insert(Descendants, v)
						end
					end
				end
				if i == WaitNumber then
					task.wait()
					WaitNumber = WaitNumber + 5000
				end
			end
		end
		return Descendants
	end
	local function CheckIfBad(Instance)
		if not Instance:IsDescendantOf(Players) and not PartOfCharacter(Instance) then
			if Instance:IsA("DataModelMesh") then
				if _G.Settings.Meshes.LowDetail then
					sethiddenproperty(Instance, "LODX", Enum.LevelOfDetailSetting.Low)
					sethiddenproperty(Instance, "LODY", Enum.LevelOfDetailSetting.Low)
				elseif _G.Settings.Meshes.Destroy then
					Instance:Destroy()
				end
			elseif Instance:IsA("FaceInstance") then
				if _G.Settings.Images.Invisible then
					Instance.Transparency = 1
				elseif _G.Settings.Images.LowDetail then
					Instance.Shiny = 1
				elseif _G.Settings.Images.Destroy then
					Instance:Destroy()
				end
			elseif table.find(CanBeEnabled, Instance.ClassName) then
				if _G.Settings["No Particles"] or (_G.Settings.Other and _G.Settings.Other["No Particles"]) then
					Instance.Enabled = false
				end
			elseif Instance:IsA("Explosion") then
				if _G.Settings["No Explosions"] or (_G.Settings.Other and _G.Settings.Other["No Explosions"]) then
					Instance.Visible = false
				end
			elseif Instance:IsA("Clothing") then
				if _G.Settings["No Clothes"] or (_G.Settings.Other and _G.Settings.Other["No Clothes"]) then
					Instance:Destroy()
				end
			elseif Instance:IsA("BasePart") then
				if _G.Settings["Low Quality Parts"] or (_G.Settings.Other and _G.Settings.Other["Low Quality Parts"]) then
					Instance.Material = Enum.Material.Plastic
					Instance.Reflectance = 0
				end
			end
		end
	end
	if _G.Settings["Low Water Graphics"] or (_G.Settings.Other and _G.Settings.Other["Low Water Graphics"]) then
		workspace:FindFirstChildOfClass("Terrain").WaterWaveSize = 0
		workspace:FindFirstChildOfClass("Terrain").WaterWaveSpeed = 0
		workspace:FindFirstChildOfClass("Terrain").WaterReflectance = 0
		workspace:FindFirstChildOfClass("Terrain").WaterTransparency = 0
	end
	if _G.Settings["No Shadows"] or (_G.Settings.Other and _G.Settings.Other["No Shadows"]) then
		game:GetService("Lighting").GlobalShadows = false
		game:GetService("Lighting").FogEnd = 9e9
	end
	if _G.Settings["Low Rendering"] or (_G.Settings.Other and _G.Settings.Other["Low Rendering"]) then
		settings().Rendering.QualityLevel = 1
	end
end)
    HoverText = "a actually good fps boost"
})