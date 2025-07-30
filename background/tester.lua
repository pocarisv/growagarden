-- 4:3 Roblox GUI Script
-- Made by jayzee

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CustomGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Border Frame (Silver background, slightly bigger)
local borderFrame = Instance.new("Frame")
borderFrame.Name = "BorderFrame"
borderFrame.Size = UDim2.new(0, 203, 0, 268) -- 4px bigger on each side (8px total)
borderFrame.Position = UDim2.new(0.5, -101.5, 0.5, -134)
borderFrame.BackgroundColor3 = Color3.fromRGB(192, 192, 192) -- Silver background
borderFrame.BorderSizePixel = 0
borderFrame.Active = true
borderFrame.Draggable = true
borderFrame.Parent = screenGui

-- Corner rounding for border frame
local borderCorner = Instance.new("UICorner")
borderCorner.CornerRadius = UDim.new(0, 10) -- Slightly larger radius
borderCorner.Parent = borderFrame

-- Main Frame (3:4 aspect ratio, 30% bigger than previous)
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 195, 0, 260) -- 3:4 ratio, 30% bigger
mainFrame.Position = UDim2.new(0, 4, 0, 4) -- Centered within border frame
mainFrame.BackgroundColor3 = Color3.fromRGB(64, 64, 64) -- Dark gray
mainFrame.BorderColor3 = Color3.fromRGB(192, 192, 192) -- Silver
mainFrame.BorderSizePixel = 3 -- Thicker silver outline
mainFrame.Active = false -- Disable interaction since border frame handles it
mainFrame.Draggable = false -- Border frame handles dragging
mainFrame.Parent = borderFrame -- Parent to border frame instead of screenGui

-- Corner rounding for main frame
local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 8)
mainCorner.Parent = mainFrame

-- Silver outline stroke for main frame
local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(192, 192, 192) -- Silver
mainStroke.Thickness = 2
mainStroke.Parent = mainFrame

-- Title Bar
local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(48, 48, 48) -- Darker gray for title
titleBar.BorderSizePixel = 0 -- Remove default border since we're using UIStroke
titleBar.Parent = mainFrame

-- Corner rounding for title bar
local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 8)
titleCorner.Parent = titleBar

-- Silver outline stroke for title bar
local titleStroke = Instance.new("UIStroke")
titleStroke.Color = Color3.fromRGB(192, 192, 192) -- Silver
titleStroke.Thickness = 1
titleStroke.Parent = titleBar

-- Title Text
local titleText = Instance.new("TextLabel")
titleText.Name = "TitleText"
titleText.Size = UDim2.new(1, -60, 1, 0) -- Adjusted for smaller GUI
titleText.Position = UDim2.new(0, 8, 0, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "Custom GUI"
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.TextSize = 14 -- Modern appropriate font size
titleText.Font = Enum.Font.SourceSansLight -- Closest to Visby rounded
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.Parent = titleBar

-- Minimize Button
local minimizeButton = Instance.new("TextButton")
minimizeButton.Name = "MinimizeButton"
minimizeButton.Size = UDim2.new(0, 20, 0, 20) -- Smaller for compact GUI
minimizeButton.Position = UDim2.new(1, -45, 0, 5)
minimizeButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
minimizeButton.BorderSizePixel = 0 -- Remove default border since we're using UIStroke
minimizeButton.Text = "−"
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.TextSize = 16 -- Modern appropriate font size
minimizeButton.Font = Enum.Font.SourceSansLight -- Closest to Visby rounded
minimizeButton.Parent = titleBar

local minimizeCorner = Instance.new("UICorner")
minimizeCorner.CornerRadius = UDim.new(0, 4)
minimizeCorner.Parent = minimizeButton

-- Silver outline stroke for minimize button
local minimizeStroke = Instance.new("UIStroke")
minimizeStroke.Color = Color3.fromRGB(192, 192, 192) -- Silver
minimizeStroke.Thickness = 1
minimizeStroke.Parent = minimizeButton

-- Close Button
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 20, 0, 20) -- Smaller for compact GUI
closeButton.Position = UDim2.new(1, -22, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(180, 60, 60)
closeButton.BorderSizePixel = 0 -- Remove default border since we're using UIStroke
closeButton.Text = "×"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextSize = 16 -- Modern appropriate font size
closeButton.Font = Enum.Font.SourceSansLight -- Closest to Visby rounded
closeButton.Parent = titleBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 4)
closeCorner.Parent = closeButton

-- Silver outline stroke for close button
local closeStroke = Instance.new("UIStroke")
closeStroke.Color = Color3.fromRGB(192, 192, 192) -- Silver
closeStroke.Thickness = 1
closeStroke.Parent = closeButton

-- Content Area
local contentFrame = Instance.new("Frame")
contentFrame.Name = "ContentFrame"
contentFrame.Size = UDim2.new(1, -6, 1, -54) -- Adjusted for thicker borders
contentFrame.Position = UDim2.new(0, 3, 0, 32)
contentFrame.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
contentFrame.BorderSizePixel = 0 -- Remove default border since we're using UIStroke
contentFrame.Parent = mainFrame

-- Silver outline stroke for content frame
local contentStroke = Instance.new("UIStroke")
contentStroke.Color = Color3.fromRGB(192, 192, 192) -- Silver
contentStroke.Thickness = 1
contentStroke.Parent = contentFrame

