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
			Main:TweenSize(UDim2.new(0, 324,0, 375), "InOut", "Quad", 0.5)
			wait(0.4)
			Close.Rotation = 0
		end
		end)

    local offsetX, offsetY = 0, 0

    function funcs:CreateButton(text, callback)
	print(offsetX,offsetY)
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
    function funcs:CreateToggle(text, callback)
	print(offsetX,offsetY)
local actions = {}
local enabled = false
text = text or "New Toggle"
callback = callback or function() end

local Toggle = Instance.new("TextLabel")
local Background = Instance.new("TextButton")
local OnOfToggle = Instance.new("TextButton")

offsetY = offsetY + 10

Toggle.Name = "Toggle"
Toggle.Parent = Main
Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Toggle.BackgroundTransparency = 1.000
Toggle.Position = UDim2.new(0.0802469105, offsetX, 0, offsetY)
Toggle.Size = UDim2.new(0, 119, 0, 22)
Toggle.Font = Enum.Font.SourceSans
Toggle.Text = text
Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
Toggle.TextSize = 15.000
Toggle.TextXAlignment = Enum.TextXAlignment.Left

if (Toggle.AbsolutePosition.Y + 32 > Main.AbsolutePosition.Y + Main.AbsoluteSize.Y) then
    offsetX = offsetX + Toggle.AbsoluteSize.X + 6
    offsetY = 0
    Toggle.Position = UDim2.new(0, offsetX, 0, offsetY)
end

offsetY = offsetY + Toggle.AbsoluteSize.Y + 3 

Background.Name = "Background"
Background.Parent = Toggle
Background.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Background.BorderColor3 = Color3.fromRGB(27, 42, 53)
Background.BorderSizePixel = 0
Background.Position = UDim2.new(0.576666892, 0, 0.134285718, 0)
Background.Size = UDim2.new(0, 42, 0, 22)
Background.Font = Enum.Font.SourceSans
Background.Text = ""
Background.TextColor3 = Color3.fromRGB(0, 0, 0)
Background.TextSize = 14.000

OnOfToggle.Name = "OnOfToggle"
OnOfToggle.Parent = Background
OnOfToggle.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
OnOfToggle.Position = UDim2.new(0.5, 0, 0, 0)
OnOfToggle.Size = UDim2.new(0, 21, 0, 22)
OnOfToggle.Font = Enum.Font.SourceSans
OnOfToggle.Text = ""
OnOfToggle.TextColor3 = Color3.fromRGB(0, 0, 0)
OnOfToggle.TextSize = 14.000





local function Fire()
enabled = not enabled
OnOfToggle:TweenPosition(enabled and UDim2.new(-0, 0,0, 0) or UDim2.new(0.5, 0,0, 0), "InOut", "Linear", 0.2)
OnOfToggle.BackgroundColor3 = enabled and Color3.fromRGB(46, 255, 88) or Color3.fromRGB(255, 55, 37)
OnOfToggle.Text = enabled and utf8.char(10003) or ""
pcall(callback, enabled)

end
OnOfToggle.MouseButton1Click:Connect(Fire)
function actions:Set(arg)
    OnOfToggle:TweenPosition(enabled and UDim2.new(-0, 0,0, 0) or UDim2.new(0.5, 0,0, 0), "InOut", "Linear", 0.2)
    OnOfToggle.BackgroundColor3 = enabled and Color3.fromRGB(46, 255, 88) or Color3.fromRGB(255, 55, 37)
    pcall(callback, arg)




end
    end
    return funcs
end
return library
