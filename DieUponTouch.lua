--Rename "Part" to the path of your part in order to use this script

game.Workspace:FindFirstChild("Part").Touched:Connect(function(hit)
	local character = hit.Parent
	local humanoid = character:FindFirstChildOfClass("Humanoid")

	if humanoid then
		humanoid.Health = 0
	end
end)
