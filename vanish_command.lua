print("say /vanish in chat to disappear in the air. Warning: This will clear your screen too. Another warning: Dying after executing will unexecute it. Please re-execute if you died.")

player = game.Players.LocalPlayer
character = player.Character or player.CharacterAdded:Wait()
humanoid = character:WaitForChild("Humanoid")
isVanished = false

function teleportToVanish()
    while isVanished do
        character:SetPrimaryPartCFrame(CFrame.new(0, 10000, 0))
        wait() -- Adjust the wait time if needed
    end
end

game:GetService("Players").LocalPlayer.Chatted:Connect(function(message)
    if message:lower() == "/vanish" then
        isVanished = true
        teleportToVanish()
    elseif message:lower() == "/unvanish" then
        isVanished = false
        character:SetPrimaryPartCFrame(CFrame.new(0, 10000, 0))
    end
end)
