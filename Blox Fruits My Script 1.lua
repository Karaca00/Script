local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/Karaca00/My-Fluent-UI/refs/heads/main/Fluent%20UI%20Library.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Karaca00/My-Fluent-UI/refs/heads/main/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
	Title = "Karaca Hub",
	SubTitle = "Blox Fruits : First Sea",
	TabWidth = 160,
	Size = UDim2.fromOffset(580, 460),
	Acrylic = true, 
	Theme = "Dark",
	MinimizeKey = Enum.KeyCode.LeftControl
})




do 
	Players = game.Players
	LocalPlayer = game.Players.LocalPlayer
	Client = game.Players.LocalPlayer
    Camera = workspace.CurrentCamera

	RunService = game:GetService("RunService")
	VirtualInputManager = game:GetService('VirtualInputManager')
	CoreGui = game:GetService("CoreGui")
	TeleportService = game:GetService("TeleportService")
	VirtualUser = game:GetService("VirtualUser")
	VirtualInputManager = game:GetService("VirtualInputManager")
	UserInputService = game:GetService("UserInputService")
    TweenService = game:GetService("TweenService")
	
	PlayerGui = LocalPlayer.PlayerGui
	Backpack = LocalPlayer.Backpack

	Char = Client.Character
	Character = Client.Character

	repeat 
		LocalPlayer = Players.LocalPlayer
		wait(0.005)
	until LocalPlayer
end

function Notify(Des, Time, title)
	Fluent:Notify({
		Title= title or "Karaca Hub",
		Content = Des,
		Duration = Time or 3
	})
end

_G['Karaca Hub Table'] = {
	isWindows = UserInputService:GetPlatform() == Enum.Platform.Windows,
	TypeOs = (table.find({Enum.Platform.Windows}, game:GetService('UserInputService'):GetPlatform()) ~= nil and 'Pc') or 'Mb',
	SizeUi = (not isWindows and UDim2.fromOffset(600,300)) or UDim2.fromOffset(560,600),
	AutoSize = true,
	TweenUiSize = true,
	SpeedTweenUi = 0.25,
	StyleTweenUi = Enum.EasingStyle.Quad,
	Mutiply = 1.80,
	SizeX = 550,
	SafePercent = 20,

	AnimationUiToggle = true,
}

_G['Karaca Hub Table'].SizeUi = (not _G['Karaca Hub Table'].isWindows and UDim2.fromOffset(600,300)) or UDim2.fromOffset(560,600)
if not _G['Karaca Hub Table'].isWindows then
	if game.CoreGui:FindFirstChild('UIBUTTON') then
		game.CoreGui:FindFirstChild('UIBUTTON'):Destroy()
	end

	local UserInputService = game:GetService("UserInputService")
	local UIBUTTON = Instance.new("ScreenGui")
	local Frame = Instance.new("Frame")
	local ImageButton = Instance.new("ImageButton")
	local UICorner = Instance.new("UICorner")
	local UICorner_2 = Instance.new("UICorner")

	UIBUTTON.Name = "UIBUTTON"
	UIBUTTON.Parent = game.CoreGui
	UIBUTTON.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Frame.Parent = UIBUTTON
	Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame.BorderSizePixel = 0
	Frame.Transparency = 1
	Frame.Position = UDim2.new(0.157012194, 0, 0.164366379, 0)
	Frame.Size = UDim2.new(0, 115, 0, 49)

ImageButton.Parent = Frame
ImageButton.BorderSizePixel = 0
ImageButton.Active = true
ImageButton.Draggable = true
ImageButton.Position = UDim2.new(0.218742043, 0, -0.155235752, 0)
ImageButton.Size = UDim2.new(0, 40, 0, 40)

ImageButton.Image = "rbxassetid://128979448164481"

ImageButton.MouseButton1Click:Connect(function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    VirtualInputManager:SendKeyEvent(true,"RightControl",false,game)
    VirtualInputManager:SendKeyEvent(false,"RightControl",false,game)
    VirtualInputManager:SendKeyEvent(true,"LeftControl",false,game)
    VirtualInputManager:SendKeyEvent(false,"LeftControl",false,game)
end)

UICorner.CornerRadius = UDim.new(0, 100)
UICorner.Parent = ImageButton

	UICorner_2.CornerRadius = UDim.new(0, 10)
	UICorner_2.Parent = Frame

	local UIS = game:GetService('UserInputService')
	local frame = Frame
	local dragToggle = nil
	local dragSpeed = 0.25
	local dragStart = nil
	local startPos = nil
	frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)

	UIS.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				Frame.Transparency = 1
				updateInput(input)
			else
				Frame.Transparency = 1
			end
		end
	end)
end

-------------------------------------------------------------------------------------------------------------------------------------------------

local Tap = {
	Main = Window:AddTab({Title = "Main", Icon = "box"}),
	Player = Window:AddTab({ Title = "Player", Icon = "user"}),
	Shop = Window:AddTab({ Title = "Shop", Icon = "shopping-bag"}),
	Teleport = Window:AddTab({Title = "Teleport", Icon = "map"}),
	Settings = Window:AddTab({Title = "Settings", Icon = "settings"}),
}



--Main
local farms = Tap.Main:AddSection("Setting")
local Auto_Farm = Tap.Main:AddSection("Auto Farm")
_G.Toggle_Buso = nil
_G.Toggle_Farm = nil
_G.Toggle_Equip = nil
_G.Equip_Tool = nil
_G.Warp = false
_G.Bring = nil
local RegisterAttack = game:GetService("ReplicatedStorage").Modules.Net:WaitForChild("RE/RegisterAttack")
local RegisterHit = game:GetService("ReplicatedStorage").Modules.Net:WaitForChild("RE/RegisterHit")

MonN = "Bandit"
QuestN = "BanditQuest1"
QuestL = 1
QuestP = Vector3.new(1060.9383544922, 16.455066680908, 1547.7841796875)
MonP = Vector3.new(1038.5533447266, 41.296249389648, 1576.5098876953)

_G.Mon_Name = MonN
_G.Quest_Name = QuestN
_G.Quest_Level = QuestL
_G.Quest_Pos = QuestP
_G.Mon_Pos = MonP

local Level = LocalPlayer.Data.Level

_G.Equip_Tool = "Melee"
_G.Weapon = "Combat"

game:GetService("RunService").RenderStepped:Connect(function()
	for i ,m in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		if m.ToolTip == "Melee" and _G.Equip_Tool == "Melee" then
			if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(m.Name)) then
				_G.Weapon = m.Name
				return
			end
		end
		if m.ToolTip == "Blox Fruit" and _G.Equip_Tool == "Blox Fruit" then
			if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(m.Name)) then
				_G.Weapon = m.Name
				return
			end
		end
		if m.ToolTip == "Sword" and _G.Equip_Tool == "Sword" then
			if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(m.Name)) then
				_G.Weapon = m.Name
				return
			end
		end
	end
end)

