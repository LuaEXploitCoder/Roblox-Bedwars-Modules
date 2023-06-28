local Connection
lua_library:CreateButton('inf jump', 'TenaCustom', 'inf_jump',function()
    if lua_library.Constants.inf_jump then
        local InfiniteJumpEnabled = true
        game:GetService("UserInputService").JumpRequest:connect(function()
            if InfiniteJumpEnabled then
                game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
            end
        end)
    else
        if Connection then Connection:Disconnect() end
    end
end)