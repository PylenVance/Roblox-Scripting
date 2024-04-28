local GamePassId = "YOUR_GAMEPASS_ID_HERE" -- Replace "YOUR_GAMEPASS_ID_HERE" with the ID of your game pass

local function giveSpeedCoil(player)
	-- Check if the player is valid
	if player then
		-- Check if the player already owns the Speed Coil
		if not player:FindFirstChild("SpeedCoil") then
			-- Clone the Speed Coil object from ServerStorage
			local speedCoil = game.ServerStorage:FindFirstChild("SpeedCoil"):Clone()
			-- Give the Speed Coil to the player
			speedCoil.Parent = player.Backpack
			-- Notify the player
			local hint = Instance.new("Hint", player.PlayerGui)
			hint.Text = "You received a Speed Coil!"
			wait(3)
			hint:Destroy()
		end
	end
end

-- Connect to the GamePassService
game:GetService("GamePassService").Purchased:Connect(function(player, gamePassId)
	-- Check if the purchased game pass matches the desired GamePassId
	if gamePassId == GamePassId then
		-- Give the player a Speed Coil
		giveSpeedCoil(player)
	end
end)
local function checkSpeedCoil(player)
	-- Check if the player is valid and owns the game pass
	if player and game:GetService("GamePassService"):PlayerHasPass(player, GamePassId) then
		-- Give the player a Speed Coil
		giveSpeedCoil(player)
	end
end

-- Connect to the PlayerAdded event
game.Players.PlayerAdded:Connect(function(player)
	-- Check if the player has the Speed Coil when they join
	checkSpeedCoil(player)
end)
