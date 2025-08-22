local CoreGui = game:GetService("CoreGui")
local contentFrame = CoreGui:FindFirstChild("AikooX_UI") and CoreGui.AikooX_UI.MainFrame:FindFirstChild("ContentFrame")
if not contentFrame then return end
for _, child in ipairs(contentFrame:GetChildren()) do child:Destroy() end

local discordCard = Instance.new("Frame")
discordCard.Size = UDim2.new(0.9, 0, 0, 80)
discordCard.Position = UDim2.new(0.05, 0, 0, 10)
discordCard.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
discordCard.BackgroundTransparency = 0.3
discordCard.Parent = contentFrame
Instance.new("UICorner", discordCard).CornerRadius = UDim.new(0, 8)

local label = Instance.new("TextLabel")
label.Text = "Join our Discord server:"
label.Size = UDim2.new(1, -20, 0.5, 0)
label.Position = UDim2.new(0, 10, 0, 5)
label.BackgroundTransparency = 1
label.TextColor3 = Color3.new(1, 1, 1)
label.Font = Enum.Font.Gotham
label.TextScaled = true
label.TextXAlignment = Enum.TextXAlignment.Left
label.Parent = discordCard

local copyBtn = Instance.new("TextButton")
copyBtn.Text = "Copy Invite"
copyBtn.Size = UDim2.new(0.5, -20, 0.4, 0)
copyBtn.Position = UDim2.new(0.5, 10, 0.5, 0)
copyBtn.BackgroundColor3 = Color3.fromRGB(180, 130, 255)
copyBtn.TextColor3 = Color3.fromRGB(20, 20, 20)
copyBtn.Font = Enum.Font.GothamBold
copyBtn.TextScaled = true
copyBtn.Parent = discordCard
Instance.new("UICorner", copyBtn).CornerRadius = UDim.new(0, 6)
copyBtn.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/aikooxlua")
end)
