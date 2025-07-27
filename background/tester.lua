local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

print("Script starting...")
local function logError(err)
    print("ERROR: " .. err)
    warn(debug.traceback())
end

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
local tabButtons = {}
local tabContents = {}

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
    tabButtons[name] = tabButton
    return tab
end

createTab("Main", 1, true)
createTab("Egg Finder", 2, true)
createTab("Pet Mutation Finder", 3, true)
createTab("Pet Age Loader", 4, true)
createTab("Infinite Loader", 5, true)
createTab("Update Early Access", 6, true)
createTab("Coming Soon", 7, false)

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

local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Name = "ContentScroller"
scrollFrame.Size = UDim2.new(1, -10, 1, -10)
scrollFrame.Position = UDim2.new(0, 5, 0, 5)
scrollFrame.BackgroundTransparency = 1
scrollFrame.BorderSizePixel = 0
scrollFrame.ScrollBarThickness = 4
scrollFrame.ScrollBarImageColor3 = Color3.fromRGB(70, 80, 120)
scrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
scrollFrame.Parent = contentArea

local contentHolder = Instance.new("Frame")
contentHolder.Name = "ContentHolder"
contentHolder.Size = UDim2.new(1, 0, 0, 0)
contentHolder.AutomaticSize = Enum.AutomaticSize.Y
contentHolder.BackgroundTransparency = 1
contentHolder.Parent = scrollFrame

local function createMainContent()
    local mainContent = Instance.new("Frame")
    mainContent.Name = "MainContent"
    mainContent.Size = UDim2.new(1, 0, 0, 0)
    mainContent.AutomaticSize = Enum.AutomaticSize.Y
    mainContent.BackgroundTransparency = 1
    mainContent.Visible = true
    mainContent.Parent = contentHolder
    
    local welcomeLabel = Instance.new("TextLabel")
    welcomeLabel.Name = "WelcomeLabel"
    welcomeLabel.Size = UDim2.new(1, 0, 0, 0)
    welcomeLabel.AutomaticSize = Enum.AutomaticSize.Y
    welcomeLabel.BackgroundTransparency = 1
    welcomeLabel.Text = "Welcome to PocariVulns!!\n\nThis is compilation of the Vulnerabilities active in Grow A Garden, this is purely for educational purposes only and not intended for harm and misuse.\n\nYour executor is now initialized and verified, you may now access the vulns at the side bar. Thank you!"
    welcomeLabel.TextColor3 = Color3.fromRGB(180, 185, 230)
    welcomeLabel.TextSize = 12
    welcomeLabel.Font = Enum.Font.Gotham
    welcomeLabel.TextWrapped = true
    welcomeLabel.TextXAlignment = Enum.TextXAlignment.Left
    welcomeLabel.TextYAlignment = Enum.TextYAlignment.Top
    welcomeLabel.Parent = mainContent
    
    return mainContent
end

local function createEggFinderContent()
    local content = Instance.new("Frame")
    content.Name = "EggFinderContent"
    content.Size = UDim2.new(1, 0, 0, 0)
    content.AutomaticSize = Enum.AutomaticSize.Y
    content.BackgroundTransparency = 1
    content.Visible = false
    content.Parent = contentHolder
    
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(1, 0, 0, 30)
    title.Position = UDim2.new(0, 0, 0, 10)
    title.BackgroundTransparency = 1
    title.Text = "🐾 Egg Finder ✨"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 16
    title.TextColor3 = Color3.fromRGB(180, 185, 230)
    title.TextXAlignment = Enum.TextXAlignment.Center
    title.Parent = content
    
    local randomizeBtn = Instance.new("TextButton")
    randomizeBtn.Name = "RandomizeButton"
    randomizeBtn.Size = UDim2.new(0.9, 0, 0, 35)
    randomizeBtn.Position = UDim2.new(0.05, 0, 0, 50)
    randomizeBtn.BackgroundColor3 = Color3.fromRGB(80, 120, 255)
    randomizeBtn.Text = "🎲 Randomize Pets"
    randomizeBtn.TextSize = 14
    randomizeBtn.Font = Enum.Font.GothamBold
    randomizeBtn.TextColor3 = Color3.new(1, 1, 1)
    randomizeBtn.Parent = content
    
    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Name = "ToggleButton"
    toggleBtn.Size = UDim2.new(0.9, 0, 0, 35)
    toggleBtn.Position = UDim2.new(0.05, 0, 0, 95)
    toggleBtn.BackgroundColor3 = Color3.fromRGB(40, 45, 70)
    toggleBtn.Text = "👁️ ESP: OFF"
    toggleBtn.TextSize = 14
    toggleBtn.Font = Enum.Font.GothamBold
    toggleBtn.TextColor3 = Color3.new(1, 1, 1)
    toggleBtn.Parent = content
    
    local autoBtn = Instance.new("TextButton")
    autoBtn.Name = "AutoButton"
    autoBtn.Size = UDim2.new(0.9, 0, 0, 35)
    autoBtn.Position = UDim2.new(0.05, 0, 0, 140)
    autoBtn.BackgroundColor3 = Color3.fromRGB(40, 45, 70)
    autoBtn.Text = "🔁 Auto Randomize: OFF"
    autoBtn.TextSize = 14
    autoBtn.Font = Enum.Font.GothamBold
    autoBtn.TextColor3 = Color3.new(1, 1, 1)
    autoBtn.Parent = content
    
    for _, btn in ipairs({randomizeBtn, toggleBtn, autoBtn}) do
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 6)
        corner.Parent = btn
        
        local stroke = Instance.new("UIStroke")
        stroke.Color = Color3.fromRGB(70, 80, 120)
        stroke.Thickness = 1
        stroke.Parent = btn
    end
    
    return content
