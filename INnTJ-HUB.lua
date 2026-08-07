-- // ================================================================= //
-- //                INTJ-HUB : تم تشغيل سكربت عبود 🤩                 //
-- //                   ULTIMATE EDITION (RED CRIMSON)                  //
-- // ================================================================= //

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local TextChatService = game:GetService("TextChatService")
local StarterGui = game:GetService("StarterGui")

-- // Safe UI Screen Creation
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AboodUltimate_INTJ_HUB"
ScreenGui.ResetOnSpawn = false

if syn and syn.protect_gui then
    syn.protect_gui(ScreenGui)
    ScreenGui.Parent = CoreGui
elseif gethui then
    ScreenGui.Parent = gethui()
else
    pcall(function() ScreenGui.Parent = CoreGui end)
    if not ScreenGui.Parent then
        ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    end
end

-- // --- 1. Top Banner Notification (تم تشغيل سكربت عبود 🤩) --- //
local Notif = Instance.new("Frame")
Notif.Size = UDim2.new(0, 300, 0, 42)
Notif.Position = UDim2.new(0.5, -150, 0, -60)
Notif.BackgroundColor3 = Color3.fromRGB(110, 10, 20)
Notif.BorderSizePixel = 0
Notif.Parent = ScreenGui

local NotifCorner = Instance.new("UICorner", Notif)
NotifCorner.CornerRadius = UDim.new(0, 12)

local NotifStroke = Instance.new("UIStroke", Notif)
NotifStroke.Color = Color3.fromRGB(220, 20, 35)
NotifStroke.Thickness = 2

local NotifText = Instance.new("TextLabel")
NotifText.Size = UDim2.new(1, 0, 1, 0)
NotifText.BackgroundTransparency = 1
NotifText.Text = "تم تشغيل سكربت عبود 🤩"
NotifText.TextColor3 = Color3.fromRGB(255, 255, 255)
NotifText.TextSize = 18
NotifText.Font = Enum.Font.SourceSansBold
NotifText.Parent = Notif

-- Notification Animation
task.spawn(function()
    local tweenIn = TweenService:Create(Notif, TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -150, 0, 15)})
    tweenIn:Play()
    tweenIn.Completed:Wait()
    task.wait(3.5)
    local tweenOut = TweenService:Create(Notif, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(0.5, -150, 0, -60)})
    tweenOut:Play()
    tweenOut.Completed:Wait()
    Notif:Destroy()
end)

-- // --- 2. Advanced Multi-Route Chat Engine (تخطي حظر الشات) --- //
local function AdvancedSendChat(message)
    local sent = false
    
    -- Method 1: Modern TextChatService
    pcall(function()
        if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
            local channel = TextChatService.TextChannels:FindFirstChild("RBXGeneral") or TextChatService.TextChannels:FindFirstChild("All")
            if channel then
                channel:SendAsync(message)
                sent = true
            end
        end
    end)
    if sent then return end

    -- Method 2: Default Legacy SayMessageRequest
    pcall(function()
        local defaultEvents = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
        if defaultEvents and defaultEvents:FindFirstChild("SayMessageRequest") then
            defaultEvents.SayMessageRequest:FireServer(message, "All")
            sent = true
        end
    end)
    if sent then return end

    -- Method 3: Deep Scan for Custom Map Chat Remotes
    pcall(function()
        for _, descendant in ipairs(ReplicatedStorage:GetDescendants()) do
            if descendant:IsA("RemoteEvent") and (string.find(string.lower(descendant.Name), "chat") or string.find(string.lower(descendant.Name), "say") or string.find(string.lower(descendant.Name), "msg")) then
                descendant:FireServer(message, "All")
                sent = true
            end
        end
    end)
end

