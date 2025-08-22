local playerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AikooXMainUI"
ScreenGui.Parent = playerGui

local blur = Instance.new("BlurEffect")
blur.Size = 12
blur.Parent = game:GetService("Lighting")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 820, 0, 520)
MainFrame.Position = UDim2.new(0.5, -410, 0.5, -260)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
MainFrame.BackgroundTransparency = 0.32
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 28)
MainCorner.Parent = MainFrame

-- Header
local Header = Instance.new("TextLabel")
Header.Size = UDim2.new(1, 0, 0, 44)
Header.Position = UDim2.new(0, 0, 0, 0)
Header.BackgroundTransparency = 1
Header.Text = "Aikoo X | Version 1.0 | discord.gg/aikoox"
Header.TextColor3 = Color3.fromRGB(180, 120, 255)
Header.Font = Enum.Font.GothamBold
Header.TextSize = 22
Header.TextXAlignment = Enum.TextXAlignment.Left
Header.Parent = MainFrame

-- Tombol Close
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 32, 0, 32)
CloseBtn.Position = UDim2.new(1, -44, 0, 8)
CloseBtn.BackgroundColor3 = Color3.fromRGB(60, 0, 80)
CloseBtn.BackgroundTransparency = 0.18
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(220, 180, 255)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 22
CloseBtn.Parent = MainFrame

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(1, 0)
CloseCorner.Parent = CloseBtn

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
    blur:Destroy()
end)

-- Tombol Minimize
local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0, 32, 0, 32)
MinBtn.Position = UDim2.new(1, -84, 0, 8)
MinBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 120)
MinBtn.BackgroundTransparency = 0.18
MinBtn.Text = "-"
MinBtn.TextColor3 = Color3.fromRGB(180, 180, 255)
MinBtn.Font = Enum.Font.GothamBold
MinBtn.TextSize = 22
MinBtn.Parent = MainFrame

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(1, 0)
MinCorner.Parent = MinBtn

-- Ikon bulat minimize
local MiniIcon = Instance.new("ImageButton")
MiniIcon.Size = UDim2.new(0, 52, 0, 52)
MiniIcon.Position = UDim2.new(0.5, -26, 0.1, 0)
MiniIcon.BackgroundColor3 = Color3.fromRGB(120, 80, 255)
MiniIcon.BackgroundTransparency = 0.18
MiniIcon.Image = ""
MiniIcon.Visible = false
MiniIcon.Parent = ScreenGui

local MiniCorner = Instance.new("UICorner")
MiniCorner.CornerRadius = UDim.new(1, 0)
MiniCorner.Parent = MiniIcon

local MiniLabel = Instance.new("TextLabel")
MiniLabel.Size = UDim2.new(1, 0, 1, 0)
MiniLabel.BackgroundTransparency = 1
MiniLabel.Text = "🟣"
MiniLabel.TextColor3 = Color3.fromRGB(255,255,255)
MiniLabel.Font = Enum.Font.GothamBold
MiniLabel.TextSize = 32
MiniLabel.Parent = MiniIcon

MinBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    MiniIcon.Visible = true
    blur.Enabled = false
end)

MiniIcon.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    MiniIcon.Visible = false
    blur.Enabled = true
end)

-- Sidebar modern & lebar
local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 220, 1, -44)
Sidebar.Position = UDim2.new(0, 0, 0, 44)
Sidebar.BackgroundColor3 = Color3.fromRGB(24, 24, 36)
Sidebar.BackgroundTransparency = 0.13
Sidebar.Parent = MainFrame

local SidebarCorner = Instance.new("UICorner")
SidebarCorner.CornerRadius = UDim.new(0, 24)
SidebarCorner.Parent = Sidebar

-- Drag system untuk Sidebar
local UserInputService = game:GetService("UserInputService")
local function makeDraggable(frame)
    local dragging, dragInput, mousePos, framePos
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            mousePos = input.Position
            framePos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - mousePos
            frame.Position = UDim2.new(
                framePos.X.Scale,
                framePos.X.Offset + delta.X,
                framePos.Y.Scale,
                framePos.Y.Offset + delta.Y
            )
        end
    end)
