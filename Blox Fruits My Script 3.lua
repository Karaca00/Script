local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/Karaca00/Atom-HUb/refs/heads/main/Fluent%20UI%20Library.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Karaca00/Atom-HUb/refs/heads/main/InterfaceManager.lua"))()
local Options = Fluent.Options

local Window = Fluent:CreateWindow({
	Title = "Karaca Hub",
	SubTitle = "Blox Fruits : Third Sea",
	TabWidth = 160,
	Size = UDim2.fromOffset(550, 320),
	Acrylic = false, 
	Theme = "Darker",
	MinimizeKey = Enum.KeyCode.LeftControl
})




do 
	Config = {

	}
	_G.Config = Config
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
		wait()
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
	Settings = Window:AddTab({Title = "Settings", Icon = "settings"})
}



--Main
local farms = Tap.Main:AddSection("Farm Setting")
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
	if Level.Value >= 1500 and Level.Value < 1525 then
		MonN = "Pirate Millionaire"
		QuestN = "PiratePortQuest"
		QuestL = 1
		QuestP = Vector3.new(-289.61752319336, 43.819011688232, 5580.0903320313)
		MonP = Vector3.new(-435.68109130859, 189.69866943359, 5551.0756835938)
	end
	if Level.Value >= 1525 and Level.Value < 1575 then
		MonN = "Pistol Billionaire"
		QuestN = "PiratePortQuest"
		QuestL = 2
		QuestP = Vector3.new(-289.61752319336, 43.819011688232, 5580.0903320313)
		MonP = Vector3.new(-236.53652954102, 217.46676635742, 6006.0883789063)
	end
	if Level.Value >= 1600 and Level.Value < 1625 then
		MonN = "Dragon Crew Archer"
		QuestN = "AmazonQuest"
		QuestL = 2
		QuestP = Vector3.new(5833.1147460938, 51.60498046875, -1103.0693359375)
		MonP = Vector3.new(6831.1171875, 441.76708984375, 446.58615112305)
	end
	if Level.Value >= 1625 and Level.Value < 1650 then
		MonN = "Female Islander"
		QuestN = "AmazonQuest2"
		QuestL = 1
		QuestP = Vector3.new(5446.8793945313, 601.62945556641, 749.45672607422)
		MonP = Vector3.new(5792.5166015625, 848.14392089844, 1084.1818847656)
	end
	if Level.Value >= 1650 and Level.Value < 1700 then
		MonN = "Giant Islander"
		QuestN = "AmazonQuest2"
		QuestL = 2
		QuestP = Vector3.new(5446.8793945313, 601.62945556641, 749.45672607422)
		MonP = Vector3.new(5009.5068359375, 664.11071777344, -40.960144042969)
	end
	if Level.Value >= 1700 and Level.Value < 1725 then
		MonN = "Marine Commodore"
		QuestN = "MarineTreeIsland"
		QuestL = 1
		QuestP = Vector3.new(2179.98828125, 28.731239318848, -6740.0551757813)
		MonP = Vector3.new(2198.0063476563, 128.71075439453, -7109.5043945313)
	end
	if Level.Value >= 1725 and Level.Value < 1775 then
		MonN = "Marine Rear Admiral"
		QuestN = "MarineTreeIsland"
		QuestL = 2
		QuestP = Vector3.new(2179.98828125, 28.731239318848, -6740.0551757813)
		MonP = Vector3.new(3294.3142089844, 385.41125488281, -7048.6342773438)
	end
	if Level.Value >= 1775 and Level.Value < 1800 then
		MonN = "Fishman Raider"
		QuestN = "DeepForestIsland3"
		QuestL = 1
		QuestP = Vector3.new(-10582.759765625, 331.78845214844, -8757.666015625)
		MonP = Vector3.new(-10553.268554688, 521.38439941406, -8176.9458007813)
	end
	if Level.Value >= 1800 and Level.Value < 1825 then
		MonN = "Fishman Captain"
		QuestN = "DeepForestIsland3"
		QuestL = 2
		QuestP = Vector3.new(-10583.099609375, 331.78845214844, -8759.4638671875)
		MonP = Vector3.new(-10789.401367188, 427.18637084961, -9131.4423828125)
	end
	if Level.Value >= 1825 and Level.Value < 1850 then
		MonN = "Forest Pirate"
		QuestN = "DeepForestIsland"
		QuestL = 1
		QuestP = Vector3.new(-13232.662109375, 332.40396118164, -7626.4819335938)
		MonP = Vector3.new(-13489.397460938, 400.30349731445, -7770.251953125)
	end
	if Level.Value >= 1850 and Level.Value < 1900 then
		MonN = "Mythological Pirate"
		QuestN = "DeepForestIsland"
		QuestL = 2
		QuestP = Vector3.new(-13232.662109375, 332.40396118164, -7626.4819335938)
		MonP = Vector3.new(-13508.616210938, 582.46228027344, -6985.3037109375)
	end
	if Level.Value >= 1900 and Level.Value < 1925 then
		MonN = "Jungle Pirate"
		QuestN = "DeepForestIsland2"
		QuestL = 1
		QuestP = Vector3.new(-12682.096679688, 390.88653564453, -9902.1240234375)
		MonP = Vector3.new(-12267.103515625, 459.75262451172, -10277.200195313)
	end
	if Level.Value >= 1925 and Level.Value < 1975 then
		MonN = "Musketeer Pirate"
		QuestN = "DeepForestIsland2"
		QuestL = 2
		QuestP = Vector3.new(-12682.096679688, 390.88653564453, -9902.1240234375)
		MonP = Vector3.new(-13291.5078125, 520.47338867188, -9904.638671875)
	end
	if Level.Value >= 1975 and Level.Value < 2000 then
		MonN = "Reborn Skeleton"
		QuestN = "HauntedQuest1"
		QuestL = 1
		QuestP = Vector3.new(-9480.80762, 142.130661, 5566.37305)
		MonP = Vector3.new(-8761.77148, 183.431747, 6168.33301)
	end
	if Level.Value >= 2000 and Level.Value < 2025 then
		MonN = "Living Zombie"
		QuestN = "HauntedQuest1"
		QuestL = 2
		QuestP = Vector3.new(-9480.80762, 142.130661, 5566.37305)
		MonP = Vector3.new(-10103.7529, 238.565979, 6179.75977)
	end
	if Level.Value >= 2025 and Level.Value < 2050 then
		MonN = "Demonic Soul"
		QuestN = "HauntedQuest2"
		QuestL = 1
		QuestP = Vector3.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
		MonP = Vector3.new(-9712.03125, 204.69589233398, 6193.322265625)
	end
	if Level.Value >= 2050 and Level.Value < 2075 then
		MonN = "Posessed Mummy"
		QuestN = "HauntedQuest2"
		QuestL = 2
		QuestP = Vector3.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
		MonP = Vector3.new(-9545.7763671875, 69.619895935059, 6339.5615234375)
	end
	if Level.Value >= 2075 and Level.Value < 2100 then
		MonN = "Peanut Scout"
		QuestN = "NutsIslandQuest"
		QuestL = 1
		QuestP = Vector3.new(-2105.53198, 37.2495995, -10195.5088)
		MonP = Vector3.new(-2150.587890625, 122.49767303467, -10358.994140625)
	end
	if Level.Value >= 2100 and Level.Value < 2125 then
		MonN = "Peanut President"
		QuestN = "NutsIslandQuest"
		QuestL = 2
		QuestP = Vector3.new(-2105.53198, 37.2495995, -10195.5088)
		MonP = Vector3.new(-2150.587890625, 122.49767303467, -10358.994140625)
	end
	if Level.Value >= 2125 and Level.Value < 2150 then
		MonN = "Ice Cream Chef"
		QuestN = "IceCreamIslandQuest"
		QuestL = 1
		QuestP = Vector3.new(-819.376709, 64.9259796, -10967.2832)
		MonP = Vector3.new(-789.941528, 209.382889, -11009.9805)
	end
	if Level.Value >= 2150 and Level.Value < 2200 then
		MonN = "Ice Cream Commander"
		QuestN = "IceCreamIslandQuest"
		QuestL = 2
		QuestP = Vector3.new(-819.376709, 64.9259796, -10967.2832)
		MonP = Vector3.new(-789.941528, 209.382889, -11009.9805)
	end
	if Level.Value >= 2200 and Level.Value < 2225 then
		MonN = "Cookie Crafter"
		QuestN = "CakeQuest1"
		QuestL = 1
		QuestP = Vector3.new(-2022.29858, 36.9275894, -12030.9766)
		MonP = Vector3.new(-2321.71216, 36.699482, -12216.7871)
	end
	if Level.Value >= 2225 and Level.Value < 2250 then
		MonN = "Cake Guard"
		QuestN = "CakeQuest1"
		QuestL = 2
		QuestP = Vector3.new(-2022.29858, 36.9275894, -12030.9766)
		MonP = Vector3.new(-1418.11011, 36.6718941, -12255.7324)
	end
	if Level.Value >= 2250 and Level.Value < 2275 then
		MonN = "Baking Staff"
		QuestN = "CakeQuest2"
		QuestL = 1
		QuestP = Vector3.new(-1928.31763, 37.7296638, -12840.626)
		MonP = Vector3.new(-1980.43848, 36.6716766, -12983.8418)
	end
	if Level.Value >= 2275 and Level.Value < 2300 then
		MonN = "Head Baker"
		QuestN = "CakeQuest2"
		QuestL = 2
		QuestP = Vector3.new(-1928.31763, 37.7296638, -12840.626)
		MonP = Vector3.new(-2251.5791, 52.2714615, -13033.3965)
	end
	if Level.Value >= 2300 and Level.Value < 2325 then
		MonN = "Cocoa Warrior"
		QuestN = "ChocQuest1"
		QuestL = 1
		QuestP = Vector3.new(231.75, 23.9003029, -12200.292)
		MonP = Vector3.new(167.978516, 26.2254658, -12238.874)
	end
	if Level.Value >= 2325 and Level.Value < 2350 then
		MonN = "Chocolate Bar Battler"
		QuestN = "ChocQuest1"
		QuestL = 2
		QuestP = Vector3.new(231.75, 23.9003029, -12200.292)
		MonP = Vector3.new(701.312073, 25.5824986, -12708.2148)
	end
	if Level.Value >= 2350 and Level.Value < 2375 then
		MonN = "Sweet Thief"
		QuestN = "ChocQuest2"
		QuestL = 1
		QuestP = Vector3.new(151.198242, 23.8907146, -12774.6172)
		MonP = Vector3.new(-140.258301, 25.5824986, -12652.3115)
	end
	if Level.Value >= 2375 and Level.Value < 2400 then
		MonN = "Candy Rebel"
		QuestN = "ChocQuest2"
		QuestL = 2
		QuestP = Vector3.new(151.198242, 23.8907146, -12774.6172)
		MonP = Vector3.new(47.9231453, 25.5824986, -13029.2402)
	end
	if Level.Value >= 2400 and Level.Value < 2425 then
		MonN = "Candy Pirate"
		QuestN = "CandyQuest1"
		QuestL = 1
		QuestP = Vector3.new(-1149.328, 60.13536834716797, -14445.6143)
		MonP = Vector3.new(-1437.56348, 17.1481285, -14385.6934)
	end
	if Level.Value >= 2425 and Level.Value < 2450 then
		MonN = "Snow Demon"
		QuestN = "CandyQuest1"
		QuestL = 2
		QuestP = Vector3.new(-1149.328, 60.13536834716797, -14445.6143)
		MonP = Vector3.new(-916.222656, 17.1481285, -14638.8125)
	end
	if Level.Value >= 2450 and Level.Value < 2475 then
		MonN = "Isle Outlaw"
		QuestN = "TikiQuest1"
		QuestL = 1
		QuestP = Vector3.new(-16549.890625, 55.68635559082031, -179.91360473632812)
		MonP = Vector3.new(-16162.8193359375, 11.6863374710083, -96.45481872558594)
	end
	if Level.Value >= 2475 and Level.Value < 2525 then
		MonN = "Island Boy"
		QuestN = "TikiQuest1"
		QuestL = 2
		QuestP = Vector3.new(-16549.890625, 55.68635559082031, -179.91360473632812)
		MonP = Vector3.new(-16912.130859375, 11.787443161010742, -133.0850830078125)
	end
	if Level.Value >= 2525 and Level.Value < 2550 then
		MonN = "Isle Champion"
		QuestN = "TikiQuest2"
		QuestL = 2
		QuestP = Vector3.new(-16542.447265625, 55.68632888793945, 1044.41650390625)
		MonP = Vector3.new(-16848.94140625, 21.68633460998535, 1041.4490966796875)
	end
	if Level.Value >= 2550 and Level.Value < 2575 then
		MonN = "Serpent Hunter"
		QuestN = "TikiQuest3"
		QuestL = 1
		QuestP = Vector3.new(-16664.767578125, 105.22152709960938, 1578.080810546875)
		MonP = Vector3.new(-16550.080078125, 98.17667388916016, 1618.9779052734375)
	end
	if Level.Value >= 2575 and Level.Value < 2675 then
		MonN = "Skull Slayer"
		QuestN = "TikiQuest3"
		QuestL = 2
		QuestP = Vector3.new(-16664.767578125, 105.22152709960938, 1578.080810546875)
		MonP = Vector3.new(-16764.130859375, 111.36375427246094, 1601.65380859375)
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
    if _G.Toggle_Buso == true then
        if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
        end
    end
