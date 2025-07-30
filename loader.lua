local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ActivationGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local borderFrame = Instance.new("Frame")
borderFrame.Name = "BorderFrame"
borderFrame.Size = UDim2.new(0, 203, 0, 268)
borderFrame.Position = UDim2.new(0.5, -101.5, 0.5, -134)
borderFrame.BackgroundColor3 = Color3.fromRGB(192, 192, 192)
borderFrame.BorderSizePixel = 0
borderFrame.Active = true
borderFrame.Draggable = true
borderFrame.Parent = screenGui

local borderCorner = Instance.new("UICorner")
borderCorner.CornerRadius = UDim.new(0, 10)
borderCorner.Parent = borderFrame

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

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 8)
mainCorner.Parent = mainFrame

local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 8)
titleCorner.Parent = titleBar

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
titleText.Parent = titleBar

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

local contentFrame = Instance.new("ScrollingFrame")
contentFrame.Name = "ContentFrame"
contentFrame.Size = UDim2.new(1, -6, 1, -54)
contentFrame.Position = UDim2.new(0, 3, 0, 32)
contentFrame.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
contentFrame.BorderSizePixel = 0
contentFrame.ScrollBarThickness = 6
contentFrame.ScrollBarImageColor3 = Color3.fromRGB(150, 150, 150)
contentFrame.CanvasSize = UDim2.new(0, 0, 0, 240)
contentFrame.ScrollingDirection = Enum.ScrollingDirection.Y
contentFrame.Parent = mainFrame

local warningText = Instance.new("TextLabel")
warningText.Name = "WarningText"
warningText.Size = UDim2.new(1, -10, 0, 60)
warningText.Position = UDim2.new(0, 5, 0, 5)
warningText.BackgroundTransparency = 1
warningText.Text = "Whoops! Stop Right There!"
warningText.TextColor3 = Color3.fromRGB(255, 100, 100)
warningText.TextSize = 18
warningText.Font = Enum.Font.FredokaOne
warningText.TextWrapped = true
warningText.TextScaled = true
warningText.Parent = contentFrame

local agreementText = Instance.new("TextLabel")
agreementText.Name = "AgreementText"
agreementText.Size = UDim2.new(1, -10, 0, 130)
agreementText.Position = UDim2.new(0, 5, 0, 70)
agreementText.BackgroundTransparency = 1
agreementText.Text = "Before you access the exploits, I you to understand that these exploits are very sensitive against servers. In order for the script to work properly it might do a several server restarts but fear not. Those server restarts maintain the security of your accounts, it will keep your account safe from Grow A Garden Security where it will prevent you from gifting anything. If you agree please press the Activate button below this message and it will activate the script by doing a server restart."
agreementText.TextColor3 = Color3.fromRGB(220, 220, 220)
agreementText.TextSize = 12
agreementText.Font = Enum.Font.SourceSans
agreementText.TextWrapped = true
agreementText.TextXAlignment = Enum.TextXAlignment.Left
agreementText.Parent = contentFrame

local activateButton = Instance.new("TextButton")
activateButton.Name = "ActivateButton"
activateButton.Size = UDim2.new(0.8, 0, 0, 30)
activateButton.Position = UDim2.new(0.1, 0, 0, 210)
activateButton.BackgroundColor3 = Color3.fromRGB(80, 180, 80)
activateButton.Text = "ACTIVATE"
activateButton.TextColor3 = Color3.new(1, 1, 1)
activateButton.TextSize = 14
activateButton.Font = Enum.Font.FredokaOne
activateButton.Parent = contentFrame

local activateCorner = Instance.new("UICorner")
activateCorner.CornerRadius = UDim.new(0, 5)
activateCorner.Parent = activateButton

local watermarkFrame = Instance.new("Frame")
watermarkFrame.Name = "WatermarkFrame"
watermarkFrame.Size = UDim2.new(1, 0, 0, 20)
watermarkFrame.Position = UDim2.new(0, 0, 1, -20)
watermarkFrame.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
watermarkFrame.BorderSizePixel = 0
watermarkFrame.Parent = mainFrame

local watermarkCorner = Instance.new("UICorner")
watermarkCorner.CornerRadius = UDim.new(0, 8)
watermarkCorner.Parent = watermarkFrame

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
watermarkText.Parent = watermarkFrame

local isMinimized = false
local originalSize = mainFrame.Size
local originalContentVisible = true

local function toggleMinimize()
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    
    if not isMinimized then
        local titleWidth = titleText.TextBounds.X + 80
        local minimizedWidth = math.max(titleWidth, 120)
        local minimizedBorderWidth = minimizedWidth + 8
        
        local minimizeTween = TweenService:Create(mainFrame, tweenInfo, {Size = UDim2.new(0, minimizedWidth, 0, 30)})
        local borderTween = TweenService:Create(borderFrame, tweenInfo, {Size = UDim2.new(0, minimizedBorderWidth, 0, 38)})
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

createHoverEffect(minimizeButton, Color3.fromRGB(100, 100, 100), Color3.fromRGB(80, 80, 80))
createHoverEffect(closeButton, Color3.fromRGB(200, 80, 80), Color3.fromRGB(180, 60, 60))
createHoverEffect(activateButton, Color3.fromRGB(100, 220, 100), Color3.fromRGB(80, 180, 80))

minimizeButton.MouseButton1Click:Connect(toggleMinimize)
closeButton.MouseButton1Click:Connect(closeGUI)

local function activateScript()
    activateButton.Text = "ACTIVATING..."
    activateButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    
    local pulseTween = TweenService:Create(activateButton, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true), {
        BackgroundTransparency = 0.3
    })
    pulseTween:Play()
    
    wait(2)
    
    pulseTween:Cancel()
    closeGUI()
end

activateButton.MouseButton1Click:Connect(activateScript)

watermarkText.Changed:Connect(function(property)
    if property == "Text" and watermarkText.Text ~= "made by jayzee" then
        watermarkText.Text = "made by jayzee"
    end
end)
