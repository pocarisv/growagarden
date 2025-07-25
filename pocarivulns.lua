local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
if playerGui:FindFirstChild("PocariVulns") then return end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "PocariVulns"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local minimizeButton = Instance.new("TextButton")
minimizeButton.Name = "MinimizeButton"
minimizeButton.Size = UDim2.new(0, 120, 0, 30)
minimizeButton.Position = UDim2.new(0, 15, 0, 15)
minimizeButton.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
minimizeButton.BorderSizePixel = 0
minimizeButton.Text = "PocariVulns"
minimizeButton.TextColor3 = Color3.fromRGB(135, 140, 200)
minimizeButton.TextSize = 11
minimizeButton.Font = Enum.Font.GothamSemibold
minimizeButton.Visible = false
minimizeButton.Parent = screenGui

Instance.new("UICorner", minimizeButton).CornerRadius = UDim.new(0, 6)
local minimizeStroke = Instance.new("UIStroke", minimizeButton)
minimizeStroke.Color = Color3.fromRGB(45, 50, 80)
minimizeStroke.Thickness = 1

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 380, 0, 240)
mainFrame.Position = UDim2.new(0.5, -190, 0.5, -120)
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 12, 20)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local shadow = Instance.new("ImageLabel", mainFrame)
shadow.Name = "Shadow"
shadow.Size = UDim2.new(1, 16, 1, 16)
shadow.Position = UDim2.new(0, -8, 0, -8)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxasset://textures/ui/Controls/DropShadow.png"
shadow.ImageColor3 = Color3.fromRGB(0, 0, 5)
shadow.ImageTransparency = 0.2
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(12, 12, 276, 276)
shadow.ZIndex = -1

Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 10)
local mainStroke = Instance.new("UIStroke", mainFrame)
mainStroke.Color = Color3.fromRGB(45, 50, 80)
mainStroke.Thickness = 1

local titleBar = Instance.new("Frame", mainFrame)
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

Instance.new("UICorner", titleBar).CornerRadius = UDim.new(0, 10)
local titleFix = Instance.new("Frame", titleBar)
titleFix.Size = UDim2.new(1, 0, 0, 10)
titleFix.Position = UDim2.new(0, 0, 1, -10)
titleFix.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

local titleText = Instance.new("TextLabel", titleBar)
titleText.Name = "TitleText"
titleText.Size = UDim2.new(1, -70, 1, 0)
titleText.Position = UDim2.new(0, 12, 0, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "PocariVulns"
titleText.TextColor3 = Color3.fromRGB(180, 185, 230)
titleText.TextSize = 13
titleText.Font = Enum.Font.GothamBold
titleText.TextXAlignment = Enum.TextXAlignment.Left

local minimizeBtn = Instance.new("TextButton", titleBar)
minimizeBtn.Name = "MinimizeBtn"
minimizeBtn.Size = UDim2.new(0, 20, 0, 20)
minimizeBtn.Position = UDim2.new(1, -50, 0, 5)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(80, 120, 255)
minimizeBtn.Text = "—"
minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeBtn.TextSize = 10
minimizeBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", minimizeBtn).CornerRadius = UDim.new(0, 10)

local closeButton = Instance.new("TextButton", titleBar)
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 20, 0, 20)
closeButton.Position = UDim2.new(1, -25, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(180, 60, 100)
closeButton.Text = "✕"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextSize = 10
closeButton.Font = Enum.Font.GothamBold
Instance.new("UICorner", closeButton).CornerRadius = UDim.new(0, 10)

local contentContainer = Instance.new("Frame", mainFrame)
contentContainer.Name = "ContentContainer"
contentContainer.Size = UDim2.new(1, -8, 1, -64)
contentContainer.Position = UDim2.new(0, 4, 0, 34)
contentContainer.BackgroundTransparency = 1

local sidebar = Instance.new("Frame", contentContainer)
sidebar.Name = "Sidebar"
sidebar.Size = UDim2.new(0, 140, 1, 0)
sidebar.BackgroundColor3 = Color3.fromRGB(8, 10, 18)
Instance.new("UICorner", sidebar).CornerRadius = UDim.new(0, 8)
local sidebarStroke = Instance.new("UIStroke", sidebar)
sidebarStroke.Color = Color3.fromRGB(35, 40, 65)
sidebarStroke.Thickness = 1

local scrollFrame = Instance.new("ScrollingFrame", sidebar)
scrollFrame.Name = "TabsScrollFrame"
scrollFrame.Size = UDim2.new(1, -10, 1, -10)
scrollFrame.Position = UDim2.new(0, 5, 0, 5)
scrollFrame.BackgroundTransparency = 1
scrollFrame.ScrollBarThickness = 2
scrollFrame.ScrollBarImageColor3 = Color3.fromRGB(70, 80, 120)
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 200)