end)

spawn(function()
	while task.wait() do
		pcall(function()
			if _G.Warp == true then
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
			end
		end)
	end
end)

spawn(function()
	while task.wait() do
		pcall(function()
			if _G.Toggle_Farm == true or _G.Toggle_FBone == true then
				for i,e in pairs(game.Workspace.Enemies:GetChildren()) do
					if (e.HumanoidRootPart.Position - LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude <= 120 then
						RegisterAttack:FireServer(0)
						local Targets = {}
						for _, r in pairs(game.workspace.Enemies:GetChildren()) do
							if r:WaitForChild("Humanoid").Health > 0 and r:WaitForChild("Humanoid") and r:WaitForChild("HumanoidRootPart") then
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
	end
end)

function farm()
	while _G.Toggle_Farm == true do
		wait()
		_G.Warp = true
		if LocalPlayer.Character:WaitForChild("Humanoid").Health ~= 0 then
			for i,k in pairs(game.Workspace.Enemies:GetChildren()) do
				if LocalPlayer.PlayerGui.Main.Quest.Visible == true then
					local start, finish = string.find(LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, MonN)
					if start then
						if k.Name == MonN then
							if k:WaitForChild("Humanoid").Health ~= 0 then
								local distance = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - k:WaitForChild("HumanoidRootPart").Position).Magnitude
								tweenmp = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(distance / 197.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(k:WaitForChild("HumanoidRootPart").Position) * CFrame.new(0,30,0)})
								tweenmp:Play()
								Wait(distance / 197.5)
								repeat
									wait(0.05)
								    if LocalPlayer.Character:FindFirstChild(_G.Weapon) then
								    	if _G.Warp == true then
											LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(k:WaitForChild("HumanoidRootPart").Position + Vector3.new(0,30,0))
										end
				    				elseif not LocalPlayer.Character:FindFirstChild(_G.Weapon) and _G.Toggle_Equip == true then
						    			LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(LocalPlayer.Backpack:WaitForChild(_G.Weapon))
							    	end
							    until k.Humanoid.Health == 0 do
								    return farm()
							    end
							end
						elseif not game.Workspace.Enemies:FindFirstChild(MonN) then
							local dis = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - MonP).Magnitude
							tweenml = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(dis / 197.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(MonP)})
							tweenml:Play()
							Wait(dis / 197.5)
							return farm()
						end
					elseif not start then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
					end
				elseif LocalPlayer.PlayerGui.Main.Quest.Visible == false then
					local dis = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - QuestP).Magnitude
					tweenqp = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(dis / 197.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(QuestP)})
					tweenqp:Play()
					Wait(dis / 197.5)
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",QuestN,QuestL)
					return farm()
				end
			end
		elseif LocalPlayer.Character:WaitForChild("Humanoid").Health == 0 then
			repeat
				wait()
				return farm()
			until LocalPlayer.Character:WaitForChild("Humanoid").Health ~= 0
		end
	end
