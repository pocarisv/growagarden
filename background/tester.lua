local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create main GUI container
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ModernApp"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

-- Create main window frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainWindow"
mainFrame.Size = UDim2.new(0.3, 0, 0.4, 0)
mainFrame.Position = UDim2.new(0.35, 0, 0.3, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
mainFrame.BackgroundTransparency = 0.1
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

-- Add rounded corners
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0.03, 0)
corner.Parent = mainFrame

-- Add shadow effect
local shadow = Instance.new("ImageLabel")
shadow.Name = "Shadow"
shadow.Image = "rbxassetid://1316045217"
shadow.ImageColor3 = Color3.new(0, 0, 0)
shadow.ImageTransparency = 0.8
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(10, 10, 118, 118)
shadow.Size = UDim2.new(1, 20, 1, 20)
shadow.Position = UDim2.new(0, -10, 0, -10)
shadow.BackgroundTransparency = 1
shadow.Parent = mainFrame
shadow.ZIndex = -1

-- Create title bar
local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0.1, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

-- Add title text
local title = Instance.new("TextLabel")
title.Name = "Title"
title.Text = "Modern App"
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(240, 240, 240)
title.Size = UDim2.new(0.6, 0, 1, 0)
title.Position = UDim2.new(0.02, 0, 0, 0)
title.BackgroundTransparency = 1
title.Parent = titleBar

-- Create close button
local closeBtn = Instance.new("TextButton")
closeBtn.Name = "CloseButton"
closeBtn.Text = "✕"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 18
closeBtn.TextColor3 = Color3.fromRGB(240, 240, 240)
closeBtn.Size = UDim2.new(0.1, 0, 1, 0)
closeBtn.Position = UDim2.new(0.9, 0, 0, 0)
closeBtn.BackgroundTransparency = 1
closeBtn.Parent = titleBar

-- Create minimize button
local minBtn = Instance.new("TextButton")
minBtn.Name = "MinimizeButton"
minBtn.Text = "—"
minBtn.Font = Enum.Font.GothamBold
minBtn.TextSize = 18
minBtn.TextColor3 = Color3.fromRGB(240, 240, 240)
minBtn.Size = UDim2.new(0.1, 0, 1, 0)
minBtn.Position = UDim2.new(0.8, 0, 0, 0)
minBtn.BackgroundTransparency = 1
minBtn.Parent = titleBar

-- Create tray icon (initially hidden)
local trayIcon = Instance.new("ImageButton")
trayIcon.Name = "TrayIcon"
trayIcon.Size = UDim2.new(0.05, 0, 0.08, 0)
trayIcon.Position = UDim2.new(0.95, 0, 0.92, 0)
trayIcon.AnchorPoint = Vector2.new(1, 1)
trayIcon.BackgroundTransparency = 1
trayIcon.Image = "rbxassetid://13099972048" -- Replace with your image ID
trayIcon.Visible = false
trayIcon.Parent = screenGui

-- Create sample content
local content = Instance.new("ScrollingFrame")
content.Name = "Content"
content.Size = UDim2.new(0.95, 0, 0.85, 0)
content.Position = UDim2.new(0.025, 0, 0.15, 0)
content.BackgroundTransparency = 1
content.ScrollBarThickness = 5
content.CanvasSize = UDim2.new(0, 0, 2, 0)
content.Parent = mainFrame

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0.02, 0)
layout.Parent = content

for i = 1, 10 do
    local item = Instance.new("TextLabel")
    item.Text = "Item " .. i
    item.Font = Enum.Font.Gotham
    item.TextSize = 16
    item.TextColor3 = Color3.fromRGB(200, 200, 220)
    item.Size = UDim2.new(1, 0, 0.1, 0)
    item.BackgroundColor3 = Color3.fromRGB(50, 50, 65)
    item.BackgroundTransparency = 0.5
    item.Parent = content
    
    local itemCorner = Instance.new("UICorner")
    itemCorner.CornerRadius = UDim.new(0.2, 0)
    itemCorner.Parent = item
end

-- Make window draggable
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, 
                                  startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
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
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- Button functionality
closeBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

minBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
    trayIcon.Visible = true
end)

trayIcon.MouseButton1Click:Connect(function()
    mainFrame.Visible = true
    trayIcon.Visible = false
end)

-- Button hover effects
local function addButtonHover(button)
    button.MouseEnter:Connect(function()
        button.BackgroundTransparency = 0.7
        button.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    end)
    
    button.MouseLeave:Connect(function()
        button.BackgroundTransparency = 1
    end)
end

addButtonHover(closeBtn)
addButtonHover(minBtn)

-- Add subtle fade-in animation
mainFrame.BackgroundTransparency = 1
titleBar.BackgroundTransparency = 1
shadow.ImageTransparency = 1

task.spawn(function()
    for i = 1, 10 do
        mainFrame.BackgroundTransparency = 1 - (i/10)
        titleBar.BackgroundTransparency = 1 - (i/10)
        shadow.ImageTransparency = 1 - (i/10)*0.8
        task.wait(0.02)
    end
end)
