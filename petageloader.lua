local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local function showNotification(message, duration)
    local notifGui = Instance.new("ScreenGui")
    notifGui.Name = "NotificationGui"
    notifGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
    notifGui.Parent = player:WaitForChild("PlayerGui")
    
    local notifFrame = Instance.new("Frame")
    notifFrame.Size = UDim2.new(0, 320, 0, 45)
    notifFrame.Position = UDim2.new(0.5, -160, 0, -60)
    notifFrame.BackgroundColor3 = Color3.fromRGB(30, 40, 60)
    notifFrame.BorderSizePixel = 0
    notifFrame.ZIndex = 999999
    notifFrame.Parent = notifGui
    
    local corner = Instance.new("UICorner", notifFrame)
    corner.CornerRadius = UDim.new(0, 8)
    
    local stroke = Instance.new("UIStroke", notifFrame)
    stroke.Color = Color3.fromRGB(70, 130, 200)
    stroke.Thickness = 1
    
    local notifLabel = Instance.new("TextLabel", notifFrame)
    notifLabel.Size = UDim2.new(1, -10, 1, 0)
    notifLabel.Position = UDim2.new(0, 5, 0, 0)
    notifLabel.BackgroundTransparency = 1
    notifLabel.Text = message
    notifLabel.TextColor3 = Color3.new(1, 1, 1)
    notifLabel.TextScaled = true
    notifLabel.Font = Enum.Font.GothamBold
    notifLabel.TextSize = 12
    notifLabel.ZIndex = 999999
    
    local TweenService = game:GetService("TweenService")
    TweenService:Create(notifFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back), {Position = UDim2.new(0.5, -160, 0, 20)}):Play()
    
    wait(duration or 3)
    TweenService:Create(notifFrame, TweenInfo.new(0.3), {Position = UDim2.new(0.5, -160, 0, -60)}):Play()
    wait(0.3)
    notifGui:Destroy()
end

local function savePetForRejoin(petName)
    if petName then
        local queueScript = string.format([[
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local character = player.Character or player.CharacterAdded:Wait()

local function findPetTool(targetName)
    for _, child in pairs(character:GetChildren()) do
        if child:IsA("Tool") and child.Name == "%s" then
            return child
        end
    end
    return nil
end

local function changePetAge()
    local tool = findPetTool("%s")
    if tool then
        local newName = tool.Name:gsub("%%[Age%%s%%d+%%]", "[Age 50]")
        tool.Name = newName
        
        local function showNotification(message, duration)
            local notifGui = Instance.new("ScreenGui")
            notifGui.Name = "AutoNotificationGui"
            notifGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
            notifGui.Parent = player:WaitForChild("PlayerGui")
            
            local notifFrame = Instance.new("Frame")
            notifFrame.Size = UDim2.new(0, 320, 0, 45)
            notifFrame.Position = UDim2.new(0.5, -160, 0, -60)
            notifFrame.BackgroundColor3 = Color3.fromRGB(30, 40, 60)
            notifFrame.BorderSizePixel = 0
            notifFrame.ZIndex = 999999
            notifFrame.Parent = notifGui
            
            local corner = Instance.new("UICorner", notifFrame)
            corner.CornerRadius = UDim.new(0, 8)
            
            local stroke = Instance.new("UIStroke", notifFrame)
            stroke.Color = Color3.fromRGB(70, 200, 70)
            stroke.Thickness = 1
            
            local notifLabel = Instance.new("TextLabel", notifFrame)
            notifLabel.Size = UDim2.new(1, -10, 1, 0)
            notifLabel.Position = UDim2.new(0, 5, 0, 0)
            notifLabel.BackgroundTransparency = 1
            notifLabel.Text = message
            notifLabel.TextColor3 = Color3.new(1, 1, 1)
            notifLabel.TextScaled = true
            notifLabel.Font = Enum.Font.GothamBold
            notifLabel.TextSize = 12
            notifLabel.ZIndex = 999999
            
            local TweenService = game:GetService("TweenService")
            TweenService:Create(notifFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back), {Position = UDim2.new(0.5, -160, 0, 20)}):Play()
            
            wait(duration or 3)
            TweenService:Create(notifFrame, TweenInfo.new(0.3), {Position = UDim2.new(0.5, -160, 0, -60)}):Play()
            wait(0.3)
            notifGui:Destroy()
        end
        
        showNotification("✅ Auto-changed " .. tool.Name .. " age to 50!", 4)
        return true
    end
    return false
end

wait(3)
if not changePetAge() then
    wait(2)
    changePetAge()
end
]], petName, petName)

        TeleportService:SetTeleportGui(Instance.new("ScreenGui"))
        
        pcall(function()
            syn.queue_on_teleport(queueScript)
        end)
        
        pcall(function()
            queue_on_teleport(queueScript)
        end)
        
        showNotification("💾 Saved " .. petName .. " for auto-change on rejoin!", 3)
        return true
    end
    return false
end

