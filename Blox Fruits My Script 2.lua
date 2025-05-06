local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/Karaca00/My-Fluent-UI/refs/heads/main/Fluent%20UI%20Library.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Karaca00/My-Fluent-UI/refs/heads/main/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
	Title = "Karaca Hub",
	SubTitle = "Blox Fruits : Second Sea",
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
	Raid = Window:AddTab({Title = "Raid", Icon = "bookmark"}),
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
	if Level.Value >= 700 and Level.Value < 725 then
		MonN = "Raider"
		QuestN = "Area1Quest"
		QuestL = 1
		QuestP = Vector3.new(-427.72567749023, 72.99634552002, 1835.9426269531)
		MonP = Vector3.new(68.874565124512, 93.635643005371, 2429.6752929688)
	end
	if Level.Value >= 725 and Level.Value < 775 then
		MonN = "Mercenary"
		QuestN = "Area1Quest"
		QuestL = 2
		QuestP = Vector3.new(-427.72567749023, 72.99634552002, 1835.9426269531)
		MonP = Vector3.new(-864.85009765625, 122.47104644775, 1453.1505126953)
	end
	if Level.Value >= 775 and Level.Value < 800 then
		MonN = "Swan Pirate"
		QuestN = "Area2Quest"
		QuestL = 1
		QuestP = Vector3.new(635.61151123047, 73.096351623535, 917.81298828125)
		MonP = Vector3.new(1065.3669433594, 137.64012145996, 1324.3798828125)
	end
	if Level.Value >= 800 and Level.Value < 875 then
		MonN = "Factory Staff"
		QuestN = "Area2Quest"
		QuestL = 2
		QuestP = Vector3.new(635.61151123047, 73.096351623535, 917.81298828125)
		MonP = Vector3.new(533.22045898438, 128.46876525879, 355.62615966797)
	end
	if Level.Value >= 875 and Level.Value < 900 then
		MonN = "Marine Lieutenant"
		QuestN = "MarineQuest3"
		QuestL = 1
		QuestP = Vector3.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
		MonP = Vector3.new(-2489.2622070313, 84.613594055176, -3151.8830566406)
	end
	if Level.Value >= 900 and Level.Value < 950 then
		MonN = "Marine Captain"
		QuestN = "MarineQuest3"
		QuestL = 2
		QuestP = Vector3.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
		MonP = Vector3.new(-2335.2026367188, 79.786659240723, -3245.8674316406)
	end
	if Level.Value >= 950 and Level.Value < 975 then
		MonN = "Zombie"
		QuestN = "ZombieQuest"
		QuestL = 1
		QuestP = Vector3.new(-5494.3413085938, 48.505931854248, -794.59094238281)
		MonP = Vector3.new(-5536.4970703125, 101.08577728271, -835.59075927734)
	end
	if Level.Value >= 975 and Level.Value < 1000 then
		MonN = "Vampire"
		QuestN = "ZombieQuest"
		QuestL = 2
		QuestP = Vector3.new(-5494.3413085938, 48.505931854248, -794.59094238281)
		MonP = Vector3.new(-5806.1098632813, 16.722528457642, -1164.4384765625)
	end
	if Level.Value >= 1000 and Level.Value < 1050 then
		MonN = "Snow Trooper"
		QuestN = "SnowMountainQuest"
		QuestL = 1
		QuestP = Vector3.new(607.05963134766, 401.44781494141, -5370.5546875)
		MonP = Vector3.new(535.21051025391, 432.74209594727, -5484.9165039063)
	end
	if Level.Value >= 1050 and Level.Value < 1100 then
		MonN = "Winter Warrior"
		QuestN = "SnowMountainQuest"
		QuestL = 2
		QuestP = Vector3.new(607.05963134766, 401.44781494141, -5370.5546875)
		MonP = Vector3.new(1234.4449462891, 456.95419311523, -5174.130859375)
	end
	if Level.Value >= 1100 and Level.Value < 1125 then
		MonN = "Lab Subordinate"
		QuestN = "IceSideQuest"
		QuestL = 1
		QuestP = Vector3.new(-6061.841796875, 15.926671981812, -4902.0385742188)
		MonP = Vector3.new(-5720.5576171875, 63.309471130371, -4784.6103515625)
	end
	if Level.Value >= 1125 and Level.Value < 1175 then
		MonN = "Horned Warrior"
		QuestN = "IceSideQuest"
		QuestL = 2
		QuestP = Vector3.new(-6061.841796875, 15.926671981812, -4902.0385742188)
		MonP = Vector3.new(-6292.751953125, 91.181983947754, -5502.6499023438)
	end
	if Level.Value >= 1175 and Level.Value < 1200 then
		MonN = "Magma Ninja"
		QuestN = "FireSideQuest"
		QuestL = 1
		QuestP = Vector3.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
		MonP = Vector3.new(-5461.8388671875, 130.36347961426, -5836.4702148438)
	end
	if Level.Value >= 1200 and Level.Value < 1250 then
		MonN = "Lava Pirate"
		QuestN = "FireSideQuest"
		QuestL = 2
		QuestP = Vector3.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
		MonP = Vector3.new(-5251.1889648438, 55.164535522461, -4774.4096679688)
	end
	if Level.Value >= 1250 and Level.Value < 1275 then
		MonN = "Ship Deckhand"
		QuestN = "ShipQuest1"
		QuestL = 1
		QuestP = Vector3.new(1040.2927246094, 125.08293151855, 32911.0390625)
		MonP = Vector3.new(921.12365722656, 125.9839553833, 33088.328125)
	end
	if Level.Value >= 1275 and Level.Value < 1300 then
		MonN = "Ship Engineer"
		QuestN = "ShipQuest1"
		QuestL = 2
		QuestP = Vector3.new(1040.2927246094, 125.08293151855, 32911.0390625)
		MonP = Vector3.new(886.28179931641, 40.47790145874, 32800.83203125)
	end
	if Level.Value >= 1300 and Level.Value < 1325 then
		MonN = "Ship Steward"
		QuestN = "ShipQuest2"
		QuestL = 1
		QuestP = Vector3.new(971.42065429688, 125.08293151855, 33245.54296875)
		MonP = Vector3.new(943.85504150391, 129.58183288574, 33444.3671875)
	end
	if Level.Value >= 1325 and Level.Value < 1350 then
		MonN = "Ship Officer"
		QuestN = "ShipQuest2"
		QuestL = 2
		QuestP = Vector3.new(971.42065429688, 125.08293151855, 33245.54296875)
		MonP = Vector3.new(955.38458251953, 181.08335876465, 33331.890625)
	end
	if Level.Value >= 1350 and Level.Value < 1375 then
		MonN = "Arctic Warrior"
		QuestN = "FrostQuest"
		QuestL = 1
		QuestP = Vector3.new(5668.1372070313, 28.202531814575, -6484.6005859375)
		MonP = Vector3.new(5935.4541015625, 77.26016998291, -6472.7568359375)
	end
	if Level.Value >= 1375 and Level.Value < 1425 then
		MonN = "Snow Lurker"
		QuestN = "FrostQuest"
		QuestL = 2
		QuestP = Vector3.new(5668.1372070313, 28.202531814575, -6484.6005859375)
		MonP = Vector3.new(5628.482421875, 57.574996948242, -6618.3481445313)
	end
	if Level.Value >= 1425 and Level.Value < 1450 then
		MonN = "Sea Soldier"
		QuestN = "ForgottenQuest"
		QuestL = 1
		QuestP = Vector3.new(-3054.5827636719, 236.87213134766, -10147.790039063)
		MonP = Vector3.new(-3185.0153808594, 58.789089202881, -9663.6064453125)
	end
	if Level.Value >= 1450  then
		MonN = "Water Fighter"
		QuestN = "ForgottenQuest"
		QuestL = 2
		QuestP = Vector3.new(-3054.5827636719, 236.87213134766, -10147.790039063)
		MonP = Vector3.new(-3262.9301757813, 298.69036865234, -10552.529296875)
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
		if _G.Toggle_Farm == true or _G.AroundM == true or _G.Auto_boss == true or _G.Auto_FDun == true then
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
									if Level.Value >= 1250 and Level.Value < 1350  then
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
									end
									if Level.Value >= 1350 then
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 99.034996032715, -132.83953857422))
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
							if Level.Value >= 1250 and Level.Value < 1350  then
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
							end
							if Level.Value >= 1350 then
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 99.034996032715, -132.83953857422))
							end 
						end
					end
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
            if Boss.Name == "Diamond" or Boss.Name == "Jeremy" or Boss.Name == "Fajita" or Boss.Name == "Don Swan" or Boss.Name == "Smoke Admiral" or Boss.Name == "Cursed Captain" or Boss.Name == "Darkbeard" or Boss.Name == "Order" or Boss.Name == "Awakened Ice Admiral" or Boss.Name == "Tide Keeper" then
				table.insert(Bosslist,Boss.Name)
				SelectedBoss:SetValue(Bosslist)
			end
        end
		for i,Boss in pairs(game.Workspace.Enemies:GetChildren()) do
            if Boss.Name == "Diamond" or Boss.Name == "Jeremy" or Boss.Name == "Fajita" or Boss.Name == "Don Swan" or Boss.Name == "Smoke Admiral" or Boss.Name == "Cursed Captain" or Boss.Name == "Darkbeard" or Boss.Name == "Order" or Boss.Name == "Awakened Ice Admiral" or Boss.Name == "Tide Keeper" then
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
    Values = {"Kingdom Of Rese","Cafe","Green Zone","Grave Yard","Cursed Ship","Hot And Cold","Forgotten Island","Snow Mountain","Ice Castle","Dark Arena"},
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
			if Island == "Kingdom Of Rese" then
				_G.Warp = true
				local part = workspace._WorldOrigin.PlayerSpawns.Pirates.Default.Part
				local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude > 20000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 99.034996032715, -132.83953857422))
					LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0,30,0))
				end
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude < 20000 then
					local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
					tweenpt = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(distance, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(part.Position)})
					tweenpt:Play()
					wait(distance)
					_G.Warp = false
				end
			end
			if Island == "Cafe" then
				_G.Warp = true
				local part = workspace._WorldOrigin.PlayerSpawns.Pirates.Bar.Part
				local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude > 20000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 99.034996032715, -132.83953857422))
					LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0,30,0))
				end
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude < 20000 then
					local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
					tweenhl = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(distance, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(part.Position)})
					tweenhl:Play()
					wait(distance)
					_G.Warp = false
				end
			end
			if Island == "Green Zone" then
				_G.Warp = true
				local part = workspace._WorldOrigin.PlayerSpawns.Pirates.Greenb.Part
				local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude > 20000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 99.034996032715, -132.83953857422))
					LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0,30,0))
				end
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude < 20000 then
					local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
					tweengt = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(distance, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(part.Position)})
					tweengt:Play()
					wait(distance)
					_G.Warp = false
				end
			end
			if Island == "Grave Yard" then
				_G.Warp = true
				local part = workspace._WorldOrigin.PlayerSpawns.Pirates.Graveyard.Part
				local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude > 20000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 99.034996032715, -132.83953857422))
					LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0,30,0))
				end
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude < 20000 then
					local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
					tweencfts = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(distance, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(part.Position)})
					tweencfts:Play()
					wait(distance)
					_G.Warp = false
				end
			end
			if Island == "Cursed Ship" then
				_G.Warp = true
				local part = workspace._WorldOrigin.PlayerSpawns.Pirates.Ship.Part
				local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude > 20000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
				end
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude < 20000 then
					local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
					tweenm = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(distance, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(part.Position)})
					tweenm:Play()
					wait(distance)
					_G.Warp = false
				end
			end
			if Island == "Hot And Cold" then
				_G.Warp = true
				local part = workspace._WorldOrigin.PlayerSpawns.Pirates.CircleIslandIce.Part
				local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude > 20000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 99.034996032715, -132.83953857422))
					LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0,30,0))
				end
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude < 20000 then
					local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
					tweento = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(distance, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(part.Position)})
					tweento:Play()
					wait(distance)
					_G.Warp = false
				end
			end
			if Island == "Forgotten Island" then
				_G.Warp = true
				local part = workspace._WorldOrigin.PlayerSpawns.Pirates.ForgottenIsland.Part
				local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude > 20000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 99.034996032715, -132.83953857422))
					LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0,30,0))
				end
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude < 20000 then
					local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
					tweenhc = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(distance, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(part.Position)})
					tweenhc:Play()
					wait(distance)
					_G.Warp = false
				end
			end
			if Island == "Snow Mountain" then
				_G.Warp = true
				local part = workspace._WorldOrigin.PlayerSpawns.Pirates.Snowy.Part
				local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude > 20000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 99.034996032715, -132.83953857422))
					LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0,30,0))
				end
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude < 20000 then
					local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
					tweenii = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(distance, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(part.Position)})
					tweenii:Play()
					wait(distance)
					_G.Warp = false
				end
			end
			if Island == "Ice Castle" then
				_G.Warp = true
				local part = workspace._WorldOrigin.PlayerSpawns.Pirates.IceCastle.Part
				local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude > 20000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 99.034996032715, -132.83953857422))
					LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0,30,0))
				end
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude < 20000 then
					local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
					tweenpi = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(distance, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(part.Position)})
					tweenpi:Play()
					wait(distance)
					_G.Warp = false
				end
			end
			if Island == "Dark Arena" then
				_G.Warp = true
				local part = workspace.Map.DarkbeardArena.Summoner.Model:GetChildren()[14]
				local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude > 20000 then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 99.034996032715, -132.83953857422))
					LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0,30,0))
				end
				if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - part.Position).Magnitude < 20000 then
					local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
					tweenli = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(distance, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(part.Position)})
					tweenli:Play()
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
        if tweenpt then
            tweenpt:Cancel()
			_G.Warp = false
        end
        if tweenhl then
            tweenhl:Cancel()
			_G.Warp = false
        end
        if tweengt then
            tweengt:Cancel()
			_G.Warp = false
        end
        if tweencfts then
            tweencfts:Cancel()
			_G.Warp = false
        end
        if tweenm then
            tweenm:Cancel()
			_G.Warp = false
        end
        if tweento then
            tweento:Cancel()
			_G.Warp = false
        end
        if tweenhc then
            tweenhc:Cancel()
			_G.Warp = false
        end
        if tweenii then
            tweenii:Cancel()
			_G.Warp = false
        end
        if tweenpi then
            tweenpi:Cancel()
			_G.Warp = false
        end
        if tweenli then
            tweenli:Cancel()
			_G.Warp = false
        end
    end
})


