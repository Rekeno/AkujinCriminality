

local s, r = pcall(game.HttpGet, game, 'https://raw.githubusercontent.com/wally-rblx/roblox-scripts/main/criminality_esp.lua')
if s and loadstring(r) then
   pcall(loadstring(r))
else
   setclipboard("FAIL")
end

loadstring(game:HttpGet("https://pastebin.com/raw/ZQzw4tBr"))()

-- START OF MY SCRIPT: VVVVVV

local TextTemplate = "[%s] - [%s]\n[%s]\n[%s] - [%s]" -- Name, DisplayName, Visible, Health, Holding

local Camera = game.Workspace.CurrentCamera
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local ESP = {}

function WorldToScreen(Position)
    local Screen, OnScreen = Camera:WorldToViewportPoint(Position)
    return Vector2.new(Screen.x, Screen.y), OnScreen 
end

local CreateESP = function(Player, Options) -- CreateESP({Part, Text, Color, Position, Size})
    if Options == nil then return end

    local Part = Player.Character.Head
    local Position, OnSCreen = WorldToScreen(Part.Position)

    local Object = Drawing.new("Text")

    local Tool = Player.Character:FindFirstChildOfClass("Tool") or {Name = "NIL"}
    local Text = TextTemplate:format(Player.Name, Player.DisplayName, math.floor(Player.Character.Humanoid.Health), "OFF-Screen", Tool.Name) -- Name, DisplayName, Health, Holding
    
    Object.Color = Options.Color or Color3.new(1,1,1)
    Object.Position = Position
    Object.Size = Options.Size or 19
    Object.Outline = true
    Object.Center = true
    Object.Visible = true

    game:GetService('RunService').Stepped:Connect(function()
        pcall(function()
            local WorkspaceDescendant = Part:IsDescendantOf(game.Workspace)

            if not WorkspaceDescendant then Object:Remove() end

            local Position, OnScreen = WorldToScreen(Part.Position)

            if Part ~= nil then
                Object.Position = Position
                local Ray = Ray.new(workspace.CurrentCamera.CFrame.p, (Player.Character.HumanoidRootPart.Position - workspace.CurrentCamera.CFrame.p).unit * 2048)
				local block = workspace:FindPartOnRayWithIgnoreList(Ray, {game.Players.LocalPlayer.Character})
                local Visible = "OFF-Screen"
                print(block)
                if block ~= nil then
                    if block:IsDescendantOf(Player.Character) then
                        Visible = "VISIBLE"
                    end
                end
                local Tool = Player.Character:FindFirstChildOfClass("Tool") or {Name = "NIL"}
                local Text = TextTemplate:format(Player.Name, Player.DisplayName, math.floor(Player.Character.Humanoid.Health), Visible, Tool.Name) -- Name, DisplayName, Health, Holding
                Object.Text = Text
            end

            Object.Visible = OnScreen
        end)
    end)
end

local FriendsList = {Ethangodatgame = "Ethangodatgame", Luna_luff = "Luna_luff", Stanleyisgodatgame = "Stanleyisgodatgame", V7IKU = "V7IKU", mrmrmrmrmrsas = "mrmrmrmrmrsas", IlIIlllIlIIlIIlIlIIl = "IlIIlllIlIIlIIlIlIIl"}

function Simply(Player)
    if FriendsList[Player.Name] then
        CreateESP(Player, {Color = Color3.new(1,1,1)})
    else
        CreateESP(Player, {Color = Color3.new(0,1,1)})
    end
end

-- Gui to Lua
-- Version: 3.2

-- Instances:

local Compass = Instance.new("ScreenGui")
local Compass_2 = Instance.new("Frame")
local SW = Instance.new("TextLabel")
local W = Instance.new("TextLabel")
local SE = Instance.new("TextLabel")
local S = Instance.new("TextLabel")
local NW = Instance.new("TextLabel")
local NE = Instance.new("TextLabel")
local N = Instance.new("TextLabel")
local E = Instance.new("TextLabel")

