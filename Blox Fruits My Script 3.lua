local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/Karaca00/My-Fluent-UI/refs/heads/main/Fluent%20UI%20Library.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Karaca00/My-Fluent-UI/refs/heads/main/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
	Title = "Karaca Hub",
	SubTitle = "Blox Fruits : Third Sea",
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

local bringmon = farms:AddToggle("bring",{
	Title = "Auto Bring Mob",
	Default = true
})

bringmon:OnChanged(function(Toggle)
	_G.Bring = Toggle
end)

RunService.RenderStepped:Connect(function()
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
		pcall(function()
			if _G.Toggle_Farm == true or _G.AroundM == true or _G.Auto_boss == true or _G.Auto_FDun == true or _G.Toggle_FBone == true or _G.Toggle_FCake == true then
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
									elseif not game.Workspace.Enemies:FindFirstChild(MonN) then
										local dis = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - MonP).Magnitude
										tweenmls = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(dis / 197.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(MonP)})
										tweenmls:Play()
										Wait(dis / 197.5)
									end
								end
							elseif not start then
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
							end
						elseif LocalPlayer.PlayerGui.Main.Quest.Visible == false then
							local dis = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - QuestP).Magnitude
							tweenqp = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(dis / 197.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(QuestP)})
							tweenqp:Play()
							Wait(dis / 197.5)
							if _G.Toggle_Farm == true then
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",QuestN,QuestL)							farm()
							end
						end
					end
				else
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
            if Boss.Name == "Stone" or Boss.Name == "Island Empress" or Boss.Name =="Kilo Admiral" or Boss.Name == "Captain Elephant" or Boss.Name == "Beautiful Pirate" or Boss.Name == "rip_indra True Form" or Boss.Name == "Longma" or Boss.Name == "Soul Reaper" or Boss.Name == "Cake Queen" or Boss.Name == "Tyrant of the Skies" or Boss.Name == "Cake Prince" or Boss.Name == "Hydra Leader" then
				table.insert(Bosslist,Boss.Name)
				SelectedBoss:SetValue(Bosslist)
			end
        end
		for i,Boss in pairs(game.Workspace.Enemies:GetChildren()) do
            if Boss.Name == "Stone" or Boss.Name == "Island Empress" or Boss.Name =="Kilo Admiral" or Boss.Name == "Captain Elephant" or Boss.Name == "Beautiful Pirate" or Boss.Name == "rip_indra True Form" or Boss.Name == "Longma" or Boss.Name == "Soul Reaper" or Boss.Name == "Cake Queen" or Boss.Name == "Tyrant of the Skies" or Boss.Name == "Cake Prince" or Boss.Name == "Hydra Leader" then
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
													tweenbsmrp2 = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(distance / 500, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = posbsm * CFrame.new(50,30,0)})
													tweenbsmrp2:Play()
												end
												if randomPos == 3 then
													local distance = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - bossMon2:WaitForChild("HumanoidRootPart").Position).Magnitude
													local posbsm = CFrame.new(bossMon2:WaitForChild("HumanoidRootPart").Position)
													tweenbsmrp3 = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(distance / 500, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = posbsm * CFrame.new(0,25,50)})
													tweenbsmrp3:Play()
												end
												if randomPos == 4 then
													local distance = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - bossMon2:WaitForChild("HumanoidRootPart").Position).Magnitude
													local posbsm = CFrame.new(bossMon2:WaitForChild("HumanoidRootPart").Position)
													tweenbsmrp4 = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(distance / 500, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = posbsm * CFrame.new(-50,30,0)})
													tweenbsmrp4:Play()
												end
												if randomPos == 5 then
													local distance = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - bossMon2:WaitForChild("HumanoidRootPart").Position).Magnitude
													local posbsm = CFrame.new(bossMon2:WaitForChild("HumanoidRootPart").Position)
													tweenbsmrp5 = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(distance / 500, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = posbsm * CFrame.new(0,25,-50)})
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
local boneMon = nil
local bringBMon = nil

