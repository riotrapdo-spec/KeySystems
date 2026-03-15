--[[
    ╔═══════════════════════════════════════════════════════╗
    ║         GOLDEN v1 BETA - KEY SYSTEM                  ║
    ║              Created by: Golden                       ║
    ║                                                       ║
    ║  © 2025 Golden. All Rights Reserved.                  ║
    ║  Unauthorized redistribution is prohibited.           ║
    ║  Discord: https://discord.gg/zZF5FJ6Qs               ║
    ╚═══════════════════════════════════════════════════════╝
]]

if game:GetService("CoreGui"):FindFirstChild("GoldenKeySystem") then
    game:GetService("CoreGui"):FindFirstChild("GoldenKeySystem"):Destroy()
end

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local Player = Players.LocalPlayer

local VALID_KEYS = {
    "GOLDEN-FREE-2025",
    "GOLDEN-VIP-HUB",
    "GOLDEN-BETA-KEY",
    "GOLDEN-YOUTUBE",
    "GOLDEN-DISCORD",
    "GOLDEN-PREMIUM",
    "GOLDEN-V1-ACCESS",
    "GOLDEN-SCRIPT-HUB",
}

local DISCORD_LINK = "https://discord.gg/zZF5FJ6Qs"
local SCRIPT_URL = "https://raw.githubusercontent.com/riotrapdo-spec/KeySystems/refs/heads/main/Brheven.txt"

local function Create(class, props)
    local inst = Instance.new(class)
    for k, v in pairs(props or {}) do
        if k ~= "Parent" then inst[k] = v end
    end
    if props and props.Parent then inst.Parent = props.Parent end
    return inst
end

local function Tween(obj, dur, props, style, dir)
    local t = TweenService:Create(obj, TweenInfo.new(dur, style or Enum.EasingStyle.Quint, dir or Enum.EasingDirection.Out), props)
    t:Play()
    return t
end

local function Corner(parent, r)
    return Create("UICorner", {CornerRadius = UDim.new(0, r or 8), Parent = parent})
end

local function Stroke(parent, col, thick, trans)
    return Create("UIStroke", {Color = col or Color3.fromRGB(255, 185, 0), Thickness = thick or 1, Transparency = trans or 0.6, Parent = parent})
end

local Gold = Color3.fromRGB(255, 185, 0)
local DarkGold = Color3.fromRGB(200, 140, 0)
local LightGold = Color3.fromRGB(255, 225, 100)
local BG = Color3.fromRGB(12, 12, 18)
local Card = Color3.fromRGB(20, 20, 30)
local InputBG = Color3.fromRGB(25, 25, 38)
local White = Color3.fromRGB(255, 255, 255)
local Sub = Color3.fromRGB(160, 160, 175)
local Dim = Color3.fromRGB(100, 100, 115)
local Green = Color3.fromRGB(70, 210, 90)
local Red = Color3.fromRGB(255, 55, 55)
local DiscordColor = Color3.fromRGB(88, 101, 242)

local ScreenGui = Create("ScreenGui", {
    Name = "GoldenKeySystem",
    Parent = CoreGui,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    ResetOnSpawn = false,
    DisplayOrder = 9999,
})

local Overlay = Create("Frame", {
    Parent = ScreenGui,
    BackgroundColor3 = Color3.new(0, 0, 0),
    BackgroundTransparency = 1,
    Size = UDim2.new(1, 0, 1, 0),
    ZIndex = 1,
})

local KeyCard = Create("Frame", {
    Parent = ScreenGui,
    BackgroundColor3 = BG,
    BackgroundTransparency = 0.02,
    Position = UDim2.new(0.5, 0, 0.5, 0),
    Size = UDim2.new(0, 0, 0, 0),
    AnchorPoint = Vector2.new(0.5, 0.5),
    ClipsDescendants = true,
    ZIndex = 10,
})
Corner(KeyCard, 16)
Stroke(KeyCard, Gold, 1.5, 0.35)

Create("ImageLabel", {
    Parent = KeyCard,
    BackgroundTransparency = 1,
    Position = UDim2.new(0.5, 0, 0.5, 0),
    Size = UDim2.new(1, 100, 1, 100),
    AnchorPoint = Vector2.new(0.5, 0.5),
    Image = "rbxassetid://5028857084",
    ImageColor3 = Gold,
    ImageTransparency = 0.9,
    ScaleType = Enum.ScaleType.Slice,
    SliceCenter = Rect.new(24, 24, 276, 276),
    ZIndex = 9,
})

