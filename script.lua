-- ===================================================
-- 🔮 TELEKINESIS KING DAVE VVIP - LOADSTRING EDITION
-- ===================================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

local Holding = false
local TargetPart = nil
local HoldDistance = 0
local BodyPos, BodyGyro = nil, nil
local CrosshairVisible = true

local oldGui = LocalPlayer.PlayerGui:FindFirstChild("KingDaveLoadstringVVIP")
if oldGui then oldGui:Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KingDaveLoadstringVVIP"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 9999

-- Crosshair Dot Tengah
local CrosshairContainer = Instance.new("Frame")
CrosshairContainer.Name = "CrosshairDot"
CrosshairContainer.Size = UDim2.new(0, 6, 0, 6)
CrosshairContainer.AnchorPoint = Vector2.new(0.5, 0.5)
CrosshairContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
CrosshairContainer.BackgroundColor3 = Color3.fromRGB(180, 0, 255)
CrosshairContainer.BorderSizePixel = 0
CrosshairContainer.Parent = ScreenGui

local DotCorner = Instance.new("UICorner") DotCorner.CornerRadius = UDim.new(1, 0) DotCorner.Parent = CrosshairContainer
local DotStroke = Instance.new("UIStroke") DotStroke.Color = Color3.fromRGB(255, 255, 255) DotStroke.Thickness = 1 DotStroke.Parent = CrosshairContainer

-- Tombol Floating (Bontal) VVIP
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0, 55, 0, 55)
ToggleBtn.Position = UDim2.new(0.03, 0, 0.2, 0)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(15, 8, 28)
ToggleBtn.Text = "👑🧲"
ToggleBtn.TextSize = 22
ToggleBtn.Active = true
ToggleBtn.Draggable = true
ToggleBtn.Parent = ScreenGui

local BtnCorner = Instance.new("UICorner") BtnCorner.CornerRadius = UDim.new(1, 0) BtnCorner.Parent = ToggleBtn
local BtnStroke = Instance.new("UIStroke") BtnStroke.Color = Color3.fromRGB(180, 0, 255) BtnStroke.Thickness = 3 BtnStroke.Parent = ToggleBtn

-- Panel Utama Phantom VVIP
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 280, 0, 245)
MainFrame.Position = UDim2.new(0.12, 0, 0.18, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 8, 20)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

local FrameCorner = Instance.new("UICorner") FrameCorner.CornerRadius = UDim.new(0, 12) FrameCorner.Parent = MainFrame
local FrameStroke = Instance.new("UIStroke") FrameStroke.Color = Color3.fromRGB(180, 0, 255) FrameStroke.Thickness = 2.5 FrameStroke.Parent = MainFrame

-- Watermark Background Naga
local BgLogo = Instance.new("TextLabel")
BgLogo.Size = UDim2.new(1, 0, 1, 0)
BgLogo.Position = UDim2.new(0, 0, 0, 10)
BgLogo.BackgroundTransparency = 1
BgLogo.Text = "🐉"
BgLogo.TextSize = 130
BgLogo.TextTransparency = 0.88
BgLogo.ZIndex = 1
BgLogo.Parent = MainFrame

-- Header Bar
local HeaderBar = Instance.new("Frame")
HeaderBar.Size = UDim2.new(1, 0, 0, 40)
HeaderBar.BackgroundColor3 = Color3.fromRGB(25, 12, 45)
HeaderBar.BorderSizePixel = 0
HeaderBar.ZIndex = 2
HeaderBar.Parent = MainFrame

local HeaderStroke = Instance.new("UIStroke") HeaderStroke.Color = Color3.fromRGB(180, 0, 255) HeaderStroke.Thickness = 1 HeaderStroke.Parent = HeaderBar

local HeaderIcon = Instance.new("TextLabel")
HeaderIcon.Size = UDim2.new(0, 35, 1, 0) HeaderIcon.Position = UDim2.new(0.02, 0, 0, 0)
HeaderIcon.BackgroundTransparency = 1 HeaderIcon.Text = "🧲" HeaderIcon.TextSize = 18 HeaderIcon.ZIndex = 2 HeaderIcon.Parent = HeaderBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(0, 180, 1, 0) TitleLabel.Position = UDim2.new(0.15, 0, 0, 0)
TitleLabel.BackgroundTransparency = 1 TitleLabel.Text = "TELEKINESIS KING DAVE" TitleLabel.TextColor3 = Color3.fromRGB(240, 200, 255) TitleLabel.TextSize = 10 TitleLabel.Font = Enum.Font.GothamBold TitleLabel.TextXAlignment = Enum.TextXAlignment.Left TitleLabel.ZIndex = 2 TitleLabel.Parent = HeaderBar

