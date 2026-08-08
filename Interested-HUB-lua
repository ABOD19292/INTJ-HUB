-- // ================================================================= //
-- //                INTJ-HUB : ABOOD GOD-MODE ULTIMATE V20             //
-- //             ROYAL DARK CRIMSON EDITION - MYSTERIOUS RED           //
-- // ================================================================= //

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextChatService = game:GetService("TextChatService")
local VirtualUser = game:GetService("VirtualUser")

-- // Safe Clipboard Utility
local function SafeSetClipboard(txt)
    if setclipboard then
        setclipboard(txt)
        return true
    elseif toclipboard then
        toclipboard(txt)
        return true
    end
    return false
end

-- // --- 1. محرك الشات الذكي المباشر --- //
local function UniversalSendChat(msg)
    if not msg or msg == "" then return end

    local sent = false

    -- Path 1: TextChatService (روبلوكس الحديث)
    pcall(function()
        if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
            local textChannels = TextChatService:FindFirstChild("TextChannels")
            if textChannels then
                local mainChan = textChannels:FindFirstChild("RBXGeneral") or textChannels:FindFirstChild("All")
                if mainChan then
                    mainChan:SendAsync(msg)
                    sent = true
                end
            end
        end
    end)

    if sent then return end

    -- Path 2: Legacy Chat System
    pcall(function()
        local chatEvents = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
        if chatEvents then
            local sayRemote = chatEvents:FindFirstChild("SayMessageRequest")
            if sayRemote and sayRemote:IsA("RemoteEvent") then
                sayRemote:FireServer(msg, "All")
                sent = true
            end
        end
    end)

    if sent then return end

    -- Path 3: Fallback Event
    pcall(function()
        LocalPlayer.Chatted:Fire(msg)
    end)
end

-- // --- 2. إنشاء واجهة ScreenGui --- //
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AboodGodModeHUB_V20"
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

-- // --- 3. الشعار العلوي (أحمر ملكي غامض) --- //
local StaticNotif = Instance.new("Frame")
StaticNotif.Name = "AboodBanner"
StaticNotif.Size = UDim2.new(0, 280, 0, 34)
StaticNotif.Position = UDim2.new(0.5, -140, 0, 12)
StaticNotif.BackgroundColor3 = Color3.fromRGB(18, 8, 12)
StaticNotif.BorderSizePixel = 0
StaticNotif.Parent = ScreenGui

local NotifCorner = Instance.new("UICorner", StaticNotif) NotifCorner.CornerRadius = UDim.new(0, 17)
local NotifStroke = Instance.new("UIStroke", StaticNotif)
NotifStroke.Color = Color3.fromRGB(180, 25, 35) NotifStroke.Thickness = 1.5

local RedDot = Instance.new("Frame")
RedDot.Size = UDim2.new(0, 8, 0, 8)
RedDot.Position = UDim2.new(0, 16, 0.5, -4)
RedDot.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
RedDot.Parent = StaticNotif
local DotCorner = Instance.new("UICorner", RedDot) DotCorner.CornerRadius = UDim.new(1, 0)

local NotifText = Instance.new("TextLabel")
NotifText.Size = UDim2.new(1, -30, 1, 0)
NotifText.Position = UDim2.new(0, 26, 0, 0)
NotifText.BackgroundTransparency = 1
NotifText.Text = "تم تفعيل الثيم الأحمر الغامض الملكي 🍷🔥"
NotifText.TextColor3 = Color3.fromRGB(240, 60, 70)
NotifText.TextSize = 12
NotifText.Font = Enum.Font.BuilderSansBold
NotifText.Parent = StaticNotif

-- // --- 4. زر الاختصار الجانبي (ABOD) --- //
local ToggleContainer = Instance.new("Frame")
ToggleContainer.Size = UDim2.new(0, 75, 0, 36)
ToggleContainer.Position = UDim2.new(1, -85, 0.5, 10)
ToggleContainer.BackgroundTransparency = 1
ToggleContainer.Parent = ScreenGui

