-- // ================================================================= //
-- //                   INTJ-HUB : ABOOD GOD-MODE V10                   //
-- //            ULTIMATE LUAU ENGINE & CUSTOM IPHONE THEME             //
-- // ================================================================= //

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local TextChatService = game:GetService("TextChatService")

-- // Safe ScreenGui Container
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AboodGodModeHUB"
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

-- // --- 1. الشعار العلوي الثابت دائمًا (تم تشغيل سكربت عبود 🤩) --- //
local StaticNotif = Instance.new("Frame")
StaticNotif.Name = "AboodStaticBanner"
StaticNotif.Size = UDim2.new(0, 320, 0, 42)
StaticNotif.Position = UDim2.new(0.5, -160, 0, 12)
StaticNotif.BackgroundColor3 = Color3.fromRGB(110, 10, 20)
StaticNotif.BorderSizePixel = 0
StaticNotif.Parent = ScreenGui

local NotifCorner = Instance.new("UICorner", StaticNotif)
NotifCorner.CornerRadius = UDim.new(0, 12)

local NotifStroke = Instance.new("UIStroke", StaticNotif)
NotifStroke.Color = Color3.fromRGB(230, 25, 45)
NotifStroke.Thickness = 2.5

local NotifText = Instance.new("TextLabel")
NotifText.Size = UDim2.new(1, 0, 1, 0)
NotifText.BackgroundTransparency = 1
NotifText.Text = "تم تشغيل سكربت عبود 🤩"
NotifText.TextColor3 = Color3.fromRGB(255, 255, 255)
NotifText.TextSize = 18
NotifText.Font = Enum.Font.SourceSansBold
NotifText.Parent = StaticNotif

-- // --- 2. محرك الشات الخارق والتخطي الذكي --- //
local function SuperBypassChat(msg)
    local success = false
    
    -- المسار الأول: البحث المباشر في ريموتات الماب
    pcall(function()
        for _, remote in ipairs(ReplicatedStorage:GetDescendants()) do
            if remote:IsA("RemoteEvent") then
                local lowName = string.lower(remote.Name)
                if lowName:find("chat") or lowName:find("say") or lowName:find("msg") or lowName:find("command") then
                    remote:FireServer(msg, "All")
                    success = true
                end
            end
        end
    end)
    if success then return end

    -- المسار الثاني: TextChatService الحديث
    pcall(function()
        if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
            local mainChannel = TextChatService.TextChannels:FindFirstChild("RBXGeneral") or TextChatService.TextChannels:FindFirstChild("All")
            if mainChannel then
                mainChannel:SendAsync(msg)
                success = true
            end
        end
    end)
    if success then return end

    -- المسار الثالث: SayMessageRequest الأفتراضي
    pcall(function()
        local chatEvents = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
        if chatEvents and chatEvents:FindFirstChild("SayMessageRequest") then
            chatEvents.SayMessageRequest:FireServer(msg, "All")
        end
    end)
end

-- // --- 3. الواجهة الرئيسية (iPhone Curved Crimson Theme) --- //
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 530, 0, 365)
MainFrame.Position = UDim2.new(0.5, -265, 0.5, -182)
MainFrame.BackgroundColor3 = Color3.fromRGB(14, 14, 18)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner", MainFrame)
MainCorner.CornerRadius = UDim.new(0, 18)

local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Color = Color3.fromRGB(180, 15, 30)
MainStroke.Thickness = 2.5

-- زر السهم الأحمر
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Name = "ToggleArrow"
ToggleBtn.Size = UDim2.new(0, 36, 0, 36)
ToggleBtn.Position = UDim2.new(1, -45, 0.5, -18)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(160, 15, 30)
ToggleBtn.Text = "◄"
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.TextSize = 20
ToggleBtn.Font = Enum.Font.SourceSansBold
ToggleBtn.Parent = ScreenGui

local ArrowCorner = Instance.new("UICorner", ToggleBtn)
ArrowCorner.CornerRadius = UDim.new(0, 10)

ToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
    ToggleBtn.Text = MainFrame.Visible and "◄" or "►"
end)

-- العنوان
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -30, 0, 30)
TitleLabel.Position = UDim2.new(0, 15, 0, 10)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "INTJ-HUB | عبود الهيبة 👑"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextSize = 17
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = MainFrame

-- حاوية المحتوى
local Container = Instance.new("Frame")
Container.Size = UDim2.new(1, -24, 1, -85)
Container.Position = UDim2.new(0, 12, 0, 75)
Container.BackgroundTransparency = 1
Container.Parent = MainFrame

-- // --- 4. نظام التبويبات الأربعة --- //
local NavFrame = Instance.new("Frame")
NavFrame.Size = UDim2.new(1, -24, 0, 35)
NavFrame.Position = UDim2.new(0, 12, 0, 38)
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
-- 1. TAB: نسخ (نظام التحديد والتكرار التلقائي المستمر)
-- =================================================================
local CopyPage = TabPages["نسخ"]

local PlayerScroll = Instance.new("ScrollingFrame")
PlayerScroll.Size = UDim2.new(0.62, 0, 0, 150)
PlayerScroll.BackgroundColor3 = Color3.fromRGB(22, 22, 26)
PlayerScroll.BorderSizePixel = 0
PlayerScroll.ScrollBarThickness = 4
PlayerScroll.Parent = CopyPage