game:GetService("RunService").RenderStepped:Connect(function()
	if Level.Value >= 1 and Level.Value < 9 then
		MonN = "Bandit"
		QuestN = "BanditQuest1"
		QuestL = 1
		QuestP = Vector3.new(1060.9383544922, 16.455066680908, 1547.7841796875)
		MonP = Vector3.new(1038.5533447266, 41.296249389648, 1576.5098876953)
	end
	if Level.Value >= 10 and Level.Value < 15 then
		MonN = "Monkey"
		QuestN = "JungleQuest"
		QuestL = 1
		QuestP = Vector3.new(-1601.6553955078, 36.85213470459, 153.38809204102)
		MonP = Vector3.new(-1448.1446533203, 50.851993560791, 63.60718536377)
	end
	if Level.Value >= 15 and Level.Value < 30 then
		MonN = "Gorilla"
		QuestN = "JungleQuest"
		QuestL = 2
		QuestP = Vector3.new(-1601.6553955078, 36.85213470459, 153.38809204102)
		MonP = Vector3.new(-1142.6488037109, 40.462348937988, -515.39227294922)
	end
	if Level.Value >= 30 and Level.Value < 40 then
		MonN = "Pirate"
		QuestN = "BuggyQuest1"
		QuestL = 1
		QuestP = Vector3.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
		MonP = Vector3.new(-1201.0881347656, 40.628940582275, 3857.5966796875)
	end
	if Level.Value >= 40 and Level.Value < 60 then
		MonN = "Brute"
		QuestN = "BuggyQuest1"
		QuestL = 2
		QuestP = Vector3.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
		MonP = Vector3.new(-1387.5324707031, 24.592035293579, 4100.9575195313)
	end
	if Level.Value >= 60 and Level.Value < 75 then
		MonN = "Desert Bandit"
		QuestN = "DesertQuest"
		QuestL = 1
		QuestP = Vector3.new(896.51721191406, 6.4384617805481, 4390.1494140625)
		MonP = Vector3.new(984.99896240234, 16.109552383423, 4417.91015625)
	end
	if Level.Value >= 75 and Level.Value < 90 then
		MonN = "Desert Officer"
		QuestN = "DesertQuest"
		QuestL = 2
		QuestP = Vector3.new(896.51721191406, 6.4384617805481, 4390.1494140625)
		MonP = Vector3.new(1547.1510009766, 14.452038764954, 4381.8002929688)
	end
	if Level.Value >= 90 and Level.Value < 100 then
		MonN = "Snow Bandit"
		QuestN = "SnowQuest"
		QuestL = 1
		QuestP = Vector3.new(1386.8073730469, 87.272789001465, -1298.3576660156)
		MonP = Vector3.new(1356.3028564453, 105.76865386963, -1328.2418212891)
	end
	if Level.Value >= 100 and Level.Value < 120 then
		MonN = "Snowman"
		QuestN = "SnowQuest"
		QuestL = 2
		QuestP = Vector3.new(1386.8073730469, 87.272789001465, -1298.3576660156)
		MonP = Vector3.new(1218.7956542969, 138.01184082031, -1488.0262451172)
	end
	if Level.Value >= 120 and Level.Value < 150 then
		MonN = "Chief Petty Officer"
		QuestN = "MarineQuest2"
		QuestL = 1
		QuestP = Vector3.new(-5035.49609375, 28.677835464478, 4324.1840820313)
		MonP = Vector3.new(-4931.1552734375, 65.793113708496, 4121.8393554688)
	end
	if Level.Value >= 150 and Level.Value < 175 then
		MonN = "Sky Bandit"
		QuestN = "SkyQuest"
		QuestL = 1
		QuestP = Vector3.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
		MonP = Vector3.new(-4955.6411132813, 365.46365356445, -2908.1865234375)
	end
	if Level.Value >= 175 and Level.Value < 190 then
		MonN = "Dark Master"
		QuestN = "SkyQuest"
		QuestL = 2
		QuestP = Vector3.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
		MonP = Vector3.new(-5148.1650390625, 439.04571533203, -2332.9611816406)
	end
	if Level.Value >= 190 and Level.Value < 210 then
		MonN = "Prisoner"
		QuestN = "PrisonerQuest"
		QuestL = 1
		QuestP = Vector3.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, -0.999846935, 0, 0.0175017118)
		MonP = Vector3.new(4937.31885, 0.332031399, 649.574524, 0.694649816, 0, -0.719348073, 0, 1, 0, 0.719348073, 0, 0.694649816)
	end
	if Level.Value >= 210 and Level.Value < 250 then
		MonN = "Dangerous Prisoner"
		QuestN = "PrisonerQuest"
		QuestL = 2
		QuestP = Vector3.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, -0.999846935, 0, 0.0175017118)
		MonP = Vector3.new(5099.6626, 0.351562679, 1055.7583, 0.898906827, 0, -0.438139856, 0, 1, 0, 0.438139856, 0, 0.898906827)
	end
	if Level.Value >= 250 and Level.Value < 275 then
		MonN = "Toga Warrior"
		QuestN = "ColosseumQuest"
		QuestL = 1
		QuestP = Vector3.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
		MonP = Vector3.new(-1872.5166015625, 49.080215454102, -2913.810546875)
	end
	if Level.Value >= 275 and Level.Value < 300 then
		MonN = "Gladiator"
		QuestN = "ColosseumQuest"
		QuestL = 2
		QuestP = Vector3.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
		MonP = Vector3.new(-1521.3740234375, 81.203170776367, -3066.3139648438)
	end
	if Level.Value >= 300 and Level.Value < 325 then
		MonN = "Military Soldier"
		QuestN = "MagmaQuest"
		QuestL = 1
		QuestP = Vector3.new(-5316.1157226563, 12.262831687927, 8517.00390625)
		MonP = Vector3.new(-5369.0004882813, 61.24352645874, 8556.4921875)
	end
	if Level.Value >= 325 and Level.Value < 375 then
		MonN = "Military Spy"
		QuestN = "MagmaQuest"
		QuestL = 2
		QuestP = Vector3.new(-5316.1157226563, 12.262831687927, 8517.00390625)
		MonP = Vector3.new(-5787.00293, 75.8262634, 8651.69922, 0.838590562, 0, -0.544762194, 0, 1, 0, 0.544762194, 0, 0.838590562)
	end
	if Level.Value >= 375 and Level.Value < 400 then
		MonN = "Fishman Warrior"
		QuestN = "FishmanQuest"
		QuestL = 1
		QuestP = Vector3.new(61122.65234375, 18.497442245483, 1569.3997802734)
		MonP = Vector3.new(60844.10546875, 98.462875366211, 1298.3985595703)
	end
	if Level.Value >= 400 and Level.Value < 450 then
		MonN = "Fishman Commando"
		QuestN = "FishmanQuest"
		QuestL = 2
		QuestP = Vector3.new(61122.65234375, 18.497442245483, 1569.3997802734)
		MonP = Vector3.new(61738.3984375, 64.207321166992, 1433.8375244141)
	end
	if Level.Value >= 450 and Level.Value < 475 then
		MonN = "God's Guard"
		QuestN = "SkyExp1Quest"
		QuestL = 1
		QuestP = Vector3.new(-4721.8603515625, 845.30297851563, -1953.8489990234)
		MonP = Vector3.new(-4628.0498046875, 866.92877197266, -1931.2352294922)
	end
	if Level.Value >= 475 and Level.Value < 525 then
		MonN = "Shanda"
		QuestN = "SkyExp1Quest"
		QuestL = 2
		QuestP = Vector3.new(-7863.1596679688, 5545.5190429688, -378.42266845703)
		MonP = Vector3.new(-7685.1474609375, 5601.0751953125, -441.38876342773)
	end
	if Level.Value >= 525 and Level.Value < 550 then
		MonN = "Royal Squad"
		QuestN = "SkyExp2Quest"
		QuestL = 1
		QuestP = Vector3.new(-7903.3828125, 5635.9897460938, -1410.923828125)
		MonP = Vector3.new(-7654.2514648438, 5637.1079101563, -1407.7550048828)
	end
	if Level.Value >= 550 and Level.Value < 625 then
		MonN = "Royal Soldier"
		QuestN = "SkyExp2Quest"
		QuestL = 2
		QuestP = Vector3.new(-7903.3828125, 5635.9897460938, -1410.923828125)
		MonP = Vector3.new(-7760.4106445313, 5679.9077148438, -1884.8112792969)
	end
	if Level.Value >= 625 and Level.Value < 650 then
		MonN = "Galley Pirate"
		QuestN = "FountainQuest"
		QuestL = 1
		QuestP = Vector3.new(5258.2788085938, 38.526931762695, 4050.044921875)
		MonP = Vector3.new(5557.1684570313, 152.32717895508, 3998.7758789063)
	end
	if Level.Value >= 650 then
		MonN = "Galley Captain"
		QuestN = "FountainQuest"
		QuestL = 2
		QuestP = Vector3.new(5258.2788085938, 38.526931762695, 4050.044921875)
		MonP = Vector3.new(5677.6772460938, 92.786109924316, 4966.6323242188)
	end
