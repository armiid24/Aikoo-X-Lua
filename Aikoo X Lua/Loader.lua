--// Main UI Loader Script
local HttpService = game:GetService("HttpService")

local baseURL = "https://raw.githubusercontent.com/armiid24/Aikoo-X-Lua/main/Aikoo%20X%20Lua/"

local uiFiles = {
    "SettingsUI.lua",
    "SettingsThemeUI.lua",
    "MainUI.lua",
    "HomeUI.lua",
    "AutomaticallyUI.lua",
    "InventoryUI.lua",
    "MiscUI.lua",
    "ShopUI.lua"
}

for _, fileName in ipairs(uiFiles) do
    local url = baseURL .. fileName
    local success, response = pcall(function()
        return HttpService:GetAsync(url)
    end)

    if success then
        local func = loadstring(response)
        if func then
            func()
            print("✅ Loaded:", fileName)
        else
            warn("⚠️ Gagal compile:", fileName)
        end
    else
        warn("❌ Gagal ambil:", fileName)
    end
end