local AboodBtn = Instance.new("TextButton")
AboodBtn.Size = UDim2.new(0, 48, 1, 0)
AboodBtn.BackgroundColor3 = Color3.fromRGB(180, 25, 35)
AboodBtn.Text = "ABOD"
AboodBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AboodBtn.Font = Enum.Font.BuilderSansBold
AboodBtn.TextSize = 13
AboodBtn.Parent = ToggleContainer
local abc = Instance.new("UICorner", AboodBtn) abc.CornerRadius = UDim.new(0, 8)

local ArrowBtn = Instance.new("TextButton")
ArrowBtn.Size = UDim2.new(0, 22, 1, 0)
ArrowBtn.Position = UDim2.new(0, 52, 0, 0)
ArrowBtn.BackgroundColor3 = Color3.fromRGB(22, 10, 14)
ArrowBtn.Text = "◄"
ArrowBtn.TextColor3 = Color3.fromRGB(240, 60, 70)
ArrowBtn.Font = Enum.Font.BuilderSansBold
ArrowBtn.TextSize = 12
ArrowBtn.Parent = ToggleContainer
local arc = Instance.new("UICorner", ArrowBtn) arc.CornerRadius = UDim.new(0, 8)
local ars = Instance.new("UIStroke", ArrowBtn) ars.Color = Color3.fromRGB(180, 25, 35)

-- // --- 5. الواجهة الرئيسية (أسود ودموي ملكي) --- //
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 570, 0, 410)
MainFrame.Position = UDim2.new(0.5, -285, 0.5, -205)
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 6, 8)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner", MainFrame) MainCorner.CornerRadius = UDim.new(0, 12)
local MainStroke = Instance.new("UIStroke", MainFrame) MainStroke.Color = Color3.fromRGB(180, 25, 35) MainStroke.Thickness = 2

local function ToggleMenu()
    MainFrame.Visible = not MainFrame.Visible
    ArrowBtn.Text = MainFrame.Visible and "◄" or "►"
end
AboodBtn.MouseButton1Click:Connect(ToggleMenu)
ArrowBtn.MouseButton1Click:Connect(ToggleMenu)

local FooterText = Instance.new("TextLabel")
FooterText.Size = UDim2.new(1, 0, 0, 20)
FooterText.Position = UDim2.new(0, 0, 1, -22)
FooterText.BackgroundTransparency = 1
FooterText.Text = "✨ INTJ-HUB V20 | Royal Dark Crimson Edition ✨"
FooterText.TextColor3 = Color3.fromRGB(240, 60, 70)
FooterText.Font = Enum.Font.BuilderSansBold
FooterText.TextSize = 11
FooterText.Parent = MainFrame

-- شريط التبويبات العلوي
local NavFrame = Instance.new("Frame")
NavFrame.Size = UDim2.new(1, -20, 0, 36)
NavFrame.Position = UDim2.new(0, 10, 0, 12)
NavFrame.BackgroundTransparency = 1
NavFrame.Parent = MainFrame

local NavLayout = Instance.new("UIListLayout", NavFrame)
NavLayout.FillDirection = Enum.FillDirection.Horizontal
NavLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
NavLayout.Padding = UDim.new(0, 5)

local Container = Instance.new("Frame")
Container.Size = UDim2.new(1, -24, 1, -85)
Container.Position = UDim2.new(0, 12, 0, 55)
Container.BackgroundTransparency = 1
Container.Parent = MainFrame

local TabsList = {"تجهيز ونسخ 🔥", "تخريب على الكل", "Cmdbar2", "حماية", "سكربتات إضافية"}
local TabPages = {}
local ActiveTabBtn = nil

