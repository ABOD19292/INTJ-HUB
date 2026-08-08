-- // ================================================================= //
-- //                INTJ-HUB : ABOOD GOD-MODE ULTIMATE V18             //
-- //             BLACK & GOLD LUXURY EDITION - FIXES & CONVERTER       //
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

-- // --- 1. محرك الشات الشامل لماب الماب --- //
local function UniversalSendChat(msg)
    if not msg or msg == "" then return end

    -- Path 1: TextChatService (Roblox الجديد)
    pcall(function()
        if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
            local textChannels = TextChatService:FindFirstChild("TextChannels")
            if textChannels then
                local mainChan = textChannels:FindFirstChild("RBXGeneral") or textChannels:FindFirstChild("All")
                if mainChan then
                    mainChan:SendAsync(msg)
                end
            end
        end
    end)

    -- Path 2: Legacy Chat System (SayMessageRequest)
    pcall(function()
        local chatEvents = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
        if chatEvents then
            local sayRemote = chatEvents:FindFirstChild("SayMessageRequest")
            if sayRemote and sayRemote:IsA("RemoteEvent") then
                sayRemote:FireServer(msg, "All")
            end
        end
    end)

    -- Path 3: Deep Search for Admin & Chat Remotes
    pcall(function()
        for _, remote in ipairs(ReplicatedStorage:GetDescendants()) do
            if remote:IsA("RemoteEvent") then
                local lowName = string.lower(remote.Name)
                if lowName:find("chat") or lowName:find("say") or lowName:find("message") or lowName:find("cmd") then
                    remote:FireServer(msg, "All")
                end
            end
        end
    end)

    -- Path 4: LocalPlayer Chatted Event
    pcall(function()
        LocalPlayer.Chatted:Fire(msg)
    end)
end

-- // --- 2. إنتاج واجهة ScreenGui --- //
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AboodGodModeHUB_V18"
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

-- // --- 3. الشعار العلوي (أسود مع إطار ذهبي) --- //
local StaticNotif = Instance.new("Frame")
StaticNotif.Name = "AboodBanner"
StaticNotif.Size = UDim2.new(0, 270, 0, 34)
StaticNotif.Position = UDim2.new(0.5, -135, 0, 12)
StaticNotif.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
StaticNotif.BorderSizePixel = 0
StaticNotif.Parent = ScreenGui

local NotifCorner = Instance.new("UICorner", StaticNotif) NotifCorner.CornerRadius = UDim.new(0, 17)
local NotifStroke = Instance.new("UIStroke", StaticNotif)
NotifStroke.Color = Color3.fromRGB(240, 185, 45) NotifStroke.Thickness = 1.5

local GoldDot = Instance.new("Frame")
GoldDot.Size = UDim2.new(0, 8, 0, 8)
GoldDot.Position = UDim2.new(0, 16, 0.5, -4)
GoldDot.BackgroundColor3 = Color3.fromRGB(240, 185, 45)
GoldDot.Parent = StaticNotif
local DotCorner = Instance.new("UICorner", GoldDot) DotCorner.CornerRadius = UDim.new(1, 0)

local NotifText = Instance.new("TextLabel")
NotifText.Size = UDim2.new(1, -30, 1, 0)
NotifText.Position = UDim2.new(0, 26, 0, 0)
NotifText.BackgroundTransparency = 1
NotifText.Text = "تم تفعيل سكربت عبود المطور 🤩"
NotifText.TextColor3 = Color3.fromRGB(240, 185, 45)
NotifText.TextSize = 13
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
AboodBtn.BackgroundColor3 = Color3.fromRGB(240, 185, 45)
AboodBtn.Text = "ABOD"
AboodBtn.TextColor3 = Color3.fromRGB(15, 15, 15)
AboodBtn.Font = Enum.Font.BuilderSansBold
AboodBtn.TextSize = 13
AboodBtn.Parent = ToggleContainer
local abc = Instance.new("UICorner", AboodBtn) abc.CornerRadius = UDim.new(0, 8)

