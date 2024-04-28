-- Define a function to make a player's character invisible for 10 seconds
local function makePlayerInvisible(player)
	-- Check if the player is valid and has a character
	if player and player.Character then
		-- Loop through each part of the player's character
		for _, part in ipairs(player.Character:GetChildren()) do
			-- Check if the part is a BasePart (like a Part or MeshPart)
			if part:IsA("BasePart") then
				-- Make the part invisible by setting its Transparency to 1
				part.Transparency = 1
			end
		end
		-- Wait for 10 seconds
		wait(10)
		-- Restore the visibility of each part after 10 seconds by setting Transparency back to 0
		for _, part in ipairs(player.Character:GetChildren()) do
			if part:IsA("BasePart") then
				-- Make the part visible again
				part.Transparency = 0
			end
		end
	end
end

-- Connect the function to the PlayerAdded event
game.Players.PlayerAdded:Connect(function(player)
	-- Listen for chat messages from the player
	player.Chatted:Connect(function(message)
		-- Check if the message is "!invis" (case-insensitive)
		if message:lower() == "!invis" then
			-- Call the makePlayerInvisible function to make the player invisible
			makePlayerInvisible(player)
		end
	end)
end)