end)

local farmsetting = farms:AddDropdown("EquipTool",{
    Title = "Select Weapon",
    Values = {"Melee","Sword","Demon Fruit"},
    Multi = false,
    Default = 1
})

farmsetting:OnChanged(function(Value)
    _G.Equip_Tool = Value
end)

local autoequip = farms:AddToggle("AutoEquip",{
    Title = "Auto Equip",
    Default = true
})

autoequip:OnChanged(function(Toggle)
    _G.Toggle_Equip = Toggle
end)

local autobuso = farms:AddToggle("Buso", {
    Title = "Auto Turn Haki",
    Default = true
})

autobuso:OnChanged(function(Toggle)
    _G.Toggle_Buso = Toggle
end)

local bringmon = farms:AddToggle("bring",{
	Title = "Auto Bring Mob",
	Default = true
})

bringmon:OnChanged(function(Toggle)
	_G.Bring = Toggle
end)

RunService.RenderStepped:Connect(function()
	wait(0.005)
    if _G.Toggle_Buso == true then
        if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
        end
    end
end)

spawn(function()
	while task.wait(0.005) do
		pcall(function()
			if _G.Warp == true then
				if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
					game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit = false
				end
				if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Lock") then
					if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
						game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit = false
					end
					Noclip = Instance.new("BodyVelocity")
					Noclip.Name = "Lock"
					Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
					Noclip.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000)
					Noclip.Velocity = Vector3.new(0, 0, 0)
				end
			else
				if Noclip then
					Noclip:Destroy()
				end
				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Lock"):Destroy()
			end
		end)
	end
end)


spawn(function()
	RunService.RenderStepped:Connect(function()
		if _G.Toggle_Farm == true or _G.AroundM == true or _G.Auto_boss == true then
			for i,e in pairs(game.Workspace.Enemies:GetChildren()) do
				if (e:WaitForChild("HumanoidRootPart").Position - LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude <= 120 then
					RegisterAttack:FireServer(0)
					local Targets = {}
					for _, r in pairs(game.workspace.Enemies:GetChildren()) do
						if r:WaitForChild("Humanoid").Health >= 1 and r:WaitForChild("Humanoid") and r:WaitForChild("HumanoidRootPart") then
							table.insert(Targets, { r, r:WaitForChild("HumanoidRootPart") })
						end
					end
					RegisterHit:FireServer(e:WaitForChild("HumanoidRootPart"), Targets)
					if LocalPlayer.Character:WaitForChild("Stun") then
						LocalPlayer.Character.Stun.Value = 0
					end
					if LocalPlayer.Character:WaitForChild("Busy") then
						LocalPlayer.Character.Busy.Value = false
					end
				end
			end
		end
	end)
end)

local fMon = nil
local bringFMon = nil

function farm()
	pcall(function()
		while _G.Toggle_Farm == true do
			wait(0.005)
			_G.Warp = true
			if LocalPlayer.Character:WaitForChild("Humanoid").Health >= 1 then
				if game.Workspace.Enemies:FindFirstChildWhichIsA("Model") then
					for i,k in pairs(game.Workspace.Enemies:GetChildren()) do
						fMon = k
						if LocalPlayer.PlayerGui.Main.Quest.Visible == true then
							local start, finish = string.find(LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, MonN)
							if start then
								if fMon ~= nil then
									if fMon.Name == MonN then
										if fMon:WaitForChild("Humanoid").Health >= 1 then
											local distance = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - fMon:WaitForChild("HumanoidRootPart").Position).Magnitude
											local posm = CFrame.new(fMon:WaitForChild("HumanoidRootPart").Position)
											tweenmp = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(distance / 197.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = posm  * CFrame.new(0,30,0)})
											tweenmp:Play()
											wait(distance / 197.5)
											repeat
												wait(0.005)
												if LocalPlayer.Character:FindFirstChild(_G.Weapon) then
													if _G.Toggle_Farm == true then
														if _G.Bring == true then
															if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - fMon:WaitForChild("HumanoidRootPart").Position).Magnitude <= 200 then
																local distance = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - fMon:WaitForChild("HumanoidRootPart").Position).Magnitude
																tweenbfs = TweenService:Create(fMon:WaitForChild("HumanoidRootPart"), TweenInfo.new(distance / 1000, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position + Vector3.new(0,-30,0))})
																tweenbfs:Play()
																fMon:WaitForChild("Humanoid").WalkSpeed = 0
																fMon:WaitForChild("Humanoid").Sit = true
																sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
															end
															for i,s in pairs(game.Workspace.Enemies:GetChildren()) do
																bringFMon = s
																if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - bringFMon:WaitForChild("HumanoidRootPart").Position).Magnitude <= 200 and bringFMon ~= fMon and bringFMon ~= nil then
																	if bringFMon.Name == fMon.Name then
																		local distance = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - bringFMon:WaitForChild("HumanoidRootPart").Position).Magnitude
																		tweenbf = TweenService:Create(bringFMon:WaitForChild("HumanoidRootPart"), TweenInfo.new(distance / 1000, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position + Vector3.new(0,-30,0))})
																		tweenbf:Play()
																		bringFMon:WaitForChild("Humanoid").WalkSpeed = 0
																		bringFMon:WaitForChild("Humanoid").Sit = true
																		sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
																	end
																end
															end
														elseif _G.Bring == false then
															local distance = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - bringFMon:WaitForChild("HumanoidRootPart").Position).Magnitude
															local pos = CFrame.new(bringFMon:WaitForChild("HumanoidRootPart").Position)
															tweenfnb = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(distance / 500, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = pos * CFrame.new(0,30,0)})
															tweenfnb:Play()
														end
													end
												elseif not LocalPlayer.Character:FindFirstChild(_G.Weapon) and _G.Toggle_Equip == true then
													if _G.Toggle_Farm == true then
														LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(LocalPlayer.Backpack:WaitForChild(_G.Weapon))
														farm()
													end
												end
											until fMon.Humanoid.Health == 0 do
												farm()
											end
										end
									end
								elseif not game.Workspace.Enemies:FindFirstChild(MonN) then
									if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - MonP).Magnitude < 20000 then
										local dis = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - MonP).Magnitude
										tweenmls = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(dis / 197.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(MonP)})
										tweenmls:Play()
										Wait(dis / 197.5)
									elseif (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - MonP).Magnitude >= 20000 then
										if Level.Value >= 375 and Level.Value < 450  then
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
										end
										if Level.Value >= 450 then
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.68798828125, 5.350067615509033, -1926.2139892578125))
										end 
									end
								end
							elseif not start then
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
							end
						elseif LocalPlayer.PlayerGui.Main.Quest.Visible == false then
							if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - QuestP).Magnitude < 20000 then
								local dis = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - QuestP).Magnitude
								tweenqp = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(dis / 197.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(QuestP)})
								tweenqp:Play()
								Wait(dis / 197.5)
								if _G.Toggle_Farm == true then
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",QuestN,QuestL)
									farm()
								end
							elseif (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - QuestP).Magnitude >= 20000 then
								if Level.Value >= 325 and Level.Value < 450  then
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
	
								end
								if Level.Value >= 450 then
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.68798828125, 5.350067615509033, -1926.2139892578125)) 
								end 
							end
						end
					end
				elseif not game.Workspace.Enemies:FindFirstChildWhichIsA("Model") then
					local dis = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - MonP).Magnitude
					tweennml = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(dis / 197.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(MonP)})
					tweennml:Play()
					Wait(dis / 197.5)
				end
			elseif LocalPlayer.Character:WaitForChild("Humanoid").Health <= 0 then
				repeat
					wait(0.005)
					farm()
				until LocalPlayer.Character:WaitForChild("Humanoid").Health ~= 0 do
					farm()
				end
			end
		end
	end)
