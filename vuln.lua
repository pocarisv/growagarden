local gui = Instance.new("ScreenGui")
gui.Name = "PocariGUI"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 400, 0, 300)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.ClipsDescendants = true

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 8)
mainCorner.Parent = mainFrame

local mainBorder = Instance.new("UIStroke")
mainBorder.Color = Color3.fromRGB(180, 180, 180)
mainBorder.Thickness = 2
mainBorder.Parent = mainFrame

local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 36)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(60, 60, 60)

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 6)
titleCorner.Parent = titleBar

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Text = "CONTROL PANEL"
title.Font = Enum.Font.FredokaOne
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(220, 220, 220)
title.BackgroundTransparency = 1
title.Size = UDim2.new(0, 200, 1, 0)
title.Position = UDim2.new(0, 15, 0, 0)
title.TextXAlignment = Enum.TextXAlignment.Left

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Text = "×"
closeButton.Font = Enum.Font.GothamSemibold
closeButton.TextSize = 24
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
closeButton.Size = UDim2.new(0, 36, 1, 0)
closeButton.Position = UDim2.new(1, -36, 0, 0)
closeButton.BorderSizePixel = 0

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeButton

local minimizeButton = Instance.new("TextButton")
minimizeButton.Name = "MinimizeButton"
minimizeButton.Text = "-"
minimizeButton.Font = Enum.Font.GothamSemibold
minimizeButton.TextSize = 24
minimizeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
minimizeButton.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
minimizeButton.Size = UDim2.new(0, 36, 1, 0)
minimizeButton.Position = UDim2.new(1, -72, 0, 0)
minimizeButton.BorderSizePixel = 0

local minCorner = Instance.new("UICorner")
minCorner.CornerRadius = UDim.new(0, 6)
minCorner.Parent = minimizeButton

local contentFrame = Instance.new("Frame")
contentFrame.Name = "ContentFrame"
contentFrame.BackgroundTransparency = 1
contentFrame.Size = UDim2.new(1, -20, 1, -76)
contentFrame.Position = UDim2.new(0, 10, 0, 46)

local watermark = Instance.new("TextLabel")
watermark.Name = "Watermark"
watermark.Text = "made by pocari"
watermark.Font = Enum.Font.GothamSemibold
watermark.TextSize = 10
watermark.TextColor3 = Color3.fromRGB(150, 150, 150)
watermark.BackgroundTransparency = 1
watermark.Size = UDim2.new(1, 0, 0, 20)
watermark.Position = UDim2.new(0, 0, 1, -20)
watermark.TextYAlignment = Enum.TextYAlignment.Top

local userInput = game:GetService("UserInputService")
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

minimizeButton.MouseButton1Click:Connect(function()
    if minimizeButton.Text == "-" then
        contentFrame.Visible = false
        mainFrame.Size = UDim2.new(mainFrame.Size.X.Scale, mainFrame.Size.X.Offset, 0, 36)
        minimizeButton.Text = "+"
    else
        contentFrame.Visible = true
        mainFrame.Size = UDim2.new(0, 400, 0, 300)
        minimizeButton.Text = "-"
    end
end)

closeButton.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

minimizeButton.MouseEnter:Connect(function()
    minimizeButton.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
end)

minimizeButton.MouseLeave:Connect(function()
    minimizeButton.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
end)

closeButton.MouseEnter:Connect(function()
    closeButton.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
end)

closeButton.MouseLeave:Connect(function()
    closeButton.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
end)

watermark.Parent = mainFrame
contentFrame.Parent = mainFrame
minimizeButton.Parent = titleBar
closeButton.Parent = titleBar
title.Parent = titleBar
titleBar.Parent = mainFrame
mainFrame.Parent = gui
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