local tabContainer = Instance.new("Frame", scrollFrame)
tabContainer.Name = "TabContainer"
tabContainer.Size = UDim2.new(1, 0, 0, 200)
tabContainer.BackgroundTransparency = 1

local tabLayout = Instance.new("UIListLayout", tabContainer)
tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
tabLayout.Padding = UDim.new(0, 6)

local tabPadding = Instance.new("UIPadding", tabContainer)
tabPadding.PaddingTop = UDim.new(0, 3)
tabPadding.PaddingBottom = UDim.new(0, 3)
tabPadding.PaddingLeft = UDim.new(0, 3)
tabPadding.PaddingRight = UDim.new(0, 3)

local tabs = {}
local tabContents = {}

local function createTab(name, layoutOrder)
    local tab = Instance.new("Frame", tabContainer)
    tab.Name = name .. "Tab"
    tab.Size = UDim2.new(1, -6, 0, 32)
    tab.BackgroundColor3 = Color3.fromRGB(18, 22, 35)
    tab.LayoutOrder = layoutOrder
    
    Instance.new("UICorner", tab).CornerRadius = UDim.new(0, 6)
    local tabStroke = Instance.new("UIStroke", tab)
    tabStroke.Color = Color3.fromRGB(40, 45, 70)
    tabStroke.Thickness = 1
    
    local tabButton = Instance.new("TextButton", tab)
    tabButton.Name = "TabButton"
    tabButton.Size = UDim2.new(1, 0, 1, 0)
    tabButton.BackgroundTransparency = 1
    tabButton.Text = ""
    
    local nameLabel = Instance.new("TextLabel", tab)
    nameLabel.Name = "NameLabel"
    nameLabel.Size = UDim2.new(1, -16, 1, 0)
    nameLabel.Position = UDim2.new(0, 8, 0, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = name
    nameLabel.TextColor3 = Color3.fromRGB(130, 140, 190)
    nameLabel.TextSize = 11
    nameLabel.Font = Enum.Font.GothamSemibold
    nameLabel.TextXAlignment = Enum.TextXAlignment.Center
    nameLabel.TextYAlignment = Enum.TextYAlignment.Center
    
    tabs[name] = {
        frame = tab,
        button = tabButton,
        label = nameLabel,
        stroke = tabStroke
    }
    
    tabButton.MouseButton1Click:Connect(function()
        tabContents[name].Visible = true
    end)
    
    return tab
end

createTab("Main", 1)

local contentArea = Instance.new("ScrollingFrame", contentContainer)
contentArea.Name = "ContentArea"
contentArea.Size = UDim2.new(1, -146, 1, 0)
contentArea.Position = UDim2.new(0, 146, 0, 0)
contentArea.BackgroundTransparency = 1
contentArea.ScrollBarThickness = 6
contentArea.ScrollBarImageColor3 = Color3.fromRGB(70, 80, 120)
contentArea.AutomaticCanvasSize = Enum.AutomaticSize.Y

local contentInner = Instance.new("Frame", contentArea)
contentInner.Name = "ContentInner"
contentInner.Size = UDim2.new(1, 0, 0, 0)
contentInner.AutomaticSize = Enum.AutomaticSize.Y
contentInner.BackgroundTransparency = 1

Instance.new("UIListLayout", contentInner).SortOrder = Enum.SortOrder.LayoutOrder

local watermarkFrame = Instance.new("Frame", mainFrame)
watermarkFrame.Name = "WatermarkFrame"
watermarkFrame.Size = UDim2.new(1, 0, 0, 26)
watermarkFrame.Position = UDim2.new(0, 0, 1, -26)
watermarkFrame.BackgroundColor3 = Color3.fromRGB(5, 8, 15)
watermarkFrame.ZIndex = 10
Instance.new("UICorner", watermarkFrame).CornerRadius = UDim.new(0, 10)

local watermarkFix = Instance.new("Frame", watermarkFrame)
watermarkFix.Size = UDim2.new(1, 0, 0, 10)
watermarkFix.BackgroundColor3 = Color3.fromRGB(5, 8, 15)

local watermarkText = Instance.new("TextLabel", watermarkFrame)
watermarkText.Name = "WatermarkText"
watermarkText.Size = UDim2.new(1, 0, 1, 0)
watermarkText.BackgroundTransparency = 1
watermarkText.Text = "made by @pocarisv"
watermarkText.TextColor3 = Color3.fromRGB(70, 80, 120)
watermarkText.TextSize = 9
watermarkText.Font = Enum.Font.GothamSemibold
watermarkText.TextXAlignment = Enum.TextXAlignment.Center
watermarkText.ZIndex = 11

minimizeBtn.MouseEnter:Connect(function()
    TweenService:Create(minimizeBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(100, 140, 255)}):Play()
end)