function Bonefarm()
	pcall(function()
		while _G.Toggle_FBone == true do
			wait()
			_G.Warp = true
			if LocalPlayer.Character:WaitForChild("Humanoid").Health >= 1 then
				if _G.Toggle_FBone == true then
					for i,bm in pairs(game.Workspace.Enemies:GetChildren()) do
						boneMon = bm
						if boneMon ~= nil then
							if boneMon.Name == "Demonic Soul" or boneMon.Name == "Living Zombie" or boneMon.Name == "Posessed Mummy" or boneMon.Name == "Reborn Skeleton" then
								if boneMon:WaitForChild("Humanoid").Health >= 1 then
									local distance = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - boneMon:WaitForChild("HumanoidRootPart").Position).Magnitude
									local posbm = CFrame.new(boneMon:WaitForChild("HumanoidRootPart").Position)
									tweenbmp = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(distance / 197.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = posbm * CFrame.new(0,30,0)})
									tweenbmp:Play()
									wait(distance / 197.5)
									repeat
										wait(0.005)
										if LocalPlayer.Character:FindFirstChild(_G.Weapon) then
											if _G.Toggle_FBone == true then
												if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - boneMon:WaitForChild("HumanoidRootPart").Position).Magnitude <= 200 then
													local distance = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - boneMon:WaitForChild("HumanoidRootPart").Position).Magnitude
													tweenmbfba = TweenService:Create(boneMon:WaitForChild("HumanoidRootPart"), TweenInfo.new(distance / 1000, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position + Vector3.new(0,-30,0))})
													tweenmbfba:Play()
													boneMon:WaitForChild("Humanoid").WalkSpeed = 0
													boneMon:WaitForChild("Humanoid").Sit = true
													sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
												end
												for i,bb in pairs(game.Workspace.Enemies:GetChildren()) do
													bringBMon = bb
													if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - bringBMon:WaitForChild("HumanoidRootPart").Position).Magnitude <= 200 and bringBMon ~= boneMon and bringBMon ~= nil then
														local distance = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - bringBMon:WaitForChild("HumanoidRootPart").Position).Magnitude
														tweenmbfb = TweenService:Create(bringBMon:WaitForChild("HumanoidRootPart"), TweenInfo.new(distance / 1000, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position + Vector3.new(0,-30,0))})
														tweenmbfb:Play()
														bringBMon:WaitForChild("Humanoid").WalkSpeed = 0
														bringBMon:WaitForChild("Humanoid").Sit = true
														sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
													end
												end
											end
										elseif not LocalPlayer.Character:FindFirstChild(_G.Weapon) and _G.Toggle_Equip == true then
											if _G.Toggle_FBone == true then
												LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(LocalPlayer.Backpack:WaitForChild(_G.Weapon))
												Bonefarm()
											end
										end
									until boneMon:WaitForChild("Humanoid").Health == 0 do
										Bonefarm()
									end
								end
							elseif not game.Workspace.Enemies:FindFirstChild("Demonic Soul") or game.Workspace.Enemies:FindFirstChild("Living Zombie") or game.Workspace.Enemies:FindFirstChild("Posessed Mummy") or game.Workspace.Enemies:FindFirstChild("Reborn Skeleton") then
								local dis = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - bMonP).Magnitude
								tweenbml = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(dis / 197.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(bMonP)})
								tweenbml:Play()
								Wait(dis / 197.5)
								Bonefarm()
							end
						end
					end
				end
			elseif LocalPlayer.Character:WaitForChild("Humanoid").Health <= 0 then
				repeat
					wait()
					Bonefarm()
				until LocalPlayer.Character:WaitForChild("Humanoid").Health ~= 0
			end
		end
	end)
end

Farm_Bone:OnChanged(function(Toggle)
    _G.Toggle_FBone = Toggle
	Bonefarm()
	if _G.Toggle_FBone == false then
		_G.Warp = false
        if tweenbml then
            tweenbml:Cancel()
        end
        if tweenbmp then
            tweenbmp:Cancel()
        end
    end
end)



local Cake = Tap.Main:AddSection("Farm Cake Enemies")
_G.Toggle_FCake = nil

local status_cake = Cake:AddParagraph({
    Title = ""
})

RunService.RenderStepped:Connect(function()
	if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 88 then
		status_cake:SetTitle("Defeat : "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,41))
	elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 87 then
		status_cake:SetTitle("Defeat : "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,40))
	elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 86 then
		status_cake:SetTitle("Defeat : "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,39))
	else
		status_cake:SetTitle("Boss Is Spawning")
	end
end)

local Farm_Cake = Cake:AddToggle("FC",{
	Title = "Auto Farm Cake Enemie",
	Default = false
})

local cMonP = Vector3.new(-2134.556884765625, 157, -12340.861328125)
local cakeMon = nil
local bringcMon = nil

