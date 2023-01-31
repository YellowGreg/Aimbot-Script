--// Made By YellowGreg \\--
game:GetService("StarterGui"):SetCore("SendNotification",{
  Title = "AdvanceFalling Team",
    Text = "YellowGreg#7993 & MMSVon Bitches",
    Icon = "rbxthumb://type=Asset&id=9863339777&w=150&h=150",
    Duration = 8,
  }


--// i think this was the function but i dont give a fuck \\--
local Camera = workspace.CurrentCamera
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Holding = false
--// THE FUCKING SETTING SHIT \\--
  -- Main Setting
_G.AimbotEnabled = true
_G.TeamCheck = true --// If set to true then the script would only lock your aim at enemy team members.
_G.AimPart = "Head" --// Where the aimbot script would lock on at.
_G.Sensitivity = 0 --// How many seconds it takes for the aimbot script to officially lock onto the target's aimpart.
  -- FOVCircle Setting 
_G.CircleSides = 64 --// How many sides the FOV circle would have.
_G.CircleColor = Color3.fromRGB(255, 255, 255) --// (RGB) Color that the FOV circle would appear.
_G.CircleTransparency = 0.8 --// Transparency of the circle(its like invisible).
_G.CircleRadius = 80 --// The radius of the circle / FOV.
_G.CircleFilled = false --// Fill The Circle or Not.
_G.CircleVisible = true --// Make The Circle Go Away or Stay.
_G.CircleThickness = 0 --// The thickness of the circle.

--// The Fucking FOV Shit \\--
local CircleBitch = Drawing.new("Circle")
CircleBitch.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
CircleBitch.Radius = _G.CircleRadius
CircleBitch.Filled = _G.CircleFilled
CircleBitch.Color = _G.CircleColor
CircleBitch.Visible = _G.CircleVisible
CircleBitch.Radius = _G.CircleRadius
CircleBitch.Transparency = _G.CircleTransparency
CircleBitch.NumSides = _G.CircleSides
CircleBitch.Thickness = _G.CircleThickness
--// Aimbot Here Bitch \\--
local function GetClosestPlayer()
	local MaximumDistance = _G.CircleRadius
	local Target = nil
	for _, v in next, Players:GetPlayers() do
		if v.Name ~= LocalPlayer.Name then
			if _G.TeamCheck == true then
				if v.Team ~= LocalPlayer.Team then
					if v.Character ~= nil then
						if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
							if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
								local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
								local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
								if VectorDistance < MaximumDistance then
									Target = v
								end
							end
						end
					end
				end
      else
        if v.Character ~= nil then
					if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
						if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
							local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
							local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
							if VectorDistance < MaximumDistance then
								Target = v
							end
						end
					end
				end
			end
		end
	end
	return Target
end
UserInputService.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton2 then
        Holding = true
    end
end)
UserInputService.InputEnded:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton2 then
        Holding = false
    end
end)
--// Fov Shit Here i guess \\--
RunService.RenderStepped:Connect(function()
    CircleBitch.Position = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
    CircleBitch.Radius = _G.CircleRadius
    CircleBitch.Filled = _G.CircleFilled
    CircleBitch.Color = _G.CircleColor
    CircleBitch.Visible = _G.CircleVisible
    CircleBitch.Radius = _G.CircleRadius
    CircleBitch.Transparency = _G.CircleTransparency
    CircleBitch.NumSides = _G.CircleSides
    CircleBitch.Thickness = _G.CircleThickness

    if Holding == true and _G.AimbotEnabled == true then
        TweenService:Create(Camera, TweenInfo.new(_G.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(Camera.CFrame.Position, GetClosestPlayer().Character[_G.AimPart].Position)}):Play()
    end
end)
print("Made by YellowGreg, and MMSVon Gay Shit")