local Header = Create("Frame", {
    Parent = KeyCard,
    BackgroundColor3 = Card,
    BackgroundTransparency = 0.3,
    Size = UDim2.new(1, 0, 0, 70),
    ZIndex = 11,
    BorderSizePixel = 0,
})
Corner(Header, 16)
Create("Frame", {
    Parent = Header,
    BackgroundColor3 = Card,
    BackgroundTransparency = 0.3,
    Size = UDim2.new(1, 0, 0, 20),
    Position = UDim2.new(0, 0, 1, -20),
    ZIndex = 11,
    BorderSizePixel = 0,
})

local AccLine = Create("Frame", {
    Parent = Header,
    BackgroundColor3 = Gold,
    BackgroundTransparency = 0.15,
    Size = UDim2.new(1, 0, 0, 2),
    Position = UDim2.new(0, 0, 1, -2),
    ZIndex = 12,
    BorderSizePixel = 0,
})

local AccGrad = Create("UIGradient", {
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, DarkGold),
        ColorSequenceKeypoint.new(0.5, LightGold),
        ColorSequenceKeypoint.new(1, DarkGold),
    }),
    Parent = AccLine,
})

task.spawn(function()
    while ScreenGui.Parent do
        Tween(AccGrad, 2.5, {Offset = Vector2.new(1, 0)}, Enum.EasingStyle.Linear)
        task.wait(2.5)
        AccGrad.Offset = Vector2.new(-1, 0)
    end
end)

Create("TextLabel", {
    Parent = Header,
    BackgroundTransparency = 1,
    Position = UDim2.new(0.5, 0, 0, 8),
    Size = UDim2.new(1, 0, 0, 28),
    AnchorPoint = Vector2.new(0.5, 0),
    Font = Enum.Font.GothamBlack,
    Text = "GOLDEN v1 Beta",
    TextSize = 20,
    TextColor3 = Gold,
    ZIndex = 12,
})

Create("TextLabel", {
    Parent = Header,
    BackgroundTransparency = 1,
    Position = UDim2.new(0.5, 0, 0, 38),
    Size = UDim2.new(1, 0, 0, 18),
    AnchorPoint = Vector2.new(0.5, 0),
    Font = Enum.Font.Gotham,
    Text = "Key System | Credit: Golden",
    TextSize = 11,
    TextColor3 = Sub,
    TextTransparency = 0.2,
    ZIndex = 12,
})

Create("TextLabel", {
    Parent = KeyCard,
    BackgroundTransparency = 1,
    Position = UDim2.new(0.5, 0, 0, 82),
    Size = UDim2.new(0, 60, 0, 40),
    AnchorPoint = Vector2.new(0.5, 0),
    Text = "🔒",
    TextSize = 32,
    ZIndex = 11,
})

Create("TextLabel", {
    Parent = KeyCard,
    BackgroundTransparency = 1,
    Position = UDim2.new(0.5, 0, 0, 125),
    Size = UDim2.new(1, -40, 0, 20),
    AnchorPoint = Vector2.new(0.5, 0),
    Font = Enum.Font.GothamSemibold,
    Text = "Enter your key to unlock the hub",
    TextSize = 13,
    TextColor3 = White,
    ZIndex = 11,
})

Create("TextLabel", {
    Parent = KeyCard,
    BackgroundTransparency = 1,
    Position = UDim2.new(0.5, 0, 0, 145),
    Size = UDim2.new(1, -40, 0, 16),
    AnchorPoint = Vector2.new(0.5, 0),
    Font = Enum.Font.Gotham,
    Text = "Get your key from our Discord server below",
    TextSize = 10,
    TextColor3 = Dim,
    ZIndex = 11,
})

local InputFrame = Create("Frame", {
    Parent = KeyCard,
    BackgroundColor3 = InputBG,
    BackgroundTransparency = 0.15,
    Position = UDim2.new(0.5, 0, 0, 175),
    Size = UDim2.new(1, -50, 0, 42),
    AnchorPoint = Vector2.new(0.5, 0),
    ZIndex = 11,
})
Corner(InputFrame, 10)
local InputStroke = Stroke(InputFrame, Gold, 1, 0.7)

