-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TextButton = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local ImageLabel = Instance.new("ImageLabel")
local UICorner_3 = Instance.new("UICorner")
local ImageLabel2 = Instance.new("ImageLabel")
local UICorner_4 = Instance.new("UICorner")
local Close = Instance.new("TextButton")
local Frame2 = Instance.new("Frame")
local TextButton_2 = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(95, 95, 95)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.182443157, 0, 0.48550725, 0)
Frame.Size = UDim2.new(0, 241, 0, 181)

UICorner.Parent = Frame

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.136929467, 0, 0.497237563, 0)
TextButton.Size = UDim2.new(0, 174, 0, 50)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = ""
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextSize = 14.000

UICorner_2.Parent = TextButton

ImageLabel.Parent = TextButton
ImageLabel.BackgroundColor3 = Color3.fromRGB(225, 43, 37)
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(-0.0402298868, 0, 0, 0)
ImageLabel.Size = UDim2.new(0, 58, 0, 50)

UICorner_3.CornerRadius = UDim.new(0, 16)
UICorner_3.Parent = ImageLabel

ImageLabel2.Name = "ImageLabel2"
ImageLabel2.Parent = TextButton
ImageLabel2.BackgroundColor3 = Color3.fromRGB(26, 225, 26)
ImageLabel2.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel2.BorderSizePixel = 0
ImageLabel2.Position = UDim2.new(0.666666687, 0, 0, 0)
ImageLabel2.Size = UDim2.new(0, 58, 0, 50)
ImageLabel2.Visible = false

UICorner_4.CornerRadius = UDim.new(0, 16)
UICorner_4.Parent = ImageLabel2

Close.Name = "Close"
Close.Parent = Frame
Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0.79668051, 0, 0, 0)
Close.Size = UDim2.new(0, 49, 0, 33)
Close.Font = Enum.Font.SourceSans
Close.TextColor3 = Color3.fromRGB(0, 0, 0)
Close.TextSize = 14.000

Frame2.Name = "Frame2"
Frame2.Parent = ScreenGui
Frame2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame2.BorderSizePixel = 0
Frame2.Position = UDim2.new(0.0322580636, 0, 0.390096605, 0)
Frame2.Size = UDim2.new(0, 60, 0, 43)
Frame2.Visible = false

TextButton_2.Parent = Frame2
TextButton_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextButton_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton_2.BorderSizePixel = 0
TextButton_2.Size = UDim2.new(1, 0, 1, 0)
TextButton_2.Font = Enum.Font.SourceSans
TextButton_2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton_2.TextSize = 14.000

-- Scripts:

local function UBFOYWA_fake_script() -- TextButton.LocalScript 
	local script = Instance.new('LocalScript', TextButton)

	local toggleDurumu = false -- Başlangıçta kapalı olduğunu varsayalım
	
	script.Parent.MouseButton1Click:Connect(function()
		if not toggleDurumu then
			script.Parent.ImageLabel.Visible = false
			script.Parent.ImageLabel2.Visible = true
		else
			script.Parent.ImageLabel.Visible = true
			script.Parent.ImageLabel2.Visible = false
		end
		toggleDurumu = not toggleDurumu -- Durumu tersine çevir
	end)
	
end
coroutine.wrap(UBFOYWA_fake_script)()
local function FQRHH_fake_script() -- TextButton.LocalScript 
	local script = Instance.new('LocalScript', TextButton)

	local player = game.Players.LocalPlayer
	local visitedParts = {} -- Ziyaret edilen CleanPart'ların listesi
	local isEnabled = false -- Toggle durumu
	
	local function getCleanParts()
		local cleanParts = {}
		local cleanPartFolder = workspace:FindFirstChild("CleanPart")
		if cleanPartFolder then
			for _, child in ipairs(cleanPartFolder:GetChildren()) do
				if child.Name:match("^CleanPart%d+$") then
					table.insert(cleanParts, child)
				end
			end
		end
		return cleanParts
	end
	
	local function teleportToCleanPart(cleanPart)
		player.Character:SetPrimaryPartCFrame(CFrame.new(cleanPart.Position))
		visitedParts[cleanPart] = true
	end
	
	local function adjustProximityPrompts()
		local cleanParts = workspace:FindFirstChild("CleanPart")
		if cleanParts then
			for _, cleanPart in ipairs(cleanParts:GetChildren()) do
				local proximityPrompt = cleanPart:FindFirstChildOfClass("ProximityPrompt")
				if proximityPrompt then
					proximityPrompt.HoldDuration = 0
					proximityPrompt.MaxActivationDistance = 19
				end
			end
		end
	end
	
	local function toggleEvents()
		isEnabled = not isEnabled
	end
	
	local function runTeleportation()
		while isEnabled do
			game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E, false, game) -- E tuşuna basma işlevselliğini tetikle
			adjustProximityPrompts() -- ProximityPrompt ayarlarını güncelle
			local cleanParts = getCleanParts()
			local teleportTarget = nil
			for _, part in ipairs(cleanParts) do
				if not visitedParts[part] then
					teleportTarget = part
					break
				end
			end
			if teleportTarget then
				teleportToCleanPart(teleportTarget)
			else
				visitedParts = {} -- Eğer tüm CleanPart'lar ziyaret edilmişse, ziyaret edilen listesini sıfırla
			end
			wait(4.5) -- 1.5 saniye bekle
		end
	end
	
	
	
	
	
	local function spame()
		while isEnabled do
			game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E, false, game) -- E tuşuna basma işlevselliğini tetikle
			wait(0.5) -- 0.5 saniye bekle
		end
	end
	
	
	
	
	
	player.CharacterAdded:Connect(function(character)
		local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
		humanoidRootPart.Anchored = true -- Oyuncuyu başta anchorla
	end)
	
	local toggleButton = script.Parent -- TextButton'u script'in parent'ı olarak alıyoruz
	
	toggleButton.MouseButton1Click:Connect(function()
		toggleEvents()
		if isEnabled then
			runTeleportation()
	
		end
	end)
	
end
coroutine.wrap(FQRHH_fake_script)()
local function HDHQP_fake_script() -- Close.LocalScript 
	local script = Instance.new('LocalScript', Close)

	script.Parent.MouseButton1Click:Connect(function()
		script.Parent.Parent.Parent.Frame.Visible = false
		script.Parent.Parent.Parent.Frame2.Visible = true
	end)
end
coroutine.wrap(HDHQP_fake_script)()
local function ORXVLOP_fake_script() -- TextButton_2.LocalScript 
	local script = Instance.new('LocalScript', TextButton_2)

	script.Parent.MouseButton1Click:Connect(function()
		script.Parent.Parent.Parent.Frame2.Visible = false
		script.Parent.Parent.Parent.Frame.Visible = true
	end)
end
coroutine.wrap(ORXVLOP_fake_script)()
local function ORQIL_fake_script() -- ScreenGui.LocalScript 
	local script = Instance.new('LocalScript', ScreenGui)

	local frame = script.Parent.Frame
	local frame2 = script.Parent.Frame2
	
	frame.Draggable = true
	frame2.Draggable = true
	
	frame.Active = true
	frame2.Active = true
	
	frame.Selectable = true
	frame2.Selectable = true
end
coroutine.wrap(ORQIL_fake_script)()
