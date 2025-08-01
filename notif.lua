-- Stacking Kitsune Text Display Script with Loop Button
-- Place this in StarterGui as a LocalScript

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ContentProvider = game:GetService("ContentProvider")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "KitsuneTextDisplay"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

-- Container for stacking notifications
local notificationContainer = Instance.new("Frame")
notificationContainer.Name = "NotificationContainer"
notificationContainer.Size = UDim2.new(0, 600, 1, 0)
notificationContainer.Position = UDim2.new(0.5, -300, 0, 100)  -- Lower position (100px from top)
notificationContainer.BackgroundTransparency = 1
notificationContainer.Parent = screenGui

-- Create Loop Button
local loopButton = Instance.new("TextButton")
loopButton.Name = "LoopButton"
loopButton.Size = UDim2.new(0, 120, 0, 40)
loopButton.Position = UDim2.new(0, 20, 0, 20)
loopButton.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
loopButton.Text = "Loop Notifications"
loopButton.TextColor3 = Color3.fromRGB(255, 255, 255)
loopButton.TextSize = 14
loopButton.Font = Enum.Font.SourceSansBold
loopButton.Parent = screenGui

-- Add corner to button
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 6)
buttonCorner.Parent = loopButton

-- Variables for notification management
local activeNotifications = {}
local isLooping = false
local loopConnection = nil

-- Sample notification texts
local notificationTexts = {
    "Kitsune Chest earned for balancing Corrupt and Tranquil",
    "Mutated Harvest! Your Serenity got Corrupt!",
    "Tranquil Level Increased to 5",
    "Corruption level needs to be higher to bring balance",
    "Only Tranquil Mutated plants can be used!",
    "New Zen Event Started!",
    "Balance Achievement Unlocked!"
}

-- Preload custom font
local comicFont = Font.new()
comicFont.Family = "rbxasset://fonts/families/ComicNeueAngular.json"
comicFont.Weight = Enum.FontWeight.Bold

-- Function to create a single notification
local function createNotification(text, yPosition)
    local notificationFrame = Instance.new("Frame")
    notificationFrame.Name = "Notification_" .. tostring(tick())
    notificationFrame.Size = UDim2.new(1, 0, 0, 18)  -- Very compact height
    notificationFrame.Position = UDim2.new(0, 0, 0, yPosition)
    notificationFrame.BackgroundTransparency = 1
    notificationFrame.Parent = notificationContainer
    
    local mainText = Instance.new("TextLabel")
    mainText.Name = "MainText"
    mainText.Size = UDim2.new(1, -10, 1, 0)
    mainText.Position = UDim2.new(0, 5, 0, 0)
    mainText.BackgroundTransparency = 1
    mainText.Text = text
    mainText.TextColor3 = Color3.fromRGB(255, 255, 255)
    mainText.TextSize = 12  -- Smaller text size
    mainText.TextStrokeTransparency = 0.5
    mainText.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    mainText.TextXAlignment = Enum.TextXAlignment.Center
    mainText.TextYAlignment = Enum.TextYAlignment.Center
    mainText.TextWrapped = false
    mainText.ClipsDescendants = true
    
    -- Apply custom font
    mainText.FontFace = comicFont
    
    mainText.Parent = notificationFrame
    
    return notificationFrame
end

-- Function to update positions of all notifications
local function updateNotificationPositions()
    for i, notification in ipairs(activeNotifications) do
        if notification and notification.Parent then
            -- Very tight spacing between notifications
            local targetY = (i - 1) * 18  -- Minimal spacing (same as height)
            local moveTween = TweenService:Create(notification,
                TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Position = UDim2.new(0, 0, 0, targetY)}
            )
            moveTween:Play()
        end
    end
end

-- Function to remove a notification
local function removeNotification(notification)
    for i, notif in ipairs(activeNotifications) do
        if notif == notification then
            table.remove(activeNotifications, i)
            break
        end
    end
    
    if notification and notification.Parent then
        -- Fade out animation
        local fadeOut = TweenService:Create(notification,
            TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
            {Position = UDim2.new(1, 0, notification.Position.Y.Scale, notification.Position.Y.Offset)}
        )
        
        fadeOut:Play()
        fadeOut.Completed:Connect(function()
            if notification and notification.Parent then
                notification:Destroy()
                updateNotificationPositions()
            end
        end)
    end
end

-- Function to show a new notification
local function showNotification(customText)
    local text = customText or notificationTexts[math.random(1, #notificationTexts)]
    local startY = -50 -- Start above screen
    
    local notification = createNotification(text, startY)
    table.insert(activeNotifications, 1, notification)  -- Add to beginning of list
    
    -- Slide in animation
    local slideIn = TweenService:Create(notification,
        TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        {Position = UDim2.new(0, 0, 0, 0)}  -- Slide to top position
    )
    
    slideIn:Play()
    slideIn.Completed:Connect(function()
        updateNotificationPositions()
    end)
    
    -- Auto-remove after 3 seconds
    task.delay(3, function()
        if notification and notification.Parent then
            removeNotification(notification)
        end
    end)
end

-- Function to toggle looping
local function toggleLoop()
    isLooping = not isLooping
    
    if isLooping then
        loopButton.Text = "Stop Loop"
        loopButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        
        -- Start spawning notifications every 0.8 seconds
        loopConnection = task.spawn(function()
            while isLooping do
                showNotification()
                task.wait(0.8)
            end
        end)
    else
        loopButton.Text = "Loop Notifications"
        loopButton.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
        
        if loopConnection then
            task.cancel(loopConnection)
            loopConnection = nil
        end
    end
end

-- Preload the font before showing notifications
ContentProvider:PreloadAsync({comicFont})

-- Connect button click
loopButton.MouseButton1Click:Connect(toggleLoop)

-- Show initial notification for testing
task.delay(0.5, function()
    showNotification("Kitsune Chest earned for balancing Corrupt and Tranquil")
end)