end

local function createMutationFinderContent()
    local content = Instance.new("Frame")
    content.Name = "MutationFinderContent"
    content.Size = UDim2.new(1, 0, 0, 0)
    content.AutomaticSize = Enum.AutomaticSize.Y
    content.BackgroundTransparency = 1
    content.Visible = false
    content.Parent = contentHolder
    
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(1, 0, 0, 30)
    title.Position = UDim2.new(0, 0, 0, 10)
    title.BackgroundTransparency = 1
    title.Text = "🔍 Pet Mutation Finder 🧬"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 16
    title.TextColor3 = Color3.fromRGB(180, 185, 230)
    title.TextXAlignment = Enum.TextXAlignment.Center
    title.Parent = content
    
    local rerollBtn = Instance.new("TextButton")
    rerollBtn.Name = "RerollButton"
    rerollBtn.Size = UDim2.new(0.9, 0, 0, 35)
    rerollBtn.Position = UDim2.new(0.05, 0, 0, 50)
    rerollBtn.BackgroundColor3 = Color3.fromRGB(80, 120, 255)
    rerollBtn.Text = "🔃 Reroll Mutation"
    rerollBtn.TextSize = 14
    rerollBtn.Font = Enum.Font.GothamBold
    rerollBtn.TextColor3 = Color3.new(1, 1, 1)
    rerollBtn.Parent = content
    
    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Name = "ToggleButton"
    toggleBtn.Size = UDim2.new(0.9, 0, 0, 35)
    toggleBtn.Position = UDim2.new(0.05, 0, 0, 95)
    toggleBtn.BackgroundColor3 = Color3.fromRGB(40, 45, 70)
    toggleBtn.Text = "🔍 ESP: OFF"
    toggleBtn.TextSize = 14
    toggleBtn.Font = Enum.Font.GothamBold
    toggleBtn.TextColor3 = Color3.new(1, 1, 1)
    toggleBtn.Parent = content
    
    for _, btn in ipairs({rerollBtn, toggleBtn}) do
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 6)
        corner.Parent = btn
        
        local stroke = Instance.new("UIStroke")
        stroke.Color = Color3.fromRGB(70, 80, 120)
        stroke.Thickness = 1
        stroke.Parent = btn
    end
    
    return content
end