end

local autofarm = Auto_Farm:AddToggle("Farm",{
    Title = "Auto Farm Level",
    Default = false
})

autofarm:OnChanged(function(Toggle)
    _G.Toggle_Farm = Toggle
    farm()
    if _G.Toggle_Farm == false then
		_G.Warp = false
        if tweenqp then
            tweenqp:Cancel()
        end
		if tweenmls then
            tweenmls:Cancel()
        end
        if tweenmp then
            tweenmp:Cancel()
        end
		if tweennml then
            tweennml:Cancel()
        end
		if tweenfnb then
            tweenfnb:Cancel()
        end
    end
end)

_G.AroundM = nil
local arom = nil
local bringAMon = nil

function Aroundfarm()
	pcall(function()
		while _G.AroundM == true do
			wait(0.005)
			_G.Warp = true
			if LocalPlayer.Character:WaitForChild("Humanoid").Health >= 1 then
				if _G.AroundM == true then
					for i,b in pairs(game.Workspace.Enemies:GetChildren()) do
						arom = b
						if arom ~= nil then
							if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - arom:WaitForChild("HumanoidRootPart").Position).Magnitude <= 1000 then
								if arom:WaitForChild("Humanoid").Health >= 1 then
									local distance = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - arom:WaitForChild("HumanoidRootPart").Position).Magnitude
									local posam = CFrame.new(arom:WaitForChild("HumanoidRootPart").Position)
									tweenamp = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(distance / 197.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = posam * CFrame.new(0,30,0)})
									tweenamp:Play()
									wait(distance / 197.5)
									repeat
										wait(0.005)
										if LocalPlayer.Character:FindFirstChild(_G.Weapon) then
											if _G.AroundM == true then
												if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - arom:WaitForChild("HumanoidRootPart").Position).Magnitude <= 200 then
													local distance = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - arom:WaitForChild("HumanoidRootPart").Position).Magnitude
													tweenmbfa = TweenService:Create(arom:WaitForChild("HumanoidRootPart"), TweenInfo.new(distance / 1000, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position + Vector3.new(0,-30,0))})
													tweenmbfa:Play()
													arom:WaitForChild("Humanoid").WalkSpeed = 0
													arom:WaitForChild("Humanoid").Sit = true
													sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
												end
												for i,ar in pairs(game.Workspace.Enemies:GetChildren()) do
													bringAMon = ar
													if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - bringAMon:WaitForChild("HumanoidRootPart").Position).Magnitude <= 200 and bringAMon ~= arom and bringAMon ~= nil then
														local distance = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - bringAMon:WaitForChild("HumanoidRootPart").Position).Magnitude
														tweenmbf = TweenService:Create(bringAMon:WaitForChild("HumanoidRootPart"), TweenInfo.new(distance / 1000, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position + Vector3.new(0,-30,0))})
														tweenmbf:Play()
														bringAMon:WaitForChild("Humanoid").WalkSpeed = 0
														bringAMon:WaitForChild("Humanoid").Sit = true
														sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
													end
												end
											end
										elseif not LocalPlayer.Character:FindFirstChild(_G.Weapon) and _G.Toggle_Equip == true then
											if _G.AroundM == true then
												LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(LocalPlayer.Backpack:WaitForChild(_G.Weapon))
												Aroundfarm()
											end
										end
									until arom:WaitForChild("Humanoid").Health == 0 do
										Aroundfarm()
									end
								end
							end
						end
					end
				end
			elseif LocalPlayer.Character:WaitForChild("Humanoid").Health <= 0 then
				repeat
					wait(0.005)
					Aroundfarm()
				until LocalPlayer.Character:WaitForChild("Humanoid").Health ~= 0 do
					Aroundfarm()
				end
			end
		end
	end)
end





local AroundMon = Auto_Farm:AddToggle("Around",{
	Title = "Auto Monsters Around",
	Default = false
})

AroundMon:OnChanged(function(Toggle)
	_G.AroundM = Toggle
    Aroundfarm()
    if _G.AroundM == false then
		_G.Warp = false
        if tweenamp then
            tweenamp:Cancel()
        end
    end
end)



_G.SelectBoss = nil
_G.Auto_boss = nil

local Bosslist = {}

local SelectedBoss = Auto_Farm:AddDropdown("SelectedBoss", {
    Title = "Select Boss",
    Description = "",
    Values = Bosslist,
    Multi = false,
})

SelectedBoss:SetValue()
SelectedBoss:OnChanged(function(Value)
    _G.SelectBoss = Value
end)


Auto_Farm:AddButton({
    Title = "Refresh Boss",
    Description = "",
    Callback = function()
        table.clear(Bosslist)
		SelectedBoss:SetValue()
        for i,Boss in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
            if Boss.Name == "The Gorilla King" or Boss.Name == "Bobby" or Boss.Name == "Yeti" or Boss.Name == "Mob Leader" or Boss.Name == "Vice Admiral" or Boss.Name == "Warden" or Boss.Name == "Chief Warden" or Boss.Name == "Swan" or Boss.Name == "Magma Admiral" or Boss.Name == "Fishman Lord" or Boss.Name == "Wysper" or Boss.Name == "Thunder God" or Boss.Name == "Cyborg" or Boss.Name == "Saber Expert" then
				table.insert(Bosslist,Boss.Name)
				SelectedBoss:SetValue(Bosslist)
			end
        end
		for i,Boss in pairs(game.Workspace.Enemies:GetChildren()) do
            if Boss.Name == "The Gorilla King" or Boss.Name == "Bobby" or Boss.Name == "Yeti" or Boss.Name == "Mob Leader" or Boss.Name == "Vice Admiral" or Boss.Name == "Warden" or Boss.Name == "Chief Warden" or Boss.Name == "Swan" or Boss.Name == "Magma Admiral" or Boss.Name == "Fishman Lord" or Boss.Name == "Wysper" or Boss.Name == "Thunder God" or Boss.Name == "Cyborg" or Boss.Name == "Saber Expert" then
				table.insert(Bosslist,Boss.Name)
				SelectedBoss:SetValue(Bosslist)
			end
        end
    end
})

