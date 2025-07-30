-- 4:3 Activation GUI Script
-- Made by jayzee

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ActivationGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Border Frame (Silver background, slightly bigger)
local borderFrame = Instance.new("Frame")
borderFrame.Name = "BorderFrame"
borderFrame.Size = UDim2.new(0, 203, 0, 268)
borderFrame.Position = UDim2.new(0.5, -101.5, 0.5, -134)
borderFrame.BackgroundColor3 = Color3.fromRGB(192, 192, 192)
borderFrame.BorderSizePixel = 0
borderFrame.Active = true
borderFrame.Draggable = true
borderFrame.Parent = screenGui

-- Corner rounding for border frame
local borderCorner = Instance.new("UICorner")
borderCorner.CornerRadius = UDim.new(0, 10)
borderCorner.Parent = borderFrame

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 195, 0, 260)
mainFrame.Position = UDim2.new(0, 4, 0, 4)
mainFrame.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
mainFrame.BorderColor3 = Color3.fromRGB(192, 192, 192)
mainFrame.BorderSizePixel = 3
mainFrame.Active = false
mainFrame.Draggable = false
mainFrame.Parent = borderFrame

-- Corner rounding for main frame
local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 8)
mainCorner.Parent = mainFrame

-- Add padding to main frame for better text spacing
local mainPadding = Instance.new("UIPadding")
mainPadding.PaddingLeft = UDim.new(0, 8)
mainPadding.PaddingRight = UDim.new(0, 8)
mainPadding.PaddingTop = UDim.new(0, 5)
mainPadding.PaddingBottom = UDim.new(0, 5)
mainPadding.Parent = mainFrame

-- Title Bar
local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, -16, 0, 30)
titleBar.Position = UDim2.new(0, 8, 0, 5)
titleBar.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

-- Corner rounding for title bar
local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 8)
titleCorner.Parent = titleBar

-- Title Text
local titleText = Instance.new("TextLabel")
titleText.Name = "TitleText"
titleText.Size = UDim2.new(1, -60, 1, 0)
titleText.Position = UDim2.new(0, 8, 0, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "Activation Required"
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.TextSize = 14
titleText.Font = Enum.Font.FredokaOne
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.TextYAlignment = Enum.TextYAlignment.Center
titleText.Parent = titleBar

-- Minimize Button
local minimizeButton = Instance.new("TextButton")
minimizeButton.Name = "MinimizeButton"
minimizeButton.Size = UDim2.new(0, 20, 0, 20)
minimizeButton.Position = UDim2.new(1, -45, 0, 5)
minimizeButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
minimizeButton.BorderSizePixel = 0
minimizeButton.Text = "−"
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.TextSize = 16
minimizeButton.Font = Enum.Font.FredokaOne
minimizeButton.Parent = titleBar

local minimizeCorner = Instance.new("UICorner")
minimizeCorner.CornerRadius = UDim.new(0, 4)
minimizeCorner.Parent = minimizeButton

-- Close Button
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 20, 0, 20)
closeButton.Position = UDim2.new(1, -22, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(180, 60, 60)
closeButton.BorderSizePixel = 0
closeButton.Text = "×"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextSize = 16
closeButton.Font = Enum.Font.FredokaOne
closeButton.Parent = titleBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 4)
closeCorner.Parent = closeButton

-- Content Area
local contentFrame = Instance.new("Frame")
contentFrame.Name = "ContentFrame"
contentFrame.Size = UDim2.new(1, -16, 1, -60)
contentFrame.Position = UDim2.new(0, 8, 0, 40)
contentFrame.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
contentFrame.BorderSizePixel = 0
contentFrame.Parent = mainFrame

-- Add padding to content frame
local contentPadding = Instance.new("UIPadding")
contentPadding.PaddingLeft = UDim.new(0, 10)
contentPadding.PaddingRight = UDim.new(0, 10)
contentPadding.PaddingTop = UDim.new(0, 8)
contentPadding.PaddingBottom = UDim.new(0, 8)
contentPadding.Parent = contentFrame

-- Warning Text
local warningText = Instance.new("TextLabel")
warningText.Name = "WarningText"
warningText.Size = UDim2.new(1, 0, 0, 35)
warningText.Position = UDim2.new(0, 0, 0, 0)
warningText.BackgroundTransparency = 1
warningText.Text = "Whoops! Stop Right There!"
warningText.TextColor3 = Color3.fromRGB(255, 100, 100)
warningText.TextSize = 16
warningText.Font = Enum.Font.FredokaOne
warningText.TextWrapped = true
warningText.TextXAlignment = Enum.TextXAlignment.Center
warningText.TextYAlignment = Enum.TextYAlignment.Center
warningText.Parent = contentFrame

