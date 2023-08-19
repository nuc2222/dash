dashPower = 40 -- You can change this value to the desired amount of studs to move forward
dashSpeed = 100 -- You can adjust this value to control how fast the character reaches the destination

local function runRemoteScript(power, speed)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/nuc2222/dash/main/script.lua"))()(power, speed)
end
runRemoteScript(dashPower, dashSpeed)