Auto_Farm:AddButton({
	Title = "Go To Boss",
	Description = "",
	Callback = function()
		if _G.SelectBoss ~= nil then
			if game:GetService("ReplicatedStorage"):WaitForChild(_G.SelectBoss) then
				_G.Warp = true
				local bsposr = game:GetService("ReplicatedStorage"):WaitForChild(_G.SelectBoss):WaitForChild("HumanoidRootPart")
				local disbr = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - bsposr.Position).Magnitude
				tweentbr = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(disbr / 197.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(bsposr.Position + Vector3.new(0,50,0))})
				tweentbr:Play()
				Wait(disbr / 197.5)
				_G.Warp = false
			elseif game.Workspace.Enemies:WaitForChild(_G.SelectBoss) then
				_G.Warp = true
				local bsposw = game.Workspace.Enemies:WaitForChild(_G.SelectBoss):WaitForChild("HumanoidRootPart")
				local disbw = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - bsposw.Position).Magnitude
				tweentbw = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(disbw / 197.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(bsposw.Position + Vector3.new(0,50,0))})
				tweentbw:Play()
				Wait(disb / 197.5)
				_G.Warp = false
			end
		end
	end
})

Auto_Farm:AddButton({
	Title = "Cancel",
	Description = "",
	Callback = function()
		if tweentbw then
			tweentbw:Cancel()
			_G.Warp = false
		end
		if tweentbr then
			tweentbr:Cancel()
			_G.Warp = false
		end
	end
})

local Auto_Boss = Auto_Farm:AddToggle("Farmboss",{
	Title = "Auto Farm Boss",
	Default = false
})

local bossMon1 = nil
local bossMon2 = nil

function Bossfarm()
	pcall(function()
		while _G.Auto_boss == true do
			wait(0.005)
			_G.Warp = true
			if LocalPlayer.Character:WaitForChild("Humanoid").Health >= 1 then
				if _G.Auto_boss == true and _G.SelectBoss ~= nil then
					if game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss) then
						for i,Bs in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
							bossMon1 = Bs
							if bossMon1.Name == _G.SelectBoss and bossMon1 ~= nil then
								if bossMon1:WaitForChild("Humanoid").Health >= 1 then
									local distancer = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - bossMon1:WaitForChild("HumanoidRootPart").Position).Magnitude
									tweenBpr = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(distancer / 197.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(bossMon1:WaitForChild("HumanoidRootPart").Position) * CFrame.new(0,50,0)})
									tweenBpr:Play()
									Wait(distancer / 197.5)
								end
							end
						end
					elseif game.Workspace.Enemies:FindFirstChild(_G.SelectBoss) then
						for i,Bsa in pairs(game.Workspace.Enemies:GetChildren()) do
							bossMon2 = Bsa
							if bossMon2.Name == _G.SelectBoss and bossMon2 ~= nil then
								if bossMon2:WaitForChild("Humanoid").Health >= 1 then
									local distancew = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - bossMon2:WaitForChild("HumanoidRootPart").Position).Magnitude
									tweenBpw = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(distancew / 197.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(bossMon2:WaitForChild("HumanoidRootPart").Position) * CFrame.new(0,50,0)})
									tweenBpw:Play()
									Wait(distancew / 197.5)
									repeat
										wait(0.005)
										if LocalPlayer.Character:FindFirstChild(_G.Weapon) then
											if _G.Auto_boss == true then
												local randomPos = math.random(1,5)
												if randomPos == 1 then
													local distance = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - bossMon2:WaitForChild("HumanoidRootPart").Position).Magnitude
													local posbsm = CFrame.new(bossMon2:WaitForChild("HumanoidRootPart").Position)
													tweenbsmrp1 = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(distance / 500, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = posbsm * CFrame.new(0,50,0)})
													tweenbsmrp1:Play()
												end
												if randomPos == 2 then
													local distance = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - bossMon2:WaitForChild("HumanoidRootPart").Position).Magnitude
													local posbsm = CFrame.new(bossMon2:WaitForChild("HumanoidRootPart").Position)
													tweenbsmrp2 = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(distance / 500, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = posbsm * CFrame.new(50,35,0)})
													tweenbsmrp2:Play()
												end
												if randomPos == 3 then
													local distance = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - bossMon2:WaitForChild("HumanoidRootPart").Position).Magnitude
													local posbsm = CFrame.new(bossMon2:WaitForChild("HumanoidRootPart").Position)
													tweenbsmrp3 = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(distance / 500, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = posbsm * CFrame.new(0,35,50)})
													tweenbsmrp3:Play()
												end
												if randomPos == 4 then
													local distance = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - bossMon2:WaitForChild("HumanoidRootPart").Position).Magnitude
													local posbsm = CFrame.new(bossMon2:WaitForChild("HumanoidRootPart").Position)
													tweenbsmrp4 = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(distance / 500, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = posbsm * CFrame.new(-50,35,0)})
													tweenbsmrp4:Play()
												end
												if randomPos == 5 then
													local distance = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - bossMon2:WaitForChild("HumanoidRootPart").Position).Magnitude
													local posbsm = CFrame.new(bossMon2:WaitForChild("HumanoidRootPart").Position)
													tweenbsmrp5 = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(distance / 500, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = posbsm * CFrame.new(0,35,-50)})
													tweenbsmrp5:Play()
												end
												bossMon2:WaitForChild("Humanoid").WalkSpeed = 0
												bossMon2:WaitForChild("Humanoid").Sit = true
												sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
											end
										elseif not LocalPlayer.Character:FindFirstChild(_G.Weapon) and _G.Toggle_Equip == true then
											if _G.Auto_boss == true then
												LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(LocalPlayer.Backpack:WaitForChild(_G.Weapon))
												Bossfarm()
											end
										end
									until bossMon2.Humanoid.Health == 0
								end
							end
						end
					end
				end
			elseif LocalPlayer.Character:WaitForChild("Humanoid").Health <= 0 then
				repeat
					wait(0.005)
					Bossfarm()
				until LocalPlayer.Character:WaitForChild("Humanoid").Health ~= 0 do
					Bossfarm()
				end
			end
		end
	end)
end

Auto_Boss:OnChanged(function(Toggle)
	_G.Auto_boss = Toggle
	Bossfarm()
	if _G.Auto_boss == false then
		_G.Warp = false
        if tweenBpr then
            tweenBpr:Cancel()
        end
		if tweenBpw then
            tweenBpw:Cancel()
        end
		if tweenbsmrp1 then
			tweenbsmrp1:Cancel()
		end
		if tweenbsmrp2 then
			tweenbsmrp2:Cancel()
		end
		if tweenbsmrp3 then
			tweenbsmrp3:Cancel()
		end
		if tweenbsmrp4 then
			tweenbsmrp4:Cancel()
		end
		if tweenbsmrp5 then
			tweenbsmrp5:Cancel()
		end
    end
end)






local auto_stats = Tap.Main:AddSection("Auto Status")
_G.Melee_Status = nil
_G.Defense_Status = nil
_G.Sword_Status = nil
_G.Gun_Status = nil
_G.Fruit_Status = nil
_G.Point_Status = 1