minimizeBtn.MouseLeave:Connect(function()
    TweenService:Create(minimizeBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(80, 120, 255)}):Play()
end)

closeButton.MouseEnter:Connect(function()
    TweenService:Create(closeButton, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(200, 80, 120)}):Play()
end)

closeButton.MouseLeave:Connect(function()
    TweenService:Create(closeButton, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(180, 60, 100)}):Play()
end)

minimizeButton.MouseEnter:Connect(function()
    TweenService:Create(minimizeButton, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(20, 22, 35)}):Play()
end)

minimizeButton.MouseLeave:Connect(function()
    TweenService:Create(minimizeButton, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(15, 15, 25)}):Play()
end)

local isMinimizing, isRestoring, isClosing = false, false, false

minimizeBtn.MouseButton1Click:Connect(function()
    if isMinimizing or isRestoring or isClosing then return end
    isMinimizing = true
    
    local targetPos = UDim2.new(0, 75, 0, 30)
    local shrinkTween = TweenService:Create(mainFrame, TweenInfo.new(0.35), {Size = UDim2.new(0, 0, 0, 0), Position = targetPos})
    local fadeTween = TweenService:Create(mainFrame, TweenInfo.new(0.25), {BackgroundTransparency = 1})
    
    shrinkTween:Play()
    task.wait(0.1)
    fadeTween:Play()
    
    shrinkTween.Completed:Connect(function()
        mainFrame.Visible = false
        minimizeButton.Visible = true
        minimizeButton.Size = UDim2.new(0, 0, 0, 0)
        minimizeButton.Position = targetPos
        minimizeButton.BackgroundTransparency = 1
        
        local appearTween = TweenService:Create(minimizeButton, TweenInfo.new(0.3), {Size = UDim2.new(0, 120, 0, 30)})
        local fadeInTween = TweenService:Create(minimizeButton, TweenInfo.new(0.2), {BackgroundTransparency = 0})
        
        appearTween:Play()
        fadeInTween:Play()
        appearTween.Completed:Connect(function() isMinimizing = false end)
    end)
end)

minimizeButton.MouseButton1Click:Connect(function()
    if isMinimizing or isRestoring or isClosing then return end
    isRestoring = true
    
    local hideTween = TweenService:Create(minimizeButton, TweenInfo.new(0.25), {Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1})
    hideTween:Play()
    
    hideTween.Completed:Connect(function()
        minimizeButton.Visible = false
        mainFrame.Visible = true
        mainFrame.Size = UDim2.new(0, 0, 0, 0)
        mainFrame.Position = minimizeButton.Position
        mainFrame.BackgroundTransparency = 1
        
        local restoreTween = TweenService:Create(mainFrame, TweenInfo.new(0.4), {Size = UDim2.new(0, 380, 0, 240), Position = UDim2.new(0.5, -190, 0.5, -120)})
        local fadeInTween = TweenService:Create(mainFrame, TweenInfo.new(0.3), {BackgroundTransparency = 0})
        
        restoreTween:Play()
        task.wait(0.1)
        fadeInTween:Play()
        restoreTween.Completed:Connect(function() isRestoring = false end)
    end)
end)

