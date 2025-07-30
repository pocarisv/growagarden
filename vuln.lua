local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "WarningGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local borderFrame = Instance.new("Frame")
borderFrame.Name = "BorderFrame"
borderFrame.Size = UDim2.new(0, 500, 0, 375)
borderFrame.Position = UDim2.new(0.5, -250, 0.5, -187.5)
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
mainFrame.Size = UDim2.new(0, 492, 0, 367)
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
titleText.Text = "Grow a Garden - Warning"
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.TextSize = 14
titleText.Font = Enum.Font.FredokaOne
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.Parent = titleBar

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 20, 0, 20)
closeButton.Position = UDim2.new(1, -27, 0, 5)
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

local contentFrame = Instance.new("Frame")
contentFrame.Name = "ContentFrame"
contentFrame.Size = UDim2.new(1, -10, 1, -40)
contentFrame.Position = UDim2.new(0, 5, 0, 35)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = mainFrame

local warningLabel = Instance.new("TextLabel")
warningLabel.Name = "WarningLabel"
warningLabel.Size = UDim2.new(1, 0, 0, 40)
warningLabel.BackgroundTransparency = 1
warningLabel.Text = "Whoops! Stop Right There..."
warningLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
warningLabel.TextSize = 24
warningLabel.Font = Enum.Font.FredokaOne
warningLabel.TextWrapped = true
warningLabel.TextXAlignment = Enum.TextXAlignment.Center
warningLabel.Parent = contentFrame

local descriptionLabel = Instance.new("TextLabel")
descriptionLabel.Name = "DescriptionLabel"
descriptionLabel.Size = UDim2.new(1, -10, 0, 150)
descriptionLabel.Position = UDim2.new(0, 5, 0, 45)
descriptionLabel.BackgroundTransparency = 1
descriptionLabel.Text = "Before you access the exploits for Grow a Garden, I want you to understand several things. This script is server sensitive and might do a server restart suddenly, its to keep your account safe from light bans (ex. Gifting Failed or Data Loss). Therefore it is implemented to prevent your account to experience such things, if a server restart happens please refrain from doing anything and wait until it was all completed it will only take a minute or two depends on your internet connection. If that is all well understood, check the box below this message and proceed to press the Activate button right after."
descriptionLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
descriptionLabel.TextSize = 16
descriptionLabel.Font = Enum.Font.GothamSemibold
descriptionLabel.TextWrapped = true
descriptionLabel.TextXAlignment = Enum.TextXAlignment.Justify
descriptionLabel.Parent = contentFrame

local checkboxFrame = Instance.new("Frame")
checkboxFrame.Name = "CheckboxFrame"
checkboxFrame.Size = UDim2.new(1, -20, 0, 30)
checkboxFrame.Position = UDim2.new(0, 10, 0, 205)
checkboxFrame.BackgroundTransparency = 1
checkboxFrame.Parent = contentFrame

local checkbox = Instance.new("TextButton")
checkbox.Name = "Checkbox"
checkbox.Size = UDim2.new(0, 24, 0, 24)
checkbox.Position = UDim2.new(0, 0, 0, 3)
checkbox.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
checkbox.Text = ""
checkbox.Parent = checkboxFrame

local checkboxCorner = Instance.new("UICorner")
checkboxCorner.CornerRadius = UDim.new(0, 4)
checkboxCorner.Parent = checkbox

local checkmark = Instance.new("TextLabel")
checkmark.Name = "Checkmark"
checkmark.Size = UDim2.new(1, 0, 1, 0)
checkmark.BackgroundTransparency = 1
checkmark.Text = "✓"
checkmark.TextColor3 = Color3.fromRGB(50, 200, 50)
checkmark.TextSize = 20
checkmark.Visible = false
checkmark.Parent = checkbox

local checkboxLabel = Instance.new("TextLabel")
checkboxLabel.Name = "CheckboxLabel"
checkboxLabel.Size = UDim2.new(1, -30, 1, 0)
checkboxLabel.Position = UDim2.new(0, 30, 0, 0)
checkboxLabel.BackgroundTransparency = 1
checkboxLabel.Text = "I understood the conditions and I wish to proceed"
checkboxLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
checkboxLabel.TextSize = 16
checkboxLabel.Font = Enum.Font.GothamSemibold
checkboxLabel.TextXAlignment = Enum.TextXAlignment.Left
checkboxLabel.Parent = checkboxFrame

local activateButton = Instance.new("TextButton")
activateButton.Name = "ActivateButton"
activateButton.Size = UDim2.new(0.6, 0, 0, 45)
activateButton.Position = UDim2.new(0.2, 0, 0, 250)
activateButton.BackgroundColor3 = Color3.fromRGB(40, 90, 40)
activateButton.Text = "Activate"
activateButton.TextColor3 = Color3.fromRGB(255, 255, 255)
activateButton.TextSize = 20
activateButton.Font = Enum.Font.FredokaOne
activateButton.AutoButtonColor = false
activateButton.Active = false
activateButton.Parent = contentFrame

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 6)
buttonCorner.Parent = activateButton

local function createHoverEffect(button, hoverColor, normalColor)
    button.MouseEnter:Connect(function()
        if button.Active then
            local hoverTween = TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = hoverColor})
            hoverTween:Play()
        end
    end)
    button.MouseLeave:Connect(function()
        if button.Active then
            local leaveTween = TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = normalColor})
            leaveTween:Play()
        end
    end)
end

createHoverEffect(closeButton, Color3.fromRGB(200, 80, 80), Color3.fromRGB(180, 60, 60))
createHoverEffect(activateButton, Color3.fromRGB(80, 180, 80), Color3.fromRGB(60, 150, 60))

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

local accepted = false
checkbox.MouseButton1Click:Connect(function()
    accepted = not accepted
    checkmark.Visible = accepted
    activateButton.Active = accepted
    activateButton.BackgroundColor3 = accepted and Color3.fromRGB(60, 150, 60) or Color3.fromRGB(40, 90, 40)
end)

activateButton.MouseButton1Click:Connect(function()
    closeGUI()
end)

closeButton.MouseButton1Click:Connect(closeGUI)