local ArrowBtn = Instance.new("TextButton")
ArrowBtn.Size = UDim2.new(0, 22, 1, 0)
ArrowBtn.Position = UDim2.new(0, 52, 0, 0)
ArrowBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
ArrowBtn.Text = "◄"
ArrowBtn.TextColor3 = Color3.fromRGB(240, 185, 45)
ArrowBtn.Font = Enum.Font.BuilderSansBold
ArrowBtn.TextSize = 12
ArrowBtn.Parent = ToggleContainer
local arc = Instance.new("UICorner", ArrowBtn) arc.CornerRadius = UDim.new(0, 8)
local ars = Instance.new("UIStroke", ArrowBtn) ars.Color = Color3.fromRGB(240, 185, 45)

-- // --- 5. الواجهة الرئيسية (أسود وذهبي) --- //
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 570, 0, 410)
MainFrame.Position = UDim2.new(0.5, -285, 0.5, -205)
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner", MainFrame) MainCorner.CornerRadius = UDim.new(0, 12)
local MainStroke = Instance.new("UIStroke", MainFrame) MainStroke.Color = Color3.fromRGB(240, 185, 45) MainStroke.Thickness = 2

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
FooterText.Text = "✨ INTJ-HUB V18 | Pure Gold & Black Luxury Edition ✨"
FooterText.TextColor3 = Color3.fromRGB(240, 185, 45)
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
    btn.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
    btn.Text = tabName
    btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    btn.Font = Enum.Font.BuilderSansBold
    btn.TextSize = 11
    btn.Parent = NavFrame

    local bc = Instance.new("UICorner", btn) bc.CornerRadius = UDim.new(0, 7)
    local bs = Instance.new("UIStroke", btn) bs.Color = Color3.fromRGB(50, 50, 60)

    local page = Instance.new("Frame")
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.Visible = false
    page.Parent = Container
    TabPages[tabName] = page

    btn.MouseButton1Click:Connect(function()
        if ActiveTabBtn then
            ActiveTabBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
            ActiveTabBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
            ActiveTabBtn:FindFirstChildOfClass("UIStroke").Color = Color3.fromRGB(50, 50, 60)
            TabPages[ActiveTabBtn.Text].Visible = false
        end
        ActiveTabBtn = btn
        btn.BackgroundColor3 = Color3.fromRGB(240, 185, 45)
        btn.TextColor3 = Color3.fromRGB(15, 15, 15)
        btn:FindFirstChildOfClass("UIStroke").Color = Color3.fromRGB(240, 185, 45)
        page.Visible = true
    end)

    if i == 1 then
        ActiveTabBtn = btn
        btn.BackgroundColor3 = Color3.fromRGB(240, 185, 45)
        btn.TextColor3 = Color3.fromRGB(15, 15, 15)
        btn:FindFirstChildOfClass("UIStroke").Color = Color3.fromRGB(240, 185, 45)
        page.Visible = true
    end
end

-- =================================================================
-- 1. TAB: تجهيز ونسخ 🔥 (مُحسّن ومُصلح بالكامل)
-- =================================================================
local CopyPrepPage = TabPages["تجهيز ونسخ 🔥"]

local TargetInput = Instance.new("TextBox")
TargetInput.Size = UDim2.new(1, 0, 0, 30)
TargetInput.Position = UDim2.new(0, 0, 0, 0)
TargetInput.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
TargetInput.PlaceholderText = "اكتب اسم الهدف هنا بدلاً من Svr (مثال: all أو اسم اللاعب)"
TargetInput.Text = "all"
TargetInput.TextColor3 = Color3.fromRGB(240, 185, 45)
TargetInput.Font = Enum.Font.BuilderSansBold
TargetInput.TextSize = 11
TargetInput.Parent = CopyPrepPage
local tc1 = Instance.new("UICorner", TargetInput) tc1.CornerRadius = UDim.new(0, 6)
local ts1 = Instance.new("UIStroke", TargetInput) ts1.Color = Color3.fromRGB(240, 185, 45)