local btml = auto_stats:AddToggle("Melee",{
    Title = "Melee",
    Default = true
})
local btde = auto_stats:AddToggle("Defense",{
    Title = "Defense",
    Default = true
})
local btsw = auto_stats:AddToggle("Sword",{
    Title = "Sword",
    Default = false
})
local btgn = auto_stats:AddToggle("Gun",{
    Title = "Gun",
    Default = false
})
local btdf = auto_stats:AddToggle("Demon Fruit",{
    Title = "Demon Fruit",
    Default = true
})

btml:OnChanged(function(Toggle)
    _G.Melee_Status = Toggle
end)
btde:OnChanged(function(Toggle)
    _G.Defense_Status = Toggle
end)
btsw:OnChanged(function(Toggle)
    _G.Sword_Status = Toggle
end)
btgn:OnChanged(function(Toggle)
    _G.Gun_Status = Toggle
end)
btdf:OnChanged(function(Toggle)
    _G.Fruit_Status = Toggle
end)

local Input_Point = auto_stats:AddInput("Point", {
    Title = "Status Point",
    Default = 1,
    Placeholder = "Status Point",
    Numeric = true,
    Finished = false,
    Callback = function(Value)
         _G.Point_Status = Value
    end
})

RunService.RenderStepped:Connect(function()
    wait(0.01)
    if _G.Point_Status >= 1 then
        if _G.Melee_Status == true and Client.Data.Stats.Melee.Level.Value <= Client.Data.Level.Value then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Melee",_G.Point_Status)
        end
        if _G.Defense_Status == true and Client.Data.Stats.Defense.Level.Value <= Client.Data.Level.Value then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Defense",_G.Point_Status)
        end
        if _G.Sword_Status == true and Client.Data.Stats.Sword.Level.Value <= Client.Data.Level.Value then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Sword",_G.Point_Status)
        end
        if _G.Gun_Status == true and Client.Data.Stats.Gun.Level.Value <= Client.Data.Level.Value then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Gun",_G.Point_Status)
        end
        if _G.Fruit_Status == true and Client.Data.Stats["Demon Fruit"].Level.Value <= Client.Data.Level.Value then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Demon Fruit",_G.Point_Status)
        end
    end
end)



local Chest = Tap.Main:AddSection("Auto Chest")
_G.Toggle_Chest = nil
_G.oldpos = nil
_G.Toggle_Backpos = nil

local autochest = Chest:AddToggle("Chest",{
    Title = "Auto Chest",
    Default = false
})

autochest:OnChanged(function(Toggle)
    _G.Toggle_Chest = Toggle
    if _G.Toggle_Chest == true and _G.oldpos == nil then
        _G.oldpos = LocalPlayer.Character.HumanoidRootPart.Position
    end
    if _G.Toggle_Chest == false and _G.oldpos ~= nil then
		_G.Warp = false
        wait(0.5)
        _G.oldpos = nil
    end
end)

local autobackpos = Chest:AddToggle("BackPos",{
    Title = "Auto Back",
    Default = true
})

autobackpos:OnChanged(function(Toggle)
    _G.Toggle_Backpos = Toggle
end)

spawn(function()
	while wait() do
		pcall(function()
			if _G.Toggle_Chest == true then
				_G.Warp = true
				for i,c in pairs(game.workspace.ChestModels:GetChildren()) do
					if c.RootPart.Transparency ~= 0  then
						LocalPlayer.Character.HumanoidRootPart.CFrame = c.RootPart.CFrame
						wait(0.25)
						c.RootPart.Transparency = 0
						wait(3)
						c.RootPart.Transparency = 1
					else
						if _G.Toggle_Backpos == true then
							local distance = (LocalPlayer.Character.HumanoidRootPart.Position - _G.oldpos).Magnitude / 197.5
							local tweenold = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(distance, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(_G.oldpos)})
							tweenold:Play()
						end
					end
				end
			else
				if _G.oldpos ~= nil then
					if _G.Toggle_Backpos == true then
						local distance = (LocalPlayer.Character.HumanoidRootPart.Position - _G.oldpos).Magnitude / 197.5
						local tweenold = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(distance, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(_G.oldpos)})
						tweenold:Play()
					end
				end
			end
		end)
	end
end)



--Player
local Statustap = Tap.Player:AddSection("Player Status")

local stlv = Statustap:AddParagraph({
    Title = ""
})

local stxp = Statustap:AddParagraph({
    Title = ""
})

local stbl = Statustap:AddParagraph({
    Title = ""
})

local stfm = Statustap:AddParagraph({
    Title = ""
})

local strc = Statustap:AddParagraph({
    Title = ""
})

local stvl = Statustap:AddParagraph({
    Title = ""
})

local stbh = Statustap:AddParagraph({
    Title = ""
})

local stsp = Statustap:AddParagraph({
    Title = ""
})

local Playertap = Tap.Player:AddSection("All Player")
_G.SelectPly = nil

local Playerslist = {}

local SelectedPly = Playertap:AddDropdown("SelectedPly", {
    Title = "Select Player",
    Description = "",
    Values = Playerslist,
    Multi = false,
})

SelectedPly:SetValue()
SelectedPly:OnChanged(function(Value)
    _G.SelectPly = Value
end)


Playertap:AddButton({
    Title = "Refresh Player",
    Description = "",
    Callback = function()
        table.clear(Playerslist)
        for i,p in pairs(game.Players:GetChildren()) do
            if p.Name ~= LocalPlayer.Name then
				table.insert(Playerslist,p.Name)
				SelectedPly:SetValue(PlayerList)
			end
        end
    end
})

Playertap:AddButton({
	Title = "Go To Player",
	Description = "",
	Callback = function()
		if _G.SelectPly ~= nil then
			_G.Warp = true
			local pspos = game.Players:WaitForChild(_G.SelectPly).Character:WaitForChild("HumanoidRootPart")
			local disp = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - pspos.Position).Magnitude
			tweentp = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(disp / 197.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(pspos.Position)})
			tweentp:Play()
			Wait(disp / 197.5)
			_G.Warp = false
		end
	end
})

Playertap:AddButton({
	Title = "Cancel",
	Description = "",
	Callback = function()
		if tweentp then
			tweentp:Cancel()
			_G.Warp = false
		end
	end
})

RunService.RenderStepped:Connect(function()
    stlv:SetTitle("Level  :  " .. Client.Data.Level.Value)
    stxp:SetTitle("Exp  :  " .. Client.Data.Exp.Value)
    stbl:SetTitle("Beli  :  " .. Client.Data.Beli.Value)
    stfm:SetTitle("Fragments  :  " .. Client.Data.Fragments.Value)
    strc:SetTitle("Race  :  " .. Client.Data.Race.Value)
    stvl:SetTitle("Valor Point  :  " .. Client.Data.Valor.Value)
    stbh:SetTitle("Bouunty  :  " .. Client.leaderstats:FindFirstChild("Bounty/Honor").Value)
    stsp:SetTitle("Spawn Point  :  " .. Client.Data.SpawnPoint.Value)
end)


--Shop

local Fighting = Tap.Shop:AddSection("Fighting Styles")

