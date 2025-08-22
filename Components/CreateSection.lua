return function(title)
    local section = Instance.new("Frame")
    section.Name = title .. "_Section"
    section.Size = UDim2.new(1, 0, 0, 50)
    section.BackgroundTransparency = 1
    local label = Instance.new("TextLabel")
    label.Text = "— " .. title .. " —"
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(200, 200, 200)
    label.Font = Enum.Font.GothamBold
    label.TextScaled = true
    label.Parent = section
    return section
end