for i, tabName in ipairs(TabsList) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.19, 0, 1, 0)
    btn.BackgroundColor3 = Color3.fromRGB(22, 10, 14)
    btn.Text = tabName
    btn.TextColor3 = Color3.fromRGB(180, 150, 155)
    btn.Font = Enum.Font.BuilderSansBold
    btn.TextSize = 11
    btn.Parent = NavFrame

    local bc = Instance.new("UICorner", btn) bc.CornerRadius = UDim.new(0, 7)
    local bs = Instance.new("UIStroke", btn) bs.Color = Color3.fromRGB(50, 20, 28)

    local page = Instance.new("Frame")
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.Visible = false
    page.Parent = Container
    TabPages[tabName] = page

    btn.MouseButton1Click:Connect(function()
        if ActiveTabBtn then
            ActiveTabBtn.BackgroundColor3 = Color3.fromRGB(22, 10, 14)
            ActiveTabBtn.TextColor3 = Color3.fromRGB(180, 150, 155)
            ActiveTabBtn:FindFirstChildOfClass("UIStroke").Color = Color3.fromRGB(50, 20, 28)
            TabPages[ActiveTabBtn.Text].Visible = false
        end
        ActiveTabBtn = btn
        btn.BackgroundColor3 = Color3.fromRGB(180, 25, 35)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn:FindFirstChildOfClass("UIStroke").Color = Color3.fromRGB(220, 40, 50)
        page.Visible = true
    end)

    if i == 1 then
        ActiveTabBtn = btn
        btn.BackgroundColor3 = Color3.fromRGB(180, 25, 35)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn:FindFirstChildOfClass("UIStroke").Color = Color3.fromRGB(220, 40, 50)
        page.Visible = true
    end
end

-- =================================================================
-- 1. TAB: تجهيز ونسخ 🔥
-- =================================================================
local CopyPrepPage = TabPages["تجهيز ونسخ 🔥"]

local TargetInput = Instance.new("TextBox")
TargetInput.Size = UDim2.new(1, 0, 0, 30)
TargetInput.Position = UDim2.new(0, 0, 0, 0)
TargetInput.BackgroundColor3 = Color3.fromRGB(22, 10, 14)
TargetInput.PlaceholderText = "اكتب اسم الهدف هنا بدلاً من Svr (مثال: all أو اسم اللاعب)"
TargetInput.Text = "all"
TargetInput.TextColor3 = Color3.fromRGB(240, 60, 70)
TargetInput.Font = Enum.Font.BuilderSansBold
TargetInput.TextSize = 11
TargetInput.Parent = CopyPrepPage
local tc1 = Instance.new("UICorner", TargetInput) tc1.CornerRadius = UDim.new(0, 6)
local ts1 = Instance.new("UIStroke", TargetInput) ts1.Color = Color3.fromRGB(180, 25, 35)

local OldCmdBox = Instance.new("TextBox")
OldCmdBox.Size = UDim2.new(1, 0, 0, 85)
OldCmdBox.Position = UDim2.new(0, 0, 0, 36)
OldCmdBox.BackgroundColor3 = Color3.fromRGB(18, 8, 12)
OldCmdBox.Text = ";jail Svr, ;jail2 Svr, ;freeze Svr, ;kill Svr, ;loopkill Svr, ;respawn Svr, ;refresh Svr, ;void Svr, ;fire Svr, ;bring Svr, ;to Svr, ;teleport Svr, ;handTo Svr, ;box Svr, ;dog Svr, ;worm Svr, ;wormify Svr, ;chibify Svr, ;plushify Svr, ;freaky Svr, ;frogly Svr, ;spongify Svr, ;bigify Svr, ;creepify Svr, ;dinofy Svr, ;fatify Svr, ;ghost Svr, ;squash Svr, ;fat Svr, ;thin Svr, ;giantDwarf Svr, ;dwarf Svr, ;headSize Svr, ;bodyTypeScale Svr, ;depth Svr, ;potatoHead Svr, ;char Svr, ;cmdbar Svr, ;logs Svr, ;chatLogs Svr"
OldCmdBox.TextColor3 = Color3.fromRGB(200, 180, 185)
OldCmdBox.Font = Enum.Font.BuilderSansBold
OldCmdBox.TextSize = 10
OldCmdBox.TextWrapped = true
OldCmdBox.TextYAlignment = Enum.TextYAlignment.Top
OldCmdBox.Parent = CopyPrepPage
local tc2 = Instance.new("UICorner", OldCmdBox) tc2.CornerRadius = UDim.new(0, 6)

local ConvertBtn = Instance.new("TextButton")
ConvertBtn.Size = UDim2.new(1, 0, 0, 34)
ConvertBtn.Position = UDim2.new(0, 0, 0, 126)
ConvertBtn.BackgroundColor3 = Color3.fromRGB(180, 25, 35)
ConvertBtn.Text = "تحويل النص 🔥"
ConvertBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ConvertBtn.Font = Enum.Font.BuilderSansBold
ConvertBtn.TextSize = 13
ConvertBtn.Parent = CopyPrepPage
local cvc = Instance.new("UICorner", ConvertBtn) cvc.CornerRadius = UDim.new(0, 6)

