-- CreateDropdown(name, options)
return function(name, options)
    local dropdown = Instance.new("Frame")
    dropdown.Name = name .. "_Dropdown"
    dropdown.Size = UDim2.new(1, 0, 0, 40)
    dropdown.BackgroundTransparency = 0.2

    local label = Instance.new("TextLabel")
    label.Text = name
    label.Size = UDim2.new(1, 0, 0.5, 0)
    label.Parent = dropdown

    local list = Instance.new("TextButton")
    list.Text = "▼ Select Option"
    list.Size = UDim2.new(1, 0, 0.5, 0)
    list.Position = UDim2.new(0, 0, 0.5, 0)
    list.Parent = dropdown

    return dropdown
end