end
makeDraggable(MainFrame)
makeDraggable(MiniIcon)
makeDraggable(Sidebar)

-- Sidebar menu data
local menuData = {
    {icon = "🔎", text = "Home"},
    {icon = "📋", text = "Main"},
    {icon = "⚡", text = "Automatically"},
    {icon = "🎒", text = "Inventory"},
    {icon = "🛒", text = "Shop"},
    {icon = "🌐", text = "Webhook"},
    {icon = "🧩", text = "Misc"},
    {icon = "⚙️", text = "Settings"},
    {icon = "🎨", text = "Settings UI"},
}

local selectedMenu = 1

for i, menu in ipairs(menuData) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -32, 0, 44)
    btn.Position = UDim2.new(0, 16, 0, (i-1)*52 + 60)
    btn.BackgroundColor3 = i == selectedMenu and Color3.fromRGB(80, 60, 120) or Color3.fromRGB(36, 36, 48)
    btn.BackgroundTransparency = i == selectedMenu and 0.08 or 0.22
    btn.Text = menu.icon .. "  " .. menu.text
    btn.TextColor3 = i == selectedMenu and Color3.fromRGB(180, 120, 255) or Color3.fromRGB(200, 200, 220)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 18
    btn.Parent = Sidebar

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 14)
    btnCorner.Parent = btn

    -- Neon highlight untuk menu aktif
    local neon = Instance.new("UIStroke")
    neon.Color = Color3.fromRGB(120, 80, 255)
    neon.Thickness = 3
    neon.Transparency = i == selectedMenu and 0.2 or 1
    neon.Parent = btn

    btn.MouseButton1Click:Connect(function()
        selectedMenu = i
        for j, child in ipairs(Sidebar:GetChildren()) do
            if child:IsA("TextButton") then
                child.BackgroundColor3 = j == selectedMenu and Color3.fromRGB(80, 60, 120) or Color3.fromRGB(36, 36, 48)
                child.BackgroundTransparency = j == selectedMenu and 0.08 or 0.22
                child.TextColor3 = j == selectedMenu and Color3.fromRGB(180, 120, 255) or Color3.fromRGB(200, 200, 220)
                for _, stroke in ipairs(child:GetChildren()) do
                    if stroke:IsA("UIStroke") then
                        stroke.Transparency = j == selectedMenu and 0.2 or 1
                    end
                end
            end
        end
        updateContent()
    end)
end

-- Search bar di sidebar
local SearchBar = Instance.new("TextBox")
SearchBar.Size = UDim2.new(1, -32, 0, 34)
SearchBar.Position = UDim2.new(0, 16, 0, 16)
SearchBar.PlaceholderText = "Search"
SearchBar.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
SearchBar.TextColor3 = Color3.fromRGB(180, 120, 255)
SearchBar.Font = Enum.Font.Gotham
SearchBar.TextSize = 16
SearchBar.Parent = Sidebar

local SearchCorner = Instance.new("UICorner")
SearchCorner.CornerRadius = UDim.new(0, 12)
SearchCorner.Parent = SearchBar

-- Deposit button di sidebar
local DepositBtn = Instance.new("TextButton")
DepositBtn.Size = UDim2.new(1, -32, 0, 40)
DepositBtn.Position = UDim2.new(0, 16, 1, -56)
DepositBtn.BackgroundColor3 = Color3.fromRGB(120, 80, 255)
DepositBtn.BackgroundTransparency = 0.12
DepositBtn.Text = "Deposit"
DepositBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
DepositBtn.Font = Enum.Font.GothamBold
DepositBtn.TextSize = 18
DepositBtn.Parent = Sidebar

local DepositCorner = Instance.new("UICorner")
DepositCorner.CornerRadius = UDim.new(0, 14)
DepositCorner.Parent = DepositBtn