local NewCmdBox = Instance.new("TextBox")
NewCmdBox.Size = UDim2.new(1, 0, 0, 85)
NewCmdBox.Position = UDim2.new(0, 0, 0, 165)
NewCmdBox.BackgroundColor3 = Color3.fromRGB(18, 8, 12)
NewCmdBox.PlaceholderText = "النص الجديد المحول سيظهر هنا جاهزاً..."
NewCmdBox.Text = ""
NewCmdBox.TextColor3 = Color3.fromRGB(240, 60, 70)
NewCmdBox.Font = Enum.Font.BuilderSansBold
NewCmdBox.TextSize = 10
NewCmdBox.TextWrapped = true
NewCmdBox.TextYAlignment = Enum.TextYAlignment.Top
NewCmdBox.Parent = CopyPrepPage
local tc3 = Instance.new("UICorner", NewCmdBox) tc3.CornerRadius = UDim.new(0, 6)
local ts3 = Instance.new("UIStroke", NewCmdBox) ts3.Color = Color3.fromRGB(180, 25, 35)

local CopyBtn = Instance.new("TextButton")
CopyBtn.Size = UDim2.new(1, 0, 0, 36)
CopyBtn.Position = UDim2.new(0, 0, 0, 255)
CopyBtn.BackgroundColor3 = Color3.fromRGB(180, 25, 35)
CopyBtn.Text = "جاهز للنسخ🔥"
CopyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyBtn.Font = Enum.Font.BuilderSansBold
CopyBtn.TextSize = 13
CopyBtn.Parent = CopyPrepPage
local cpc = Instance.new("UICorner", CopyBtn) cpc.CornerRadius = UDim.new(0, 6)

ConvertBtn.MouseButton1Click:Connect(function()
    local target = TargetInput.Text ~= "" and TargetInput.Text or "all"
    local converted = string.gsub(OldCmdBox.Text, "Svr", target)
    NewCmdBox.Text = converted
end)

CopyBtn.MouseButton1Click:Connect(function()
    if NewCmdBox.Text ~= "" then
        local success = SafeSetClipboard(NewCmdBox.Text)
        if success then
            CopyBtn.Text = "✅ تم النسخ إلى الحافظة بنجاح!"
        else
            CopyBtn.Text = "❌ انسخه يدوياً من المربع بالأعلى"
        end
    else
        CopyBtn.Text = "⚠️ يرجى الضغط على (تحويل النص 🔥) أولاً!"
    end
    task.wait(2)
    CopyBtn.Text = "جاهز للنسخ🔥"
end)

-- =================================================================
-- 2. TAB: تخريب على الكل
-- =================================================================
local SabotagePage = TabPages["تخريب على الكل"]

local SabScroll = Instance.new("ScrollingFrame")
SabScroll.Size = UDim2.new(1, 0, 1, 0)
SabScroll.BackgroundTransparency = 1
SabScroll.BorderSizePixel = 0
SabScroll.ScrollBarThickness = 4
SabScroll.Parent = SabotagePage

local SabLayout = Instance.new("UIListLayout", SabScroll)
SabLayout.Padding = UDim.new(0, 6)
SabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

local CmdBox = Instance.new("TextBox")
CmdBox.Size = UDim2.new(1, 0, 0, 45)
CmdBox.BackgroundColor3 = Color3.fromRGB(22, 10, 14)
CmdBox.Text = ";kill all"
CmdBox.TextColor3 = Color3.fromRGB(240, 60, 70)
CmdBox.Font = Enum.Font.BuilderSansBold
CmdBox.TextSize = 12
CmdBox.Parent = SabScroll
local cbc = Instance.new("UICorner", CmdBox) cbc.CornerRadius = UDim.new(0, 6)
local cbs = Instance.new("UIStroke", CmdBox) cbs.Color = Color3.fromRGB(180, 25, 35)

