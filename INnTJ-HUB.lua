-- // ================================================================= //
-- //                INTJ-HUB : ABOOD GOD-MODE FINAL V13               //
-- //               FIXED SEMICOLON COMMANDS & ELEGANT UI              //
-- // ================================================================= //

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextChatService = game:GetService("TextChatService")

-- // Container Creation
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AboodGodModeHUB_V13"
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
NotifStroke.Thickness = 2

local NotifText = Instance.new("TextLabel")
NotifText.Size = UDim2.new(1, 0, 1, 0)
NotifText.BackgroundTransparency = 1
NotifText.Text = "تم تشغيل سكربت عبود 🤩"
NotifText.TextColor3 = Color3.fromRGB(255, 255, 255)
NotifText.TextSize = 17
NotifText.Font = Enum.Font.GothamBold
NotifText.Parent = StaticNotif

-- // --- 2. محركات الشات (علني للنسخ / مخفي للحماية) --- //

-- أ) محرك إرسال علني للنسخ والـ Spam
local function PublicSendChat(msg)
    pcall(function()
        if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
            local mainChannel = TextChatService.TextChannels:FindFirstChild("RBXGeneral") or TextChatService.TextChannels:FindFirstChild("All")
            if mainChannel then mainChannel:SendAsync(msg) end
        else
            local chatEvents = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
            if chatEvents and chatEvents:FindFirstChild("SayMessageRequest") then
                chatEvents.SayMessageRequest:FireServer(msg, "All")
            end
        end
    end)
end

-- ب) محرك إرسال مخفي للحماية فقط
local function SilentSendProtect(msg)
    pcall(function()
        for _, remote in ipairs(ReplicatedStorage:GetDescendants()) do
            if remote:IsA("RemoteEvent") then
                local lowName = string.lower(remote.Name)
                if lowName:find("chat") or lowName:find("say") or lowName:find("msg") or lowName:find("command") then
                    remote:FireServer(msg, "All")
                end
            end
        end
    end)
end

-- // --- 3. الواجهة الرئيسية بالتصميم العربي الأنيق --- //
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 520, 0, 370)
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -185)
MainFrame.BackgroundColor3 = Color3.fromRGB(16, 16, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner", MainFrame)
MainCorner.CornerRadius = UDim.new(0, 16)

local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Color = Color3.fromRGB(190, 20, 35)
MainStroke.Thickness = 2.5

-- زر السهم للفتح والإغلاق
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Name = "ToggleArrow"
ToggleBtn.Size = UDim2.new(0, 38, 0, 38)
ToggleBtn.Position = UDim2.new(1, -48, 0.5, -19)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(170, 18, 32)
ToggleBtn.Text = "◄"
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.TextSize = 18
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.Parent = ScreenGui

local ArrowCorner = Instance.new("UICorner", ToggleBtn)
ArrowCorner.CornerRadius = UDim.new(0, 10)

ToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
    ToggleBtn.Text = MainFrame.Visible and "◄" or "►"
end)

-- العنوان
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -30, 0, 32)
TitleLabel.Position = UDim2.new(0, 15, 0, 10)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "INTJ-HUB | عبود الهيبة 👑"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 16
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = MainFrame

-- حاوية المحتوى
local Container = Instance.new("Frame")
Container.Size = UDim2.new(1, -24, 1, -90)
Container.Position = UDim2.new(0, 12, 0, 80)
Container.BackgroundTransparency = 1
Container.Parent = MainFrame

-- // --- 4. نظام التبويبات الأربعة --- //
local NavFrame = Instance.new("Frame")
NavFrame.Size = UDim2.new(1, -24, 0, 36)
NavFrame.Position = UDim2.new(0, 12, 0, 40)
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
    btn.BackgroundColor3 = Color3.fromRGB(28, 28, 34)
    btn.Text = tabName
    btn.TextColor3 = Color3.fromRGB(190, 190, 190)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 13
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
            ActiveTabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 34)
            ActiveTabBtn.TextColor3 = Color3.fromRGB(190, 190, 190)
            TabPages[ActiveTabBtn.Text].Visible = false
        end
        ActiveTabBtn = btn
        btn.BackgroundColor3 = Color3.fromRGB(180, 18, 32)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        page.Visible = true
    end)

    if i == 1 then
        ActiveTabBtn = btn
        btn.BackgroundColor3 = Color3.fromRGB(180, 18, 32)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        page.Visible = true
    end