-- Content Area (Inventory grid)
local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, -240, 1, -64)
ContentFrame.Position = UDim2.new(0, 230, 0, 54)
ContentFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
ContentFrame.BackgroundTransparency = 0.22
ContentFrame.Parent = MainFrame

local ContentCorner = Instance.new("UICorner")
ContentCorner.CornerRadius = UDim.new(0, 18)
ContentCorner.Parent = ContentFrame

local ContentTitle = Instance.new("TextLabel")
ContentTitle.Size = UDim2.new(1, 0, 0, 44)
ContentTitle.Position = UDim2.new(0, 0, 0, 0)
ContentTitle.BackgroundTransparency = 1
ContentTitle.Text = menuData[selectedMenu].text
ContentTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
ContentTitle.Font = Enum.Font.GothamBold
ContentTitle.TextSize = 28
ContentTitle.TextXAlignment = Enum.TextXAlignment.Left
ContentTitle.Parent = ContentFrame

local function updateContent()
    ContentTitle.Text = menuData[selectedMenu].text
    -- Tambahkan konten dinamis sesuai menu di sini
end

updateContent()

-- Inventory grid (contoh item)
local InventoryGrid = Instance.new("Frame")
InventoryGrid.Size = UDim2.new(1, -40, 1, -80)
InventoryGrid.Position = UDim2.new(0, 20, 0, 60)
InventoryGrid.BackgroundTransparency = 1
InventoryGrid.Parent = ContentFrame

local GridLayout = Instance.new("UIGridLayout")
GridLayout.CellSize = UDim2.new(0, 110, 0, 110)
GridLayout.CellPadding = UDim2.new(0, 16, 0, 16)
GridLayout.Parent = InventoryGrid

local items = {
    {name = "Arctic", rarity = "Legendary", equipped = true, neon = Color3.fromRGB(0,255,120)},
    {name = "Overseer", rarity = "Rare"},
    {name = "Default Knife", rarity = "Common"},
    {name = "Default Knife", rarity = "Common"},
    {name = "Default Knife", rarity = "Common"},
    {name = "Default Knife", rarity = "Common"},
    {name = "Default Knife", rarity = "Common"},
    {name = "Default Knife", rarity = "Common"},
}

for i, item in ipairs(items) do
    local Card = Instance.new("Frame")
    Card.Size = UDim2.new(0, 110, 0, 110)
    Card.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    Card.BackgroundTransparency = 0.18
    Card.Parent = InventoryGrid

    local CardCorner = Instance.new("UICorner")
    CardCorner.CornerRadius = UDim.new(0, 18)
    CardCorner.Parent = Card

    if item.neon then
        local NeonStroke = Instance.new("UIStroke")
        NeonStroke.Color = item.neon
        NeonStroke.Thickness = 4
        NeonStroke.Transparency = 0.15
        NeonStroke.Parent = Card
    end

    local ItemLabel = Instance.new("TextLabel")
    ItemLabel.Size = UDim2.new(1, 0, 0, 28)
    ItemLabel.Position = UDim2.new(0, 0, 1, -28)
    ItemLabel.BackgroundTransparency = 1
    ItemLabel.Text = item.name .. "\n" .. (item.rarity or "")
    ItemLabel.TextColor3 = item.neon or Color3.fromRGB(255,255,255)
    ItemLabel.Font = Enum.Font.GothamBold
    ItemLabel.TextSize = 16
    ItemLabel.TextYAlignment = Enum.TextYAlignment.Bottom
    ItemLabel.Parent = Card

    if item.equipped then
        local EquippedLabel = Instance.new("TextLabel")
        EquippedLabel.Size = UDim2.new(1, 0, 0, 20)
        EquippedLabel.Position = UDim2.new(0, 0, 0, 0)
        EquippedLabel.BackgroundTransparency = 1
        EquippedLabel.Text = "Equipped ✓"
        EquippedLabel.TextColor3 = Color3.fromRGB(0,255,120)
        EquippedLabel.Font = Enum.Font.GothamBold
        EquippedLabel.TextSize = 14
        EquippedLabel.Parent = Card
    end
end