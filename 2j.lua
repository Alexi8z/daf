wait (10)



for i,v in next, game.CoreGui:GetChildren() do if v.Name == "Taunts" then v:Destroy() end end

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local dancing = false

local TauntUI = game:GetObjects("rbxassetid://5478726847")[1]
TauntUI.Parent = game.CoreGui
TauntUI.Main.EmotesWheel.Visible = false

local cursor = Instance.new("ImageLabel")
cursor.Name = "cursor"
cursor.Parent = TauntUI
cursor.BackgroundTransparency = 1
cursor.Size = UDim2.new(0,15,0,15)
cursor.Image = "rbxassetid://518398610"
cursor.ZIndex = 100

UserInputService.InputBegan:connect(function(key)
	if key.KeyCode == Enum.KeyCode.Comma then
		TauntUI.Main.EmotesWheel.Visible = not TauntUI.Main.EmotesWheel.Visible
	end
end)

for i,v in next, TauntUI.Main.EmotesWheel.Front.EmotesButtons:GetChildren() do
	v.MouseButton1Click:connect(function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") and not dancing then
            TauntUI.Main.EmotesWheel.Visible = false
            dancing = true
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://"..v.anim.Value
            local loadedanim = LocalPlayer.Character.Humanoid:LoadAnimation(anim)
            loadedanim:Play()
            spawn(function()
                while dancing do wait()
                    LocalPlayer.CameraMaxZoomDistance = 10
                    LocalPlayer.CameraMinZoomDistance = 10
                end
            end)
            spawn(function()
				wait(loadedanim.Length)
				dancing = false
                pcall(function()
                    loadedanim:Stop()
                end)
				wait(0.5)
				dancing = true
				for i=1,10 do wait()
					LocalPlayer.CameraMode = "Classic"
					LocalPlayer.CameraMaxZoomDistance = 0
					LocalPlayer.CameraMinZoomDistance = 0
				end
				dancing = false
            end)
        end
    end)
end

game:GetService("RunService").RenderStepped:connect(function()
	cursor.Visible = TauntUI.Main.EmotesWheel.Visible
	cursor.Position = UDim2.new(0,Mouse.X,0,Mouse.Y)
end)