--Raid

local Dungeon = Tap.Raid:AddSection("Dungeon")
_G.SelectedDun = nil
_G.Auto_Chip = nil
_G.Auto_StartRaid = nil
_G.Auto_FDun = nil



local SelectDun = Dungeon:AddDropdown("Sd", {
    Title = "Select Dungeon",
    Values = {"Flame","Ice","Quake","Light","Dark","Spider","Rumble","Magma","Buddha","Sand","Phoenix","Dough"},
    Multi = false,
    Default = nil,
})

SelectDun:OnChanged(function(Value)
	_G.SelectedDun = Value
end)


Dungeon:AddButton({
	Title = "Buy Chip",
	Description = "",
	Callback = function()
		if _G.SelectedDun ~= nil then
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc","Select",_G.SelectedDun)
		end
	end
})

local Auto_BChip = Dungeon:AddToggle("ABC", {
	Title = "Auto Buy Chip",
	Default = false
})

Auto_BChip:OnChanged(function(Toggle)
	_G.Auto_Chip = Toggle
end)



Dungeon:AddButton({
	Title = "Start Dungeon",
	Description = "",
	Callback = function()
		if LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible == false then
			if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") then
				fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
			end
		end
	end
})

local Auto_StartDun = Dungeon:AddToggle("ASD", {
	Title = "Auto Start Dungeon",
	Default = false
})