end

-- =================================================================
-- 1. TAB: نسخ (أوامر علنية + تشغيل تلقائي مستمر مع ;)
-- =================================================================
local CopyPage = TabPages["نسخ"]

local PlayerScroll = Instance.new("ScrollingFrame")
PlayerScroll.Size = UDim2.new(0.62, 0, 0, 150)
PlayerScroll.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
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
        pBtn.BackgroundColor3 = SelectedPlayers[plr.Name] and Color3.fromRGB(190, 20, 35) or Color3.fromRGB(34, 34, 42)
        pBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        pBtn.Font = Enum.Font.GothamBold
        pBtn.TextSize = 12
        pBtn.Parent = PlayerScroll
        
        local c = Instance.new("UICorner", pBtn) c.CornerRadius = UDim.new(0, 6)

        pBtn.MouseButton1Click:Connect(function()
            if SelectedPlayers[plr.Name] then
                SelectedPlayers[plr.Name] = nil
                pBtn.BackgroundColor3 = Color3.fromRGB(34, 34, 42)
            else
                SelectedPlayers[plr.Name] = true
                pBtn.BackgroundColor3 = Color3.fromRGB(190, 20, 35)
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
CmdBox.Font = Enum.Font.GothamBold
CmdBox.TextSize = 13
CmdBox.BackgroundColor3 = Color3.fromRGB(24, 24, 30)
CmdBox.TextColor3 = Color3.fromRGB(255, 255, 255)
CmdBox.Parent = CopyPage
local cbc = Instance.new("UICorner", CmdBox) cbc.CornerRadius = UDim.new(0,6)

-- زر التكرار التلقائي المستمر للنسخ
local CopyLoopBtn = Instance.new("TextButton")
CopyLoopBtn.Size = UDim2.new(1, 0, 0, 42)
CopyLoopBtn.Position = UDim2.new(0, 0, 1, -42)
CopyLoopBtn.Text = "تشغيل النسخ والـ Spam تلقائياً (متوقف) 🛑"
CopyLoopBtn.BackgroundColor3 = Color3.fromRGB(150, 15, 25)
CopyLoopBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyLoopBtn.Font = Enum.Font.GothamBold
CopyLoopBtn.TextSize = 14
CopyLoopBtn.Parent = CopyPage
local clc = Instance.new("UICorner", CopyLoopBtn) clc.CornerRadius = UDim.new(0,8)

local CopyActive = false
local CopyThread = nil

CopyLoopBtn.MouseButton1Click:Connect(function()
    CopyActive = not CopyActive
    if CopyActive then
        CopyLoopBtn.Text = "النسخ شغال علنياً وبدون توقف! 🔥"
        CopyLoopBtn.BackgroundColor3 = Color3.fromRGB(25, 150, 60)
        CopyThread = task.spawn(function()
            while CopyActive do
                local rawCmd = CmdBox.Text
                for plrName, active in pairs(SelectedPlayers) do
                    if active and CopyActive then
                        local finalCmd = string.gsub(rawCmd, "%%plr", plrName)
                        PublicSendChat(finalCmd)
                        task.wait(0.12)
                    end
                end
                task.wait(0.2)
            end
        end)
    else
        if CopyThread then task.cancel(CopyThread) end
        CopyLoopBtn.Text = "تشغيل النسخ والـ Spam تلقائياً (متوقف) 🛑"
        CopyLoopBtn.BackgroundColor3 = Color3.fromRGB(150, 15, 25)
    end
end)

-- =================================================================
-- 2. TAB: حماية (أوامر مخفية ;unjc و ;unice)
-- =================================================================
local ProtectPage = TabPages["حماية"]

local ProtectBtn = Instance.new("TextButton")
ProtectBtn.Size = UDim2.new(1, 0, 0, 50)
ProtectBtn.Position = UDim2.new(0, 0, 0, 20)
ProtectBtn.Text = "تفعيل حماية الـ Spam الخارقة (;unjc ;unice) 🛡️"
ProtectBtn.BackgroundColor3 = Color3.fromRGB(150, 15, 25)
ProtectBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ProtectBtn.Font = Enum.Font.GothamBold
ProtectBtn.TextSize = 15
ProtectBtn.Parent = ProtectPage
local pbc = Instance.new("UICorner", ProtectBtn) pbc.CornerRadius = UDim.new(0,10)

local Protecting = false
local ProtectThread = nil

ProtectBtn.MouseButton1Click:Connect(function()
    Protecting = not Protecting
    if Protecting then
        ProtectBtn.Text = "الحماية المخفية تعمل بأقصى سرعة! ⚡"
        ProtectBtn.BackgroundColor3 = Color3.fromRGB(25, 150, 60)
        ProtectThread = task.spawn(function()
            while Protecting do
                SilentSendProtect(";unjc")
                task.wait(0.05)
                SilentSendProtect(";unice")
                task.wait(0.05)
            end
        end)
    else
        if ProtectThread then task.cancel(ProtectThread) end
        ProtectBtn.Text = "تفعيل حماية الـ Spam الخارقة (;unjc ;unice) 🛡️"
        ProtectBtn.BackgroundColor3 = Color3.fromRGB(150, 15, 25)
    end
end)

-- =================================================================
-- 3. TAB: تجهيز نسخ (المستبدل السريع مع ;)
-- =================================================================
local PrepPage = TabPages["تجهيز نسخ"]

local OldCommandsText = ";jail Svr, ;jail2 Svr, ;freeze Svr, ;kill Svr, ;loopkill Svr, ;respawn Svr, ;refresh Svr, ;void Svr, ;fire Svr, ;bring Svr, ;to Svr, ;teleport Svr, ;handTo Svr, ;box Svr, ;dog Svr, ;worm Svr, ;wormify Svr, ;chibify Svr, ;plushify Svr, ;freaky Svr, ;frogly Svr, ;spongify Svr, ;bigify Svr, ;creepify Svr, ;dinofy Svr, ;fatify Svr, ;ghost Svr, ;squash Svr, ;fat Svr, ;thin Svr, ;giantDwarf Svr, ;dwarf Svr, ;headSize Svr, ;bodyTypeScale Svr, ;depth Svr, ;potatoHead Svr, ;char Svr, ;cmdbar Svr, ;logs Svr, ;chatLogs Svr"

local SourceBox = Instance.new("TextBox")
SourceBox.Size = UDim2.new(1, 0, 0, 65)
SourceBox.Position = UDim2.new(0, 0, 0, 0)
SourceBox.Text = OldCommandsText
SourceBox.MultiLine = true
SourceBox.ClearTextOnFocus = false
SourceBox.Font = Enum.Font.GothamBold
SourceBox.TextSize = 11
SourceBox.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
SourceBox.TextColor3 = Color3.fromRGB(200, 200, 200)
SourceBox.TextWrapped = true
SourceBox.Parent = PrepPage
local sbc = Instance.new("UICorner", SourceBox) sbc.CornerRadius = UDim.new(0,6)

local OldTarget = Instance.new("TextBox")
OldTarget.Size = UDim2.new(0.48, 0, 0, 32)
OldTarget.Position = UDim2.new(0, 0, 0, 72)
OldTarget.Text = "Svr"
OldTarget.Font = Enum.Font.GothamBold
OldTarget.PlaceholderText = "الاسم القديم"
OldTarget.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
OldTarget.TextColor3 = Color3.fromRGB(255, 255, 255)
OldTarget.Parent = PrepPage
local otc = Instance.new("UICorner", OldTarget) otc.CornerRadius = UDim.new(0,6)

local NewTarget = Instance.new("TextBox")
NewTarget.Size = UDim2.new(0.48, 0, 0, 32)
NewTarget.Position = UDim2.new(0.52, 0, 0, 72)
NewTarget.Text = "Mohammed"
NewTarget.Font = Enum.Font.GothamBold
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
OutputBox.Font = Enum.Font.GothamBold
OutputBox.TextSize = 11
OutputBox.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
OutputBox.TextColor3 = Color3.fromRGB(0, 255, 150)
OutputBox.TextWrapped = true
OutputBox.Parent = PrepPage
local obc = Instance.new("UICorner", OutputBox) obc.CornerRadius = UDim.new(0,6)

local ConvertBtn = Instance.new("TextButton")
ConvertBtn.Size = UDim2.new(1, 0, 0, 35)
ConvertBtn.Position = UDim2.new(0, 0, 0, 182)
ConvertBtn.Text = "تحديث ونسخ النص فوراً ⚡"
ConvertBtn.BackgroundColor3 = Color3.fromRGB(180, 18, 32)
ConvertBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ConvertBtn.Font = Enum.Font.GothamBold
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
    btn.BackgroundColor3 = Color3.fromRGB(34, 34, 44)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 13
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
