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
