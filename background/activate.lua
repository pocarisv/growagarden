return function(contentFrame, player, Activate)
    local TweenService = game:GetService("TweenService")
    
    local welcomeLabel = Instance.new("TextLabel")
    welcomeLabel.Name = "WelcomeLabel"
    welcomeLabel.Size = UDim2.new(1, -40, 0, 60)
    welcomeLabel.Position = UDim2.new(0, 20, 0, 30)
    welcomeLabel.BackgroundTransparency = 1
    welcomeLabel.Text = "Welcome! Press activate to access scripts."
    welcomeLabel.TextColor3 = Color3.fromRGB(180, 185, 230)
    welcomeLabel.TextSize = 12
    welcomeLabel.Font = Enum.Font.GothamSemibold
    welcomeLabel.TextWrapped = true
    welcomeLabel.TextXAlignment = Enum.TextXAlignment.Center
    welcomeLabel.Parent = contentFrame
    
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
    activateButton.Parent = contentFrame
    
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
        welcomeLabel.Text = "Activated! Select a script from the sidebar."
        activateButton.Visible = false
    end)
end
