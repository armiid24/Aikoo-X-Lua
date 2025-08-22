--// FILE: MainUIFrame.lua
--// SLOT: Kerangka Utama UI Aikoo X Lua

local gui = Instance.new("ScreenGui")
gui.Name = "AikooX_UI"
gui.ResetOnSpawn = false
gui.Parent = game:GetService("CoreGui")

-- Frame utama
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 600, 0, 400)
mainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BorderSizePixel = 0
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.Parent = gui
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 12)

-- Header bar
local header = Instance.new("Frame")
header.Name = "HeaderBar"
header.Size = UDim2.new(1, 0, 0, 40)
header.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
header.BorderSizePixel = 0
header.Parent = mainFrame

local headerText = Instance.new("TextLabel")
headerText.Text = "Aikoo X Lua | Version 1.0.0 | discord.gg/aikooxlua"
headerText.Size = UDim2.new(1, -80, 1, 0)
headerText.Position = UDim2.new(0, 10, 0, 0)
headerText.BackgroundTransparency = 1
headerText.TextColor3 = Color3.fromRGB(180, 130, 255)
headerText.Font = Enum.Font.GothamBold
headerText.TextScaled = true
headerText.TextXAlignment = Enum.TextXAlignment.Left
headerText.Parent = header

-- Tombol Close
local closeBtn = Instance.new("TextButton")
closeBtn.Text = "✕"
closeBtn.Size = UDim2.new(0, 30, 1, 0)
closeBtn.Position = UDim2.new(1, -35, 0, 0)
closeBtn.BackgroundTransparency = 1
closeBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextScaled = true
closeBtn.Parent = header
closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- Tombol Minimize
local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Text = "—"
minimizeBtn.Size = UDim2.new(0, 30, 1, 0)
minimizeBtn.Position = UDim2.new(1, -70, 0, 0)
minimizeBtn.BackgroundTransparency = 1
minimizeBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextScaled = true
minimizeBtn.Parent = header

local isMinimized = false
minimizeBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    mainFrame.Visible = not isMinimized
end)

-- Sidebar
local sidebar = Instance.new("Frame")
sidebar.Name = "Sidebar"
sidebar.Size = UDim2.new(0, 150, 1, -40)
sidebar.Position = UDim2.new(0, 0, 0, 40)
sidebar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
sidebar.BorderSizePixel = 0
sidebar.Parent = mainFrame

local sidebarLayout = Instance.new("UIListLayout")
sidebarLayout.FillDirection = Enum.FillDirection.Vertical
sidebarLayout.Padding = UDim.new(0, 6)
sidebarLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
sidebarLayout.VerticalAlignment = Enum.VerticalAlignment.Top
sidebarLayout.Parent = sidebar

-- Menu Button Generator
local function createMenuButton(name)
    local btn = Instance.new("TextButton")
    btn.Name = name .. "_Button"
    btn.Text = name
    btn.Size = UDim2.new(0.9, 0, 0, 30)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    btn.Font = Enum.Font.Gotham
    btn.TextScaled = true
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    btn.Parent = sidebar
    return btn
end

-- Tambahkan menu
local menuNames = {
    "Home", "Main", "Automatically", "Inventory",
    "Shop", "Webhook", "Misc", "Settings", "Settings UI"
}

for _, name in ipairs(menuNames) do
    createMenuButton(name)
end

-- Konten Utama
local contentFrame = Instance.new("Frame")
contentFrame.Name = "ContentFrame"
contentFrame.Size = UDim2.new(1, -150, 1, -40)
contentFrame.Position = UDim2.new(0, 150, 0, 40)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = mainFrame

-- Placeholder konten
local placeholder = Instance.new("TextLabel")
placeholder.Text = "Select a menu from the sidebar"
placeholder.Size = UDim2.new(1, 0, 1, 0)
placeholder.BackgroundTransparency = 1
placeholder.TextColor3 = Color3.fromRGB(255, 255, 255)
placeholder.Font = Enum.Font.Gotham
placeholder.TextScaled = true
placeholder.Parent = contentFrame
