local ComponentsFolder = game:GetService("CoreGui"):FindFirstChild("Components")
local CreateSection = require(ComponentsFolder:WaitForChild("CreateSection"))
local CreateDropdown = require(ComponentsFolder:WaitForChild("CreateDropdown"))
local CreateButton = require(ComponentsFolder:WaitForChild("CreateButton"))
local CreateInput = require(ComponentsFolder:WaitForChild("CreateInput"))


local gui = Instance.new("ScreenGui")
gui.Name = "AikooX_UI"
gui.Parent = game:GetService("CoreGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 300)
frame.Position = UDim2.new(0.5, -200, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Text = "Settings Theme UI"
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.Parent = frame