local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0, 28, 0, 28) MinBtn.Position = UDim2.new(0.72, 0, 0.15, 0)
MinBtn.BackgroundColor3 = Color3.fromRGB(255, 180, 0) MinBtn.Text = "-" MinBtn.TextColor3 = Color3.fromRGB(0, 0, 0) MinBtn.TextSize = 16 MinBtn.Font = Enum.Font.GothamBold MinBtn.ZIndex = 2 MinBtn.Parent = HeaderBar
local MinC = Instance.new("UICorner") MinC.CornerRadius = UDim.new(1, 0) MinC.Parent = MinBtn

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 28, 0, 28) CloseBtn.Position = UDim2.new(0.86, 0, 0.15, 0)
CloseBtn.BackgroundColor3 = Color3.fromRGB(230, 40, 60) CloseBtn.Text = "X" CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255) CloseBtn.TextSize = 12 CloseBtn.Font = Enum.Font.GothamBold CloseBtn.ZIndex = 2 CloseBtn.Parent = HeaderBar
local CloseC = Instance.new("UICorner") CloseC.CornerRadius = UDim.new(1, 0) CloseC.Parent = CloseBtn

-- Tombol Utama Bahasa Indonesia
local GrabBtn = Instance.new("TextButton")
GrabBtn.Size = UDim2.new(0.9, 0, 0, 48) GrabBtn.Position = UDim2.new(0.05, 0, 0.24, 0)
GrabBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 70) GrabBtn.Text = "🖐️ PEGANG OBJEK : MATI" GrabBtn.TextColor3 = Color3.fromRGB(255, 255, 255) GrabBtn.TextSize = 11 GrabBtn.Font = Enum.Font.GothamBold GrabBtn.ZIndex = 2 GrabBtn.Parent = MainFrame
local GC = Instance.new("UICorner") GC.CornerRadius = UDim.new(0, 8) GC.Parent = GrabBtn
local GS = Instance.new("UIStroke") GS.Color = Color3.fromRGB(255, 120, 130) GS.Thickness = 1.5 GS.Parent = GrabBtn

local FreezeBtn = Instance.new("TextButton")
FreezeBtn.Size = UDim2.new(0.9, 0, 0, 48) FreezeBtn.Position = UDim2.new(0.05, 0, 0.47, 0)
FreezeBtn.BackgroundColor3 = Color3.fromRGB(70, 130, 240) FreezeBtn.Text = "🔒 BEKUKAN OBJEK (FREEZE)" FreezeBtn.TextColor3 = Color3.fromRGB(255, 255, 255) FreezeBtn.TextSize = 11 FreezeBtn.Font = Enum.Font.GothamBold FreezeBtn.ZIndex = 2 FreezeBtn.Parent = MainFrame
local FC = Instance.new("UICorner") FC.CornerRadius = UDim.new(0, 8) FC.Parent = FreezeBtn
local FS = Instance.new("UIStroke") FS.Color = Color3.fromRGB(150, 200, 255) FS.Thickness = 1.5 FS.Parent = FreezeBtn

local CrosshairToggleBtn = Instance.new("TextButton")
CrosshairToggleBtn.Size = UDim2.new(0.9, 0, 0, 32) CrosshairToggleBtn.Position = UDim2.new(0.05, 0, 0.71, 0)
CrosshairToggleBtn.BackgroundColor3 = Color3.fromRGB(30, 15, 50) CrosshairToggleBtn.Text = "👁️ TITIK BIDIK : TAMPILKAN" CrosshairToggleBtn.TextColor3 = Color3.fromRGB(200, 150, 255) CrosshairToggleBtn.TextSize = 10 CrosshairToggleBtn.Font = Enum.Font.GothamMedium CrosshairToggleBtn.ZIndex = 2 CrosshairToggleBtn.Parent = MainFrame
local CC = Instance.new("UICorner") CC.CornerRadius = UDim.new(0, 6) CC.Parent = CrosshairToggleBtn
local CS = Instance.new("UIStroke") CS.Color = Color3.fromRGB(180, 0, 255) CS.Thickness = 1 CS.Parent = CrosshairToggleBtn

local FooterLabel = Instance.new("TextLabel")
FooterLabel.Size = UDim2.new(1, 0, 0, 22) FooterLabel.Position = UDim2.new(0, 0, 0.88, 0)
FooterLabel.BackgroundTransparency = 1 FooterLabel.Text = "by KING DAVE" FooterLabel.TextColor3 = Color3.fromRGB(160, 120, 200) FooterLabel.TextSize = 10 FooterLabel.Font = Enum.Font.GothamBold FooterLabel.ZIndex = 2 FooterLabel.Parent = MainFrame

-- Logika Telekinesis & Fix Airdrop
ToggleBtn.MouseButton1Click:Connect(function() MainFrame.Visible = not MainFrame.Visible end)
MinBtn.MouseButton1Click:Connect(function() MainFrame.Visible = false end)
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

