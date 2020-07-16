local VirtualUser=game:service'VirtualUser'
	game:service'Players'.LocalPlayer.Idled:connect(function()
	VirtualUser:CaptureController()
	VirtualUser:ClickButton2(Vector2.new())
end)

local SELL_TRESHOLD = 420000 -- ONLY CHANGE THIS IF YOU HAVE INF BACKPACK.

local LocalPlayer = game.Players.LocalPlayer
local Rebirths = LocalPlayer.leaderstats.Rebirths


local Remote = game.ReplicatedStorage.Network:InvokeServer()
local InventoryAmount = LocalPlayer.PlayerGui.ScreenGui.StatsFrame2.Inventory.Amount
local CoinsAmount = game.Players.LocalPlayer.leaderstats.Coins

local function GetCoinsAmount()
	local Amount = CoinsAmount.Value
	Amount = Amount:gsub(',', '')

	return tonumber(Amount)
end

local function GetInventoryAmount()
	local Amount = InventoryAmount.Text
	local Amount2 = InventoryAmount.Text
	Amount = Amount:gsub('%s+', '')
	Amount2 = Amount2:gsub('%s+', '')
	Amount = Amount:gsub(',', '')
	
	local stringTable = Amount:split("/")
	local stringTable2 = Amount2:split("/")
	return tonumber(stringTable[1]), tonumber(stringTable[2]), stringTable2[1], stringTable2[2]
end


--UI Library
local library = loadstring(readfile("ui_lib_v3.lua"))()
w = library:CreateWindow("Mining Sim")
local b = w:CreateFolder("Folder")
b:Slider("Sell Threshold",1000000,function(value) --MaxValue
    SELL_TRESHOLD = value
end)
b:Toggle("Fast Mine",function(bool) shared.fastmine = bool end)
b:Toggle("Auto Mine",function(bool) shared.automine = bool end)
b:Toggle("Auto Sell",function(bool) shared.autosell = bool end)
b:Toggle("Auto Tools",function(bool) shared.autotools = bool end)
b:Toggle("Auto Rebirth",function(bool) shared.autorebirth = bool end)

spawn(function()
	while true do
		if shared.automine then
			local Character = LocalPlayer.Character
			local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
			if HumanoidRootPart then
				local min = HumanoidRootPart.CFrame + Vector3.new(-10,-10,-10)
				local max = HumanoidRootPart.CFrame + Vector3.new(10,10,10)
				local region = Region3.new(min.Position, max.Position)
				local parts = workspace:FindPartsInRegion3WithWhiteList(region, {game.Workspace.Blocks}, 100) --  ignore part
				
				for each, block in pairs(parts) do
					if block:IsA("BasePart") then
						local BlockModel = block.Parent
						Remote:FireServer("MineBlock",{{BlockModel}})
						wait()
					end
				end
			end
		end
		wait()
	end
end)
spawn(function()
	while true do
		if shared.fastmine then
			for each, block in pairs(game.Workspace.Blocks:GetChildren()) do
				local Stats = block:FindFirstChild("Stats")
				if Stats then
					local Multiplier = Stats:FindFirstChild("Multiplier")
					if Multiplier then
						local ActualMultiplier = Stats:FindFirstChild("ActualMultiplier")
						if not ActualMultiplier then
							local ActualMultiplier = Multiplier:Clone()
							ActualMultiplier.Name = "ActualMultiplier"
							ActualMultiplier.Parent = Stats
						end
						Multiplier.Value = -1337
					end
				end
			end
		else
			for each, block in pairs(game.Workspace.Blocks:GetChildren()) do
				local Stats = block:FindFirstChild("Stats")
				if Stats then
					local Multiplier = Stats:FindFirstChild("Multiplier")
					if Multiplier then
						local ActualMultiplier = Stats:FindFirstChild("ActualMultiplier")
						if ActualMultiplier then
							Multiplier.Value = ActualMultiplier.Value
						end
					end
				end
			end
		end
	wait()
	end
end)


CoinsAmount.Changed:Connect(function(Change)
	if shared.autorebirth then
		local Amount = GetCoinsAmount()
		if Amount >= (10000000 * (Rebirths.Value + 1)) then
			Remote:FireServer("Rebirth",{{					                }})
		end
	end
	if shared.autotools then
		for i = 1, 50 do
			Remote:FireServer("BuyItem",{{"Tools",i}})
			wait(0.1)			
		end
	end
end)
			
spawn(function()
	while true do
	if shared.autosell then
		local Amount, MaxAmount, AmountComma, MaxAmountComma2 = GetInventoryAmount()
		if SELL_TRESHOLD ~= nil then MaxAmount = SELL_TRESHOLD 	end
		if Amount >= MaxAmount then
			local Character = LocalPlayer.Character
			if Character then
				local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
				local oldCFrame = HumanoidRootPart.CFrame
				if HumanoidRootPart then
					local SavedLocation = HumanoidRootPart.CFrame
					local SavedText = InventoryAmount.Text
					while InventoryAmount.Text == SavedText do
						HumanoidRootPart.CFrame = CFrame.new(-116, 13, 38)
						Remote:FireServer("SellItems",{{               }})
						wait()
					end
					HumanoidRootPart.Anchored = true
					while HumanoidRootPart.CFrame ~= SavedLocation do
						HumanoidRootPart.CFrame = SavedLocation
					wait()
					end
					HumanoidRootPart.Anchored = false
				end
				wait(0.12)
				HumanoidRootPart.CFrame = oldCFrame
			end
		end
	end
	wait()
	end
end)


game.Workspace.Blocks.ChildAdded:Connect(function(block)
	if ScreenGUI then
		if shared.fastmine then
			local Stats = block:WaitForChild("Stats")
			if Stats then
				local Multiplier = Stats:WaitForChild("Multiplier")
				if Multiplier then
					local ActualMultiplier = Stats:FindFirstChild("ActualMultiplier")
					if not ActualMultiplier then
						local ActualMultiplier = Multiplier:Clone()
						ActualMultiplier.Name = "ActualMultiplier"
						ActualMultiplier.Parent = Stats
					end
					Multiplier.Value = -1337
				end
			end
		end
	end
end)

b:Button("Destroy Gui",function()
	for _, v in pairs(game:GetService("CoreGui"):GetChildren()) do
		if v:FindFirstChild("HiI'mSexyDon'tTouchMePls") then
			v:Destroy()
		end
	end
end)