local function CreateSabButton(text, isRed, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 32)
    btn.BackgroundColor3 = isRed and Color3.fromRGB(180, 25, 35) or Color3.fromRGB(22, 10, 14)
    btn.Text = text
    btn.TextColor3 = isRed and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(240, 60, 70)
    btn.Font = Enum.Font.BuilderSansBold
    btn.TextSize = 12
    btn.Parent = SabScroll
    local c = Instance.new("UICorner", btn) c.CornerRadius = UDim.new(0, 6)
    local s = Instance.new("UIStroke", btn) s.Color = Color3.fromRGB(180, 25, 35)
    btn.MouseButton1Click:Connect(callback)
    return btn
end

local MassActive = false
CreateSabButton("💥 تشغيل سبام التخريب المكتوب بالأعلى", true, function()
    MassActive = not MassActive
    if MassActive then
        task.spawn(function()
            while MassActive do
                UniversalSendChat(CmdBox.Text)
                task.wait(1.5)
            end
        end)
    end
end)

CreateSabButton("💀 إبادة وقتل الجميع (;kill all)", false, function() UniversalSendChat(";kill all") end)
CreateSabButton("⛓️ سجن جميع اللاعبين (;jail all)", false, function() UniversalSendChat(";jail all") end)
CreateSabButton("❄️ تجميد السيرفر بالكامل (;freeze all)", false, function() UniversalSendChat(";freeze all") end)
CreateSabButton("🐛 تحويل الكل لديدان (;worm all)", false, function() UniversalSendChat(";worm all") end)
CreateSabButton("🔥 إشعال النار في الجميع (;fire all)", false, function() UniversalSendChat(";fire all") end)

SabScroll.CanvasSize = UDim2.new(0, 0, 0, 280)

-- =================================================================
-- 3. TAB: Cmdbar2
-- =================================================================
local CmdBarPage = TabPages["Cmdbar2"]

local CmdBarTitle = Instance.new("TextLabel")
CmdBarTitle.Size = UDim2.new(1, 0, 0, 20)
CmdBarTitle.Position = UDim2.new(0, 0, 0, 0)
CmdBarTitle.BackgroundTransparency = 1
CmdBarTitle.Text = "💬 شريط الأوامر والتكرار السرّي 2"
CmdBarTitle.TextColor3 = Color3.fromRGB(240, 60, 70)
CmdBarTitle.Font = Enum.Font.BuilderSansBold
CmdBarTitle.TextSize = 12
CmdBarTitle.Parent = CmdBarPage

local CmdBarInput = Instance.new("TextBox")
CmdBarInput.Size = UDim2.new(1, 0, 0, 110)
CmdBarInput.Position = UDim2.new(0, 0, 0, 25)
CmdBarInput.BackgroundColor3 = Color3.fromRGB(22, 10, 14)
CmdBarInput.Text = ";unjc\n;unice"
CmdBarInput.TextColor3 = Color3.fromRGB(255, 255, 255)
CmdBarInput.Font = Enum.Font.BuilderSansBold
CmdBarInput.TextSize = 12
CmdBarInput.TextYAlignment = Enum.TextYAlignment.Top
CmdBarInput.Parent = CmdBarPage
local cbic = Instance.new("UICorner", CmdBarInput) cbic.CornerRadius = UDim.new(0, 6)
local cbis = Instance.new("UIStroke", CmdBarInput) cbis.Color = Color3.fromRGB(180, 25, 35)

local CmdBarSendBtn = Instance.new("TextButton")
CmdBarSendBtn.Size = UDim2.new(0.48, 0, 0, 35)
CmdBarSendBtn.Position = UDim2.new(0, 0, 0, 142)
CmdBarSendBtn.BackgroundColor3 = Color3.fromRGB(180, 25, 35)
CmdBarSendBtn.Text = "⚡ إرسال مباشر"
CmdBarSendBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CmdBarSendBtn.Font = Enum.Font.BuilderSansBold
CmdBarSendBtn.TextSize = 12
CmdBarSendBtn.Parent = CmdBarPage
local cbc1 = Instance.new("UICorner", CmdBarSendBtn) cbc1.CornerRadius = UDim.new(0, 6)