local KeyInput = Create("TextBox", {
    Parent = InputFrame,
    BackgroundTransparency = 1,
    Position = UDim2.new(0, 15, 0, 0),
    Size = UDim2.new(1, -30, 1, 0),
    Font = Enum.Font.GothamSemibold,
    Text = "",
    PlaceholderText = "GOLDEN-XXXX-XXXX",
    PlaceholderColor3 = Dim,
    TextSize = 14,
    TextColor3 = Gold,
    ClearTextOnFocus = false,
    ZIndex = 12,
})

KeyInput.Focused:Connect(function()
    Tween(InputStroke, 0.25, {Transparency = 0.2, Color = Gold})
    Tween(InputFrame, 0.25, {BackgroundTransparency = 0.05})
end)
KeyInput.FocusLost:Connect(function()
    Tween(InputStroke, 0.25, {Transparency = 0.7})
    Tween(InputFrame, 0.25, {BackgroundTransparency = 0.15})
end)

local StatusLabel = Create("TextLabel", {
    Parent = KeyCard,
    BackgroundTransparency = 1,
    Position = UDim2.new(0.5, 0, 0, 223),
    Size = UDim2.new(1, -50, 0, 18),
    AnchorPoint = Vector2.new(0.5, 0),
    Font = Enum.Font.GothamSemibold,
    Text = "",
    TextSize = 11,
    TextColor3 = Red,
    TextTransparency = 1,
    ZIndex = 11,
})

local function SetStatus(text, color, duration)
    StatusLabel.Text = text
    StatusLabel.TextColor3 = color or Red
    Tween(StatusLabel, 0.3, {TextTransparency = 0})
    if duration then
        task.delay(duration, function()
            Tween(StatusLabel, 0.3, {TextTransparency = 1})
        end)
    end
end

local CheckBtn = Create("TextButton", {
    Parent = KeyCard,
    BackgroundColor3 = Gold,
    BackgroundTransparency = 0.1,
    Position = UDim2.new(0.5, 0, 0, 248),
    Size = UDim2.new(1, -50, 0, 40),
    AnchorPoint = Vector2.new(0.5, 0),
    Font = Enum.Font.GothamBlack,
    Text = "CHECK KEY",
    TextSize = 14,
    TextColor3 = BG,
    AutoButtonColor = false,
    ZIndex = 12,
    BorderSizePixel = 0,
})
Corner(CheckBtn, 10)

CheckBtn.MouseEnter:Connect(function()
    Tween(CheckBtn, 0.2, {BackgroundTransparency = 0, Size = UDim2.new(1, -46, 0, 42)})
end)
CheckBtn.MouseLeave:Connect(function()
    Tween(CheckBtn, 0.2, {BackgroundTransparency = 0.1, Size = UDim2.new(1, -50, 0, 40)})
end)

local DiscordBtn = Create("TextButton", {
    Parent = KeyCard,
    BackgroundColor3 = DiscordColor,
    BackgroundTransparency = 0.15,
    Position = UDim2.new(0.5, 0, 0, 296),
    Size = UDim2.new(1, -50, 0, 36),
    AnchorPoint = Vector2.new(0.5, 0),
    Font = Enum.Font.GothamBold,
    Text = "Copy Discord Invite",
    TextSize = 12,
    TextColor3 = White,
    AutoButtonColor = false,
    ZIndex = 12,
    BorderSizePixel = 0,
})
Corner(DiscordBtn, 10)

DiscordBtn.MouseEnter:Connect(function()
    Tween(DiscordBtn, 0.2, {BackgroundTransparency = 0})
end)
DiscordBtn.MouseLeave:Connect(function()
    Tween(DiscordBtn, 0.2, {BackgroundTransparency = 0.15})
end)

local GetKeyBtn = Create("TextButton", {
    Parent = KeyCard,
    BackgroundColor3 = Card,
    BackgroundTransparency = 0.2,
    Position = UDim2.new(0.5, 0, 0, 338),
    Size = UDim2.new(1, -50, 0, 30),
    AnchorPoint = Vector2.new(0.5, 0),
    Font = Enum.Font.Gotham,
    Text = "How to get a key?",
    TextSize = 11,
    TextColor3 = Sub,
    AutoButtonColor = false,
    ZIndex = 12,
    BorderSizePixel = 0,
})
Corner(GetKeyBtn, 8)
Stroke(GetKeyBtn, Gold, 1, 0.8)

