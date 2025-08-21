-- CreateButton(name, callback)
return function(name, callback)
    local button = Instance.new("TextButton")
    button.Name = name .. "_Button"
    button.Text = name
    button.Size = UDim2.new(1, 0, 0, 40)
    button.MouseButton1Click:Connect(callback)
    return button
end