local OldCmdBox = Instance.new("TextBox")
OldCmdBox.Size = UDim2.new(1, 0, 0, 85)
OldCmdBox.Position = UDim2.new(0, 0, 0, 36)
OldCmdBox.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
OldCmdBox.Text = ";jail Svr, ;jail2 Svr, ;freeze Svr, ;kill Svr, ;loopkill Svr, ;respawn Svr, ;refresh Svr, ;void Svr, ;fire Svr, ;bring Svr, ;to Svr, ;teleport Svr, ;handTo Svr, ;box Svr, ;dog Svr, ;worm Svr, ;wormify Svr, ;chibify Svr, ;plushify Svr, ;freaky Svr, ;frogly Svr, ;spongify Svr, ;bigify Svr, ;creepify Svr, ;dinofy Svr, ;fatify Svr, ;ghost Svr, ;squash Svr, ;fat Svr, ;thin Svr, ;giantDwarf Svr, ;dwarf Svr, ;headSize Svr, ;bodyTypeScale Svr, ;depth Svr, ;potatoHead Svr, ;char Svr, ;cmdbar Svr, ;logs Svr, ;chatLogs Svr"
OldCmdBox.TextColor3 = Color3.fromRGB(200, 200, 200)
OldCmdBox.Font = Enum.Font.BuilderSansBold
OldCmdBox.TextSize = 10
OldCmdBox.TextWrapped = true
OldCmdBox.TextYAlignment = Enum.TextYAlignment.Top
OldCmdBox.Parent = CopyPrepPage
local tc2 = Instance.new("UICorner", OldCmdBox) tc2.CornerRadius = UDim.new(0, 6)

local ConvertBtn = Instance.new("TextButton")
ConvertBtn.Size = UDim2.new(1, 0, 0, 34)
ConvertBtn.Position = UDim2.new(0, 0, 0, 126)
ConvertBtn.BackgroundColor3 = Color3.fromRGB(240, 185, 45)
ConvertBtn.Text = "تحويل النص 🔥"
ConvertBtn.TextColor3 = Color3.fromRGB(15, 15, 15)
ConvertBtn.Font = Enum.Font.BuilderSansBold
ConvertBtn.TextSize = 13
ConvertBtn.Parent = CopyPrepPage
local cvc = Instance.new("UICorner", ConvertBtn) cvc.CornerRadius = UDim.new(0, 6)

local NewCmdBox = Instance.new("TextBox")
NewCmdBox.Size = UDim2.new(1, 0, 0, 85)
NewCmdBox.Position = UDim2.new(0, 0, 0, 165)
NewCmdBox.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
NewCmdBox.PlaceholderText = "النص الجديد المحول سيظهر هنا جاهزاً..."
NewCmdBox.Text = ""
NewCmdBox.TextColor3 = Color3.fromRGB(240, 185, 45)
NewCmdBox.Font = Enum.Font.BuilderSansBold
NewCmdBox.TextSize = 10
NewCmdBox.TextWrapped = true
NewCmdBox.TextYAlignment = Enum.TextYAlignment.Top
NewCmdBox.Parent = CopyPrepPage
local tc3 = Instance.new("UICorner", NewCmdBox) tc3.CornerRadius = UDim.new(0, 6)
local ts3 = Instance.new("UIStroke", NewCmdBox) ts3.Color = Color3.fromRGB(240, 185, 45)

local CopyBtn = Instance.new("TextButton")
CopyBtn.Size = UDim2.new(1, 0, 0, 36)
CopyBtn.Position = UDim2.new(0, 0, 0, 255)
CopyBtn.BackgroundColor3 = Color3.fromRGB(240, 185, 45)
CopyBtn.Text = "جاهز للنسخ🔥"
CopyBtn.TextColor3 = Color3.fromRGB(15, 15, 15)
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
            CopyBtn.Text = "❌ لم يتم النسخ، يمكنك نسخه يدوياً من المربع"
        end
    else
        CopyBtn.Text = "⚠️ يرجى الضغط على (تحويل النص 🔥) أولاً!"
    end
    task.wait(2)
    CopyBtn.Text = "جاهز للنسخ🔥"