local function createAgeLoaderContent()
    local content = Instance.new("Frame")
    content.Name = "AgeLoaderContent"
    content.Size = UDim2.new(1, 0, 0, 0)
    content.AutomaticSize = Enum.AutomaticSize.Y
    content.BackgroundTransparency = 1
    content.Visible = false
    content.Parent = contentHolder
    
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(1, 0, 0, 30)
    title.Position = UDim2.new(0, 0, 0, 10)
    title.BackgroundTransparency = 1
    title.Text = "🧬 Pet Age Loader"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 16
    title.TextColor3 = Color3.fromRGB(180, 185, 230)
    title.TextXAlignment = Enum.TextXAlignment.Center
    title.Parent = content
    
    local customAgeBtn = Instance.new("TextButton")
    customAgeBtn.Name = "CustomAgeButton"
    customAgeBtn.Size = UDim2.new(0.9, 0, 0, 30)
    customAgeBtn.Position = UDim2.new(0.05, 0, 0, 50)
    customAgeBtn.BackgroundColor3 = Color3.fromRGB(80, 120, 255)
    customAgeBtn.Text = "⚙️ Custom Age: OFF"
    customAgeBtn.TextSize = 14
    customAgeBtn.Font = Enum.Font.GothamBold
    customAgeBtn.TextColor3 = Color3.new(1, 1, 1)
    customAgeBtn.Parent = content
    
    local ageInput = Instance.new("TextBox")
    ageInput.Name = "AgeInput"
    ageInput.Size = UDim2.new(0.9, 0, 0, 30)
    ageInput.Position = UDim2.new(0.05, 0, 0, 85)
    ageInput.BackgroundColor3 = Color3.fromRGB(30, 35, 50)
    ageInput.Text = "50"
    ageInput.TextColor3 = Color3.new(1, 1, 1)
    ageInput.TextSize = 14
    ageInput.Font = Enum.Font.Gotham
    ageInput.Visible = false
    ageInput.Parent = content
    
    local ageInputStroke = Instance.new("UIStroke")
    ageInputStroke.Color = Color3.fromRGB(70, 80, 120)
    ageInputStroke.Thickness = 1
    ageInputStroke.Parent = ageInput
    
    local ageInputCorner = Instance.new("UICorner")
    ageInputCorner.CornerRadius = UDim.new(0, 6)
    ageInputCorner.Parent = ageInput
    
    local petInfo = Instance.new("TextLabel")
    petInfo.Name = "PetInfo"
    petInfo.Size = UDim2.new(0.9, 0, 0, 25)
    petInfo.Position = UDim2.new(0.05, 0, 0, 120)
    petInfo.BackgroundTransparency = 1
    petInfo.Text = "Equipped Pet: [None]"
    petInfo.TextColor3 = Color3.fromRGB(150, 200, 150)
    petInfo.TextSize = 12
    petInfo.Font = Enum.Font.Gotham
    petInfo.TextXAlignment = Enum.TextXAlignment.Left
    petInfo.Parent = content
    
    local setAgeBtn = Instance.new("TextButton")
    setAgeBtn.Name = "SetAgeButton"
    setAgeBtn.Size = UDim2.new(0.9, 0, 0, 35)
    setAgeBtn.Position = UDim2.new(0.05, 0, 0, 150)
    setAgeBtn.BackgroundColor3 = Color3.fromRGB(70, 130, 200)
    setAgeBtn.Text = "🚀 Set Pet Age"
    setAgeBtn.TextSize = 14
    setAgeBtn.Font = Enum.Font.GothamBold
    setAgeBtn.TextColor3 = Color3.new(1, 1, 1)
    setAgeBtn.Parent = content
    
    for _, btn in ipairs({customAgeBtn, setAgeBtn}) do
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 6)
        corner.Parent = btn
        
        local stroke = Instance.new("UIStroke")
        stroke.Color = Color3.fromRGB(70, 80, 120)
        stroke.Thickness = 1
        stroke.Parent = btn
    end
    
    return content
end