local function StopHolding()
    Holding = false
    GrabBtn.Text = "🖐️ PEGANG OBJEK : MATI"
    GrabBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 70)
    GS.Color = Color3.fromRGB(255, 120, 130)
    if BodyPos then BodyPos:Destroy() BodyPos = nil end
    if BodyGyro then BodyGyro:Destroy() BodyGyro = nil end
    if TargetPart then
        TargetPart.AssemblyLinearVelocity = Vector3.zero
        TargetPart.AssemblyAngularVelocity = Vector3.zero
        TargetPart.Anchored = true
        TargetPart = nil
    end
end

local function StartHoldingPart(part)
    if not part then return end
    TargetPart = part
    TargetPart.Anchored = false
    if TargetPart.Parent and TargetPart.Parent:IsA("Model") then
        for _, p in pairs(TargetPart.Parent:GetDescendants()) do
            if p:IsA("BasePart") then p.Anchored = false p.CustomPhysicalProperties = PhysicalProperties.new(0.001, 0, 0, 0, 0) end
        end
    else
        TargetPart.CustomPhysicalProperties = PhysicalProperties.new(0.001, 0, 0, 0, 0)
    end
    Holding = true
    HoldDistance = (Camera.CFrame.Position - TargetPart.Position).Magnitude
    if HoldDistance < 4 then HoldDistance = 4 end
    if HoldDistance > 60 then HoldDistance = 30 end

    GrabBtn.Text = "🖐️ PEGANG OBJEK : AKTIF"
    GrabBtn.BackgroundColor3 = Color3.fromRGB(0, 210, 90)
    GS.Color = Color3.fromRGB(255, 255, 255)

    BodyPos = Instance.new("BodyPosition")
    BodyPos.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    BodyPos.Position = TargetPart.Position
    BodyPos.P = 500000 BodyPos.D = 800 BodyPos.Parent = TargetPart

    BodyGyro = Instance.new("BodyGyro")
    BodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    BodyGyro.CFrame = TargetPart.CFrame
    BodyGyro.P = 500000 BodyGyro.D = 800 BodyGyro.Parent = TargetPart
end

local function GetTargetInCrosshair()
    local char = LocalPlayer.Character
    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Exclude
    if char then raycastParams.FilterDescendantsInstances = {char} end
    local rayResult = Workspace:Raycast(Camera.CFrame.Position, Camera.Camera.CFrame.LookVector * 250, raycastParams)
    if rayResult and rayResult.Instance and not rayResult.Instance:IsDescendantOf(char) then return rayResult.Instance end
    
    local closestPart = nil
    local shortestDist = 18
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("BasePart") and obj.Parent ~= char and not obj:IsDescendantOf(char) then
            local screenPos, onScreen = Camera:WorldToViewportPoint(obj.Position)
            if onScreen then
                local centerScreen = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                local distFromCenter = (Vector2.new(screenPos.X, screenPos.Y) - centerScreen).Magnitude
                if distFromCenter < shortestDist then closestPart = obj end
            end
        end
    end
    return closestPart
end

GrabBtn.MouseButton1Click:Connect(function()
    if Holding then StopHolding() else
        local target = GetTargetInCrosshair()
        if target then StartHoldingPart(target) else
            GrabBtn.Text = "❌ TIDAK ADA OBJEK!"
            task.wait(1)
            if not Holding then GrabBtn.Text = "🖐️ PEGANG OBJEK : MATI" end
        end
    end
end)

FreezeBtn.MouseButton1Click:Connect(function()
    if TargetPart then
        TargetPart.Anchored = not TargetPart.Anchored
        if TargetPart.Anchored then
            FreezeBtn.Text = "🧊 BERHASIL DIBEKUKAN!"
            StopHolding()
            task.wait(1)
            FreezeBtn.Text = "🔒 BEKUKAN OBJEK (FREEZE)"
        end
    end
end)

CrosshairToggleBtn.MouseButton1Click:Connect(function()
    CrosshairVisible = not CrosshairVisible
    CrosshairContainer.Visible = CrosshairVisible
    CrosshairToggleBtn.Text = CrosshairVisible and "👁️ TITIK BIDIK : TAMPILKAN" or "🙈 TITIK BIDIK : SEMBUNYIKAN"
end)

RunService.RenderStepped:Connect(function()
    if Holding and TargetPart and BodyPos and BodyGyro then
        if not TargetPart.Parent then StopHolding() return end
        TargetPart.AssemblyLinearVelocity = Vector3.zero
        TargetPart.AssemblyAngularVelocity = Vector3.zero
        local targetCFrame = Camera.CFrame * CFrame.new(0, 0, -HoldDistance)
        BodyPos.Position = targetCFrame.Position
        BodyGyro.CFrame = targetCFrame
    end
end)

StarterGui:SetCore("SendNotification", { Title = "TELEKINESIS KING DAVE", Text = "Loadstring Successfully Executed!", Duration = 5 })