end)

-- =================================================================
-- 2. TAB: تخريب على الكل (مُعبّأ ومُفعّل بالكامل)
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
CmdBox.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
CmdBox.Text = ";kill all"
CmdBox.TextColor3 = Color3.fromRGB(240, 185, 45)
CmdBox.Font = Enum.Font.BuilderSansBold
CmdBox.TextSize = 12
CmdBox.Parent = SabScroll
local cbc = Instance.new("UICorner", CmdBox) cbc.CornerRadius = UDim.new(0, 6)
local cbs = Instance.new("UIStroke", CmdBox) cbs.Color = Color3.fromRGB(240, 185, 45)

local function CreateSabButton(text, isGold, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 32)
    btn.BackgroundColor3 = isGold and Color3.fromRGB(240, 185, 45) or Color3.fromRGB(22, 22, 28)
    btn.Text = text
    btn.TextColor3 = isGold and Color3.fromRGB(15, 15, 15) or Color3.fromRGB(240, 185, 45)
    btn.Font = Enum.Font.BuilderSansBold
    btn.TextSize = 12
    btn.Parent = SabScroll
    local c = Instance.new("UICorner", btn) c.CornerRadius = UDim.new(0, 6)
    local s = Instance.new("UIStroke", btn) s.Color = Color3.fromRGB(240, 185, 45)
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
                task.wait(1.2)
            end
        end)
    end
end)

CreateSabButton("💀 إبادة وقتل الجميع (;kill all)", false, function() UniversalSendChat(";kill all") end)
CreateSabButton("⛓️ سجن جميع اللاعبين (;jail all)", false, function() UniversalSendChat(";jail all") end)
CreateSabButton("❄️ تجميد السيرفر بالكامل (;freeze all)", false, function() UniversalSendChat(";freeze all") end)
CreateSabButton("🐛 تحويل الكل لديدان (;worm all)", false, function() UniversalSendChat(";worm all") end)
CreateSabButton("🔥 إشعال النار في الجميع (;fire all)", false, function() UniversalSendChat(";fire all") end)
CreateSabButton("🌀 تحويل الكل لـ miri", false, function()
    for _, p in ipairs(Players:GetPlayers()) do
        UniversalSendChat(";miri " .. p.Name)
        task.wait(0.15)
    end
end)

SabScroll.CanvasSize = UDim2.new(0, 0, 0, 320)

-- =================================================================
-- 3. TAB: Cmdbar2 (مُفعل مع أزرار سريعة ومحرك إرسال مكس)
-- =================================================================
local CmdBarPage = TabPages["Cmdbar2"]

local CmdBarTitle = Instance.new("TextLabel")
CmdBarTitle.Size = UDim2.new(1, 0, 0, 20)
CmdBarTitle.Position = UDim2.new(0, 0, 0, 0)
CmdBarTitle.BackgroundTransparency = 1
CmdBarTitle.Text = "💬 شريط الأوامر والتكرار السرّي 2"
CmdBarTitle.TextColor3 = Color3.fromRGB(240, 185, 45)
CmdBarTitle.Font = Enum.Font.BuilderSansBold
CmdBarTitle.TextSize = 12
CmdBarTitle.Parent = CmdBarPage

local CmdBarInput = Instance.new("TextBox")
CmdBarInput.Size = UDim2.new(1, 0, 0, 110)
CmdBarInput.Position = UDim2.new(0, 0, 0, 25)
CmdBarInput.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
CmdBarInput.Text = ";unjc\n;unice"
CmdBarInput.TextColor3 = Color3.fromRGB(255, 255, 255)
CmdBarInput.Font = Enum.Font.BuilderSansBold
CmdBarInput.TextSize = 12
CmdBarInput.TextYAlignment = Enum.TextYAlignment.Top
CmdBarInput.Parent = CmdBarPage
local cbic = Instance.new("UICorner", CmdBarInput) cbic.CornerRadius = UDim.new(0, 6)
local cbis = Instance.new("UIStroke", CmdBarInput) cbis.Color = Color3.fromRGB(240, 185, 45)