end

local autofarm = Auto_Farm:AddToggle("Farm",{
    Title = "Auto Farm",
    Default = false
})

autofarm:OnChanged(function(Toggle)
    _G.Toggle_Farm = Toggle
    farm()
    if _G.Toggle_Farm == false then
		_G.Warp = false
        if tweenqp then
            tweenqp:Pause()
        end
        if tweenml then
            tweenml:Pause()
        end
        if tweenmp then
            tweenmp:Pause()
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

RunService.RenderStepped:Connect(function()
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




local bone = Tap.Main:AddSection("Farm Bone")
_G.Toggle_Bone = nil
_G.Toggle_FBone = nil

local status_bone = bone:AddParagraph({
    Title = ""
})

bone:AddButton({
    Title = "Random Bone",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Buy",1,1)
    end
})

local Take_bone = bone:AddToggle("Take", {
    Title = "Auto Random Bone",
    Default = false
})

RunService.RenderStepped:Connect(function()
    status_bone:SetTitle("Bone  :  " .. game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Check"))
    if _G.Toggle_Bone == true then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Buy",1,1)
		wait(0.5)
    end
end)

Take_bone:OnChanged(function(Toggle)
    _G.Toggle_Bone = Toggle
end)

local Farm_Bone = bone:AddToggle("FB",{
	Title = "Auto Farm Bone",
	Default = false
})

local bMonP = Vector3.new(-9514.8369140625, 165.1, 5786.89501953125)

function Bonefarm()
	while _G.Toggle_FBone == true do
		wait()
		_G.Warp = true
		if LocalPlayer.Character:WaitForChild("Humanoid").Health ~= 0 then
			if _G.Toggle_FBone == true then
				for i,b in pairs(game.Workspace.Enemies:GetChildren()) do
					if b.Name == "Demonic Soul" or b.Name == "Living Zombie" or b.Name == "Posessed Mummy" or b.Name == "Reborn Skeleton" then
						if b:WaitForChild("Humanoid").Health ~= 0 then
							local distance = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - b:WaitForChild("HumanoidRootPart").Position).Magnitude
							tweenbmp = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(distance / 197.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(b:WaitForChild("HumanoidRootPart").Position) * CFrame.new(0,30,0)})
							tweenbmp:Play()
							Wait(distance / 197.5)
							repeat
								wait(0.05)
								if LocalPlayer.Character:FindFirstChild(_G.Weapon) then
									if _G.Warp == true then
										LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(b:WaitForChild("HumanoidRootPart").Position + Vector3.new(0,30,0))
									end
								elseif not LocalPlayer.Character:FindFirstChild(_G.Weapon) and _G.Toggle_Equip == true then
									LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(LocalPlayer.Backpack:WaitForChild(_G.Weapon))
								end
							until b.Humanoid.Health == 0 do
								return Bonefarm()
							end
						end
					elseif not game.Workspace.Enemies:FindFirstChild("Demonic Soul") or game.Workspace.Enemies:FindFirstChild("Living Zombie") or game.Workspace.Enemies:FindFirstChild("Posessed Mummy") or game.Workspace.Enemies:FindFirstChild("Reborn Skeleton") then
						local dis = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - bMonP).Magnitude
						tweenbml = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(dis / 197.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(bMonP)})
						tweenbml:Play()
						Wait(dis / 197.5)
						return Bonefarm()
					end
				end
			end
		elseif LocalPlayer.Character:WaitForChild("Humanoid").Health == 0 then
			repeat
				wait()
				return Bonefarm()
			until LocalPlayer.Character:WaitForChild("Humanoid").Health ~= 0
		end
	end
