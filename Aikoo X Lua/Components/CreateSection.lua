-- CreateSection(title)
return function(title)
    local section = Instance.new("Frame")
    section.Name = title .. "_Section"
    section.Size = UDim2.new(1, 0, 0, 50)
    section.BackgroundTransparency = 1
    return section
end