local CmdBarSendBtn = Instance.new("TextButton")
CmdBarSendBtn.Size = UDim2.new(0.48, 0, 0, 35)
CmdBarSendBtn.Position = UDim2.new(0, 0, 0, 142)
CmdBarSendBtn.BackgroundColor3 = Color3.fromRGB(240, 185, 45)
CmdBarSendBtn.Text = "⚡ إرسال مباشر"
CmdBarSendBtn.TextColor3 = Color3.fromRGB(15, 15, 15)
CmdBarSendBtn.Font = Enum.Font.BuilderSansBold
CmdBarSendBtn.TextSize = 12
CmdBarSendBtn.Parent = CmdBarPage
local cbc1 = Instance.new("UICorner", CmdBarSendBtn) cbc1.CornerRadius = UDim.new(0, 6)

local CmdBarSpamBtn = Instance.new("TextButton")
CmdBarSpamBtn.Size = UDim2.new(0.48, 0, 0, 35)
CmdBarSpamBtn.Position = UDim2.new(0.52, 0, 0, 142)
CmdBarSpamBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
CmdBarSpamBtn.Text = "🔁 تشغيل السبام"
CmdBarSpamBtn.TextColor3 = Color3.fromRGB(240, 185, 45)
CmdBarSpamBtn.Font = Enum.Font.BuilderSansBold
CmdBarSpamBtn.TextSize = 12
CmdBarSpamBtn.Parent = CmdBarPage
local cbc2 = Instance.new("UICorner", CmdBarSpamBtn) cbc2.CornerRadius = UDim.new(0, 6)
local cbs2 = Instance.new("UIStroke", CmdBarSpamBtn) cbs2.Color = Color3.fromRGB(240, 185, 45)

CmdBarSendBtn.MouseButton1Click:Connect(function()
    for line in string.gmatch(CmdBarInput.Text, "[^\r\n]+") do
        UniversalSendChat(line)
    end
end)

local CmdSpamActive = false
CmdBarSpamBtn.MouseButton1Click:Connect(function()
    CmdSpamActive = not CmdSpamActive
    if CmdSpamActive then
        CmdBarSpamBtn.Text = "⏹️ إيقاف السبام"
        CmdBarSpamBtn.BackgroundColor3 = Color3.fromRGB(240, 185, 45)
        CmdBarSpamBtn.TextColor3 = Color3.fromRGB(15, 15, 15)
        task.spawn(function()
            while CmdSpamActive do
                for line in string.gmatch(CmdBarInput.Text, "[^\r\n]+") do
                    UniversalSendChat(line)
                    task.wait(0.1)
                end
                task.wait(0.3)
            end
        end)
    else
        CmdBarSpamBtn.Text = "🔁 تشغيل السبام"
        CmdBarSpamBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
        CmdBarSpamBtn.TextColor3 = Color3.fromRGB(240, 185, 45)
    end
end)

-- =================================================================
-- 4. TAB: حماية (شغالة ومفعلة برمجياً)
-- =================================================================
local ProtectPage = TabPages["حماية"]

local ProtToggleBtn = Instance.new("TextButton")
ProtToggleBtn.Size = UDim2.new(1, 0, 0, 36)
ProtToggleBtn.Position = UDim2.new(0, 0, 0, 0)
ProtToggleBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
ProtToggleBtn.Text = "🛡️ حماية فك السجن والتجميد تلقائياً (;unjc ;unice)"
ProtToggleBtn.TextColor3 = Color3.fromRGB(240, 185, 45)
ProtToggleBtn.Font = Enum.Font.BuilderSansBold
ProtToggleBtn.TextSize = 12
ProtToggleBtn.Parent = ProtectPage
local ptc = Instance.new("UICorner", ProtToggleBtn) ptc.CornerRadius = UDim.new(0, 6)
local pts = Instance.new("UIStroke", ProtToggleBtn) pts.Color = Color3.fromRGB(240, 185, 45)