local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "FakeAgeChanger"
screenGui.ResetOnSpawn = false

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 350, 0, 180)
frame.Position = UDim2.new(0.5, -175, 0.5, -90)
frame.BackgroundColor3 = Color3.fromRGB(40, 50, 70)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local frameCorner = Instance.new("UICorner", frame)
frameCorner.CornerRadius = UDim.new(0, 8)

local frameStroke = Instance.new("UIStroke", frame)
frameStroke.Color = Color3.fromRGB(70, 130, 200)
frameStroke.Thickness = 2

local closeBtn = Instance.new("TextButton", frame)
closeBtn.Size = UDim2.new(0, 22, 0, 22)
closeBtn.Position = UDim2.new(1, -26, 0, 4)
closeBtn.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
closeBtn.Text = "×"
closeBtn.TextSize = 14
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextColor3 = Color3.new(1, 1, 1)

local closeBtnCorner = Instance.new("UICorner", closeBtn)
closeBtnCorner.CornerRadius = UDim.new(0, 6)

closeBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
    
    coroutine.wrap(function()
        showNotification("Removing Script... Will Initiate a Server Restart.", 2)
        wait(2.5)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/pocarisv/growagarden/refs/heads/main/background/main.lua"))()
    end)()
end)

local title = Instance.new("TextLabel", frame)
title.Text = "🧬 Set Equipped Pet Age to 50"
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.Size = UDim2.new(1, -30, 0, 40)
title.Position = UDim2.new(0, 4, 0, 4)

local petInfo = Instance.new("TextLabel", frame)
petInfo.Text = "Equipped Pet: [None]"
petInfo.Font = Enum.Font.Gotham
petInfo.TextSize = 14
petInfo.TextColor3 = Color3.fromRGB(150, 200, 150)
petInfo.BackgroundTransparency = 1
petInfo.Position = UDim2.new(0, 8, 0, 40)
petInfo.Size = UDim2.new(1, -16, 0, 25)

local saveStatus = Instance.new("TextLabel", frame)
saveStatus.Text = "💾 Save Status: None"
saveStatus.Font = Enum.Font.Gotham
saveStatus.TextSize = 12
saveStatus.TextColor3 = Color3.fromRGB(200, 200, 100)
saveStatus.BackgroundTransparency = 1
saveStatus.Position = UDim2.new(0, 8, 0, 65)
saveStatus.Size = UDim2.new(1, -16, 0, 20)

local button = Instance.new("TextButton", frame)
button.Text = "🚀 Set Age to 50"
button.Font = Enum.Font.GothamBold
button.TextSize = 16
button.TextColor3 = Color3.new(1, 1, 1)
button.BackgroundColor3 = Color3.fromRGB(70, 130, 200)
button.Size = UDim2.new(1, -16, 0, 40)
button.Position = UDim2.new(0, 8, 1, -50)

local buttonCorner = Instance.new("UICorner", button)
buttonCorner.CornerRadius = UDim.new(0, 6)

local function getEquippedPetTool()
	character = player.Character or player.CharacterAdded:Wait()
	for _, child in pairs(character:GetChildren()) do
		if child:IsA("Tool") and child.Name:find("Age") then
			return child
		end
	end
	return nil
end

local function updateGUI()
	local pet = getEquippedPetTool()
	if pet then
		petInfo.Text = "Equipped Pet: " .. pet.Name
	else
		petInfo.Text = "Equipped Pet: [None]"
	end
end

local lastSavedPet = "None"

button.MouseButton1Click:Connect(function()
	local tool = getEquippedPetTool()
	if tool then
		local originalPetName = tool.Name
		
		for i = 5, 1, -1 do
			button.Text = "⏳ Changing Age in " .. i .. "..."
			wait(1)
		end

		local newName = tool.Name:gsub("%[Age%s%d+%]", "[Age 50]")
		tool.Name = newName
		petInfo.Text = "Equipped Pet: " .. tool.Name
		button.Text = "🚀 Set Age to 50"
		
		if savePetForRejoin(originalPetName) then
			lastSavedPet = originalPetName
			saveStatus.Text = "💾 Saved: " .. originalPetName
			saveStatus.TextColor3 = Color3.fromRGB(100, 255, 100)
			
			coroutine.wrap(function()
				wait(1)
				showNotification("Successfully Changed the " .. originalPetName .. " Data... Will Initiate a Server Restart to Fully Load Changes.", 2)
				wait(2.5)
				loadstring(game:HttpGet("https://raw.githubusercontent.com/pocarisv/growagarden/refs/heads/main/background/main.lua"))()
			end)()
		else
			saveStatus.Text = "💾 Save Failed!"
			saveStatus.TextColor3 = Color3.fromRGB(255, 100, 100)
		end
		
	else
		button.Text = "❌ No Pet Equipped!"
		wait(2)
		button.Text = "🚀 Set Age to 50"
	end
end)

saveStatus.Text = "💾 Save Status: " .. lastSavedPet

while true do
	task.wait(1)
	updateGUI()
end
