local function kickPlayer(player, reason)
		player:Kick(reason)
end

-- Connect to the PlayerChatted event
game.Players.PlayerAdded:Connect(function(player)
	player.Chatted:Connect(function(message)
		-- Check if the message starts with "!kick"
		if message:sub(1, 5) == "!kick" then
			-- Extract the username to be kicked
			local playerName = message:sub(7)
			-- Find the player object by name
			local targetPlayer = game.Players:FindFirstChild(playerName)
			-- Check if the player exists
			if targetPlayer then
				-- Kick the player with a default reason
				kickPlayer(targetPlayer, "You have been kicked from the game.")
			else
				-- Notify the admin that the player is not found
				warn("Player '" .. playerName .. "' not found.")
			end
		end
	end)
end)
