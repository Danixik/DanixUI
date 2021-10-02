local library = {}
local toggled = false

function library:CreateWindow(name)
    local funcs = {}
    local UILib = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    local DraggableFrame = Instance.new("Frame")
    local NameLabel = Instance.new("TextLabel")
    local Close = Instance.new("TextButton")

    DraggableFrame.Name = "DraggableFrame"
    DraggableFrame.Parent = UILib
    DraggableFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    DraggableFrame.BorderColor3 = Color3.fromRGB(55, 55, 55)
    DraggableFrame.Position = UDim2.new(0.2644898, 0, 0.255214721, 0)
    DraggableFrame.Size = UDim2.new(0, 324, 0, 26)
    DraggableFrame.Active = true
    DraggableFrame.Draggable = true
    
    NameLabel.Name = "NameLabel"
    NameLabel.Parent = DraggableFrame
    NameLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NameLabel.BackgroundTransparency = 1.000
    NameLabel.Position = UDim2.new(0.020125404, 0, 0.0399999991, 0)
    NameLabel.Size = UDim2.new(0, 150, 0, 22)
    NameLabel.Font = Enum.Font.SourceSans
    NameLabel.Text = "Name"
    NameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    NameLabel.TextSize = 17.000
    NameLabel.TextXAlignment = Enum.TextXAlignment.Left
    NameLabel.Text = name
    
    UILib.Name = "UI Lib"
    UILib.Parent = game.CoreGui
    UILib.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    Main.Name = "Main"
Main.Parent = DraggableFrame
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Main.BorderColor3 = Color3.fromRGB(55, 55, 55)
Main.Position = UDim2.new(-0.000942289829, 0, 0.979424238, 0)
Main.Size = UDim2.new(0, 324, 0, 375)
Main.ClipsDescendants = true
    
    Close.Name = "Close"
Close.Parent = DraggableFrame
Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Close.BackgroundTransparency = 1.000
Close.Position = UDim2.new(0.916905999, 0, -0.0291647017, 0)
Close.Size = UDim2.new(0, 26, 0, 26)
Close.Font = Enum.Font.SourceSans
Close.Text = "^"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextScaled = true
Close.TextSize = 14.000
Close.TextWrapped = true
Close.ClipsDescendants = true
Close.MouseButton1Click:Connect(function()
			if toggled then
			toggled = false
			Main:TweenSize(UDim2.new(0, 324,0, 0), "InOut", "Quad", 0.5)
			wait(0.4)
			Close.Rotation = 180
		else
			toggled = true
			Main:TweenSize(UDim2.new(0, 324,0, 350), "InOut", "Quad", 0.5)
			wait(0.4)
			Close.Rotation = 0
		end
		end)

    local offsetX, offsetY = 0, 0

    function funcs:CreateButton(text, callback)
        local Button = Instance.new("TextButton")
        local callback = callback or function() end
    
    
        Button.Name = "Button"
        Button.Parent = Main
        Button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        Button.BorderColor3 = Color3.fromRGB(55, 55, 55)
        Button.Position = UDim2.new(0.0185185224, offsetX, 0.0251473188, offsetY)
        Button.Size = UDim2.new(0, 120, 0, 22)
        
        if (Button.AbsolutePosition.Y + 32 > Main.AbsolutePosition.Y + Main.AbsoluteSize.Y) then
            offsetX = offsetX + Button.AbsoluteSize.X + 6
            offsetY = 0
            Button.Position = UDim2.new(0.0185185224, offsetX, 0.0251473188, offsetY)
        end
        Button.Font = Enum.Font.SourceSans
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.TextSize = 14.000
        Button.Text = text
        
        Button.MouseButton1Click:Connect(function()
            pcall(callback)
end)
        offsetY = offsetY + Button.AbsoluteSize.Y + 3
    end

    return funcs
end
return library
