--Insert this to StarterPlayerScripts

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local walkSpeed = 16
local sprintSpeed = 30
local isSprinting = false

local function toggleSprint()
	isSprinting = not isSprinting
	humanoid.WalkSpeed = isSprinting and sprintSpeed or walkSpeed
end

-- Listen for Shift key press
game:GetService("UserInputService").InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.LeftShift then
		toggleSprint()
	end
end)

-- Listen for Shift key release
game:GetService("UserInputService").InputEnded:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.LeftShift then
		toggleSprint()
	end
end)