-- // --- 3. Main Interface (iPhone Red Theme) --- //
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 540, 0, 370)
MainFrame.Position = UDim2.new(0.5, -270, 0.5, -185)
MainFrame.BackgroundColor3 = Color3.fromRGB(14, 14, 18)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner", MainFrame)
MainCorner.CornerRadius = UDim.new(0, 16)

local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Color = Color3.fromRGB(180, 15, 30)
MainStroke.Thickness = 2.5

-- Toggle Arrow Button (السهم الأحمر)
local ToggleArrow = Instance.new("TextButton")
ToggleArrow.Name = "ToggleArrow"
ToggleArrow.Size = UDim2.new(0, 35, 0, 35)
ToggleArrow.Position = UDim2.new(1, -45, 0.5, -17)
ToggleArrow.BackgroundColor3 = Color3.fromRGB(160, 15, 30)
ToggleArrow.Text = "◄"
ToggleArrow.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleArrow.TextSize = 20
ToggleArrow.Font = Enum.Font.SourceSansBold
ToggleArrow.Parent = ScreenGui

local ArrowCorner = Instance.new("UICorner", ToggleArrow)
ArrowCorner.CornerRadius = UDim.new(0, 8)

ToggleArrow.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
    ToggleArrow.Text = MainFrame.Visible and "◄" or "►"
end)

-- Title Bar
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, 0, 0, 30)
TitleLabel.Position = UDim2.new(0, 15, 0, 8)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "INTJ-HUB | عبود الهيبة 👑"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextSize = 17
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = MainFrame

-- Container
local Container = Instance.new("Frame")
Container.Size = UDim2.new(1, -24, 1, -80)
Container.Position = UDim2.new(0, 12, 0, 70)
Container.BackgroundTransparency = 1
Container.Parent = MainFrame

-- // --- 4. Navigation Tabs (التبويبات الأربعة) --- //
local NavFrame = Instance.new("Frame")
NavFrame.Size = UDim2.new(1, -24, 0, 32)
NavFrame.Position = UDim2.new(0, 12, 0, 35)
NavFrame.BackgroundTransparency = 1
NavFrame.Parent = MainFrame

local NavLayout = Instance.new("UIListLayout", NavFrame)
NavLayout.FillDirection = Enum.FillDirection.Horizontal
NavLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
NavLayout.Padding = UDim.new(0, 6)

local Tabs = {"نسخ", "حماية", "تجهيز نسخ", "سكربتات إضافية"}
local TabPages = {}
local ActiveTabBtn = nil

for i, tabName in ipairs(Tabs) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.235, 0, 1, 0)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
    btn.Text = tabName
    btn.TextColor3 = Color3.fromRGB(180, 180, 180)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 14
    btn.Parent = NavFrame

    local btnCorner = Instance.new("UICorner", btn)
    btnCorner.CornerRadius = UDim.new(0, 8)

    local page = Instance.new("Frame")
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.Visible = false
    page.Parent = Container
    TabPages[tabName] = page

    btn.MouseButton1Click:Connect(function()
        if ActiveTabBtn then
            ActiveTabBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
            ActiveTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
            TabPages[ActiveTabBtn.Text].Visible = false
        end
        ActiveTabBtn = btn
        btn.BackgroundColor3 = Color3.fromRGB(170, 15, 30)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        page.Visible = true
    end)

    if i == 1 then
        ActiveTabBtn = btn
        btn.BackgroundColor3 = Color3.fromRGB(170, 15, 30)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        page.Visible = true
    end
end

-- =================================================================
-- 1. TAB: نسخ (Advanced Player Targeter)
-- =================================================================
local CopyPage = TabPages["نسخ"]

local PlayerScroll = Instance.new("ScrollingFrame")
PlayerScroll.Size = UDim2.new(0.62, 0, 0, 160)
PlayerScroll.BackgroundColor3 = Color3.fromRGB(22, 22, 26)
PlayerScroll.BorderSizePixel = 0
PlayerScroll.ScrollBarThickness = 4
PlayerScroll.Parent = CopyPage