closeButton.MouseButton1Click:Connect(function()
    if isMinimizing or isRestoring or isClosing then return end
    isClosing = true
    
    local closeTween = TweenService:Create(mainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0)})
    local fadeTween = TweenService:Create(mainFrame, TweenInfo.new(0.25), {BackgroundTransparency = 1})
    local shadowFadeTween = TweenService:Create(shadow, TweenInfo.new(0.2), {ImageTransparency = 1})
    
    closeTween:Play()
    fadeTween:Play()
    shadowFadeTween:Play()
    closeTween.Completed:Connect(function() screenGui:Destroy() end)
end)

local dragging = false
local dragStart = nil
local startPos = nil

local function startDrag(input)
    dragging = true
    dragStart = input.Position
    startPos = mainFrame.Position
end

local function updateDrag(input)
    if dragging then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        startDrag(input)
    end
end)

minimizeButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragStart = input.Position
        startPos = minimizeButton.Position
        dragging = true
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        if dragging and mainFrame.Visible then
            updateDrag(input)
        elseif dragging and minimizeButton.Visible then
            local delta = input.Position - dragStart
            minimizeButton.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

mainFrame.Size = UDim2.new(0, 0, 0, 0)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
TweenService:Create(mainFrame, TweenInfo.new(0.4), {Size = UDim2.new(0, 380, 0, 240), Position = UDim2.new(0.5, -190, 0.5, -120)}):Play()

local mainContent = Instance.new("Frame", contentInner)
mainContent.Name = "MainContent"
mainContent.Size = UDim2.new(1, 0, 0, 0)
mainContent.AutomaticSize = Enum.AutomaticSize.Y
mainContent.BackgroundTransparency = 1
mainContent.Visible = true

local welcomeLabel = Instance.new("TextLabel", mainContent)
welcomeLabel.Size = UDim2.new(1, -40, 0, 60)
welcomeLabel.Position = UDim2.new(0, 20, 0, 30)
welcomeLabel.BackgroundTransparency = 1
welcomeLabel.Text = "Welcome! Please press the button below to access our scripts."
welcomeLabel.TextColor3 = Color3.fromRGB(180, 185, 230)
welcomeLabel.TextSize = 12
welcomeLabel.Font = Enum.Font.GothamSemibold
welcomeLabel.TextWrapped = true
welcomeLabel.TextXAlignment = Enum.TextXAlignment.Center

local activateButton = Instance.new("TextButton", mainContent)
activateButton.Size = UDim2.new(0, 120, 0, 35)
activateButton.Position = UDim2.new(0.5, -60, 0, 100)
activateButton.BackgroundColor3 = Color3.fromRGB(80, 120, 255)
activateButton.Text = "Activate"
activateButton.TextColor3 = Color3.fromRGB(255, 255, 255)
activateButton.TextSize = 12
activateButton.Font = Enum.Font.GothamBold

Instance.new("UICorner", activateButton).CornerRadius = UDim.new(0, 6)
local buttonStroke = Instance.new("UIStroke", activateButton)
buttonStroke.Color = Color3.fromRGB(120, 160, 255)
buttonStroke.Thickness = 1

activateButton.MouseEnter:Connect(function()
    TweenService:Create(activateButton, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(100, 140, 255)}):Play()
end)

activateButton.MouseLeave:Connect(function()
    TweenService:Create(activateButton, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(80, 120, 255)}):Play()
end)

activateButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/pocarisv/growagarden/refs/heads/main/background/main.lua"))()
    if game:GetService("Players").LocalPlayer then
        queue_on_teleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/pocarisv/growagarden/refs/heads/main/background/loader.lua"))()')
    end
    welcomeLabel.Text = "Activated! Please select a script from the sidebar."
    activateButton.Visible = false
end)