local function createInfiniteLoaderContent()
    local content = Instance.new("Frame")
    content.Name = "InfiniteLoaderContent"
    content.Size = UDim2.new(1, 0, 0, 0)
    content.AutomaticSize = Enum.AutomaticSize.Y
    content.BackgroundTransparency = 1
    content.Visible = false
    content.Parent = contentHolder
    
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(1, -10, 0, 40)
    title.Position = UDim2.new(0, 5, 0, 10)
    title.BackgroundTransparency = 1
    title.Text = "∞ Infinite Loader"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 14
    title.TextColor3 = Color3.fromRGB(180, 185, 230)
    title.TextXAlignment = Enum.TextXAlignment.Center
    title.TextWrapped = true
    title.Parent = content
    
    local statusLabel = Instance.new("TextLabel")
    statusLabel.Name = "StatusLabel"
    statusLabel.Size = UDim2.new(0.9, 0, 0, 40)
    statusLabel.Position = UDim2.new(0.05, 0, 0, 60)
    statusLabel.BackgroundTransparency = 1
    statusLabel.Text = "Ready to activate"
    statusLabel.Font = Enum.Font.Gotham
    statusLabel.TextSize = 14
    statusLabel.TextColor3 = Color3.fromRGB(180, 200, 230)
    statusLabel.TextXAlignment = Enum.TextXAlignment.Left
    statusLabel.TextWrapped = true
    statusLabel.Parent = content
    
    local progressBg = Instance.new("Frame")
    progressBg.Name = "ProgressBG"
    progressBg.Size = UDim2.new(0.9, 0, 0, 20)
    progressBg.Position = UDim2.new(0.05, 0, 0, 110)
    progressBg.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    progressBg.BorderSizePixel = 0
    progressBg.Parent = content
    
    local progressCorner = Instance.new("UICorner")
    progressCorner.CornerRadius = UDim.new(0, 10)
    progressCorner.Parent = progressBg
    
    local progressFill = Instance.new("Frame")
    progressFill.Name = "ProgressFill"
    progressFill.Size = UDim2.new(0, 0, 1, 0)
    progressFill.BackgroundColor3 = Color3.fromRGB(80, 180, 255)
    progressFill.BorderSizePixel = 0
    progressFill.Parent = progressBg
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(0, 10)
    fillCorner.Parent = progressFill
    
    local progressText = Instance.new("TextLabel")
    progressText.Name = "ProgressText"
    progressText.Size = UDim2.new(1, 0, 1, 0)
    progressText.BackgroundTransparency = 1
    progressText.Text = "0%"
    progressText.Font = Enum.Font.GothamBold
    progressText.TextSize = 12
    progressText.TextColor3 = Color3.fromRGB(255, 255, 255)
    progressText.Parent = progressBg
    
    local infiniteBtn = Instance.new("TextButton")
    infiniteBtn.Name = "InfiniteButton"
    infiniteBtn.Size = UDim2.new(0.9, 0, 0, 40)
    infiniteBtn.Position = UDim2.new(0.05, 0, 0, 140)
    infiniteBtn.BackgroundColor3 = Color3.fromRGB(80, 120, 255)
    infiniteBtn.Text = "🔃 ACTIVATE LOADER"
    infiniteBtn.Font = Enum.Font.GothamBold
    infiniteBtn.TextSize = 16
    infiniteBtn.TextColor3 = Color3.new(1, 1, 1)
    infiniteBtn.Parent = content
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = infiniteBtn
    
    local btnStroke = Instance.new("UIStroke")
    btnStroke.Color = Color3.fromRGB(70, 80, 120)
    btnStroke.Thickness = 1
    btnStroke.Parent = infiniteBtn
    
    local infiniteModeActive = false
    local lastTool = nil
    local loadCoroutine = nil
    local TARGET_QUANTITY = 9999
    local currentQuantities = {}
    
    local function getEquippedTool()
        local character = player.Character
        if not character then return nil end
        
        for _, tool in ipairs(character:GetChildren()) do
            if tool:IsA("Tool") then
                return tool
            end
        end
        
        return nil
    end
    
    local function extractQuantityInfo(toolName)
        local seedPackMatch = {toolName:match("^(.-)(%[X)(%d+)(%])$")}
        local eggMatch = {toolName:match("^(.-)( x)(%d+)$")}
        local kitsuneMatch = {toolName:match("^(.-)(%[)(%d+)(%])$")}
        
        if #seedPackMatch == 4 then
            local prefix, openTag, quantity, closeTag = unpack(seedPackMatch)
            return {
                type = "seed",
                prefix = prefix,
                openTag = openTag,
                quantity = tonumber(quantity),
                closeTag = closeTag
            }
        elseif #eggMatch == 3 then
            local prefix, xSeparator, quantity = unpack(eggMatch)
            return {
                type = "egg",
                prefix = prefix,
                xSeparator = xSeparator,
                quantity = tonumber(quantity)
            }
        elseif #kitsuneMatch == 4 then
            local prefix, openTag, quantity, closeTag = unpack(kitsuneMatch)
            return {
                type = "kitsune",
                prefix = prefix,
                openTag = openTag,
                quantity = tonumber(quantity),
                closeTag = closeTag
            }
        end
        return nil
    end
    
    local function createVisualName(quantityInfo, quantity)
        if quantityInfo.type == "seed" then
            return quantityInfo.prefix .. quantityInfo.openTag .. quantity .. quantityInfo.closeTag
        elseif quantityInfo.type == "egg" then
            return quantityInfo.prefix .. quantityInfo.xSeparator .. quantity
        elseif quantityInfo.type == "kitsune" then
            return quantityInfo.prefix .. quantityInfo.openTag .. quantity .. quantityInfo.closeTag
        else
            return quantityInfo.prefix .. tostring(quantity)
        end
    end
    
    local function applyVisualQuantity(tool, quantity)
        if not tool or not tool.Parent then return end
        
        local qtyInfo = extractQuantityInfo(tool.Name)
        if not qtyInfo then return end
        
        currentQuantities[tool] = quantity
        tool.Name = createVisualName(qtyInfo, quantity)
    end
    
    local function updateProgress(percent)
        local targetWidth = progressBg.AbsoluteSize.X * (percent / 100)
        local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tween = TweenService:Create(progressFill, tweenInfo, {Size = UDim2.new(0, targetWidth, 1, 0)})
        tween:Play()
        progressText.Text = math.floor(percent) .. "%"
    end
    
    local function startInfiniteLoad()
        local tool = getEquippedTool()
        if not tool or not extractQuantityInfo(tool.Name) then
            statusLabel.Text = "❌ No valid seed pack/chest/egg equipped!"
            infiniteBtn.Text = "🔃 ACTIVATE LOADER"
            infiniteBtn.BackgroundColor3 = Color3.fromRGB(80, 120, 255)
            infiniteModeActive = false
            return
        end
        
        lastTool = tool
        statusLabel.Text = "🔄 Initializing loader..."
        
        for i = 5, 1, -1 do
            if not infiniteModeActive then return end
            statusLabel.Text = "⏳ Starting in " .. i .. "s..."
            updateProgress((5 - i) * 20)
            wait(1)
        end
        
        local qtyInfo = extractQuantityInfo(tool.Name)
        local startQty = qtyInfo.quantity
        statusLabel.Text = "🚀 Increasing quantity..."
        
        local currentQty = startQty
        while infiniteModeActive and currentQty < TARGET_QUANTITY do
            if not tool or not tool.Parent then
                statusLabel.Text = "❌ Tool no longer available!"
                break
            end
            
            currentQty = currentQty + 1
            applyVisualQuantity(tool, currentQty)
            
            local progress = math.min(100, ((currentQty - startQty) / (TARGET_QUANTITY - startQty)) * 100)
            updateProgress(progress)
            
            wait(0.5)
        end
        
        if infiniteModeActive then
            statusLabel.Text = "✅ Loader complete!"
        end
        
        wait(2)
        if infiniteModeActive then
            statusLabel.Text = "Loader active"
            updateProgress(100)
        else
            updateProgress(0)
        end
    end
    
    infiniteBtn.MouseButton1Click:Connect(function()
        infiniteModeActive = not infiniteModeActive
        
        if infiniteModeActive then
            infiniteBtn.Text = "⏹ STOP LOADER"
            infiniteBtn.BackgroundColor3 = Color3.fromRGB(200, 80, 100)
            statusLabel.Text = "🔄 Starting process..."
            
            if loadCoroutine then
                coroutine.close(loadCoroutine)
            end
            loadCoroutine = coroutine.create(startInfiniteLoad)
            coroutine.resume(loadCoroutine)
        else
            infiniteBtn.Text = "🔃 ACTIVATE LOADER"
            infiniteBtn.BackgroundColor3 = Color3.fromRGB(80, 120, 255)
            statusLabel.Text = "🛑 Process stopped"
            updateProgress(0)
            
            wait(1.5)
            statusLabel.Text = "Ready to activate"
        end
    end)
    
    local function trackQuantityChanges()
        while true do
            wait(1)
            for tool, storedQty in pairs(currentQuantities) do
                if tool and tool.Parent then
                    local qtyInfo = extractQuantityInfo(tool.Name)
                    if qtyInfo and qtyInfo.quantity ~= storedQty then
                        applyVisualQuantity(tool, qtyInfo.quantity)
                        currentQuantities[tool] = qtyInfo.quantity
                    end
                end
            end
        end
    end
    
    coroutine.wrap(trackQuantityChanges)()
    
    return content
