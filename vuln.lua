local gui = Instance.new("ScreenGui")
gui.Name = "PocariGUI"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 400, 0, 500)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.ClipsDescendants = true

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 8)
mainCorner.Parent = mainFrame

local mainBorder = Instance.new("UIStroke")
mainBorder.Color = Color3.fromRGB(230, 230, 230)
mainBorder.Thickness = 3
mainBorder.Parent = mainFrame

local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 32)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
titleBar.ClipsDescendants = true

local titleBarCorner = Instance.new("UICorner")
titleBarCorner.CornerRadius = UDim.new(0, 8)
titleBarCorner.Parent = titleBar

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Text = "ACTIVATION REQUIRED"
title.Font = Enum.Font.FredokaOne
title.TextSize = 16
title.TextColor3 = Color3.fromRGB(230, 230, 230)
title.BackgroundTransparency = 1
title.Size = UDim2.new(0, 200, 1, 0)
title.Position = UDim2.new(0, 12, 0, 0)
title.TextXAlignment = Enum.TextXAlignment.Left

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Text = "×"
closeButton.Font = Enum.Font.GothamSemibold
closeButton.TextSize = 22
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
closeButton.Size = UDim2.new(0, 28, 0, 28)
closeButton.Position = UDim2.new(1, -32, 0, 2)
closeButton.BorderSizePixel = 0

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeButton

local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Name = "ScrollFrame"
scrollFrame.BackgroundTransparency = 1
scrollFrame.Size = UDim2.new(1, -16, 1, -100)
scrollFrame.Position = UDim2.new(0, 8, 0, 40)
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollFrame.ScrollBarThickness = 5
scrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

local contentLayout = Instance.new("UIListLayout")
contentLayout.Parent = scrollFrame
contentLayout.Padding = UDim.new(0, 10)

local warningTitle = Instance.new("TextLabel")
warningTitle.Name = "WarningTitle"
warningTitle.Text = "Whoops! Stop Right There.."
warningTitle.Font = Enum.Font.FredokaOne
warningTitle.TextSize = 24
warningTitle.TextColor3 = Color3.fromRGB(255, 85, 85)
warningTitle.BackgroundTransparency = 1
warningTitle.Size = UDim2.new(1, 0, 0, 30)
warningTitle.TextXAlignment = Enum.TextXAlignment.Left
warningTitle.LayoutOrder = 1

local warningMessage = Instance.new("TextLabel")
warningMessage.Name = "WarningMessage"
warningMessage.Text = "Before you can have the access for the exploits. I wanted you to understand that the script you are executing are very sensitive towards servers, now keep in mind that it does the job done but it also assures your account safety. Therefore script will conduct several server restarts during the execution of the scripts/exploits and server restarts will only lasts for approximately 1min to 3mins, making sure you are in the safe server. Now, why does the script server restarts, well its because game light-ban their players by disabling the gifting feature for the account (ex. Trade Failed, Data Loss). During the server restart please refrain from doing anything to keep your account totally safe. If you agree please proceed to tick the check box below this message and press Activate button. Enjoy and Goodluck ;)"
warningMessage.Font = Enum.Font.Gotham
warningMessage.TextSize = 14
warningMessage.TextColor3 = Color3.fromRGB(220, 220, 220)
warningMessage.BackgroundTransparency = 1
warningMessage.Size = UDim2.new(1, 0, 0, 0)
warningMessage.TextWrapped = true
warningMessage.TextXAlignment = Enum.TextXAlignment.Left
warningMessage.AutomaticSize = Enum.AutomaticSize.Y
warningMessage.LayoutOrder = 2

local agreementFrame = Instance.new("Frame")
agreementFrame.Name = "AgreementFrame"
agreementFrame.BackgroundTransparency = 1
agreementFrame.Size = UDim2.new(1, 0, 0, 25)
agreementFrame.LayoutOrder = 3

local checkBox = Instance.new("TextButton")
checkBox.Name = "CheckBox"
checkBox.Size = UDim2.new(0, 20, 0, 20)
checkBox.Position = UDim2.new(0, 0, 0, 2)
checkBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
checkBox.Text = ""
checkBox.AutoButtonColor = false

local checkBoxCorner = Instance.new("UICorner")
checkBoxCorner.CornerRadius = UDim.new(0, 4)
checkBoxCorner.Parent = checkBox

