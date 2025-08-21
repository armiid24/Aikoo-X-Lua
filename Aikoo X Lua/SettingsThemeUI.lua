-- SettingsThemeUI.lua

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


--// SLOT: Settings UI - Theme & Background
--// FILE: SettingsThemeUI.lua

-- Dependencies
local ThemeUI = Instance.new("Frame")
ThemeUI.Name = "SettingsThemeUI"
ThemeUI.Size = UDim2.new(1, 0, 1, 0)
ThemeUI.BackgroundTransparency = 1
ThemeUI.Visible = false

--// SECTION: Theme
local ThemeSection = CreateSection("Theme")

local ThemeDropdown = CreateDropdown("Select Theme", {
    "Navy", "Silver", "Cyan", "Purple", "Gold", "Brown", "Orange", "Red",
    "Lime", "Darker", "Teal", "Pink", "Crimson", "Green", "Blue", "Yellow",
    "Dark", "Gray",
    "---" -- Slot kosong untuk penambahan manual
})

local ResetThemeButton = CreateButton("Reset Theme", function()
    print("🔁 Reset theme triggered")
end)

--// SECTION: Background UI
local BackgroundSection = CreateSection("Background UI")

local BackgroundSlider = CreateInput("Background Transparency", "0.5") -- default opasitas

-- Parent all components
ThemeDropdown.Parent = ThemeSection
ResetThemeButton.Parent = ThemeSection
ThemeSection.Parent = ThemeUI

BackgroundSlider.Parent = BackgroundSection
BackgroundSection.Parent = ThemeUI

-- Return UI (optional if using module system)
return ThemeUI