local PlayerGrid = Instance.new("UIGridLayout", PlayerScroll)
PlayerGrid.CellSize = UDim2.new(0.47, 0, 0, 30)
PlayerGrid.CellPadding = UDim2.new(0.03, 0, 0, 5)

local SelectedPlayers = {}

local function RefreshList()
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
        
        local c = Instance.new("UICorner", pBtn) c.CornerRadius = UDim.new(0, 6)

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
Players.PlayerAdded:Connect(RefreshList)
Players.PlayerRemoving:Connect(RefreshList)
RefreshList()

local CmdBox = Instance.new("TextBox")
CmdBox.Size = UDim2.new(0.35, 0, 0, 150)
CmdBox.Position = UDim2.new(0.65, 0, 0, 0)
CmdBox.PlaceholderText = "أدخل الأوامر..."
CmdBox.Text = ";jail %plr"
CmdBox.MultiLine = true
CmdBox.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
CmdBox.TextColor3 = Color3.fromRGB(255, 255, 255)
CmdBox.Parent = CopyPage
local cbc = Instance.new("UICorner", CmdBox) cbc.CornerRadius = UDim.new(0,6)

-- زر التشغيل المستمر (تلقائي بدون توقف)
local CopyLoopBtn = Instance.new("TextButton")
CopyLoopBtn.Size = UDim2.new(1, 0, 0, 40)
CopyLoopBtn.Position = UDim2.new(0, 0, 1, -40)
CopyLoopBtn.Text = "تشغيل النسخ والـ Spam تلقائياً (متوقف) 🛑"
CopyLoopBtn.BackgroundColor3 = Color3.fromRGB(140, 15, 25)
CopyLoopBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyLoopBtn.Font = Enum.Font.SourceSansBold
CopyLoopBtn.TextSize = 15
CopyLoopBtn.Parent = CopyPage
local clc = Instance.new("UICorner", CopyLoopBtn) clc.CornerRadius = UDim.new(0,8)

local CopyActive = false
local CopyThread = nil

CopyLoopBtn.MouseButton1Click:Connect(function()
    CopyActive = not CopyActive
    if CopyActive then
        CopyLoopBtn.Text = "النسخ والـ Spam شغال تلقائياً بدون توقف! 🔥"
        CopyLoopBtn.BackgroundColor3 = Color3.fromRGB(20, 160, 60)
        CopyThread = task.spawn(function()
            while CopyActive do
                local rawCmd = CmdBox.Text
                for plrName, active in pairs(SelectedPlayers) do
                    if active and CopyActive then
                        local finalCmd = string.gsub(rawCmd, "%%plr", plrName)
                        SuperBypassChat(finalCmd)
                        task.wait(0.08)
                    end
                end
                task.wait(0.15)
            end
        end)
    else
        if CopyThread then task.cancel(CopyThread) end
        CopyLoopBtn.Text = "تشغيل النسخ والـ Spam تلقائياً (متوقف) 🛑"
        CopyLoopBtn.BackgroundColor3 = Color3.fromRGB(140, 15, 25)
    end
end)

-- =================================================================
-- 2. TAB: حماية (تلقائية مستمرة)
-- =================================================================
local ProtectPage = TabPages["حماية"]

local ProtectBtn = Instance.new("TextButton")
ProtectBtn.Size = UDim2.new(1, 0, 0, 50)
ProtectBtn.Position = UDim2.new(0, 0, 0, 20)
ProtectBtn.Text = "تفعيل حماية الـ Spam الخارقة (/unjc /unice) 🛡️"
ProtectBtn.BackgroundColor3 = Color3.fromRGB(140, 15, 25)
ProtectBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ProtectBtn.Font = Enum.Font.SourceSansBold
ProtectBtn.TextSize = 16
ProtectBtn.Parent = ProtectPage
local pbc = Instance.new("UICorner", ProtectBtn) pbc.CornerRadius = UDim.new(0,10)

local Protecting = false
local ProtectThread = nil

ProtectBtn.MouseButton1Click:Connect(function()
    Protecting = not Protecting
    if Protecting then
        ProtectBtn.Text = "الحماية مفعلة وتعمل بأقصى سرعة تلقائياً! ⚡"
        ProtectBtn.BackgroundColor3 = Color3.fromRGB(20, 160, 60)
        ProtectThread = task.spawn(function()
            while Protecting do
                SuperBypassChat("/unjc")
                task.wait(0.04)
                SuperBypassChat("/unice")
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
            ConvertBtn.Text = "تم النسخ إلى الحافظة بنجاح! ✅"
            task.wait(2)
            ConvertBtn.Text = "تحديث ونسخ النص فوراً ⚡"
        end
    end
end)

-- =================================================================
-- 4. TAB: سكربتات إضافية
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
AddExtraScript("Fly Script", "loadstring(game:HttpGet('https://raw.githubusercontent.com/jscripty/FlyScript/main/fly.lua'))()")
AddExtraScript("Rejoin Server", "game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId)")
AddExtraScript("Noclip", "game:GetService('RunService').Stepped:Connect(function() for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do if v:IsA('BasePart') then v.CanCollide = false end end end)")
