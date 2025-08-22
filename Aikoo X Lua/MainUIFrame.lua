-- Buat ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AikooXMainUI"
ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

-- Blur effect
local blur = Instance.new("BlurEffect")
blur.Size = 12
blur.Parent = game:GetService("Lighting")

-- Main Frame (Glassmorphism)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainUIFrame"
MainFrame.Size = UDim2.new(0, 700, 0, 480)
MainFrame.Position = UDim2.new(0.5, -350, 0.5, -240)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
MainFrame.BackgroundTransparency = 0.35
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 24)
MainCorner.Parent = MainFrame

-- Header
local Header = Instance.new("TextLabel")
Header.Size = UDim2.new(1, 0, 0, 40)
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
CloseBtn.Position = UDim2.new(1, -40, 0, 8)
CloseBtn.BackgroundColor3 = Color3.fromRGB(60, 0, 80)
CloseBtn.BackgroundTransparency = 0.2
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
MinBtn.Position = UDim2.new(1, -80, 0, 8)
MinBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 120)
MinBtn.BackgroundTransparency = 0.2
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
MiniIcon.Size = UDim2.new(0, 48, 0, 48)
MiniIcon.Position = UDim2.new(0.5, -24, 0.1, 0)
MiniIcon.BackgroundColor3 = Color3.fromRGB(120, 80, 255)
MiniIcon.BackgroundTransparency = 0.2
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
end)

MiniIcon.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    MiniIcon.Visible = false
end)

-- Sidebar
local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 140, 1, -40)
Sidebar.Position = UDim2.new(0, 0, 0, 40)
Sidebar.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
Sidebar.BackgroundTransparency = 0.15
Sidebar.Parent = MainFrame

local SidebarCorner = Instance.new("UICorner")
SidebarCorner.CornerRadius = UDim.new(0, 24)
SidebarCorner.Parent = Sidebar

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

for i, menu in ipairs(menuData) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -20, 0, 40)
    btn.Position = UDim2.new(0, 10, 0, (i-1)*44 + 10)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    btn.BackgroundTransparency = 0.3
    btn.Text = menu.icon .. "  " .. menu.text
    btn.TextColor3 = Color3.fromRGB(200, 200, 220)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 18
    btn.Parent = Sidebar

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 14)
    btnCorner.Parent = btn

    -- Soft shadow (neumorphism)
    local shadow = Instance.new("ImageLabel")
    shadow.Size = UDim2.new(1, 10, 1, 10)
    shadow.Position = UDim2.new(0, -5, 0, -5)
    shadow.BackgroundTransparency = 1
    shadow.Image = "rbxassetid://1316045217"
    shadow.ImageColor3 = Color3.fromRGB(120, 120, 255)
    shadow.ImageTransparency = 0.85
    shadow.Parent = btn
end

-- Content Area
local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, -160, 1, -60)
ContentFrame.Position = UDim2.new(0, 150, 0, 50)
ContentFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
ContentFrame.BackgroundTransparency = 0.25
ContentFrame.Parent = MainFrame

local ContentCorner = Instance.new("UICorner")
ContentCorner.CornerRadius = UDim.new(0, 18)
ContentCorner.Parent = ContentFrame

-- Contoh judul konten
local ContentTitle = Instance.new("TextLabel")
ContentTitle.Size = UDim2.new(1, 0, 0, 40)
ContentTitle.Position = UDim2.new(0, 0, 0, 0)
ContentTitle.BackgroundTransparency = 1
ContentTitle.Text = "Home"
ContentTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
ContentTitle.Font = Enum.Font.GothamBold
ContentTitle.TextSize = 28
ContentTitle.TextXAlignment = Enum.TextXAlignment.Left
ContentTitle.Parent = ContentFrame

-- Contoh card konten (neon border untuk item langka)
local Card = Instance.new("Frame")
Card.Size = UDim2.new(0, 320, 0, 48)
Card.Position = UDim2.new(0, 20, 0, 60)
Card.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
Card.BackgroundTransparency = 0.18
Card.Parent = ContentFrame

local CardCorner = Instance.new("UICorner")
CardCorner.CornerRadius = UDim.new(0, 14)
CardCorner.Parent = Card

local NeonStroke = Instance.new("UIStroke")
NeonStroke.Color = Color3.fromRGB(0, 255, 120)
NeonStroke.Thickness = 3
NeonStroke.Transparency = 0.2
NeonStroke.Parent = Card

local CardLabel = Instance.new("TextLabel")
CardLabel.Size = UDim2.new(1, 0, 1, 0)
CardLabel.BackgroundTransparency = 1
CardLabel.Text = "Discord Invite"
CardLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
CardLabel.Font = Enum.Font.Gotham
CardLabel.TextSize = 18
CardLabel.Parent = Card

-- Drag system untuk MainFrame dan MiniIcon
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

-- ...existing code...

MinBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    MiniIcon.Visible = true
    blur.Enabled = false -- blur hilang saat minimize
end)

MiniIcon.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    MiniIcon.Visible = false
    blur.Enabled = true -- blur muncul lagi saat restore
end)

-- Drag system untuk MainFrame dan MiniIcon
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

-- ...existing code...

makeDraggable(MainFrame)
makeDraggable(MiniIcon)

-- Selesai, layout dan style mirip gambar sudah siap!