end

local function createEarlyAccessContent()
    local content = Instance.new("Frame")
    content.Name = "EarlyAccessContent"
    content.Size = UDim2.new(1, 0, 0, 0)
    content.AutomaticSize = Enum.AutomaticSize.Y
    content.BackgroundTransparency = 1
    content.Visible = false
    content.Parent = contentHolder
    
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(1, 0, 0, 30)
    title.Position = UDim2.new(0, 0, 0, 10)
    title.BackgroundTransparency = 1
    title.Text = "🚀 Update Early Access"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 16
    title.TextColor3 = Color3.fromRGB(180, 185, 230)
    title.TextXAlignment = Enum.TextXAlignment.Center
    title.Parent = content
    
    local infoLabel = Instance.new("TextLabel")
    infoLabel.Name = "InfoLabel"
    infoLabel.Size = UDim2.new(0.9, 0, 0, 60)
    infoLabel.Position = UDim2.new(0.05, 0, 0, 50)
    infoLabel.BackgroundTransparency = 1
    infoLabel.Text = "Get early access to upcoming features and updates before anyone else!"
    infoLabel.TextColor3 = Color3.fromRGB(150, 170, 200)
    infoLabel.TextSize = 12
    infoLabel.Font = Enum.Font.Gotham
    infoLabel.TextWrapped = true
    infoLabel.TextXAlignment = Enum.TextXAlignment.Center
    infoLabel.Parent = content
    
    local accessBtn = Instance.new("TextButton")
    accessBtn.Name = "AccessButton"
    accessBtn.Size = UDim2.new(0.9, 0, 0, 35)
    accessBtn.Position = UDim2.new(0.05, 0, 0, 120)
    accessBtn.BackgroundColor3 = Color3.fromRGB(80, 120, 255)
    accessBtn.Text = "🔓 Get Early Access"
    accessBtn.TextSize = 14
    accessBtn.Font = Enum.Font.GothamBold
    accessBtn.TextColor3 = Color3.new(1, 1, 1)
    accessBtn.Parent = content
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = accessBtn
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(70, 80, 120)
    stroke.Thickness = 1
    stroke.Parent = accessBtn
    
    accessBtn.MouseButton1Click:Connect(function()
            game:GetService("ReplicatedStorage").Modules.UpdateService["Corrupted Zen"].Parent = workspace
    end)
    
    return content
