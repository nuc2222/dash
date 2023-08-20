print("say /vanish in chat to disapear in the air warning this will clear your screan too another wanring dieing after executeing will unexecute it pls reexecute if you died")
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local isVanished = false

local function teleportToVanish()
    while isVanished do
        character:SetPrimaryPartCFrame(CFrame.new(0, 100000000, 0))
        wait(1)  -- Adjust the wait time if needed
    end
end

game:GetService("Players").LocalPlayer.Chatted:Connect(function(message)
    if message:lower() == "/vanish" then
        isVanished = not isVanished
        if isVanished then
            teleportToVanish()
        end
    end
end)