GetKeyBtn.MouseEnter:Connect(function()
    Tween(GetKeyBtn, 0.2, {BackgroundTransparency = 0.05, TextColor3 = Gold})
end)
GetKeyBtn.MouseLeave:Connect(function()
    Tween(GetKeyBtn, 0.2, {BackgroundTransparency = 0.2, TextColor3 = Sub})
end)

Create("TextLabel", {
    Parent = KeyCard,
    BackgroundTransparency = 1,
    Position = UDim2.new(0.5, 0, 1, -28),
    Size = UDim2.new(1, 0, 0, 12),
    AnchorPoint = Vector2.new(0.5, 0),
    Font = Enum.Font.Gotham,
    Text = "© 2025 Golden | All Rights Reserved",
    TextSize = 9,
    TextColor3 = Dim,
    TextTransparency = 0.3,
    ZIndex = 11,
})

Create("TextLabel", {
    Parent = KeyCard,
    BackgroundTransparency = 1,
    Position = UDim2.new(0.5, 0, 1, -15),
    Size = UDim2.new(1, 0, 0, 12),
    AnchorPoint = Vector2.new(0.5, 0),
    Font = Enum.Font.Gotham,
    Text = "discord.gg/zZF5FJ6Qs",
    TextSize = 8,
    TextColor3 = DiscordColor,
    TextTransparency = 0.3,
    ZIndex = 11,
})

Tween(Overlay, 0.5, {BackgroundTransparency = 0.5})
Tween(KeyCard, 0.6, {Size = UDim2.new(0, 380, 0, 400)}, Enum.EasingStyle.Back)

task.spawn(function()
    while ScreenGui.Parent do
        pcall(function()
            local p = Create("Frame", {
                Parent = KeyCard,
                BackgroundColor3 = Gold,
                BackgroundTransparency = 0.5,
                Size = UDim2.new(0, math.random(2, 4), 0, math.random(2, 4)),
                Position = UDim2.new(math.random() * 0.9 + 0.05, 0, 1.05, 0),
                ZIndex = 10,
            })
            Corner(p, 10)
            Tween(p, math.random(20, 40) / 10, {
                Position = UDim2.new(p.Position.X.Scale + (math.random(-10, 10) / 100), 0, -0.05, 0),
                BackgroundTransparency = 1,
                Size = UDim2.new(0, 1, 0, 1),
            }, Enum.EasingStyle.Linear)
            task.delay(4, function() if p then p:Destroy() end end)
        end)
        task.wait(math.random(3, 8) / 10)
    end
end)

local checking = false
local attempts = 0

