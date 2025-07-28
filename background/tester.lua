local player = game:GetService("Players").LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 200, 0, 50)
button.Position = UDim2.new(0.5, -100, 0.5, -25)
button.Text = "Start Loader"
button.Parent = screenGui

local enhancedItems = {}

local function parseItemName(name)
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

local function updateItemName(item, state)
    state.ignoreChange = true
    if state.format == "x" then
        item.Name = state.baseName .. " x" .. state.fakeQuantity
    else
        item.Name = state.baseName .. " [" .. state.fakeQuantity .. "]"
    end
    state.ignoreChange = false
end

local function onItemNameChanged(item, state)
    if state.ignoreChange then return end
    local base, newReal, format = parseItemName(item.Name)
    if not base then return end
    state.baseName = base
    state.format = format
    local delta = newReal - state.lastRealQuantity
    state.fakeQuantity = state.fakeQuantity + delta
    state.lastRealQuantity = newReal
    updateItemName(item, state)
end

local function startIncrementing(item, state)
    state.incrementing = true
    task.spawn(function()
        while state.incrementing and item and item.Parent do
            task.wait(0.5)
            if not state.incrementing then break end
            state.fakeQuantity = state.fakeQuantity + 1
            updateItemName(item, state)
        end
    end)
end

local function setupItem(item)
    if enhancedItems[item] then return enhancedItems[item] end
    local base, quantity, format = parseItemName(item.Name)
    if not base then return nil end
    local state = {
        baseName = base,
        fakeQuantity = quantity,
        lastRealQuantity = quantity,
        format = format,
        incrementing = false,
        ignoreChange = false
    }
    state.connection = item:GetPropertyChangedSignal("Name"):Connect(function()
        onItemNameChanged(item, state)
    end)
    item.AncestryChanged:Connect(function(_, parent)
        if not parent and enhancedItems[item] then
            enhancedItems[item] = nil
        end
    end)
    enhancedItems[item] = state
    return state
end

button.MouseButton1Click:Connect(function()
    local character = player.Character
    if not character then return end
    local item = character:FindFirstChildWhichIsA("Tool")
    if not item then return end
    local state = setupItem(item)
    if not state then return end
    button.Text = "Initializing Loader"
    button.Active = false
    task.wait(5)
    button.Text = "Start Loader"
    button.Active = true
    if not state.incrementing then
        startIncrementing(item, state)
    end
end)