end

local function createComingSoonContent()
    local content = Instance.new("Frame")
    content.Name = "ComingSoonContent"
    content.Size = UDim2.new(1, 0, 0, 0)
    content.AutomaticSize = Enum.AutomaticSize.Y
    content.BackgroundTransparency = 1
    content.Visible = false
    content.Parent = contentHolder
    
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(1, 0, 0, 30)
    title.Position = UDim2.new(0, 0, 0, 10)
    title.BackgroundTransparency = 1
    title.Text = "🔜 Coming Soon"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 16
    title.TextColor3 = Color3.fromRGB(180, 185, 230)
    title.TextXAlignment = Enum.TextXAlignment.Center
    title.Parent = content
    
    local infoLabel = Instance.new("TextLabel")
    infoLabel.Name = "InfoLabel"
    infoLabel.Size = UDim2.new(0.9, 0, 0, 60)
    infoLabel.Position = UDim2.new(0.05, 0, 0, 50)
    infoLabel.BackgroundTransparency = 1
    infoLabel.Text = "New features are being developed. Stay tuned for updates!"
    infoLabel.TextColor3 = Color3.fromRGB(150, 170, 200)
    infoLabel.TextSize = 12
    infoLabel.Font = Enum.Font.Gotham
    infoLabel.TextWrapped = true
    infoLabel.TextXAlignment = Enum.TextXAlignment.Center
    infoLabel.Parent = content
    
    return content
end

tabContents["Main"] = createMainContent()
tabContents["Egg Finder"] = createEggFinderContent()
tabContents["Pet Mutation Finder"] = createMutationFinderContent()
tabContents["Pet Age Loader"] = createAgeLoaderContent()
tabContents["Infinite Loader"] = createInfiniteLoaderContent()
tabContents["Update Early Access"] = createEarlyAccessContent()
tabContents["Coming Soon"] = createComingSoonContent()

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

for name, button in pairs(tabButtons) do
    if name ~= "Coming Soon" then
        button.MouseButton1Click:Connect(function()
            for tabName, content in pairs(tabContents) do
                content.Visible = (tabName == name)
            end
        end)
    end
