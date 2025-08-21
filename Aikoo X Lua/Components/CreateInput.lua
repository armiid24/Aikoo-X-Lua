-- CreateInput(name, defaultValue)
return function(name, defaultValue)
    local input = Instance.new("Frame")
    input.Name = name .. "_Input"
    input.Size = UDim2.new(1, 0, 0, 40)

    local label = Instance.new("TextLabel")
    label.Text = name
    label.Size = UDim2.new(0.5, 0, 1, 0)
    label.Parent = input

    local box = Instance.new("TextBox")
    box.Text = defaultValue
    box.Size = UDim2.new(0.5, 0, 1, 0)
    box.Position = UDim2.new(0.5, 0, 0, 0)
    box.Parent = input

    return input
end
