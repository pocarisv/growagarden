local player = game:GetService("Players").LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 200, 0, 50)
button.Position = UDim2.new(0.5, -100, 0.5, -25)
button.Text = "Start Loader"
button.Parent = screenGui

local enhancedTools = {}

local function parseToolName(name)
    local base, qty = string.match(name, "^(.-) x(%d+)$")
    if base then
        return base, tonumber(qty), "x"
    end
    base, qty = string.match(name, "^(.-) %[(%d+)%]$")
    if base then
        return base, tonumber(qty), "bracket"
    end
    base, qty = string.match(name, "^(.-) %[[Xx](%d+)%]$")
    if base then
        return base, tonumber(qty), "bracket"
    end
    return nil
end

local function updateToolName(tool, state)
    state.ignoreChange = true
    if state.format == "x" then
        tool.Name = state.baseName .. " x" .. state.fakeQuantity
    else
        tool.Name = state.baseName .. " [" .. state.fakeQuantity .. "]"
    end
    state.ignoreChange = false
end

local function onToolNameChanged(tool, state)
    if state.ignoreChange then return end
    local base, newReal, format = parseToolName(tool.Name)
    if not base then return end
    state.baseName = base
    state.format = format
    local delta = newReal - state.lastRealQuantity
    state.fakeQuantity = state.fakeQuantity + delta
    state.lastRealQuantity = newReal
    updateToolName(tool, state)
end

local function startIncrementing(tool, state)
    state.incrementing = true
    task.spawn(function()
        while state.incrementing and tool and tool.Parent do
            task.wait(0.5)
            if not state.incrementing then break end
            state.fakeQuantity = state.fakeQuantity + 1
            updateToolName(tool, state)
        end
    end)
end

local function setupTool(tool)
    if enhancedTools[tool] then return enhancedTools[tool] end
    local base, quantity, format = parseToolName(tool.Name)
    if not base then return nil end
    local state = {
        baseName = base,
        fakeQuantity = quantity,
        lastRealQuantity = quantity,
        format = format,
        incrementing = false,
        ignoreChange = false
    }
    state.connection = tool:GetPropertyChangedSignal("Name"):Connect(function()
        onToolNameChanged(tool, state)
    end)
    tool.AncestryChanged:Connect(function(_, parent)
        if not parent and enhancedTools[tool] then
            enhancedTools[tool] = nil
        end
    end)
    enhancedTools[tool] = state
    return state
end

button.MouseButton1Click:Connect(function()
    local character = player.Character
    if not character then return end
    local tool = character:FindFirstChildWhichIsA("Tool")
    if not tool then return end
    local state = setupTool(tool)
    if not state then return end
    button.Text = "Initializing Loader"
    button.Active = false
    task.wait(5)
    button.Text = "Start Loader"
    button.Active = true
    if not state.incrementing then
        startIncrementing(tool, state)
    end
end)