end

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
    ["Zen Egg"] = { "Shiba Inu", "Nihonzaru", "Tanuki" },
}
local espEnabled = false
local truePetMap = {}
local autoRunning = false
local bestPets = {
    ["Raccoon"] = true, ["Dragonfly"] = true, ["Queen Bee"] = true,
    ["Disco Bee"] = true, ["Fennec Fox"] = true, ["Fox"] = true,
    ["Mimic Octopus"] = true
}

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
    
    local root = char:FindFirstChild("HumanoidRootPart")
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

local eggContent = tabContents["Egg Finder"]
if eggContent then
    local randomizeBtn = eggContent:FindFirstChild("RandomizeButton")
    local toggleBtn = eggContent:FindFirstChild("ToggleButton")
    local autoBtn = eggContent:FindFirstChild("AutoButton")
    
    if randomizeBtn then
        randomizeBtn.MouseButton1Click:Connect(function()
            countdownAndRandomize(randomizeBtn)
        end)
    end
    
    if toggleBtn then
        toggleBtn.MouseButton1Click:Connect(function()
            espEnabled = not espEnabled
            toggleBtn.Text = espEnabled and "👁️ ESP: ON" or "👁️ ESP: OFF"
            toggleBtn.BackgroundColor3 = espEnabled and Color3.fromRGB(80, 150, 60) or Color3.fromRGB(40, 45, 70)
            for _, egg in pairs(getPlayerGardenEggs(60)) do
                if espEnabled then
                    applyEggESP(egg, truePetMap[egg])
                else
                    removeEggESP(egg)
                end
            end
        end)
    end
    
    if autoBtn then
        autoBtn.MouseButton1Click:Connect(function()
            autoRunning = not autoRunning
            autoBtn.Text = autoRunning and "🔁 Auto Randomize: ON" or "🔁 Auto Randomize: OFF"
            autoBtn.BackgroundColor3 = autoRunning and Color3.fromRGB(80, 150, 60) or Color3.fromRGB(40, 45, 70)
            coroutine.wrap(function()
                while autoRunning do
                    countdownAndRandomize(randomizeBtn)
                    for _, petName in pairs(truePetMap) do
                        if bestPets[petName] then
                            autoRunning = false
                            autoBtn.Text = "🔁 Auto Randomize: OFF"
                            autoBtn.BackgroundColor3 = Color3.fromRGB(40, 45, 70)
                            return
                        end
                    end
                    wait(1)
                end
            end)()
        end)
    end
end

local function initESP()
    local char = player.Character
    if not char then
        player.CharacterAdded:Wait()
        char = player.Character
    end
    
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then
        char.ChildAdded:Wait()
        root = char:WaitForChild("HumanoidRootPart", 5)
    end
    
    if not root then
        warn("HumanoidRootPart not found after waiting!")
        return
    end
    
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

