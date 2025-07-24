return function(contentFrame, player, Activate)
    local Workspace = game:GetService("Workspace")
    local RunService = game:GetService("RunService")
    local TweenService = game:GetService("TweenService")
    
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
        ["Raccoon"] = true, 
        ["Dragonfly"] = true, 
        ["Queen Bee"] = true,
        ["Disco Bee"] = true, 
        ["Fennec Fox"] = true, 
        ["Fox"] = true,
        ["Mimic Octopus"] = true
    }
    
    local function glitchLabelEffect(label)
        task.spawn(function()
            local original = label.TextColor3
            for i = 1, 2 do
                label.TextColor3 = Color3.new(1, 0, 0)
                task.wait(0.07)
                label.TextColor3 = original
                task.wait(0.07)
            end
        end)
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
        if not root then return eggs end
    
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
    end
    
    local function flashEffect(button)
        local originalColor = button.BackgroundColor3
        for i = 1, 3 do
            button.BackgroundColor3 = Color3.new(1, 1, 1)
            task.wait(0.05)
            button.BackgroundColor3 = originalColor
            task.wait(0.05)
        end
    end
    
    local function countdownAndRandomize(button)
        for i = 10, 1, -1 do
            button.Text = "🎲 Randomize in: " .. i
            task.wait(1)
        end
        flashEffect(button)
        randomizeNearbyEggs()
        button.Text = "🎲 Randomize Pets"
    end
    
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
    title.Parent = contentFrame
    
    local randomizeBtn = Instance.new("TextButton")
    randomizeBtn.Name = "RandomizeButton"
    randomizeBtn.Size = UDim2.new(0.9, 0, 0, 35)
    randomizeBtn.Position = UDim2.new(0.05, 0, 0, 50)
    randomizeBtn.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
    randomizeBtn.Text = "🎲 Randomize Pets"
    randomizeBtn.TextSize = 14
    randomizeBtn.Font = Enum.Font.GothamBold
    randomizeBtn.TextColor3 = Color3.new(1, 1, 1)
    randomizeBtn.Parent = contentFrame
    
    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Name = "ToggleButton"
    toggleBtn.Size = UDim2.new(0.9, 0, 0, 35)
    toggleBtn.Position = UDim2.new(0.05, 0, 0, 95)
    toggleBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    toggleBtn.Text = "👁️ ESP: ON"
    toggleBtn.TextSize = 14
    toggleBtn.Font = Enum.Font.GothamBold
    toggleBtn.TextColor3 = Color3.new(1, 1, 1)
    toggleBtn.Parent = contentFrame
    
    local autoBtn = Instance.new("TextButton")
    autoBtn.Name = "AutoButton"
    autoBtn.Size = UDim2.new(0.9, 0, 0, 35)
    autoBtn.Position = UDim2.new(0.05, 0, 0, 140)
    autoBtn.BackgroundColor3 = Color3.fromRGB(80, 150, 60)
    autoBtn.Text = "🔁 Auto Randomize: OFF"
    autoBtn.TextSize = 14
    autoBtn.Font = Enum.Font.GothamBold
    autoBtn.TextColor3 = Color3.new(1, 1, 1)
    autoBtn.Parent = contentFrame
    
    for _, btn in ipairs({randomizeBtn, toggleBtn, autoBtn}) do
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 6)
        corner.Parent = btn
        
        local stroke = Instance.new("UIStroke")
        stroke.Color = Color3.fromRGB(120, 160, 255)
        stroke.Thickness = 1
        stroke.Parent = btn
    end
    
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
    
    randomizeBtn.MouseButton1Click:Connect(function()
        if Activate then
            countdownAndRandomize(randomizeBtn)
        end
    end)
    
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
    
    autoBtn.MouseButton1Click:Connect(function()
        if Activate then
            autoRunning = not autoRunning
            autoBtn.Text = autoRunning and "🔁 Auto Randomize: ON" or "🔁 Auto Randomize: OFF"
            task.spawn(function()
                while autoRunning do
                    countdownAndRandomize(randomizeBtn)
                    for _, petName in pairs(truePetMap) do
                        if bestPets[petName] then
                            autoRunning = false
                            autoBtn.Text = "🔁 Auto Randomize: OFF"
                            return
                        end
                    end
                    task.wait(1)
                end
            end)()
        end
    end)
    
    task.spawn(function()
        task.wait(2)
        for _, egg in ipairs(getPlayerGardenEggs(60)) do
            if not truePetMap[egg] then
                local pets = petTable[egg.Name]
                if pets then
                    truePetMap[egg] = pets[math.random(1, #pets)]
                    applyEggESP(egg, truePetMap[egg])
                end
            end
        end
    end)
end
