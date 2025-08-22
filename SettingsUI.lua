local CoreGui = game:GetService("CoreGui")
local contentFrame = CoreGui:FindFirstChild("AikooX_UI") and CoreGui.AikooX_UI.MainFrame:FindFirstChild("ContentFrame")
if not contentFrame then return end
for _, child in ipairs(contentFrame:GetChildren()) do child:Destroy() end

local label = Instance.new("TextLabel")
label.Text = "This is [Settings] UI"
label.Size = UDim2.new(1, 0, 1, 0)
label.BackgroundTransparency = 1
label.TextColor3 = Color3.new(1, 1, 1)
label.Font = Enum.Font.Gotham
label.TextScaled = true
label.Parent = contentFrame