local PlayerGrid = Instance.new("UIGridLayout", PlayerScroll)
PlayerGrid.CellSize = UDim2.new(0.47, 0, 0, 32)
PlayerGrid.CellPadding = UDim2.new(0.03, 0, 0, 5)

local SelectedPlayers = {}

local function UpdatePlayersList()
    for _, child in ipairs(PlayerScroll:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    for _, plr in ipairs(Players:GetPlayers()) do
        local pBtn = Instance.new("TextButton")
        pBtn.Text = plr.DisplayName
        pBtn.BackgroundColor3 = SelectedPlayers[plr.Name] and Color3.fromRGB(180, 20, 35) or Color3.fromRGB(35, 35, 42)
        pBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        pBtn.Font = Enum.Font.SourceSans
        pBtn.TextSize = 13
        pBtn.Parent = PlayerScroll
        
        local c = Instance.new("UICorner", pBtn)
        c.CornerRadius = UDim.new(0, 6)

        pBtn.MouseButton1Click:Connect(function()
            if SelectedPlayers[plr.Name] then
                SelectedPlayers[plr.Name] = nil
                pBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
            else
                SelectedPlayers[plr.Name] = true
                pBtn.BackgroundColor3 = Color3.fromRGB(180, 20, 35)
            end
        end)
    end
end
Players.PlayerAdded:Connect(UpdatePlayersList)
Players.PlayerRemoving:Connect(UpdatePlayersList)
UpdatePlayersList()

-- Select All / Clear All
local SelectAllBtn = Instance.new("TextButton")
SelectAllBtn.Size = UDim2.new(0.35, 0, 0, 30)
SelectAllBtn.Position = UDim2.new(0.65, 0, 0, 0)
SelectAllBtn.Text = "تحديد جميع اللاعبين 🎯"
SelectAllBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
SelectAllBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SelectAllBtn.Font = Enum.Font.SourceSansBold
SelectAllBtn.Parent = CopyPage
local sac = Instance.new("UICorner", SelectAllBtn) sac.CornerRadius = UDim.new(0,6)

SelectAllBtn.MouseButton1Click:Connect(function()
    for _, plr in ipairs(Players:GetPlayers()) do
        SelectedPlayers[plr.Name] = true
    end
    UpdatePlayersList()
end)

-- Cmd Input
local CmdBox = Instance.new("TextBox")
CmdBox.Size = UDim2.new(0.35, 0, 0, 120)
CmdBox.Position = UDim2.new(0.65, 0, 0, 40)
CmdBox.PlaceholderText = "أدخل الأوامر هنا..."
CmdBox.Text = ";jail %plr"
CmdBox.MultiLine = true
CmdBox.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
CmdBox.TextColor3 = Color3.fromRGB(255, 255, 255)
CmdBox.Parent = CopyPage
local cbc = Instance.new("UICorner", CmdBox) cbc.CornerRadius = UDim.new(0,6)

-- Execute Spam
local ExecuteBtn = Instance.new("TextButton")
ExecuteBtn.Size = UDim2.new(1, 0, 0, 40)
ExecuteBtn.Position = UDim2.new(0, 0, 1, -40)
ExecuteBtn.Text = "إطلاق الأوامر والـ Spam على المحددين 🔥"
ExecuteBtn.BackgroundColor3 = Color3.fromRGB(180, 20, 35)
ExecuteBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecuteBtn.Font = Enum.Font.SourceSansBold
ExecuteBtn.TextSize = 16
ExecuteBtn.Parent = CopyPage
local ebc = Instance.new("UICorner", ExecuteBtn) ebc.CornerRadius = UDim.new(0,8)

ExecuteBtn.MouseButton1Click:Connect(function()
    local rawCmd = CmdBox.Text
    for plrName, active in pairs(SelectedPlayers) do
        if active then
            local finalCmd = string.gsub(rawCmd, "%%plr", plrName)
            AdvancedSendChat(finalCmd)
            task.wait(0.05)
        end
    end
end)

-- =================================================================
-- 2. TAB: حماية (Ultra Fast Protection Engine)
-- =================================================================
local ProtectPage = TabPages["حماية"]

local ProtectBtn = Instance.new("TextButton")
ProtectBtn.Size = UDim2.new(1, 0, 0, 50)
ProtectBtn.Position = UDim2.new(0, 0, 0, 20)
ProtectBtn.Text = "تفعيل حماية الـ Spam الخارقة (/unjc /unice) 🛡️"
ProtectBtn.BackgroundColor3 = Color3.fromRGB(140, 15, 25)
ProtectBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ProtectBtn.Font = Enum.Font.SourceSansBold
ProtectBtn.TextSize = 17
ProtectBtn.Parent = ProtectPage
local pbc = Instance.new("UICorner", ProtectBtn) pbc.CornerRadius = UDim.new(0,10)

local Protecting = false
local ProtectThread = nil

ProtectBtn.MouseButton1Click:Connect(function()
    Protecting = not Protecting
    if Protecting then
        ProtectBtn.Text = "الحماية مفعلة وتعمل بأقصى سرعة! ⚡"
        ProtectBtn.BackgroundColor3 = Color3.fromRGB(20, 160, 60)
        ProtectThread = task.spawn(function()
            while Protecting do
                AdvancedSendChat("/unjc")
                task.wait(0.04)
                AdvancedSendChat("/unice")
                task.wait(0.04)
            end
        end)
    else
        if ProtectThread then task.cancel(ProtectThread) end
        ProtectBtn.Text = "تفعيل حماية الـ Spam الخارقة (/unjc /unice) 🛡️"
        ProtectBtn.BackgroundColor3 = Color3.fromRGB(140, 15, 25)
    end
end)

-- =================================================================
-- 3. TAB: تجهيز نسخ (Command Text Replacer)
-- =================================================================
local PrepPage = TabPages["تجهيز نسخ"]

local OldCommandsText = ";jail Svr, ;jail2 Svr, ;freeze Svr, ;kill Svr, ;loopkill Svr, ;respawn Svr, ;refresh Svr, ;void Svr, ;fire Svr, ;bring Svr, ;to Svr, ;teleport Svr, ;handTo Svr, ;box Svr, ;dog Svr, ;worm Svr, ;wormify Svr, ;chibify Svr, ;plushify Svr, ;freaky Svr, ;frogly Svr, ;spongify Svr, ;bigify Svr, ;creepify Svr, ;dinofy Svr, ;fatify Svr, ;ghost Svr, ;squash Svr, ;fat Svr, ;thin Svr, ;giantDwarf Svr, ;dwarf Svr, ;headSize Svr, ;bodyTypeScale Svr, ;depth Svr, ;potatoHead Svr, ;char Svr, ;cmdbar Svr, ;logs Svr, ;chatLogs Svr"

local SourceBox = Instance.new("TextBox")
SourceBox.Size = UDim2.new(1, 0, 0, 65)
SourceBox.Position = UDim2.new(0, 0, 0, 0)
SourceBox.Text = OldCommandsText
SourceBox.MultiLine = true
SourceBox.ClearTextOnFocus = false
SourceBox.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
SourceBox.TextColor3 = Color3.fromRGB(200, 200, 200)
SourceBox.TextWrapped = true
SourceBox.Parent = PrepPage
local sbc = Instance.new("UICorner", SourceBox) sbc.CornerRadius = UDim.new(0,6)

local OldTarget = Instance.new("TextBox")
OldTarget.Size = UDim2.new(0.48, 0, 0, 32)
OldTarget.Position = UDim2.new(0, 0, 0, 72)
OldTarget.Text = "Svr"
OldTarget.PlaceholderText = "الاسم القديم"
OldTarget.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
OldTarget.TextColor3 = Color3.fromRGB(255, 255, 255)
OldTarget.Parent = PrepPage
local otc = Instance.new("UICorner", OldTarget) otc.CornerRadius = UDim.new(0,6)

local NewTarget = Instance.new("TextBox")
NewTarget.Size = UDim2.new(0.48, 0, 0, 32)
NewTarget.Position = UDim2.new(0.52, 0, 0, 72)
NewTarget.Text = "Mohammed"
NewTarget.PlaceholderText = "الاسم الجديد"
NewTarget.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
NewTarget.TextColor3 = Color3.fromRGB(255, 255, 255)
NewTarget.Parent = PrepPage
local ntc = Instance.new("UICorner", NewTarget) ntc.CornerRadius = UDim.new(0,6)

local OutputBox = Instance.new("TextBox")
OutputBox.Size = UDim2.new(1, 0, 0, 65)
OutputBox.Position = UDim2.new(0, 0, 0, 110)
OutputBox.Text = ""
OutputBox.PlaceholderText = "النسخ الجديد يظهر هنا..."
OutputBox.MultiLine = true
OutputBox.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
OutputBox.TextColor3 = Color3.fromRGB(0, 255, 150)
OutputBox.TextWrapped = true
OutputBox.Parent = PrepPage
local obc = Instance.new("UICorner", OutputBox) obc.CornerRadius = UDim.new(0,6)

local ConvertBtn = Instance.new("TextButton")
ConvertBtn.Size = UDim2.new(1, 0, 0, 35)
ConvertBtn.Position = UDim2.new(0, 0, 0, 182)
ConvertBtn.Text = "تحديث ونسخ النص فوراً ⚡"
ConvertBtn.BackgroundColor3 = Color3.fromRGB(170, 15, 30)
ConvertBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ConvertBtn.Font = Enum.Font.SourceSansBold
ConvertBtn.Parent = PrepPage
local cbtc = Instance.new("UICorner", ConvertBtn) cbtc.CornerRadius = UDim.new(0,6)

ConvertBtn.MouseButton1Click:Connect(function()
    local src = SourceBox.Text
    local o = OldTarget.Text
    local n = NewTarget.Text
    if o ~= "" and n ~= "" then
        local res = string.gsub(src, o, n)
        OutputBox.Text = res
        if setclipboard then
            setclipboard(res)
            ConvertBtn.Text = "تم التحديث والنسخ إلى الحافظة! ✅"
            task.wait(2)
            ConvertBtn.Text = "تحديث ونسخ النص فوراً ⚡"
        end
    end
end)

-- =================================================================
-- 4. TAB: سكربتات إضافية (تم حذف cmdbar2 والـ Hub جاهز)
-- =================================================================
local ExtraPage = TabPages["سكربتات إضافية"]

local ExtraGrid = Instance.new("UIGridLayout", ExtraPage)
ExtraGrid.CellSize = UDim2.new(0.48, 0, 0, 40)
ExtraGrid.CellPadding = UDim2.new(0.04, 0, 0, 10)

local function AddExtraScript(name, code)
    local btn = Instance.new("TextButton")
    btn.Text = name
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.Parent = ExtraPage
    local c = Instance.new("UICorner", btn) c.CornerRadius = UDim.new(0,8)
    btn.MouseButton1Click:Connect(function()
        pcall(function() loadstring(code)() end)
    end)
end

AddExtraScript("Infinite Yield", "loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()")
AddExtraScript("Fly Script (طيران)", "loadstring(game:HttpGet('https://raw.githubusercontent.com/jscripty/FlyScript/main/fly.lua'))()")
AddExtraScript("Rejoin Server", "game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId)")
AddExtraScript("Noclip (اختراق الجدران)", "game:GetService('RunService').Stepped:Connect(function() for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do if v:IsA('BasePart') then v.CanCollide = false end end end)")