Fighting:AddButton({
	Title = "Black Leg",
	Description = "💶 150,000",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
	end
})
Fighting:AddButton({
	Title = "Electro",
	Description = "💶 500,000",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
	end
})
Fighting:AddButton({
	Title = "Fishman Karate",
	Description = "💶 750,000",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
	end
})
Fighting:AddButton({
	Title = "Dragon Claw",
	Description = "💷 1,500",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
	end
})
Fighting:AddButton({
	Title = "Superhuman",
	Description = "💶 3,000,000",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
	end
})
Fighting:AddButton({
	Title = "Death Step",
	Description = "💶 2,500,000 | 💷 5,000",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
	end
})
Fighting:AddButton({
	Title = "Sharkman Karate",
	Description = "💶 2,500,000 | 💷 5,000",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true)
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
	end
})
Fighting:AddButton({
	Title = "Electric Claw",
	Description = "💶 3,000,000 | 💷 5,000",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
	end
})
Fighting:AddButton({
	Title = "Dragon Talon",
	Description = "💶 3,000,000 | 💷 5,000",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
	end
})
Fighting:AddButton({
	Title = "Godhuman",
	Description = "💶:5,000,000 | 💷:5,000 | DragonScale:10 | FishTail:20 | MysticDroplet:10 | MagmaOre:20",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
	end
})
Fighting:AddButton({
	Title = "Sanguine Art",
	Description = "💶:5,000,000 | 💷:5,000 | DemonicWisps:20 | VampireFangs:20 | DarkFragments:2",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt")
	end
})

local Sword = Tap.Shop:AddSection("Sword")

local Other = Tap.Shop:AddSection("Other items")

Other:AddButton({
	Title = "Geppo",
	Description = "💶 10,000",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
	end
})
Other:AddButton({
	Title = "Haki",
	Description = "💶 25,000",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso")
	end
})
Other:AddButton({
	Title = "Soru",
	Description = "💶 100,000",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Soru")
	end
})
Other:AddButton({
	Title = "Ken",
	Description = "💶 700,000",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk","Buy")
	end
})

Other:AddButton({
	Title = "Refund Stats",
	Description = "💷 2,500",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","1")
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","2")
	end
})

Other:AddButton({
	Title = "Reroll Race",
	Description = "💷 3,000",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","1")
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","2")
	end
})
Other:AddButton({
        Title = "Buy Race Cyborg",
        Description = "💷 3,000",
        Callback = function()            
    	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CyborgTrainer","Buy")
    end
})
Other:AddButton({
    Title = "Buy Race Ghoul",
    Description = "250 Ectoplasm",
    Callback = function()            
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm","BuyCheck",4)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm","Change",4)
    end
})

Other:AddButton({
    Title = "Random Fruit",
    Description = "🍎",
    Callback = function()            
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
    end
})


















--Teleport
local teleport_tap = Tap.Teleport:AddSection("Teleport To Island")
local Island = nil

local slil = teleport_tap:AddDropdown("teleport", {
    Title = "Select Island",
    Values = {"Priate Starter","Marine Starter","Jungle","Middle Town","Underwater City","On The Water","Prison","Forzen Village","Colosseum","Skyland","Upper Sky","Pirate Village","Desert","Magma Village","Fountain City","Marine Fortrsee"},
    Multi = false,
})

slil:OnChanged(function(Value)
    Island = Value
end)

teleport_tap:AddButton({
    Title = "Go To",
    Description = "Go To Island",
    Callback = function()
        if Island ~= nil then
			if Island == "Priate Starter" then
				_G.Warp = true
				local part = workspace._WorldOrigin.PlayerSpawns.Pirates.Default.Part
				local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude > 20000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.68798828125, 5.350067615509033, -1926.2139892578125))
					LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0,30,0))
				end
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude < 20000 then
					local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
					tweenPS = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(distance, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(part.Position)})
					tweenPS:Play()
					wait(distance)
					_G.Warp = false
				end
			end
			if Island == "Marine Starter" then
				_G.Warp = true
				local part = workspace._WorldOrigin.PlayerSpawns.Marines.Default.Part
				local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude > 20000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.68798828125, 5.350067615509033, -1926.2139892578125))
					LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0,30,0))
				end
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude < 20000 then
					local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
					tweenMS = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(distance, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(part.Position)})
					tweenMS:Play()
					wait(distance)
					_G.Warp = false
				end
			end
			if Island == "Jungle" then
				_G.Warp = true
				local part = workspace._WorldOrigin.PlayerSpawns.Pirates.Jungle.Part
				local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude > 20000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.68798828125, 5.350067615509033, -1926.2139892578125))
					LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0,30,0))
				end
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude < 20000 then
					local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
					tweenJg = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(distance, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(part.Position)})
					tweenJg:Play()
					wait(distance)
					_G.Warp = false
				end
			end
			if Island == "Middle Town" then
				_G.Warp = true
				local part = workspace._WorldOrigin.PlayerSpawns.Pirates.Town.Part
				local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude > 20000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.68798828125, 5.350067615509033, -1926.2139892578125))
					LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0,30,0))
				end
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude < 20000 then
					local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
					tweenMT = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(distance, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(part.Position)})
					tweenMT:Play()
					wait(distance)
					_G.Warp = false
				end
			end
			if Island == "Underwater City" then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
			end
			if Island == "On The Water" then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.68798828125, 5.350067615509033, -1926.2139892578125))
			end
			if Island == "Prison" then
				_G.Warp = true
				local part = workspace._WorldOrigin.PlayerSpawns.Pirates.Prison.Part
				local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude > 20000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.68798828125, 5.350067615509033, -1926.2139892578125))
					LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0,30,0))
				end
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude < 20000 then
					local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
					tweenP = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(distance, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(part.Position)})
					tweenP:Play()
					wait(distance)
					_G.Warp = false
				end
			end
			if Island == "Forzen Village" then
				_G.Warp = true
				local part = workspace._WorldOrigin.PlayerSpawns.Pirates.Ice.Part
				local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude > 20000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.68798828125, 5.350067615509033, -1926.2139892578125))
					LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0,30,0))
				end
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude < 20000 then
					local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
					tweenFV = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(distance, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(part.Position)})
					tweenFV:Play()
					wait(distance)
					_G.Warp = false
				end
			end
			if Island == "Colosseum" then
				_G.Warp = true
				local part = workspace._WorldOrigin.PlayerSpawns.Pirates.Colosseum.Part
				local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude > 20000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.68798828125, 5.350067615509033, -1926.2139892578125))
					LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0,30,0))
				end
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude < 20000 then
					local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
					tweenCs = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(distance, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(part.Position)})
					tweenCs:Play()
					wait(distance)
					_G.Warp = false
				end
			end
			if Island == "Skyland" then
				_G.Warp = true
				local part = workspace._WorldOrigin.PlayerSpawns.Pirates.Sky.Part
				local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude > 20000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.68798828125, 5.350067615509033, -1926.2139892578125))
					LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0,30,0))
				end
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude < 20000 then
					local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
					tweenSl = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(distance, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(part.Position)})
					tweenSl:Play()
					wait(distance)
					_G.Warp = false
				end
			end
			if Island == "Upper Sky" then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
			end
			if Island == "Pirate Village" then
				_G.Warp = true
				local part = workspace._WorldOrigin.PlayerSpawns.Pirates.Pirate.Part
				local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude > 20000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.68798828125, 5.350067615509033, -1926.2139892578125))
					LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0,30,0))
				end
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude < 20000 then
					local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
					tweenPV = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(distance, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(part.Position)})
					tweenPV:Play()
					wait(distance)
					_G.Warp = false
				end
			end
			if Island == "Desert" then
				_G.Warp = true
				local part = workspace._WorldOrigin.PlayerSpawns.Pirates.Desert.Part
				local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude > 20000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.68798828125, 5.350067615509033, -1926.2139892578125))
					LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0,30,0))
				end
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude < 20000 then
					local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
					tweenD = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(distance, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(part.Position)})
					tweenD:Play()
					wait(distance)
					_G.Warp = false
				end
			end
			if Island == "Magma Village" then
				_G.Warp = true
				local part = workspace._WorldOrigin.PlayerSpawns.Pirates.Magma.Part
				local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude > 20000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.68798828125, 5.350067615509033, -1926.2139892578125))
					LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0,30,0))
				end
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude < 20000 then
					local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
					tweenMV = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(distance, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(part.Position)})
					tweenMV:Play()
					wait(distance)
					_G.Warp = false
				end
			end
			if Island == "Marine Fortress" then
				_G.Warp = true
				local part = workspace._WorldOrigin.PlayerSpawns.Pirates.MarineBase.Part
				local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude > 20000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.68798828125, 5.350067615509033, -1926.2139892578125))
					LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0,30,0))
				end
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude < 20000 then
					local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
					tweenMF = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(distance, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(part.Position)})
					tweenMF:Play()
					wait(distance)
					_G.Warp = false
				end
			end
			if Island == "Fountain City" then
				_G.Warp = true
				local part = workspace._WorldOrigin.PlayerSpawns.Pirates.Fountain.Part
				local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude > 20000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.68798828125, 5.350067615509033, -1926.2139892578125))
					LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0,30,0))
				end
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude < 20000 then
					local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
					tweenFC = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(distance, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(part.Position)})
					tweenFC:Play()
					wait(distance)
					_G.Warp = false
				end
			end
		end
    end
})