local mutations = {
    "Shiny", "Inverted", "Frozen", "Windy", "Golden", "Mega", "Tiny",
    "Tranquil", "IronSkin", "Radiant", "Rainbow", "Shocked", "Ascended"
}
local currentMutation = mutations[math.random(#mutations)]
local espVisible = false
local espGui, espLabel
local hue = 0

local function findMachine()
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Model") and obj.Name:lower():find("mutation") then
            return obj
        end
    end
    return nil
end

local function setupESP()
    local machine = findMachine()
    if not machine then
        warn("Pet Mutation Machine not found.")
        return
    end
    
    local basePart = machine:FindFirstChildWhichIsA("BasePart")
    if not basePart then return end
    
    if espGui then espGui:Destroy() end
    
    espGui = Instance.new("BillboardGui")
    espGui.Name = "MutationESP"
    espGui.Adornee = basePart
    espGui.Size = UDim2.new(0, 200, 0, 40)
    espGui.StudsOffset = Vector3.new(0, 3, 0)
    espGui.AlwaysOnTop = true
    espGui.Enabled = espVisible
    espGui.Parent = basePart
    
    espLabel = Instance.new("TextLabel")
    espLabel.Size = UDim2.new(1, 0, 1, 0)
    espLabel.BackgroundTransparency = 1
    espLabel.Font = Enum.Font.GothamBold
    espLabel.TextSize = 24
    espLabel.TextStrokeTransparency = 0.3
    espLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    espLabel.Text = currentMutation
    espLabel.Parent = espGui
    
    RunService.RenderStepped:Connect(function()
        if espVisible then
            hue = (hue + 0.01) % 1
            espLabel.TextColor3 = Color3.fromHSV(hue, 1, 1)
        end
    end)
end

local function animateMutationReroll()
    local mutationContent = tabContents["Pet Mutation Finder"]
    if mutationContent then
        local rerollBtn = mutationContent:FindFirstChild("RerollButton")
        if rerollBtn then
            rerollBtn.Text = "⏳ Rerolling..."
            rerollBtn.Active = false
            
            local duration = 2
            local interval = 0.1
            for i = 1, math.floor(duration / interval) do
                if espLabel then
                    espLabel.Text = mutations[math.random(#mutations)]
                end
                wait(interval)
            end
            
            currentMutation = mutations[math.random(#mutations)]
            if espLabel then
                espLabel.Text = currentMutation
            end
            
            rerollBtn.Text = "🔃 Reroll Mutation"
            rerollBtn.Active = true
        end
    end
end

local mutationContent = tabContents["Pet Mutation Finder"]
if mutationContent then
    local rerollBtn = mutationContent:FindFirstChild("RerollButton")
    local toggleBtn = mutationContent:FindFirstChild("ToggleButton")
    
    if toggleBtn then
        toggleBtn.MouseButton1Click:Connect(function()
            espVisible = not espVisible
            toggleBtn.Text = espVisible and "🔍 ESP: ON" or "🔍 ESP: OFF"
            toggleBtn.BackgroundColor3 = espVisible and Color3.fromRGB(80, 150, 60) or Color3.fromRGB(40, 45, 70)
            
            if espVisible and not espGui then
                setupESP()
            elseif espGui then
                espGui.Enabled = espVisible
            end
        end)
    end
    
    if rerollBtn then
        rerollBtn.MouseButton1Click:Connect(function()
            if espVisible then
                animateMutationReroll()
            else
                currentMutation = mutations[math.random(#mutations)]
            end
        end)
    end
end

spawn(setupESP)

local ageContent = tabContents["Pet Age Loader"]
if ageContent then
    local customAgeBtn = ageContent:FindFirstChild("CustomAgeButton")
    local ageInput = ageContent:FindFirstChild("AgeInput")
    local petInfo = ageContent:FindFirstChild("PetInfo")
    local setAgeBtn = ageContent:FindFirstChild("SetAgeButton")
    
    local customAgeEnabled = false
    local targetAge = 50
    
    if customAgeBtn then
        customAgeBtn.MouseButton1Click:Connect(function()
            customAgeEnabled = not customAgeEnabled
            customAgeBtn.Text = customAgeEnabled and "⚙️ Custom Age: ON" or "⚙️ Custom Age: OFF"
            if ageInput then
                ageInput.Visible = customAgeEnabled
            end
        end)
    end
    
    if ageInput then
        ageInput.FocusLost:Connect(function()
            local num = tonumber(ageInput.Text)
            if num and num >= 1 and num <= 100 then
                targetAge = math.floor(num)
                ageInput.Text = tostring(targetAge)
            else
                ageInput.Text = "50"
                targetAge = 50
            end
        end)
    end
    
    local function getEquippedPetTool()
        local character = player.Character or player.CharacterAdded:Wait()
        for _, child in pairs(character:GetChildren()) do
            if child:IsA("Tool") and child.Name:find("Age") then
                return child
            end
        end
        return nil
    end
    
    local function updateGUI()
        local pet = getEquippedPetTool()
        if pet then
            petInfo.Text = "Equipped Pet: " .. pet.Name
        else
            petInfo.Text = "Equipped Pet: [None]"
        end
    end
    
    if setAgeBtn then
        setAgeBtn.MouseButton1Click:Connect(function()
            local tool = getEquippedPetTool()
            if tool then
                local originalPetName = tool.Name
                
                for i = 5, 1, -1 do
                    setAgeBtn.Text = "⏳ Changing Age in " .. i .. "..."
                    wait(1)
                end
                
                local newName = tool.Name:gsub("%[Age%s%d+%]", "[Age "..targetAge.."]")
                tool.Name = newName
                petInfo.Text = "Equipped Pet: " .. tool.Name
                setAgeBtn.Text = "🚀 Set Pet Age"
            else
                setAgeBtn.Text = "❌ No Pet Equipped!"
                wait(2)
                setAgeBtn.Text = "🚀 Set Pet Age"
            end
        end)
    end
    
    coroutine.wrap(function()
        while true do
            task.wait(1)
            pcall(updateGUI)
        end
    end)()
end

coroutine.wrap(function()
    wait(3)
    pcall(initESP)
end)()