CheckBtn.MouseButton1Click:Connect(function()
    if checking then return end
    checking = true

    local key = KeyInput.Text:gsub("%s+", ""):upper()

    if key == "" then
        SetStatus("Please enter a key!", Red, 3)
        for i = 1, 6 do
            Tween(InputFrame, 0.04, {Position = UDim2.new(0.5, math.random(-8, 8), 0, 175)})
            task.wait(0.04)
        end
        Tween(InputFrame, 0.1, {Position = UDim2.new(0.5, 0, 0, 175)})
        checking = false
        return
    end

    attempts = attempts + 1
    if attempts > 10 then
        SetStatus("Too many attempts! Wait 30s.", Red)
        Tween(CheckBtn, 0.3, {BackgroundColor3 = Color3.fromRGB(180, 30, 30)})
        task.wait(30)
        attempts = 0
        Tween(CheckBtn, 0.3, {BackgroundColor3 = Gold})
        SetStatus("", Red, 0)
        checking = false
        return
    end

    SetStatus("Checking key...", Gold)
    Tween(CheckBtn, 0.2, {BackgroundColor3 = DarkGold})
    
    task.spawn(function()
        local dots = 0
        while checking do
            dots = (dots % 3) + 1
            CheckBtn.Text = "CHECKING" .. string.rep(".", dots)
            task.wait(0.3)
        end
    end)

    task.wait(math.random(10, 20) / 10)

    local valid = false
    for _, vk in pairs(VALID_KEYS) do
        if key == vk:upper() then valid = true break end
    end

    if valid then
        SetStatus("Key verified! Loading hub...", Green)
        checking = false
        CheckBtn.Text = "KEY VALID"
        Tween(CheckBtn, 0.3, {BackgroundColor3 = Green})
        Tween(InputStroke, 0.3, {Color = Green, Transparency = 0.2})
        Tween(KeyCard:FindFirstChildOfClass("UIStroke"), 0.3, {Color = Green})

        for i = 1, 15 do
            task.spawn(function()
                local dot = Create("Frame", {
                    Parent = KeyCard,
                    BackgroundColor3 = Green,
                    Size = UDim2.new(0, math.random(3, 6), 0, math.random(3, 6)),
                    Position = UDim2.new(0.5, 0, 0.6, 0),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    ZIndex = 15,
                })
                Corner(dot, 10)
                Tween(dot, 1, {
                    Position = UDim2.new(math.random() * 0.8 + 0.1, 0, math.random() * 0.8 + 0.1, 0),
                    BackgroundTransparency = 1,
                })
                task.delay(1, function() dot:Destroy() end)
            end)
        end

        task.wait(2)
        SetStatus("Launching Golden Hub...", Gold)
        task.wait(1)

        Tween(KeyCard, 0.5, {Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1}, Enum.EasingStyle.Back, Enum.EasingDirection.In)
        Tween(Overlay, 0.5, {BackgroundTransparency = 1})
        task.wait(0.6)
        ScreenGui:Destroy()

        local ok, err = pcall(function()
            loadstring(game:HttpGet(SCRIPT_URL))()
        end)

        if not ok then
            warn("[GOLDEN] Failed to load: " .. tostring(err))
            pcall(function()
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "GOLDEN",
                    Text = "Failed to load hub! Error in console (F9)",
                    Duration = 5,
                })
            end)
        end
    else
        SetStatus("Invalid key! Join Discord for a key.", Red, 5)
        checking = false
        CheckBtn.Text = "INVALID KEY"
        Tween(CheckBtn, 0.3, {BackgroundColor3 = Red})
        Tween(InputStroke, 0.3, {Color = Red, Transparency = 0.2})
        Tween(KeyCard:FindFirstChildOfClass("UIStroke"), 0.3, {Color = Red})

        for i = 1, 8 do
            Tween(InputFrame, 0.04, {Position = UDim2.new(0.5, math.random(-10, 10), 0, 175)})
            task.wait(0.04)
        end
        Tween(InputFrame, 0.1, {Position = UDim2.new(0.5, 0, 0, 175)})

        task.wait(2)
        CheckBtn.Text = "CHECK KEY"
        Tween(CheckBtn, 0.3, {BackgroundColor3 = Gold})
        Tween(InputStroke, 0.3, {Color = Gold, Transparency = 0.7})
        Tween(KeyCard:FindFirstChildOfClass("UIStroke"), 0.5, {Color = Gold})
    end

    checking = false
end)

DiscordBtn.MouseButton1Click:Connect(function()
    pcall(function() setclipboard(DISCORD_LINK) end)
    DiscordBtn.Text = "Copied!"
    Tween(DiscordBtn, 0.2, {BackgroundColor3 = Green})
    SetStatus("Discord link copied! Join for your key.", Green, 4)
    task.wait(2)
    DiscordBtn.Text = "Copy Discord Invite"
    Tween(DiscordBtn, 0.3, {BackgroundColor3 = DiscordColor})
end)

GetKeyBtn.MouseButton1Click:Connect(function()
    pcall(function() setclipboard(DISCORD_LINK) end)
    SetStatus("Join Discord > #get-key channel for your key!", Gold, 5)
    GetKeyBtn.Text = "Link Copied!"
    task.wait(2)
    GetKeyBtn.Text = "How to get a key?"
end)

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.Escape then
        SetStatus("You need a key to use this hub!", Red, 3)
        for i = 1, 6 do
            Tween(KeyCard, 0.04, {Position = UDim2.new(0.5, math.random(-5, 5), 0.5, math.random(-5, 5))})
            task.wait(0.04)
        end
        Tween(KeyCard, 0.15, {Position = UDim2.new(0.5, 0, 0.5, 0)})
    end
end)