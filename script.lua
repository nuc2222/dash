local dashPower = 40 -- Default value
local dashSpeed = 100 -- You can adjust this value to control how fast the character reaches the destination

print("script executed!")
print("dashspeed:")
print(dashSpeed)
print("dashpower:")
print(dashPower)

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local userInputService = game:GetService("UserInputService")

local isDashing = false

local function dash()
    if isDashing then
        return
    end
    
    isDashing = true
    
    local direction = character.HumanoidRootPart.CFrame.LookVector
    local startPosition = character.HumanoidRootPart.Position
    local endPosition = startPosition + direction * dashPower
    
    local distance = (endPosition - startPosition).Magnitude
    local timeToReach = distance / dashSpeed
    
    local startTime = tick()
    local currentTime = startTime
    local elapsedTime = 0
    
    while elapsedTime < timeToReach do
        local alpha = elapsedTime / timeToReach
        local newPosition = startPosition + direction * (alpha * dashPower)
        character.HumanoidRootPart.CFrame = CFrame.new(newPosition)
        
        wait(0.01)
        
        currentTime = tick()
        elapsedTime = currentTime - startTime
    end
    
    character.HumanoidRootPart.CFrame = CFrame.new(endPosition)
    
    isDashing = false
end

local function onChat(message)
    local cmd, value = message:match("/(%w+) (%d+)")
    if cmd == "dp" and value then
        dashPower = tonumber(value)
        print("New dashPower set: " .. dashPower)
    elseif cmd == "ds" and value then
        dashSpeed = tonumber(value)
        print("New dashSpeed set: " .. dashSpeed)
    end
end

userInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if not gameProcessedEvent and input.KeyCode == Enum.KeyCode.Q then
        dash()
    end
end)

game:GetService("Players").LocalPlayer.Chatted:Connect(onChat)
