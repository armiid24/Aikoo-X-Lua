local HttpService = game:GetService("HttpService")
local baseURL = "https://raw.githubusercontent.com/armiid24/Aikoo-X-Lua/main/Aikoo%20X%20Lua/"
local uiFiles = {
    "MainUIFrame.lua", "HomeUI.lua", "MainUI.lua", "AutomaticallyUI.lua",
    "InventoryUI.lua", "ShopUI.lua", "MiscUI.lua", "SettingsUI.lua", "SettingsThemeUI.lua"
}
for _, fileName in ipairs(uiFiles) do
    local url = baseURL .. fileName
    local success, response = pcall(function() return HttpService:GetAsync(url) end)
    if success then
        local func = loadstring(response)
        if func then func() else warn("⚠️ Gagal compile:", fileName) end
    else warn("❌ Gagal ambil:", fileName) end
end