local AutoReBtn = Instance.new("TextButton")
AutoReBtn.Size = UDim2.new(1, 0, 0, 36)
AutoReBtn.Position = UDim2.new(0, 0, 0, 44)
AutoReBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
AutoReBtn.Text = "💀 إعادة رسبون تلقائي عند الموت (;re)"
AutoReBtn.TextColor3 = Color3.fromRGB(240, 185, 45)
AutoReBtn.Font = Enum.Font.BuilderSansBold
AutoReBtn.TextSize = 12
AutoReBtn.Parent = ProtectPage
local arc2 = Instance.new("UICorner", AutoReBtn) arc2.CornerRadius = UDim.new(0, 6)
local ars2 = Instance.new("UIStroke", AutoReBtn) ars2.Color = Color3.fromRGB(240, 185, 45)

local AntiAfkBtn = Instance.new("TextButton")
AntiAfkBtn.Size = UDim2.new(1, 0, 0, 36)
AntiAfkBtn.Position = UDim2.new(0, 0, 0, 88)
AntiAfkBtn.BackgroundColor3 = Color3.fromRGB(240, 185, 45)
AntiAfkBtn.Text = "⚡ منع الطرد بسبب الغياب (Anti-AFK) - مفعل تلقائياً"
AntiAfkBtn.TextColor3 = Color3.fromRGB(15, 15, 15)
AntiAfkBtn.Font = Enum.Font.BuilderSansBold
AntiAfkBtn.TextSize = 12
AntiAfkBtn.Parent = ProtectPage
local aac = Instance.new("UICorner", AntiAfkBtn) aac.CornerRadius = UDim.new(0, 6)

-- Anti AFK Engine Logic
LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

local IsProtecting = false
ProtToggleBtn.MouseButton1Click:Connect(function()
    IsProtecting = not IsProtecting
    if IsProtecting then
        ProtToggleBtn.Text = "🛡️ الحماية الخارقة (شغالة وفوريّة!)⚡"
        ProtToggleBtn.BackgroundColor3 = Color3.fromRGB(240, 185, 45)
        ProtToggleBtn.TextColor3 = Color3.fromRGB(15, 15, 15)
        task.spawn(function()
            while IsProtecting do
                UniversalSendChat(";unjc")
                UniversalSendChat(";unice")
                task.wait(0.8)
            end
        end)
    else
        ProtToggleBtn.Text = "🛡️ حماية فك السجن والتجميد تلقائياً (;unjc ;unice)"
        ProtToggleBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
        ProtToggleBtn.TextColor3 = Color3.fromRGB(240, 185, 45)
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
        AutoReBtn.BackgroundColor3 = Color3.fromRGB(240, 185, 45)
        AutoReBtn.TextColor3 = Color3.fromRGB(15, 15, 15)
    else
        AutoReBtn.Text = "💀 إعادة رسبون تلقائي عند الموت (;re)"
        AutoReBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
        AutoReBtn.TextColor3 = Color3.fromRGB(240, 185, 45)
    end
end)

-- =================================================================
-- 5. TAB: سكربتات إضافية (مُحسنة ومتنوعة)
-- =================================================================
local ExtraPage = TabPages["سكربتات إضافية"]

local ExtraGrid = Instance.new("UIGridLayout", ExtraPage)
ExtraGrid.CellSize = UDim2.new(0.48, 0, 0, 36)
ExtraGrid.CellPadding = UDim2.new(0.04, 0, 0, 8)

local function AddScriptButton(name, code)
    local btn = Instance.new("TextButton")
    btn.Text = name
    btn.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
    btn.TextColor3 = Color3.fromRGB(240, 185, 45)
    btn.Font = Enum.Font.BuilderSansBold
    btn.TextSize = 11
    btn.Parent = ExtraPage
    local c = Instance.new("UICorner", btn) c.CornerRadius = UDim.new(0, 6)
    local s = Instance.new("UIStroke", btn) s.Color = Color3.fromRGB(240, 185, 45)
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