teleport_tap:AddButton({
    Title = "Cancel Tween",
    Callback = function()
        if tweenPS then
            tweenPS:Cancel()
			_G.Warp = false
        end
        if tweenMS then
            tweenMS:Cancel()
			_G.Warp = false
        end
        if tweenJg then
            tweenJg:Cancel()
			_G.Warp = false
        end
        if tweenMT then
            tweenMT:Cancel()
			_G.Warp = false
        end
        if tweenP then
            tweenP:Cancel()
			_G.Warp = false
        end
        if tweenFV then
            tweenFV:Cancel()
			_G.Warp = false
        end
        if tweenCs then
            tweenCs:Cancel()
			_G.Warp = false
        end
		if tweenSl then
            tweenSl:Cancel()
			_G.Warp = false
        end
		if tweenPV then
            tweenPV:Cancel()
			_G.Warp = false
        end
		if tweenD then
            tweenD:Cancel()
			_G.Warp = false
        end
		if tweenMV then
            tweenMV:Cancel()
			_G.Warp = false
        end
		if tweenMF then
            tweenMF:Cancel()
			_G.Warp = false
        end
		if tweenFC then
            tweenFC:Cancel()
			_G.Warp = false
        end
    end
})








--Setting
local Team = Tap.Settings:AddSection("Team")

Team:AddButton({
	Title = "Join Pirates Team",
	Description = "",
	Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam","Pirates") 
	end
})


Team:AddButton({
	Title = "Join Marines Team",
	Description = "",
	Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam","Marines") 
	end
})

local setting_server = Tap.Settings:AddSection("Server")
_G.auto_rejoin = nil

setting_server:AddButton({
	Title = "First Sea 1",
	Description = "",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
	end
})

setting_server:AddButton({
	Title = "Second Sea 2",
	Description = "",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
	end
})

setting_server:AddButton({
	Title = "Third Sea 3",
	Description = "",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
	end
})

local autorejoin = setting_server:AddToggle("auto rejoin",{
    Title = "Auto Rejoin",
    Default = true
})

autorejoin:OnChanged(function(Toggle)
    _G.auto_rejoin = Toggle
end)

RunService.RenderStepped:Connect(function()
    getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
		if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") and _G.auto_rejoin == true then
			TeleportService:TeleportToPlaceInstance(game.placeId, game.jobId, game.Players.LocalPlayer);
		end
	end)
end)

setting_server:AddButton({
	Title = "Rejoin Server",
	Description = "",
	Callback = function()
		TeleportService:TeleportToPlaceInstance(game.placeId, game.jobId, game.Players.LocalPlayer);
	end
})
-------------------------------------------------------------------------------------------------------------------------------------------------

spawn(function()
	while task.wait(0.005) do
		pcall(function()
			wait(300)
			game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
			wait(0.1)
			game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		end)
	end
end)

function AntiBan()
    for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
        if v:IsA("LocalScript") then
            if v.Name == "General" or v.Name == "Shiftlock"  or v.Name == "FallDamage" or v.Name == "4444" or v.Name == "CamBob" or v.Name == "JumpCD" or v.Name == "Looking" or v.Name == "Run" then
                v:Destroy()
            end
        end
     end
     for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerScripts:GetDescendants()) do
        if v:IsA("LocalScript") then
            if v.Name == "RobloxMotor6DBugFix" or v.Name == "Clans"  or v.Name == "Codes" or v.Name == "CustomForceField" or v.Name == "MenuBloodSp"  or v.Name == "PlayerList" then
                v:Destroy()
            end
        end
     end
end
AntiBan()

local Old = os.time()
	task.spawn(function(InitializeService)
		pcall(function()
			for i,g in pairs(getconnections(Client.Idled)) do
				g:Disable() 
			end
		end)
	end)
do
	Settings_M = Tap.Settings:AddSection("Info") do
		Timeing = Settings_M:AddParagraph({        
			Title = ""
		})
		Server_Time = Settings_M:AddParagraph({
			Title = ""
		})
		Date = Settings_M:AddParagraph({        
			Title = ""
		})
		Region = Settings_M:AddParagraph({        
			Title = ""
		})
	end

	RunService.RenderStepped:Connect(function() -- All RunService
		local TimeSinceLastPlay = os.time() - Old
		local hours = tostring(math.floor(TimeSinceLastPlay / 3600))
		local minutes = tostring(math.floor((TimeSinceLastPlay % 3600) / 60))
		local seconds = tostring(TimeSinceLastPlay % 60)
		Timeing:SetTitle("Script is working  : "..hours.." H "..minutes.." M "..seconds.." S ")

		local LocalizationService = game:GetService("LocalizationService")
		local date = os.date("*t")
		local hour = (date.hour) % 24
		local ampm = hour < 12 and "AM" or "PM"
		local timezone = string.format("%02i:%02i:%02i %s", ((hour -1) % 12) + 1, date.min, date.sec, ampm)
		local datetime = string.format("%02d/%02d/%04d", date.day, date.month, date.year)
		local GameTime = math.floor(workspace.DistributedGameTime+0.5)
		local Hour = math.floor(GameTime/(60^2))%24
		local Minute = math.floor(GameTime/(60^1))%60
		local Second = math.floor(GameTime/(60^0))%60

		Server_Time:SetTitle("Joined Server Time : " .. Hour .. " H " .. Minute .. " M " .. Second .. " S ")
		Date:SetTitle("Data : " .. datetime .. " " .. timezone)
		Region:SetTitle("Player Region : " .. LocalizationService:GetCountryRegionForPlayerAsync(LocalPlayer))
	end)



	InterfaceManager:SetLibrary(Fluent)
	InterfaceManager:BuildInterfaceSection(Tap.Settings)
	Window:SelectTab(1)
	Fluent:SetTheme("Darker")

	setfpscap(60)
	while true do
    	if (game:GetService("Workspace").DistributedGameTime % 1 * 60) > 30 then
        	setfpscap(60)
    	end
    	wait(0)
	end
end
