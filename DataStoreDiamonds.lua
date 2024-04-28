--Made by Asuka


--What this involves:
	--Saves Player Data
	--Load Player Data Func
	--Initialize Player Data on Join
	--Save Player Data on Leave
	--Give Diamonds Function

local DataStoreService = game:GetService("DataStoreService")
local PLAYER_DATA_KEY = "PlayerDiamonds"

-- Function to save player data
local function savePlayerData(player)
	local playerKey = "Player_" .. player.UserId
	local playerDataStore = DataStoreService:GetDataStore(PLAYER_DATA_KEY)

	-- Save diamonds data
	local success, error = pcall(function()
		playerDataStore:SetAsync(playerKey, player.leaderstats.Diamonds.Value)
	end)

	if not success then
		warn("Failed to save data for player " .. player.Name .. ": " .. error)
	end
end

-- Function to load player data
local function loadPlayerData(player)
	local playerKey = "Player_" .. player.UserId
	local playerDataStore = DataStoreService:GetDataStore(PLAYER_DATA_KEY)

	-- Load diamonds data
	local success, data = pcall(function()
		return playerDataStore:GetAsync(playerKey)
	end)

	if success then
		if data ~= nil then
			player.leaderstats.Diamonds.Value = data
		end
	else
		warn("Failed to load data for player " .. player.Name)
	end
end

-- Function to initialize player data when they join the game
local function onPlayerAdded(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local diamonds = Instance.new("IntValue")
	diamonds.Name = "Diamonds"
	diamonds.Value = 0
	diamonds.Parent = leaderstats

	loadPlayerData(player)
end

-- Function to save player data when they leave the game
local function onPlayerRemoving(player)
	savePlayerData(player)
end

-- Connect events
game.Players.PlayerAdded:Connect(onPlayerAdded)
game.Players.PlayerRemoving:Connect(onPlayerRemoving)


--Function to give a player diamonds
local function giveDiamond(player, amount)
	if player and player:IsA("Player") then
		local leaderstats = player:FindFirstChild("leaderstats")
		if leaderstats then
			local diamonds = leaderstats:FindFirstChild("Diamonds")
			if diamonds then
				diamonds.Value = diamonds.Value + amount
			else
				warn("Player " .. player.Name .. " does not have a Diamonds leaderstat.")
			end
		else
			warn("Player " .. player.Name .. " does not have leaderstats.")
		end
	end
end

--Note This does NOT  have a cooldown and will be given fast diamonds
game.Workspace:WaitForChild("DiamondPart").Touched:Connect(function(hit)
	local character = hit.Parent
	local player = game.Players:GetPlayerFromCharacter(character)
	if player then
		giveDiamond(player, 1)
	end
end)