local checkBoxStroke = Instance.new("UIStroke")
checkBoxStroke.Color = Color3.fromRGB(180, 180, 180)
checkBoxStroke.Thickness = 1
checkBoxStroke.Parent = checkBox

local checkMark = Instance.new("TextLabel")
checkMark.Name = "CheckMark"
checkMark.Size = UDim2.new(1, 0, 1, 0)
checkMark.Position = UDim2.new(0, 0, 0, 0)
checkMark.BackgroundTransparency = 1
checkMark.Text = "✓"
checkMark.Font = Enum.Font.GothamBold
checkMark.TextSize = 18
checkMark.TextColor3 = Color3.fromRGB(85, 255, 85)
checkMark.Visible = false
checkMark.Parent = checkBox

local agreementText = Instance.new("TextLabel")
agreementText.Name = "AgreementText"
agreementText.Text = "I understood completely, I wish to continue."
agreementText.Font = Enum.Font.Gotham
agreementText.TextSize = 14
agreementText.TextColor3 = Color3.fromRGB(200, 200, 200)
agreementText.BackgroundTransparency = 1
agreementText.Size = UDim2.new(1, -30, 1, 0)
agreementText.Position = UDim2.new(0, 30, 0, 0)
agreementText.TextXAlignment = Enum.TextXAlignment.Left

local activateButton = Instance.new("TextButton")
activateButton.Name = "ActivateButton"
activateButton.Text = "ACTIVATE"
activateButton.Font = Enum.Font.FredokaOne
activateButton.TextSize = 18
activateButton.TextColor3 = Color3.fromRGB(255, 255, 255)
activateButton.BackgroundColor3 = Color3.fromRGB(50, 120, 50)
activateButton.Size = UDim2.new(1, 0, 0, 40)
activateButton.LayoutOrder = 4
activateButton.AutoButtonColor = false

local activateCorner = Instance.new("UICorner")
activateCorner.CornerRadius = UDim.new(0, 6)
activateCorner.Parent = activateButton

local activateStroke = Instance.new("UIStroke")
activateStroke.Color = Color3.fromRGB(100, 200, 100)
activateStroke.Thickness = 2
activateStroke.Parent = activateButton

local watermark = Instance.new("TextLabel")
watermark.Name = "Watermark"
watermark.Text = "made by pocari"
watermark.Font = Enum.Font.GothamSemibold
watermark.TextSize = 10
watermark.TextColor3 = Color3.fromRGB(150, 150, 150)
watermark.BackgroundTransparency = 1
watermark.Size = UDim2.new(1, 0, 0, 16)
watermark.Position = UDim2.new(0, 0, 1, -16)
watermark.TextYAlignment = Enum.TextYAlignment.Top

local userInput = game:GetService("UserInputService")
local tweenService = game:GetService("TweenService")
local dragging
local dragInput
local dragStart
local startPos

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

titleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

userInput.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

closeButton.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

closeButton.MouseEnter:Connect(function()
    closeButton.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
end)

closeButton.MouseLeave:Connect(function()
    closeButton.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
end)

local pulseTween = tweenService:Create(
    mainBorder,
    TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
    {Color = Color3.fromRGB(255, 255, 255)}
)
pulseTween:Play()

checkBox.MouseButton1Click:Connect(function()
    checkMark.Visible = not checkMark.Visible
end)

activateButton.MouseEnter:Connect(function()
    activateButton.BackgroundColor3 = Color3.fromRGB(60, 140, 60)
end)

activateButton.MouseLeave:Connect(function()
    activateButton.BackgroundColor3 = Color3.fromRGB(50, 120, 50)
end)

activateButton.MouseButton1Click:Connect(function()
    if checkMark.Visible then
        activateButton.Text = "ACTIVATING..."
    end
end)

agreementText.Parent = agreementFrame
checkBox.Parent = agreementFrame
agreementFrame.Parent = scrollFrame
activateButton.Parent = scrollFrame
warningMessage.Parent = scrollFrame
warningTitle.Parent = scrollFrame
watermark.Parent = mainFrame
scrollFrame.Parent = mainFrame
closeButton.Parent = titleBar
title.Parent = titleBar
titleBar.Parent = mainFrame
mainFrame.Parent = gui
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
