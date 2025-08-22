--// FILE: HomeUI.lua
--// SLOT: Panel Konten - Home

local CoreGui = game:GetService("CoreGui")
local mainFrame = CoreGui:FindFirstChild("AikooX_UI") and CoreGui.AikooX_UI:FindFirstChild("MainFrame")
local contentFrame = mainFrame and mainFrame:FindFirstChild("ContentFrame")
if not contentFrame then return end

-- Bersihkan konten lama
for _, child in ipairs(contentFrame:GetChildren()) do
    child:Destroy()
end

-- Section: Discord
local discordCard = Instance.new("Frame")
discordCard.Size = UDim2.new(0.9, 0, 0, 80)
discordCard.Position = UDim2.new(0.05, 0, 0, 10)
discordCard.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
discordCard.BackgroundTransparency = 0.3
discordCard.Parent = contentFrame

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = discordCard

local discordLabel = Instance.new("TextLabel")
discordLabel.Text = "Join our Discord server:"
discordLabel.Size = UDim2.new(1, -20, 0.5, 0)
discordLabel.Position = UDim2.new(0, 10, 0, 5)
discordLabel.BackgroundTransparency = 1
discordLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
discordLabel.Font = Enum.Font.Gotham
discordLabel.TextScaled = true
discordLabel.TextXAlignment = Enum.TextXAlignment.Left
discordLabel.Parent = discordCard

local copyButton = Instance.new("TextButton")
copyButton.Text = "Copy Invite"
copyButton.Size = UDim2.new(0.5, -20, 0.4, 0)
copyButton.Position = UDim2.new(0.5, 10, 0.5, 0)
copyButton.BackgroundColor3 = Color3.fromRGB(180, 130, 255)
copyButton.TextColor3 = Color3.fromRGB(20, 20, 20)
copyButton.Font = Enum.Font.GothamBold
copyButton.TextScaled = true
copyButton.Parent = discordCard

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 6)
btnCorner.Parent = copyButton

copyButton.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/aikooxlua")
    print("📋 Discord invite copied!")
end)

-- Section: LocalPlayer (placeholder)
local localPlayerCard = Instance.new("Frame")
localPlayerCard.Size = UDim2.new(0.9, 0, 0, 120)
localPlayerCard.Position = UDim2.new(0.05, 0, 0, 100)
localPlayerCard.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
localPlayerCard.BackgroundTransparency = 0.3
localPlayerCard.Parent = contentFrame

local corner2 = Instance.new("UICorner")
corner2.CornerRadius = UDim.new(0, 8)
corner2.Parent = localPlayerCard

local localLabel = Instance.new("TextLabel")
localLabel.Text = "LocalPlayer Settings (Coming Soon)"
localLabel.Size = UDim2.new(1, -20, 1, 0)
localLabel.Position = UDim2.new(0, 10, 0, 0)
localLabel.BackgroundTransparency = 1
localLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
localLabel.Font = Enum.Font.Gotham
localLabel.TextScaled = true
localLabel.TextXAlignment = Enum.TextXAlignment.Left
localLabel.Parent = localPlayerCard