--Properties:

syn.protect_gui(Compass)

Compass.Name = "Compass"
Compass.Parent = game.CoreGui
Compass.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Compass_2.Name = "Compass"
Compass_2.Parent = Compass
Compass_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Compass_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Compass_2.BorderSizePixel = 0
Compass_2.ClipsDescendants = true
Compass_2.Position = UDim2.new(0.437999994, -50, 0.0500000007, 0)
Compass_2.Size = UDim2.new(0, 308, 0, 37)

SW.Name = "SW"
SW.Parent = Compass_2
SW.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SW.BackgroundTransparency = 1.000
SW.BorderColor3 = Color3.fromRGB(0, 0, 0)
SW.BorderSizePixel = 0
SW.Position = UDim2.new(0.0757359117, -15, 0, 3)
SW.Size = UDim2.new(0.0513514727, 30, 1, -6)
SW.Visible = false
SW.ZIndex = 2
SW.Font = Enum.Font.GothamBlack
SW.Text = "SW"
SW.TextColor3 = Color3.fromRGB(255, 255, 255)
SW.TextSize = 26.000
SW.TextStrokeTransparency = 0.000
SW.TextWrapped = true

W.Name = "W"
W.Parent = Compass_2
W.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
W.BackgroundTransparency = 1.000
W.BorderColor3 = Color3.fromRGB(0, 0, 0)
W.BorderSizePixel = 0
W.Position = UDim2.new(-0.100000009, -10, 0, 3)
W.Size = UDim2.new(0.0292207971, 20, 1, -6)
W.Visible = false
W.ZIndex = 2
W.Font = Enum.Font.GothamBlack
W.Text = "W"
W.TextColor3 = Color3.fromRGB(255, 255, 255)
W.TextSize = 26.000
W.TextStrokeTransparency = 0.000
W.TextWrapped = true

SE.Name = "SE"
SE.Parent = Compass_2
SE.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SE.BackgroundTransparency = 1.000
SE.BorderColor3 = Color3.fromRGB(0, 0, 0)
SE.BorderSizePixel = 0
SE.Position = UDim2.new(0.894534349, -15, 0, 3)
SE.Size = UDim2.new(0.0297296699, 30, 1, -6)
SE.Visible = false
SE.ZIndex = 2
SE.Font = Enum.Font.GothamBlack
SE.Text = "SE"
SE.TextColor3 = Color3.fromRGB(255, 255, 255)
SE.TextSize = 26.000
SE.TextStrokeTransparency = 0.000
SE.TextWrapped = true

S.Name = "S"
S.Parent = Compass_2
S.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
S.BackgroundTransparency = 1.000
S.BorderColor3 = Color3.fromRGB(0, 0, 0)
S.BorderSizePixel = 0
S.Position = UDim2.new(0.5, -10, 0, 3)
S.Size = UDim2.new(0, 20, 1, -6)
S.Visible = false
S.ZIndex = 2
S.Font = Enum.Font.GothamBlack
S.Text = "S"
S.TextColor3 = Color3.fromRGB(255, 255, 255)
S.TextSize = 26.000
S.TextStrokeTransparency = 0.000
S.TextWrapped = true

NW.Name = "NW"
NW.Parent = Compass_2
NW.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
NW.BackgroundTransparency = 1.000
NW.BorderColor3 = Color3.fromRGB(0, 0, 0)
NW.BorderSizePixel = 0
NW.Position = UDim2.new(0.0757359713, -15, 0, 3)
NW.Size = UDim2.new(0.0513513498, 30, 1, -6)
NW.ZIndex = 2
NW.Font = Enum.Font.GothamBlack
NW.Text = "NW"
NW.TextColor3 = Color3.fromRGB(255, 255, 255)
NW.TextSize = 26.000
NW.TextStrokeTransparency = 0.000
NW.TextWrapped = true