function Cakefarm()
	pcall(function()
		while _G.Toggle_FCake == true do
			wait()
			_G.Warp = true
			if LocalPlayer.Character:WaitForChild("Humanoid").Health >= 1 then
				if _G.Toggle_FCake == true then
					for i,t in pairs(game.Workspace.Enemies:GetChildren()) do
						cakeMon = t
						if cakeMon ~= nil then
							if cakeMon.Name == "Baking Staff" or cakeMon.Name == "Cake Guard" or cakeMon.Name == "Cookie Crafter" or cakeMon.Name == "Head Baker" then
								if cakeMon:WaitForChild("Humanoid").Health >= 1 then
									local distance = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - cakeMon:WaitForChild("HumanoidRootPart").Position).Magnitude
									local poscm = CFrame.new(cakeMon:WaitForChild("HumanoidRootPart").Position)
									tweencmp = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(distance / 197.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = poscm * CFrame.new(0,30,0)})
									tweencmp:Play()
									wait(distance / 197.5)
									repeat
										wait(0.005)
										if LocalPlayer.Character:FindFirstChild(_G.Weapon) then
											if _G.Toggle_FCake == true then
												if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - cakeMon:WaitForChild("HumanoidRootPart").Position).Magnitude <= 200 then
													local distance = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - cakeMon:WaitForChild("HumanoidRootPart").Position).Magnitude
													tweenmbfba = TweenService:Create(cakeMon:WaitForChild("HumanoidRootPart"), TweenInfo.new(distance / 1000, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position + Vector3.new(0,-30,0))})
													tweenmbfba:Play()
													cakeMon:WaitForChild("Humanoid").WalkSpeed = 0
													cakeMon:WaitForChild("Humanoid").Sit = true
													sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
												end
												for i,a in pairs(game.Workspace.Enemies:GetChildren()) do
													bringcMon = a
													if (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - bringcMon:WaitForChild("HumanoidRootPart").Position).Magnitude <= 200 and bringcMon ~= cakeMon and bringcMon ~= nil then
														local distance = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - bringcMon:WaitForChild("HumanoidRootPart").Position).Magnitude
														tweenmbfb = TweenService:Create(bringcMon:WaitForChild("HumanoidRootPart"), TweenInfo.new(distance / 1000, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position + Vector3.new(0,-30,0))})
														tweenmbfb:Play()
														bringcMon:WaitForChild("Humanoid").WalkSpeed = 0
														bringcMon:WaitForChild("Humanoid").Sit = true
														sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
													end
												end
											end
										elseif not LocalPlayer.Character:FindFirstChild(_G.Weapon) and _G.Toggle_Equip == true then
											if _G.Toggle_FCake == true then
												LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(LocalPlayer.Backpack:WaitForChild(_G.Weapon))
												Cakefarm()
											end
										end
									until cakeMon:WaitForChild("Humanoid").Health == 0 do
										Cakefarm()
									end
								end
							elseif not game.Workspace.Enemies:FindFirstChild("Baking Staff") or game.Workspace.Enemies:FindFirstChild("Cake Guard") or game.Workspace.Enemies:FindFirstChild("Cookie Crafter") or game.Workspace.Enemies:FindFirstChild("Head Baker") then
								local dis = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - cMonP).Magnitude
								tweencml = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(dis / 197.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(cMonP)})
								tweencml:Play()
								Wait(dis / 197.5)
								Cakefarm()
							end
						end
					end
				end
			elseif LocalPlayer.Character:WaitForChild("Humanoid").Health <= 0 then
				repeat
					wait()
					Cakefarm()
				until LocalPlayer.Character:WaitForChild("Humanoid").Health ~= 0
			end
		end
	end)
end

Farm_Cake:OnChanged(function(Toggle)
    _G.Toggle_FCake = Toggle
	Cakefarm()
	if _G.Toggle_FCake == false then
		_G.Warp = false
        if tweencml then
            tweencml:Cancel()
        end
        if tweencmp then
            tweencmp:Cancel()
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
        if Island ~= nil then
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
        if tweenci then
            tweenci:Cancel()
			_G.Warp = false
        end
        if tweenai then
            tweenai:Cancel()
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
				fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
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
                        fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
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
		_G.Warp = true
		local location = Vector3.new(-5038.755859375, 311.03399658203125, -2876.837890625)
		local distance = (LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - location).Magnitude
		tweenlab = TweenService:Create(LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new(distance / 197.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = CFrame.new(location)})
		tweenlab:Play()
		wait(distance / 197.5)
		_G.Warp = false
	end
})


Dungeon:AddButton({
	Title = "Cancel",
	Description = "",
	Callback = function()
		if tweenlab then
			tweenlab:Cancel()
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
