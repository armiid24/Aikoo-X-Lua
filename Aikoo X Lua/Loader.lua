--// Main UI Loader Script
--// Eksekusi satu raw link, load semua UI modular

local HttpService = game:GetService("HttpService")

-- Base URL GitHub raw (ganti sesuai repo kamu)
local baseURL = "https://raw.githubusercontent.com/mlhubx/SpeedHubX_UI/main/"

-- Daftar file UI yang ingin dimuat
local uiFiles = {
    "SettingsUI.lua",
    "SettingsThemeUI.lua",
    "MainUI.lua",
    "HomeUI.lua",
    "AutomaticallyUI.lua",
    "InventoryUI.lua",
    "MiscUI.lua",
    "ShopUI.lua",
    -- Tambahkan file lain sesuai folder kamu
}

-- Fungsi untuk load dan eksekusi file
local function loadUISlot(fileName)
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

-- Loop semua file dan jalankan
for _, file in ipairs(uiFiles) do
    loadUISlot(file)
end