Auto_StartDun:OnChanged(function(Toggle)
	_G.Auto_StartRaid = Toggle
end)




spawn(function()
	while task.wait(0.1) do
		pcall(function()
			if _G.Auto_Chip == true then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc","Select",_G.SelectedDun)
			end
			if _G.Auto_StartRaid == true then
                if LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible == false then
                    if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") then
                        fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                    end
                end
            end
		end)
	end
end)

local dMon = nil

function Dungeonfarm()
	pcall(function()
		while _G.Auto_FDun == true do
			wait(0.005)
			_G.Warp = true
			if LocalPlayer.Character:WaitForChild("Humanoid").Health >= 1 then
				if _G.Auto_FDun == true then
					if LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible == true then
						if game.Workspace.Enemies:FindFirstChildWhichIsA("Model") then
							for i,d in pairs(game.Workspace.Enemies:GetChildren()) do
								dMon = d
								if dMon ~= nil then
									if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - dMon:WaitForChild("HumanoidRootPart").Position).Magnitude <= 2000 then
										if dMon:WaitForChild("Humanoid").Health >= 1 then
											local distance = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - dMon:WaitForChild("HumanoidRootPart").Position).Magnitude
											local posdm = CFrame.new(dMon:WaitForChild("HumanoidRootPart").Position)
											tweenrmp = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(distance / 197.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = posdm * CFrame.new(0,50,0)})
											tweenrmp:Play()
											wait(distance / 197.5)
											repeat
												wait(0.005)
												if LocalPlayer.Character:FindFirstChild(_G.Weapon) then
													if _G.Auto_FDun == true then
														local randomPos = math.random(1,5)
														if randomPos == 1 then
															local distance = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - dMon:WaitForChild("HumanoidRootPart").Position).Magnitude
															local posdm = CFrame.new(dMon:WaitForChild("HumanoidRootPart").Position)
															tweenrmrp1 = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(distance / 500, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = posdm * CFrame.new(0,60,0)})
															tweenrmrp1:Play()
														end
														if randomPos == 2 then
															local distance = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - dMon:WaitForChild("HumanoidRootPart").Position).Magnitude
															local posdm = CFrame.new(dMon:WaitForChild("HumanoidRootPart").Position)
															tweenrmrp2 = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(distance / 500, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = posdm * CFrame.new(50,35,0)})
															tweenrmrp2:Play()
														end
														if randomPos == 3 then
															local distance = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - dMon:WaitForChild("HumanoidRootPart").Position).Magnitude
															local posdm = CFrame.new(dMon:WaitForChild("HumanoidRootPart").Position)
															tweenrmrp3 = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(distance / 500, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = posdm * CFrame.new(0,35,50)})
															tweenrmrp3:Play()
														end
														if randomPos == 4 then
															local distance = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - dMon:WaitForChild("HumanoidRootPart").Position).Magnitude
															local posdm = CFrame.new(dMon:WaitForChild("HumanoidRootPart").Position)
															tweenrmrp4 = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(distance / 500, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = posdm * CFrame.new(-50,35,0)})
															tweenrmrp4:Play()
														end
														if randomPos == 5 then
															local distance = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - dMon:WaitForChild("HumanoidRootPart").Position).Magnitude
															local posdm = CFrame.new(dMon:WaitForChild("HumanoidRootPart").Position)
															tweenrmrp5 = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(distance / 500, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = posdm * CFrame.new(0,35,-50)})
															tweenrmrp5:Play()
														end
														dMon:WaitForChild("Humanoid").WalkSpeed = 0
														dMon:WaitForChild("Humanoid").Sit = true
														sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
													end
												elseif not LocalPlayer.Character:FindFirstChild(_G.Weapon) and _G.Toggle_Equip == true then
													if _G.Auto_FDun == true then
														LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(LocalPlayer.Backpack:WaitForChild(_G.Weapon))
														Dungeonfarm()
													end
												end
											until dMon:WaitForChild("Humanoid").Health == 0 do
												Dungeonfarm()
											end
										end
									end
								end
							end
						else
							if not game.Workspace.Enemies:FindFirstChildWhichIsA("Model") then
								for i,isl in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
									if isl.Name == "Island 5" or isl.Name == "Island 4" or isl.Name == "Island 3" or isl.Name == "Island 2" or isl.Name == "Island 1" then
										if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - isl.Position).Magnitude <= 2000 then
											if isl.Name == "Island 5" then
												local location = isl
												local distance = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - location.Position).Magnitude
												tweenril5 = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(distance / 197.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(location.Position + Vector3.new(0,150,0))})
												tweenril5:Play()
											elseif isl.Name == "Island 4" then
												local location = isl
												local distance = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - location.Position).Magnitude
												tweenril4 = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(distance / 197.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(location.Position + Vector3.new(0,150,0))})
												tweenril4:Play()
											elseif isl.Name == "Island 3" then
												local location = isl
												local distance = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - location.Position).Magnitude
												tweenril3 = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(distance / 197.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(location.Position + Vector3.new(0,150,0))})
												tweenril3:Play()
											elseif isl.Name == "Island 2" then
												local location = isl
												local distance = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - location.Position).Magnitude
												tweenril2 = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(distance / 197.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(location.Position + Vector3.new(0,150,0))})
												tweenril2:Play()
											elseif isl.Name == "Island 1" then
												local location = isl
												local distance = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - location.Position).Magnitude
												tweenril1 = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(distance / 197.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(location.Position + Vector3.new(0,150,0))})
												tweenril1:Play()
											end
										end
									end
								end
							end
					end
				end
			end
			elseif LocalPlayer.Character:WaitForChild("Humanoid").Health == 0 then
				repeat
					wait()
					Dungeonfarm()
				until LocalPlayer.Character:WaitForChild("Humanoid").Health ~= 0 do
					Dungeonfarm()
				end
			end
		end
	end)
