-- SettingsThemeUI.lua

-- Buat ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "AikooX_UI"
gui.Parent = game:GetService("CoreGui")
gui.ResetOnSpawn = false

-- Frame utama bergaya glassmorphism
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 500, 0, 350)
frame.Position = UDim2.new(0.5, -250, 0.5, -175)
frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
frame.BackgroundTransparency = 0.85
frame.BorderSizePixel = 0
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Parent = gui

-- Tambahkan efek blur (glass)
local blur = Instance.new("UIStroke")
blur.Thickness = 1.5
blur.Color = Color3.fromRGB(200, 200, 200)
blur.Transparency = 0.4
blur.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
blur.Parent = frame

-- Tambahkan shadow
local shadow = Instance.new("UICorner")
shadow.CornerRadius = UDim.new(0, 12)
shadow.Parent = frame

-- Tambahkan label judul
local title = Instance.new("TextLabel")
title.Text = "Settings Theme UI"
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.Parent = frame

-- Tambahkan layout untuk isi konten
local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 8)
layout.FillDirection = Enum.FillDirection.Vertical
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.VerticalAlignment = Enum.VerticalAlignment.Top
layout.Parent = frame

-- Tambahkan dropdown tema (dummy)
local dropdown = Instance.new("TextButton")
dropdown.Text = "▼ Select Theme"
dropdown.Size = UDim2.new(0.9, 0, 0, 40)
dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dropdown.BackgroundTransparency = 0.6
dropdown.TextColor3 = Color3.fromRGB(50, 50, 50)
dropdown.Font = Enum.Font.Gotham
dropdown.TextScaled = true
dropdown.Parent = frame

-- Tambahkan slider transparansi (dummy)
local slider = Instance.new("TextBox")
slider.Text = "Background Transparency: 0.5"
slider.Size = UDim2.new(0.9, 0, 0, 40)
slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
slider.BackgroundTransparency = 0.6
slider.TextColor3 = Color3.fromRGB(50, 50, 50)
slider.Font = Enum.Font.Gotham
slider.TextScaled = true
slider.Parent = frame