NE.Name = "NE"
NE.Parent = Compass_2
NE.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
NE.BackgroundTransparency = 1.000
NE.BorderColor3 = Color3.fromRGB(0, 0, 0)
NE.BorderSizePixel = 0
NE.Position = UDim2.new(0.894534409, -15, 0, 3)
NE.Size = UDim2.new(0.0297297295, 30, 1, -6)
NE.ZIndex = 2
NE.Font = Enum.Font.GothamBlack
NE.Text = "NE"
NE.TextColor3 = Color3.fromRGB(255, 255, 255)
NE.TextSize = 26.000
NE.TextStrokeTransparency = 0.000
NE.TextWrapped = true

N.Name = "N"
N.Parent = Compass_2
N.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
N.BackgroundTransparency = 1.000
N.BorderColor3 = Color3.fromRGB(0, 0, 0)
N.BorderSizePixel = 0
N.Position = UDim2.new(0.5, -10, 0, 3)
N.Size = UDim2.new(0, 20, 1, -6)
N.ZIndex = 2
N.Font = Enum.Font.GothamBlack
N.Text = "N"
N.TextColor3 = Color3.fromRGB(255, 255, 255)
N.TextSize = 26.000
N.TextStrokeTransparency = 0.000
N.TextWrapped = true

E.Name = "E"
E.Parent = Compass_2
E.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
E.BackgroundTransparency = 1.000
E.BorderColor3 = Color3.fromRGB(0, 0, 0)
E.BorderSizePixel = 0
E.Position = UDim2.new(1.10000002, -10, 0, 3)
E.Size = UDim2.new(0.0162337665, 20, 1, -6)
E.Visible = false
E.ZIndex = 2
E.Font = Enum.Font.GothamBlack
E.Text = "E"
E.TextColor3 = Color3.fromRGB(255, 255, 255)
E.TextSize = 26.000
E.TextStrokeTransparency = 0.000
E.TextWrapped = true

local smoothness = 30/3

wait(1)

local player = game.Players.LocalPlayer
local camera = workspace.CurrentCamera

local dev = Compass_2

local lastY = 0
local units = {
	[dev.N ] = -math.pi * 4/4;
	[dev.NE] = -math.pi * 3/4;
	[dev.E ] = -math.pi * 2/4;
	[dev.SE] = -math.pi * 1/4;
	[dev.S ] =  math.pi * 0/4;
	[dev.SW] =  math.pi * 1/4;
	[dev.W ] =  math.pi * 2/4;
	[dev.NW] =  math.pi * 3/4;
}

function restrictAngle(angle)
	if angle < -math.pi then
		return angle + math.pi*2
	elseif angle > math.pi then
		return angle - math.pi*2
	else
		return angle
	end
end

task.spawn(function()
    while true do
        local delta = wait(1/30)

        local look = camera.CoordinateFrame.lookVector
        local look = Vector3.new(look.x, 0, look.z).unit
        local lookY = math.atan2(look.z, look.x)

        local difY = restrictAngle(lookY - lastY)
        lookY = restrictAngle(lastY + difY*delta*smoothness)
        lastY = lookY

        for unit, rot in pairs(units) do
            rot = restrictAngle(lookY - rot)
            if math.sin(rot) > 0 then
                local cosRot = math.cos(rot)
                local cosRot2 = cosRot*cosRot

                unit.Visible = true
                unit.Position = UDim2.new(0.5 + cosRot*0.6, unit.Position.X.Offset, 0, 3)
            else
                unit.Visible = false
            end
        end
    end
end)
-- COMPASS END

game.Players.PlayerAdded:Connect(function(Player)
    Player.CharacterAdded:Connect(function()
        wait(5)
        Simply(Player)
    end)
end)

for i,v in pairs(game.Players:GetPlayers()) do
    if v ~= game.Players.LocalPlayer then
        v.CharacterAdded:Connect(function()
            wait(5)
            Simply(v)
        end)
        Simply(v)
    end
end