-- Agreement Text
local agreementText = Instance.new("TextLabel")
agreementText.Name = "AgreementText"
agreementText.Size = UDim2.new(1, 0, 0, 120)
agreementText.Position = UDim2.new(0, 0, 0, 45)
agreementText.BackgroundTransparency = 1
agreementText.Text = "Before accessing the script, we need your confirmation. This script may perform a server restart if communication issues occur with the game server to prevent potential bans.\n\nFor your safety, we require your agreement. If a server restart happens, please remain in-game and avoid any actions during the process. The developer cannot predict what might happen if you leave or exit during this time.\n\nBy clicking 'ACTIVATE' below, you agree to these terms and the script will initialize with a server restart. Have fun and good luck!"
agreementText.TextColor3 = Color3.fromRGB(220, 220, 220)
agreementText.TextSize = 11
agreementText.Font = Enum.Font.SourceSans
agreementText.TextWrapped = true
agreementText.TextXAlignment = Enum.TextXAlignment.Left
agreementText.TextYAlignment = Enum.TextYAlignment.Top
agreementText.Parent = contentFrame

-- Activate Button
local activateButton = Instance.new("TextButton")
activateButton.Name = "ActivateButton"
activateButton.Size = UDim2.new(0.8, 0, 0, 32)
activateButton.Position = UDim2.new(0.1, 0, 1, -40)
activateButton.BackgroundColor3 = Color3.fromRGB(80, 180, 80)
activateButton.Text = "ACTIVATE"
activateButton.TextColor3 = Color3.new(1, 1, 1)
activateButton.TextSize = 14
activateButton.Font = Enum.Font.FredokaOne
activateButton.Parent = contentFrame

local activateCorner = Instance.new("UICorner")
activateCorner.CornerRadius = UDim.new(0, 6)
activateCorner.Parent = activateButton

-- Watermark Section
local watermarkFrame = Instance.new("Frame")
watermarkFrame.Name = "WatermarkFrame"
watermarkFrame.Size = UDim2.new(1, -16, 0, 20)
watermarkFrame.Position = UDim2.new(0, 8, 1, -25)
watermarkFrame.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
watermarkFrame.BorderSizePixel = 0
watermarkFrame.Parent = mainFrame

local watermarkCorner = Instance.new("UICorner")
watermarkCorner.CornerRadius = UDim.new(0, 8)
watermarkCorner.Parent = watermarkFrame

-- Watermark Text
local watermarkText = Instance.new("TextLabel")
watermarkText.Name = "WatermarkText"
watermarkText.Size = UDim2.new(1, -8, 1, 0)
watermarkText.Position = UDim2.new(0, 4, 0, 0)
watermarkText.BackgroundTransparency = 1
watermarkText.Text = "made by jayzee"
watermarkText.TextColor3 = Color3.fromRGB(160, 160, 160)
watermarkText.TextSize = 10
watermarkText.Font = Enum.Font.Nunito
watermarkText.TextXAlignment = Enum.TextXAlignment.Center
watermarkText.TextYAlignment = Enum.TextYAlignment.Center
watermarkText.Parent = watermarkFrame

-- Variables for minimize functionality
local isMinimized = false
local originalSize = mainFrame.Size
local originalContentVisible = true

-- Minimize functionality
local function toggleMinimize()
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    
    if not isMinimized then
        local titleWidth = titleText.TextBounds.X + 80
        local minimizedWidth = math.max(titleWidth, 120)
        local minimizedBorderWidth = minimizedWidth + 8
        
        local minimizeTween = TweenService:Create(mainFrame, tweenInfo, {Size = UDim2.new(0, minimizedWidth, 0, 40)})
        local borderTween = TweenService:Create(borderFrame, tweenInfo, {Size = UDim2.new(0, minimizedBorderWidth, 0, 48)})
        minimizeTween:Play()
        borderTween:Play()
        
        contentFrame.Visible = false
        watermarkFrame.Visible = false
        minimizeButton.Text = "+"
        isMinimized = true
    else
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
createHoverEffect(activateButton, Color3.fromRGB(100, 220, 100), Color3.fromRGB(80, 180, 80))

-- Connect button events
minimizeButton.MouseButton1Click:Connect(toggleMinimize)
closeButton.MouseButton1Click:Connect(closeGUI)

-- Activation function
local function activateScript()
    -- Simulate server restart
    activateButton.Text = "ACTIVATING..."
    activateButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    
    local pulseTween = TweenService:Create(activateButton, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true), {
        BackgroundTransparency = 0.3
    })
    pulseTween:Play()
    
    -- Simulate server restart delay
    wait(2)
    
    pulseTween:Cancel()
    closeGUI()
    
    -- Your script initialization would go here
    print("Script activated successfully!")
end

activateButton.MouseButton1Click:Connect(activateScript)

-- Prevent watermark from being modified
watermarkText.Changed:Connect(function(property)
    if property == "Text" and watermarkText.Text ~= "made by jayzee" then
        watermarkText.Text = "made by jayzee"
    end
end)

print("Activation GUI loaded successfully!")