end

Farm_Bone:OnChanged(function(Toggle)
    _G.Toggle_FBone = Toggle
	Bonefarm()
	if _G.Toggle_FBone == false then
		_G.Warp = false
        if tweenbml then
            tweenbml:Pause()
        end
        if tweenbmp then
            tweenbmp:Pause()
        end
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
	Title = "Pause",
	Description = "",
	Callback = function()
		if tweentp then
			tweentp:Pause()
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
	Description = "💶 2,500,000 / 💷 5,000",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
	end
})
Fighting:AddButton({
	Title = "Sharkman Karate",
	Description = "💶 2,500,000 / 💷 5,000",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true)
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
	end
})
Fighting:AddButton({
	Title = "Electric Claw",
	Description = "💶 3,000,000 / 💷 5,000",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
	end
})
Fighting:AddButton({
	Title = "Dragon Talon",
	Description = "💶 3,000,000 / 💷 5,000",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
	end
})
Fighting:AddButton({
	Title = "Godhuman",
	Description = "💶:5,000,000 / 💷:5,000 / DragonScale:10 / FishTail:20 / MysticDroplet:10 / MagmaOre:20",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
	end
})
Fighting:AddButton({
	Title = "Sanguine Art",
	Description = "💶:5,000,000 / 💷:5,000 / DemonicWisps:20 / VampireFangs:20 / DarkFragments:2",
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



















--Teleport
local teleport_tap = Tap.Teleport:AddSection("Teleport To Island")
local Island = nil

local slil = teleport_tap:AddDropdown("teleport", {
    Title = "Select Island",
    Values = {"Port Town","Hydra Island","Great Tree","Castle Of The Sea","Mansion","Tiki Outpost","Haunted Castle","IceCream Island","Peanut Island","Loaf Island","Chocolate Island","Candy Island"},
    Multi = false,
})

slil:OnChanged(function(Value)
    Island = Value
end)

teleport_tap:AddButton({
    Title = "Teleport",
    Description = "Click To Teleport",
    Callback = function()
        if Island == "Port Town" then
			_G.Warp = true
            local part = workspace._WorldOrigin.PlayerSpawns.Pirates.Default.Part
            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
            tweenpt = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(distance, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(part.Position)})
            tweenpt:Play()
			wait(distance)
			_G.Warp = false
        end
        if Island == "Hydra Island" then
			_G.Warp = true
            local part = workspace._WorldOrigin.PlayerSpawns.Pirates.Hydra3.Part
            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
            tweenhl = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(distance, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(part.Position)})
            tweenhl:Play()
			wait(distance)
			_G.Warp = false
        end
        if Island == "Great Tree" then
			_G.Warp = true
            local part = workspace._WorldOrigin.PlayerSpawns.Pirates.GreatTree.Part
            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
            tweengt = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(distance, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(part.Position)})
            tweengt:Play()
			wait(distance)
			_G.Warp = false
        end
        if Island == "Castle Of The Sea" then
			_G.Warp = true
            local part = workspace._WorldOrigin.PlayerSpawns.Pirates.SeaCastle.Part
            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
            tweencfts = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(distance, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(part.Position)})
            tweencfts:Play()
			wait(distance)
			_G.Warp = false
        end
        if Island == "Mansion" then
			_G.Warp = true
            local part = workspace._WorldOrigin.PlayerSpawns.Pirates.BigMansion.Part
            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
            tweenm = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(distance, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(part.Position)})
            tweenm:Play()
			wait(distance)
			_G.Warp = false
        end
        if Island == "Tiki Outpost" then
			_G.Warp = true
            local part = workspace._WorldOrigin.PlayerSpawns.Pirates.Tiki.Part
            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
            tweento = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(distance, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(part.Position)})
            tweento:Play()
			wait(distance)
			_G.Warp = false
        end
        if Island == "Haunted Castle" then
			_G.Warp = true
            local part = workspace._WorldOrigin.PlayerSpawns.Pirates.HauntedCastle.Part
            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
            tweenhc = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(distance, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(part.Position)})
            tweenhc:Play()
			wait(distance)
			_G.Warp = false
        end
        if Island == "IceCream Island" then
			_G.Warp = true
            local part = workspace._WorldOrigin.PlayerSpawns.Pirates.IceCream.Part
            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
            tweenii = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(distance, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(part.Position)})
            tweenii:Play()
			wait(distance)
			_G.Warp = false
        end
        if Island == "Peanut Island" then
			_G.Warp = true
            local part = workspace._WorldOrigin.PlayerSpawns.Pirates.Peanut.Part
            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
            tweenpi = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(distance, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(part.Position)})
            tweenpi:Play()
			wait(distance)
			_G.Warp = false
        end
        if Island == "Loaf Island" then
			_G.Warp = true
            local part = workspace._WorldOrigin.PlayerSpawns.Pirates.Loaf.Part
            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
            tweenli = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(distance, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(part.Position)})
            tweenli:Play()
			wait(distance)
			_G.Warp = false
        end
        if Island == "Chocolate Island" then
			_G.Warp = true
            local part = workspace._WorldOrigin.PlayerSpawns.Pirates.Chocolate.Part
            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
            tweenci = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(distance, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(part.Position)})
            tweenci:Play()
			wait(distance)
			_G.Warp = false
        end
        if Island == "Candy Island" then
			_G.Warp = true
            local part = workspace._WorldOrigin.PlayerSpawns.Pirates.CandyCane.Part
            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude / 197.5
            tweenai = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(distance, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(part.Position)})
            tweenai:Play()
			wait(distance)
			_G.Warp = false
        end
    end
})

teleport_tap:AddButton({
    Title = "Pause Tween",
    Callback = function()
        if tweenpt then
            tweenpt:Pause()
			_G.Warp = false
        end
        if tweenhl then
            tweenhl:Pause()
			_G.Warp = false
        end
        if tweengt then
            tweengt:Pause()
			_G.Warp = false
        end
        if tweencfts then
            tweencfts:Pause()
			_G.Warp = false
        end
        if tweenm then
            tweenm:Pause()
			_G.Warp = false
        end
        if tweento then
            tweento:Pause()
			_G.Warp = false
        end
        if tweenhc then
            tweenhc:Pause()
			_G.Warp = false
        end
        if tweenii then
            tweenii:Pause()
			_G.Warp = false
        end
        if tweenpi then
            tweenpi:Pause()
			_G.Warp = false
        end
        if tweenli then
            tweenli:Pause()
			_G.Warp = false
        end
        if tweenci then
            tweenci:Pause()
			_G.Warp = false
        end
        if tweenai then
            tweenai:Pause()
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
	while task.wait() do
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
		Timeing:SetTitle("Joined Server : "..hours.." H "..minutes.." M "..seconds.." S ")

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