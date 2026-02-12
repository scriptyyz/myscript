-- CUSTOM UI FOR YOUTUBE: SCRIPTYYZ
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local CloseBtn = Instance.new("TextButton")
local Footer = Instance.new("TextLabel")
local Container = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")

-- UI Setup
ScreenGui.Parent = game.CoreGui
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainFrame.Position = UDim2.new(0.1, 0, 0.4, 0)
MainFrame.Size = UDim2.new(0, 250, 0, 310) 
MainFrame.Active = true
MainFrame.Draggable = true
local MainCorner = Instance.new("UICorner", MainFrame)
MainCorner.CornerRadius = UDim.new(0, 15)

Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 45)
Title.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Title.Text = "Youtube: Scriptyyz"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
local TitleCorner = Instance.new("UICorner", Title)
TitleCorner.CornerRadius = UDim.new(0, 15)

-- Close Button (X) - Transparent Background
CloseBtn.Parent = MainFrame
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 7)
CloseBtn.BackgroundTransparency = 1 
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 18
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

Footer.Parent = MainFrame
Footer.Size = UDim2.new(1, 0, 0, 30)
Footer.Position = UDim2.new(0, 0, 1, -30)
Footer.BackgroundTransparency = 1
Footer.Text = "+1 Speed Escape for Brainrots"
Footer.TextColor3 = Color3.fromRGB(200, 200, 200)
Footer.Font = Enum.Font.GothamSemibold
Footer.TextSize = 12

Container.Parent = MainFrame
Container.Position = UDim2.new(0, 10, 0, 50)
Container.Size = UDim2.new(1, -20, 1, -85)
Container.BackgroundTransparency = 1
Container.ScrollBarThickness = 0

UIListLayout.Parent = Container
UIListLayout.Padding = UDim.new(0, 8)

--- UTILITIES ---
local function createButton(txt, callback)
    local btn = Instance.new("TextButton", Container)
    btn.Size = UDim2.new(1, 0, 0, 35) -- Standard Height
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    btn.Text = txt
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 14
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- Slider resized to match Button Height (35)
local function createSlider(txt, min, max, callback)
    local sliderBtn = Instance.new("Frame", Container)
    sliderBtn.Size = UDim2.new(1, 0, 0, 35) -- Same size as buttons
    sliderBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Instance.new("UICorner", sliderBtn).CornerRadius = UDim.new(0, 8)

    local label = Instance.new("TextLabel", sliderBtn)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = txt .. ": " .. min
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.Gotham
    label.TextSize = 14
    label.ZIndex = 2

    local fill = Instance.new("Frame", sliderBtn)
    fill.Size = UDim2.new(0, 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    fill.BorderSizePixel = 0
    Instance.new("UICorner", fill).CornerRadius = UDim.new(0, 8)

    local dragging = false
    local function move()
        local mousePos = game:GetService("UserInputService"):GetMouseLocation().X
        local percent = math.clamp((mousePos - sliderBtn.AbsolutePosition.X) / sliderBtn.AbsoluteSize.X, 0, 1)
        fill.Size = UDim2.new(percent, 0, 1, 0)
        local val = math.floor(min + (max - min) * percent)
        label.Text = txt .. ": " .. val
        callback(val)
    end

    sliderBtn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true move() end
    end)
    game:GetService("UserInputService").InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
    end)
    game:GetService("RunService").RenderStepped:Connect(function() if dragging then move() end end)
end

--- FEATURES ---
createSlider("Walk Speed", 16, 500, function(v)
    local hum = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    if hum then hum.WalkSpeed = v end
end)

createButton("Teleport To Safe", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1102.93, 61.61, -1229.36)
end)

createButton("Teleport To End", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1113.57, 62.07, 3269.59)
end)

local interactActive = false
local intBtn = createButton("Instant Interact: OFF", function() end)
intBtn.MouseButton1Click:Connect(function()
    interactActive = not interactActive
    intBtn.Text = "Instant Interact: " .. (interactActive and "ON" or "OFF")
    intBtn.BackgroundColor3 = interactActive and Color3.fromRGB(20, 45, 20) or Color3.fromRGB(30, 30, 30)
    task.spawn(function()
        while interactActive do
            local folder = workspace:FindFirstChild("Caches") and workspace.Caches:FindFirstChild("EntitiesFolder")
            if folder then
                for _, item in pairs(folder:GetChildren()) do
                    local prompt = item:FindFirstChildOfClass("ProximityPrompt")
                    if prompt then prompt.HoldDuration = 0 end
                end
            end
            task.wait(1)
        end
    end)
end)