local CmdBarSpamBtn = Instance.new("TextButton")
CmdBarSpamBtn.Size = UDim2.new(0.48, 0, 0, 35)
CmdBarSpamBtn.Position = UDim2.new(0.52, 0, 0, 142)
CmdBarSpamBtn.BackgroundColor3 = Color3.fromRGB(22, 10, 14)
CmdBarSpamBtn.Text = "🔁 تشغيل السبام"
CmdBarSpamBtn.TextColor3 = Color3.fromRGB(240, 60, 70)
CmdBarSpamBtn.Font = Enum.Font.BuilderSansBold
CmdBarSpamBtn.TextSize = 12
CmdBarSpamBtn.Parent = CmdBarPage
local cbc2 = Instance.new("UICorner", CmdBarSpamBtn) cbc2.CornerRadius = UDim.new(0, 6)
local cbs2 = Instance.new("UIStroke", CmdBarSpamBtn) cbs2.Color = Color3.fromRGB(180, 25, 35)

CmdBarSendBtn.MouseButton1Click:Connect(function()
    for line in string.gmatch(CmdBarInput.Text, "[^\r\n]+") do
        UniversalSendChat(line)
        task.wait(0.2)
    end
end)

local CmdSpamActive = false
CmdBarSpamBtn.MouseButton1Click:Connect(function()
    CmdSpamActive = not CmdSpamActive
    if CmdSpamActive then
        CmdBarSpamBtn.Text = "⏹️ إيقاف السبام"
        CmdBarSpamBtn.BackgroundColor3 = Color3.fromRGB(180, 25, 35)
        CmdBarSpamBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        task.spawn(function()
            while CmdSpamActive do
                for line in string.gmatch(CmdBarInput.Text, "[^\r\n]+") do
                    UniversalSendChat(line)
                    task.wait(0.3)
                end
                task.wait(0.8)
            end
        end)
    else
        CmdBarSpamBtn.Text = "🔁 تشغيل السبام"
        CmdBarSpamBtn.BackgroundColor3 = Color3.fromRGB(22, 10, 14)
        CmdBarSpamBtn.TextColor3 = Color3.fromRGB(240, 60, 70)
    end
end)

-- =================================================================
-- 4. TAB: حماية
-- =================================================================
local ProtectPage = TabPages["حماية"]

local ProtToggleBtn = Instance.new("TextButton")
ProtToggleBtn.Size = UDim2.new(1, 0, 0, 36)
ProtToggleBtn.Position = UDim2.new(0, 0, 0, 0)
ProtToggleBtn.BackgroundColor3 = Color3.fromRGB(22, 10, 14)
ProtToggleBtn.Text = "🛡️ حماية فك السجن والتجميد تلقائياً (;unjc ;unice)"
ProtToggleBtn.TextColor3 = Color3.fromRGB(240, 60, 70)
ProtToggleBtn.Font = Enum.Font.BuilderSansBold
ProtToggleBtn.TextSize = 12
ProtToggleBtn.Parent = ProtectPage
local ptc = Instance.new("UICorner", ProtToggleBtn) ptc.CornerRadius = UDim.new(0, 6)
local pts = Instance.new("UIStroke", ProtToggleBtn) pts.Color = Color3.fromRGB(180, 25, 35)

local AutoReBtn = Instance.new("TextButton")
AutoReBtn.Size = UDim2.new(1, 0, 0, 36)
AutoReBtn.Position = UDim2.new(0, 0, 0, 44)
AutoReBtn.BackgroundColor3 = Color3.fromRGB(22, 10, 14)
AutoReBtn.Text = "💀 إعادة رسبون تلقائي عند الموت (;re)"
AutoReBtn.TextColor3 = Color3.fromRGB(240, 60, 70)
AutoReBtn.Font = Enum.Font.BuilderSansBold
AutoReBtn.TextSize = 12
AutoReBtn.Parent = ProtectPage
local arc2 = Instance.new("UICorner", AutoReBtn) arc2.CornerRadius = UDim.new(0, 6)
local ars2 = Instance.new("UIStroke", AutoReBtn) ars2.Color = Color3.fromRGB(180, 25, 35)