end







local Auto_FarmDun= Dungeon:AddToggle("AFD", {
	Title = "Auto Farm Dungeon",
	Default = false
})

Auto_FarmDun:OnChanged(function(Toggle)
	_G.Auto_FDun = Toggle
	_G.Warp = true
	Dungeonfarm()
	if _G.Auto_FDun == false then
		_G.Warp = false
		if tweenrmp then
			tweenrmp:Cancel()
		end
		if tweenril1 then
			tweenril1:Cancel()
		end
		if tweenril2 then
			tweenril2:Cancel()
		end
		if tweenril3 then
			tweenril3:Cancel()
		end
		if tweenril4 then
			tweenril4:Cancel()
		end
		if tweenril5 then
			tweenril5:Cancel()
		end
		if tweenrmrp1 then
			tweenrmrp1:Cancel()
		end
		if tweenrmrp2 then
			tweenrmrp2:Cancel()
		end
		if tweenrmrp3 then
			tweenrmrp3:Cancel()
		end
		if tweenrmrp4 then
			tweenrmrp4:Cancel()
		end
		if tweenrmrp5 then
			tweenrmrp5:Cancel()
		end
	end
end)

Dungeon:AddButton({
	Title = "Go To Lab",
	Description = "",
	Callback = function()
		Warp = true
		local location = Vector3.new(-6450.56884765625, 250, -4496.19677734375)
		local distance = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - location).Magnitude
		tweenlab = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(distance / 197.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(location)})
		tweenlab:Play()
		wait(distance / 197.5)
		Warp = false
	end
})


Dungeon:AddButton({
	Title = "Cancel",
	Description = "",
	Callback = function()
		if tweenlab then
			tweenlab:Cancel()
			Warp = false
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