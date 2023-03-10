local UIS = game:GetService("UserInputService")
local camera = game.Workspace.CurrentCamera

function getClosest()
  local closestPlayer = nil
  local closestDist = math.huge
  
  for i,v in pairs(game.Players:GetPlayers()) do
    if v ~= game.Players.LocalPlayer and v.Team ~= game.Players.LocalPlayer.Team then
      local Dist = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude
      if Dist < closestDist then
        closestDist = Dist
        closestPlayer = v
      end
    end
  end
  return closestPlayer
end

_G.aim = false
UIS.InputBegan:Connect(function(inp)
    if inp.UserInputType == Enum.UserInputType.MouseButton2 then
      _G.aim = true
      while wait() do
        camera.CFrame = CFrame.new(camera.CFrame.Position,getClosest().Character.Head.Position)
        if _G.aim == false then return end
      end
    end
  end)

UIS.InputEnded:Connect(function(inp)
    if inp.UserInputType == Enum.UserInputType.MouseButton2 then
      _G.aim = false
    end
end)