local AntiAfkBtn = Instance.new("TextButton")
AntiAfkBtn.Size = UDim2.new(1, 0, 0, 36)
AntiAfkBtn.Position = UDim2.new(0, 0, 0, 88)
AntiAfkBtn.BackgroundColor3 = Color3.fromRGB(180, 25, 35)
AntiAfkBtn.Text = "⚡ منع الطرد بسبب الغياب (Anti-AFK) - مفعل تلقائياً"
AntiAfkBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AntiAfkBtn.Font = Enum.Font.BuilderSansBold
AntiAfkBtn.TextSize = 12
AntiAfkBtn.Parent = ProtectPage
local aac = Instance.new("UICorner", AntiAfkBtn) aac.CornerRadius = UDim.new(0, 6)

-- Anti AFK
LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

local IsProtecting = false
ProtToggleBtn.MouseButton1Click:Connect(function()
    IsProtecting = not IsProtecting
    if IsProtecting then
        ProtToggleBtn.Text = "🛡️ الحماية الخارقة شغالّة وتعمل تلقائياً! ⚡"
        ProtToggleBtn.BackgroundColor3 = Color3.fromRGB(180, 25, 35)
        ProtToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        task.spawn(function()
            while IsProtecting do
                UniversalSendChat(";unjc ;unice")
                task.wait(1.8)
            end
        end)
    else
        ProtToggleBtn.Text = "🛡️ حماية فك السجن والتجميد تلقائياً (;unjc ;unice)"
        ProtToggleBtn.BackgroundColor3 = Color3.fromRGB(22, 10, 14)
        ProtToggleBtn.TextColor3 = Color3.fromRGB(240, 60, 70)
    end
end)

local AutoReEnabled = false
local function DeathCheck(char)
    if not char then return end
    local hum = char:WaitForChild("Humanoid", 5)
    if hum then
        hum.Died:Connect(function()
            if AutoReEnabled then
                UniversalSendChat(";re")
            end
        end)
    end
end
if LocalPlayer.Character then DeathCheck(LocalPlayer.Character) end
LocalPlayer.CharacterAdded:Connect(DeathCheck)

AutoReBtn.MouseButton1Click:Connect(function()
    AutoReEnabled = not AutoReEnabled
    if AutoReEnabled then
        AutoReBtn.Text = "⚡ إعادة رسبون تلقائي مفعلة الآن (Auto ;re)"
        AutoReBtn.BackgroundColor3 = Color3.fromRGB(180, 25, 35)
        AutoReBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    else
        AutoReBtn.Text = "💀 إعادة رسبون تلقائي عند الموت (;re)"
        AutoReBtn.BackgroundColor3 = Color3.fromRGB(22, 10, 14)
        AutoReBtn.TextColor3 = Color3.fromRGB(240, 60, 70)
    end
end)

-- =================================================================
-- 5. TAB: سكربتات إضافية
-- =================================================================
local ExtraPage = TabPages["سكربتات إضافية"]

local ExtraGrid = Instance.new("UIGridLayout", ExtraPage)
ExtraGrid.CellSize = UDim2.new(0.48, 0, 0, 36)
ExtraGrid.CellPadding = UDim2.new(0.04, 0, 0, 8)

local function AddScriptButton(name, code)
    local btn = Instance.new("TextButton")
    btn.Text = name
    btn.BackgroundColor3 = Color3.fromRGB(22, 10, 14)
    btn.TextColor3 = Color3.fromRGB(240, 60, 70)
    btn.Font = Enum.Font.BuilderSansBold
    btn.TextSize = 11
    btn.Parent = ExtraPage
    local c = Instance.new("UICorner", btn) c.CornerRadius = UDim.new(0, 6)
    local s = Instance.new("UIStroke", btn) s.Color = Color3.fromRGB(180, 25, 35)
    btn.MouseButton1Click:Connect(function()
        pcall(function() loadstring(code)() end)
    end)
end

AddScriptButton("Infinite Yield 👑", "loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()")
AddScriptButton("Fly Script 🕊️", "loadstring(game:HttpGet('https://raw.githubusercontent.com/jscripty/FlyScript/main/fly.lua'))()")
AddScriptButton("Rejoin Server 🔄", "game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId)")
AddScriptButton("Noclip 👻", "game:GetService('RunService').Stepped:Connect(function() for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do if v:IsA('BasePart') then v.CanCollide = false end end end)")
AddScriptButton("Speed Hack ⚡", "game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 80")
AddScriptButton("High Jump 🚀", "game.Players.LocalPlayer.Character.Humanoid.JumpPower = 120")