-- Sample content
local contentText = Instance.new("TextLabel")
contentText.Name = "ContentText"
contentText.Size = UDim2.new(1, -16, 1, -16) -- Adjusted padding for smaller GUI
contentText.Position = UDim2.new(0, 8, 0, 8)
contentText.BackgroundTransparency = 1
contentText.Text = "Your GUI content goes here!\n\nThis is a 3:4 aspect ratio GUI with dark gray theme and silver outlines."
contentText.TextColor3 = Color3.fromRGB(220, 220, 220)
contentText.TextSize = 12 -- Modern appropriate font size for bigger GUI
contentText.Font = Enum.Font.SourceSansLight -- Closest to Visby rounded
contentText.TextWrapped = true
contentText.Parent = contentFrame

-- Watermark Section (Fixed at bottom)
local watermarkFrame = Instance.new("Frame")
watermarkFrame.Name = "WatermarkFrame"
watermarkFrame.Size = UDim2.new(1, 0, 0, 20)
watermarkFrame.Position = UDim2.new(0, 0, 1, -20)
watermarkFrame.BackgroundColor3 = Color3.fromRGB(64, 64, 64) -- Same as main frame
watermarkFrame.BorderSizePixel = 0 -- Remove default border since we're using UIStroke
watermarkFrame.Parent = mainFrame

-- Watermark corner rounding
local watermarkCorner = Instance.new("UICorner")
watermarkCorner.CornerRadius = UDim.new(0, 8)
watermarkCorner.Parent = watermarkFrame

-- Silver outline stroke for watermark frame
local watermarkStroke = Instance.new("UIStroke")
watermarkStroke.Color = Color3.fromRGB(192, 192, 192) -- Silver
watermarkStroke.Thickness = 1
watermarkStroke.Parent = watermarkFrame

-- Watermark Text
local watermarkText = Instance.new("TextLabel")
watermarkText.Name = "WatermarkText"
watermarkText.Size = UDim2.new(1, -8, 1, 0) -- Adjusted for smaller GUI
watermarkText.Position = UDim2.new(0, 4, 0, 0)
watermarkText.BackgroundTransparency = 1
watermarkText.Text = "made by jayzee"
watermarkText.TextColor3 = Color3.fromRGB(160, 160, 160)
watermarkText.TextSize = 10 -- Modern appropriate font size for watermark
watermarkText.Font = Enum.Font.SourceSansLight -- Closest to Visby rounded
watermarkText.TextXAlignment = Enum.TextXAlignment.Center
watermarkText.Parent = watermarkFrame

-- Variables for minimize functionality
local isMinimized = false
local originalSize = mainFrame.Size
local originalContentVisible = true

-- Minimize functionality
local function toggleMinimize()
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    
    if not isMinimized then
        -- Minimize - size to fit title bar content
        local titleWidth = titleText.TextBounds.X + 80 -- Add space for buttons and padding
        local minimizedWidth = math.max(titleWidth, 120) -- Minimum width
        local minimizedBorderWidth = minimizedWidth + 8 -- Add border padding
        
        local minimizeTween = TweenService:Create(mainFrame, tweenInfo, {Size = UDim2.new(0, minimizedWidth, 0, 30)})
        local borderTween = TweenService:Create(borderFrame, tweenInfo, {Size = UDim2.new(0, minimizedBorderWidth, 0, 38)})
        minimizeTween:Play()
        borderTween:Play()
        
        contentFrame.Visible = false
        watermarkFrame.Visible = false
        minimizeButton.Text = "+"
        isMinimized = true
    else
        -- Restore
        local restoreTween = TweenService:Create(mainFrame, tweenInfo, {Size = originalSize})
        local borderRestoreTween = TweenService:Create(borderFrame, tweenInfo, {Size = UDim2.new(0, 203, 0, 268)})
        restoreTween:Play()
        borderRestoreTween:Play()
        
        restoreTween.Completed:Connect(function()
            contentFrame.Visible = true
            watermarkFrame.Visible = true
        end)
        
        minimizeButton.Text = "−"
        isMinimized = false
    end
end

-- Close functionality
local function closeGUI()
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
    local closeTween = TweenService:Create(borderFrame, tweenInfo, {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    })
    closeTween:Play()
    
    closeTween.Completed:Connect(function()
        screenGui:Destroy()
    end)
end

-- Button hover effects
local function createHoverEffect(button, hoverColor, normalColor)
    button.MouseEnter:Connect(function()
        local hoverTween = TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = hoverColor})
        hoverTween:Play()
    end)
    
    button.MouseLeave:Connect(function()
        local leaveTween = TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = normalColor})
        leaveTween:Play()
    end)
end

-- Apply hover effects
createHoverEffect(minimizeButton, Color3.fromRGB(100, 100, 100), Color3.fromRGB(80, 80, 80))
createHoverEffect(closeButton, Color3.fromRGB(200, 80, 80), Color3.fromRGB(180, 60, 60))

-- Connect button events
minimizeButton.MouseButton1Click:Connect(toggleMinimize)
closeButton.MouseButton1Click:Connect(closeGUI)

-- Prevent watermark from being modified (make it read-only)
watermarkText.Changed:Connect(function(property)
    if property == "Text" and watermarkText.Text ~= "made by jayzee" then
        watermarkText.Text = "made by jayzee"
    end
end)

print("Custom 4:3 GUI loaded successfully!")
