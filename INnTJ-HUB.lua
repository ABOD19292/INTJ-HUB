-- // ================================================================= //
-- //                INTJ-HUB : ABOOD GOD-MODE FINAL V15               //
-- //          EXACT UI REPLICA + AUTO RE ON DEATH FEATURE             //
-- // ================================================================= //

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextChatService = game:GetService("TextChatService")

-- // Container Creation
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AboodGodModeHUB_V15"
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

-- // --- 1. الشعار العلوي الأخضر (تم تفعيل سكربت عبود 🤩) --- //
local StaticNotif = Instance.new("Frame")
StaticNotif.Name = "AboodGreenBanner"
StaticNotif.Size = UDim2.new(0, 260, 0, 32)
StaticNotif.Position = UDim2.new(0.5, -130, 0, 15)
StaticNotif.BackgroundColor3 = Color3.fromRGB(0, 180, 75)
StaticNotif.BorderSizePixel = 0
StaticNotif.Parent = ScreenGui

local NotifCorner = Instance.new("UICorner", StaticNotif)
NotifCorner.CornerRadius = UDim.new(0, 16)

local GreenDot = Instance.new("Frame")
GreenDot.Size = UDim2.new(0, 8, 0, 8)
GreenDot.Position = UDim2.new(0, 18, 0.5, -4)
GreenDot.BackgroundColor3 = Color3.fromRGB(180, 255, 180)
GreenDot.BorderSizePixel = 0
GreenDot.Parent = StaticNotif
local DotCorner = Instance.new("UICorner", GreenDot)
DotCorner.CornerRadius = UDim.new(1, 0)

local NotifText = Instance.new("TextLabel")
NotifText.Size = UDim2.new(1, -30, 1, 0)
NotifText.Position = UDim2.new(0, 28, 0, 0)
NotifText.BackgroundTransparency = 1
NotifText.Text = "تم تفعيل سكربت عبود 🤩"
NotifText.TextColor3 = Color3.fromRGB(255, 255, 255)
NotifText.TextSize = 14
NotifText.Font = Enum.Font.GothamBold
NotifText.TextXAlignment = Enum.TextXAlignment.Center
NotifText.Parent = StaticNotif

-- // --- 2. محركات إرسال الشات القوية --- //
local function UltraPublicChat(msg)
    pcall(function()
        if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
            local channels = TextChatService:FindFirstChild("TextChannels")
            if channels then
                local mainChan = channels:FindFirstChild("RBXGeneral") or channels:FindFirstChild("All")
                if mainChan then mainChan:SendAsync(msg) end
            end
        end
        local chatEvents = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
        if chatEvents and chatEvents:FindFirstChild("SayMessageRequest") then
            chatEvents.SayMessageRequest:FireServer(msg, "All")
        end
    end)
end

local function UltraSilentProtect(msg)
    pcall(function()
        for _, remote in ipairs(ReplicatedStorage:GetDescendants()) do
            if remote:IsA("RemoteEvent") then
                local low = string.lower(remote.Name)
                if low:find("chat") or low:find("say") or low:find("msg") or low:find("cmd") or low:find("admin") then
                    remote:FireServer(msg, "All")
                end
            end
        end
    end)
end

-- // --- 3. زر الاختصار الجانبي (ABOD) --- //
local ToggleContainer = Instance.new("Frame")
ToggleContainer.Size = UDim2.new(0, 75, 0, 36)
ToggleContainer.Position = UDim2.new(1, -85, 0.5, 10)
ToggleContainer.BackgroundTransparency = 1
ToggleContainer.Parent = ScreenGui

local AboodBtn = Instance.new("TextButton")
AboodBtn.Size = UDim2.new(0, 48, 1, 0)
AboodBtn.BackgroundColor3 = Color3.fromRGB(220, 15, 25)
AboodBtn.Text = "ABOD"
AboodBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AboodBtn.Font = Enum.Font.GothamBold
AboodBtn.TextSize = 13
AboodBtn.Parent = ToggleContainer
local abc = Instance.new("UICorner", AboodBtn) abc.CornerRadius = UDim.new(0, 6)

local ArrowBtn = Instance.new("TextButton")
ArrowBtn.Size = UDim2.new(0, 22, 1, 0)
ArrowBtn.Position = UDim2.new(0, 52, 0, 0)
ArrowBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 75)
ArrowBtn.Text = "◄"
ArrowBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ArrowBtn.Font = Enum.Font.GothamBold
ArrowBtn.TextSize = 12
ArrowBtn.Parent = ToggleContainer
local arc = Instance.new("UICorner", ArrowBtn) arc.CornerRadius = UDim.new(0, 6)

-- // --- 4. الواجهة الرئيسية --- //
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 560, 0, 380)
MainFrame.Position = UDim2.new(0.5, -280, 0.5, -190)
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 14, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner", MainFrame)
MainCorner.CornerRadius = UDim.new(0, 10)

local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Color = Color3.fromRGB(0, 220, 100)
MainStroke.Thickness = 2

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
FooterText.Text = "🔥 Modified & Executed by yassin_3mk033 | Hacker Edition 🔥"
FooterText.TextColor3 = Color3.fromRGB(200, 200, 200)
FooterText.Font = Enum.Font.GothamBold
FooterText.TextSize = 11
FooterText.Parent = MainFrame

-- شريط التبويبات
local NavFrame = Instance.new("Frame")
NavFrame.Size = UDim2.new(1, -20, 0, 36)
NavFrame.Position = UDim2.new(0, 10, 0, 12)
NavFrame.BackgroundTransparency = 1
NavFrame.Parent = MainFrame

local NavLayout = Instance.new("UIListLayout", NavFrame)
NavLayout.FillDirection = Enum.FillDirection.Horizontal
NavLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
NavLayout.Padding = UDim.new(0, 6)

local Container = Instance.new("Frame")
Container.Size = UDim2.new(1, -24, 1, -80)
Container.Position = UDim2.new(0, 12, 0, 55)
Container.BackgroundTransparency = 1
Container.Parent = MainFrame

local TabsList = {"سكربتات إضافية", "cmdbar2", "حماية", "نسخ", "تخريب على الكل"}
local TabPages = {}
local ActiveTabBtn = nil

for i, tabName in ipairs(TabsList) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.188, 0, 1, 0)
    btn.BackgroundColor3 = Color3.fromRGB(22, 24, 32)
    btn.Text = tabName
    btn.TextColor3 = Color3.fromRGB(220, 220, 220)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 12
    btn.Parent = NavFrame

    local bc = Instance.new("UICorner", btn) bc.CornerRadius = UDim.new(0, 6)

    local page = Instance.new("Frame")
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.Visible = false
    page.Parent = Container
    TabPages[tabName] = page

    btn.MouseButton1Click:Connect(function()
        if ActiveTabBtn then
            ActiveTabBtn.BackgroundColor3 = Color3.fromRGB(22, 24, 32)
            ActiveTabBtn.TextColor3 = Color3.fromRGB(220, 220, 220)
            TabPages[ActiveTabBtn.Text].Visible = false
        end
        ActiveTabBtn = btn
        btn.BackgroundColor3 = Color3.fromRGB(0, 180, 75)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        page.Visible = true
    end)

    if tabName == "حماية" then
        ActiveTabBtn = btn
        btn.BackgroundColor3 = Color3.fromRGB(0, 180, 75)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        page.Visible = true
    end
end

-- =================================================================
-- TAB: حماية (محدث بـ Auto Re عند الموت)
-- =================================================================
local ProtectPage = TabPages["حماية"]

local ProtToggleBtn = Instance.new("TextButton")
ProtToggleBtn.Size = UDim2.new(1, 0, 0, 36)
ProtToggleBtn.Position = UDim2.new(0, 0, 0, 5)
ProtToggleBtn.BackgroundColor3 = Color3.fromRGB(200, 20, 30)
ProtToggleBtn.Text = "🛡️ تفعيل الحماية (مغلق)"
ProtToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ProtToggleBtn.Font = Enum.Font.GothamBold
ProtToggleBtn.TextSize = 13
ProtToggleBtn.Parent = ProtectPage
local ptc = Instance.new("UICorner", ProtToggleBtn) ptc.CornerRadius = UDim.new(0, 6)

-- زر الـ Auto Re عند الموت
local AutoReBtn = Instance.new("TextButton")
AutoReBtn.Size = UDim2.new(1, 0, 0, 36)
AutoReBtn.Position = UDim2.new(0, 0, 0, 48)
AutoReBtn.BackgroundColor3 = Color3.fromRGB(200, 20, 30)
AutoReBtn.Text = "💀 إعادة رسبون تلقائي عند الموت Auto ;re (مغلق)"
AutoReBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoReBtn.Font = Enum.Font.GothamBold
AutoReBtn.TextSize = 13
AutoReBtn.Parent = ProtectPage
local arc2 = Instance.new("UICorner", AutoReBtn) arc2.CornerRadius = UDim.new(0, 6)

local ProtTitle = Instance.new("TextLabel")
ProtTitle.Size = UDim2.new(1, 0, 0, 22)
ProtTitle.Position = UDim2.new(0, 0, 0, 90)
ProtTitle.BackgroundTransparency = 1
ProtTitle.Text = "🛡️ جدار حظر وحماية ملفات السجل والـ UI والأوامر"
ProtTitle.TextColor3 = Color3.fromRGB(0, 220, 100)
ProtTitle.Font = Enum.Font.GothamBold
ProtTitle.TextSize = 12
ProtTitle.Parent = ProtectPage

local ProtDesc = Instance.new("TextLabel")
ProtDesc.Size = UDim2.new(1, 0, 0, 40)
ProtDesc.Position = UDim2.new(0, 0, 0, 114)
ProtDesc.BackgroundTransparency = 1
ProtDesc.Text = "عند تشغيل هذا الجدار، سيقوم السكربت تلقائياً بحذف وتدمير أي لوحات كونسول أو سجلات أو واجهات أدمن قد تكشف ما تفعله داخل السيرفر لحمايتك بشكل كامل وفوري."
ProtDesc.TextColor3 = Color3.fromRGB(170, 170, 180)
ProtDesc.Font = Enum.Font.GothamBold
ProtDesc.TextSize = 10
ProtDesc.TextWrapped = true
ProtDesc.Parent = ProtectPage

local WallBtn = Instance.new("TextButton")
WallBtn.Size = UDim2.new(1, 0, 0, 36)
WallBtn.Position = UDim2.new(0, 0, 0, 160)
WallBtn.BackgroundColor3 = Color3.fromRGB(180, 10, 30)
WallBtn.Text = "🔒 تفعيل جدار حظر الأوامر والـ UI"
WallBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
WallBtn.Font = Enum.Font.GothamBold
WallBtn.TextSize = 13
WallBtn.Parent = ProtectPage
local wbc = Instance.new("UICorner", WallBtn) wbc.CornerRadius = UDim.new(0, 6)

-- برمجة الحماية
local IsProtecting = false
local ProtectThread = nil

ProtToggleBtn.MouseButton1Click:Connect(function()
    IsProtecting = not IsProtecting
    if IsProtecting then
        ProtToggleBtn.Text = "🛡️ الحماية الخارقة مفعلة الآن!⚡"
        ProtToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 75)
        ProtectThread = task.spawn(function()
            while IsProtecting do
                UltraSilentProtect(";unjc")
                task.wait(0.04)
                UltraSilentProtect(";unice")
                task.wait(0.04)
            end
        end)
    else
        if ProtectThread then task.cancel(ProtectThread) end
        ProtToggleBtn.Text = "🛡️ تفعيل الحماية (مغلق)"
        ProtToggleBtn.BackgroundColor3 = Color3.fromRGB(200, 20, 30)
    end
end)

-- برمجة الـ Auto Re تلقائي عند الموت
local AutoReEnabled = false

local function SetupDeathListener(char)
    if not char then return end
    local humanoid = char:WaitForChild("Humanoid", 5)
    if humanoid then
        humanoid.Died:Connect(function()
            if AutoReEnabled then
                UltraPublicChat(";re")
                UltraSilentProtect(";re")
            end
        end)
    end
end

if LocalPlayer.Character then SetupDeathListener(LocalPlayer.Character) end
LocalPlayer.CharacterAdded:Connect(SetupDeathListener)

AutoReBtn.MouseButton1Click:Connect(function()
    AutoReEnabled = not AutoReEnabled
    if AutoReEnabled then
        AutoReBtn.Text = "⚡ إعادة رسبون تلقائي مفعلة الآن (Auto ;re)"
        AutoReBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 75)
    else
        AutoReBtn.Text = "💀 إعادة رسبون تلقائي عند الموت Auto ;re (مغلق)"
        AutoReBtn.BackgroundColor3 = Color3.fromRGB(200, 20, 30)
    end
end)

-- =================================================================
-- TAB: نسخ
-- =================================================================
local CopyPage = TabPages["نسخ"]

local PlayerScroll = Instance.new("ScrollingFrame")
PlayerScroll.Size = UDim2.new(1, 0, 0, 110)
PlayerScroll.BackgroundColor3 = Color3.fromRGB(18, 20, 28)
PlayerScroll.BorderSizePixel = 0
PlayerScroll.ScrollBarThickness = 4
PlayerScroll.Parent = CopyPage

local PlayerGrid = Instance.new("UIGridLayout", PlayerScroll)
PlayerGrid.CellSize = UDim2.new(0.315, 0, 0, 28)
PlayerGrid.CellPadding = UDim2.new(0.018, 0, 0, 6)

local SelectedPlayers = {}

local function RefreshList()
    for _, child in ipairs(PlayerScroll:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    for _, plr in ipairs(Players:GetPlayers()) do
        local pBtn = Instance.new("TextButton")
        pBtn.Text = plr.Name
        pBtn.BackgroundColor3 = SelectedPlayers[plr.Name] and Color3.fromRGB(0, 180, 75) or Color3.fromRGB(28, 30, 42)
        pBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        pBtn.Font = Enum.Font.GothamBold
        pBtn.TextSize = 11
        pBtn.Parent = PlayerScroll
        
        local c = Instance.new("UICorner", pBtn) c.CornerRadius = UDim.new(0, 5)

        pBtn.MouseButton1Click:Connect(function()
            if SelectedPlayers[plr.Name] then
                SelectedPlayers[plr.Name] = nil
                pBtn.BackgroundColor3 = Color3.fromRGB(28, 30, 42)
            else
                SelectedPlayers[plr.Name] = true
                pBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 75)
            end
        end)
    end
end
Players.PlayerAdded:Connect(RefreshList)
Players.PlayerRemoving:Connect(RefreshList)
RefreshList()

local AddCmdFrame = Instance.new("Frame")
AddCmdFrame.Size = UDim2.new(1, 0, 0, 32)
AddCmdFrame.Position = UDim2.new(0, 0, 0, 118)
AddCmdFrame.BackgroundTransparency = 1
AddCmdFrame.Parent = CopyPage

local AddInput = Instance.new("TextBox")
AddInput.Size = UDim2.new(0.8, -6, 1, 0)
AddInput.BackgroundColor3 = Color3.fromRGB(22, 24, 34)
AddInput.PlaceholderText = "أضف أمر إلى قائمة النسخ (مثال: ;re أو ;ap)"
AddInput.Text = ""
AddInput.TextColor3 = Color3.fromRGB(255, 255, 255)
AddInput.Font = Enum.Font.GothamBold
AddInput.TextSize = 11
AddInput.Parent = AddCmdFrame
local aic = Instance.new("UICorner", AddInput) aic.CornerRadius = UDim.new(0, 5)

local AddBtn = Instance.new("TextButton")
AddBtn.Size = UDim2.new(0.2, 0, 1, 0)
AddBtn.Position = UDim2.new(0.8, 0, 0, 0)
AddBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 75)
AddBtn.Text = "إضافة"
AddBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AddBtn.Font = Enum.Font.GothamBold
AddBtn.TextSize = 12
AddBtn.Parent = AddCmdFrame
local abc2 = Instance.new("UICorner", AddBtn) abc2.CornerRadius = UDim.new(0, 5)

local CmdScroll = Instance.new("ScrollingFrame")
CmdScroll.Size = UDim2.new(1, 0, 0, 80)
CmdScroll.Position = UDim2.new(0, 0, 0, 155)
CmdScroll.BackgroundColor3 = Color3.fromRGB(18, 20, 28)
CmdScroll.BorderSizePixel = 0
CmdScroll.ScrollBarThickness = 4
CmdScroll.Parent = CopyPage

local CmdListLayout = Instance.new("UIListLayout", CmdScroll)
CmdListLayout.Padding = UDim.new(0, 4)

local ActiveCmds = {";jail", ";bigHead", ";ice", ";kill"}

local function RefreshCmds()
    for _, child in ipairs(CmdScroll:GetChildren()) do
        if child:IsA("Frame") then child:Destroy() end
    end
    for idx, cmdText in ipairs(ActiveCmds) do
        local row = Instance.new("Frame")
        row.Size = UDim2.new(1, -8, 0, 24)
        row.BackgroundColor3 = Color3.fromRGB(26, 28, 38)
        row.Parent = CmdScroll
        local rc = Instance.new("UICorner", row) rc.CornerRadius = UDim.new(0, 4)

        local lbl = Instance.new("TextLabel")
        lbl.Size = UDim2.new(1, -10, 1, 0)
        lbl.Position = UDim2.new(0, 10, 0, 0)
        lbl.BackgroundTransparency = 1
        lbl.Text = cmdText .. " (اضغط للحذف)"
        lbl.TextColor3 = Color3.fromRGB(240, 200, 80)
        lbl.Font = Enum.Font.GothamBold
        lbl.TextSize = 11
        lbl.TextXAlignment = Enum.TextXAlignment.Center
        lbl.Parent = row

        local btnDel = Instance.new("TextButton")
        btnDel.Size = UDim2.new(1, 0, 1, 0)
        btnDel.BackgroundTransparency = 1
        btnDel.Text = ""
        btnDel.Parent = row

        btnDel.MouseButton1Click:Connect(function()
            table.remove(ActiveCmds, idx)
            RefreshCmds()
        end)
    end
end
RefreshCmds()

AddBtn.MouseButton1Click:Connect(function()
    if AddInput.Text ~= "" then
        table.insert(ActiveCmds, AddInput.Text)
        AddInput.Text = ""
        RefreshCmds()
    end
end)

local RunSpamBtn = Instance.new("TextButton")
RunSpamBtn.Size = UDim2.new(1, 0, 0, 36)
RunSpamBtn.Position = UDim2.new(0, 0, 1, -36)
RunSpamBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 75)
RunSpamBtn.Text = "🔥 تشغيل الـ Spam والأوامر على اللاعبين المحددين"
RunSpamBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
RunSpamBtn.Font = Enum.Font.GothamBold
RunSpamBtn.TextSize = 13
RunSpamBtn.Parent = CopyPage
local rsc = Instance.new("UICorner", RunSpamBtn) rsc.CornerRadius = UDim.new(0, 6)

local SpamActive = false
local SpamThread = nil

RunSpamBtn.MouseButton1Click:Connect(function()
    SpamActive = not SpamActive
    if SpamActive then
        RunSpamBtn.Text = "الـ Spam شغال بأقصى قوة الآن! ⚡ (اضغط للإيقاف)"
        RunSpamBtn.BackgroundColor3 = Color3.fromRGB(200, 20, 30)
        SpamThread = task.spawn(function()
            while SpamActive do
                for plrName, active in pairs(SelectedPlayers) do
                    if active and SpamActive then
                        for _, cmd in ipairs(ActiveCmds) do
                            UltraPublicChat(cmd .. " " .. plrName)
                            task.wait(0.04)
                        end
                    end
                end
                task.wait(0.1)
            end
        end)
    else
        if SpamThread then task.cancel(SpamThread) end
        RunSpamBtn.Text = "🔥 تشغيل الـ Spam والأوامر على اللاعبين المحددين"
        RunSpamBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 75)
    end
end)

-- =================================================================
-- TAB: سكربتات إضافية
-- =================================================================
local ExtraPage = TabPages["سكربتات إضافية"]

local ExtraGrid = Instance.new("UIGridLayout", ExtraPage)
ExtraGrid.CellSize = UDim2.new(0.48, 0, 0, 38)
ExtraGrid.CellPadding = UDim2.new(0.04, 0, 0, 10)

local function AddScriptButton(name, code)
    local btn = Instance.new("TextButton")
    btn.Text = name
    btn.BackgroundColor3 = Color3.fromRGB(22, 24, 34)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 12
    btn.Parent = ExtraPage
    local c = Instance.new("UICorner", btn) c.CornerRadius = UDim.new(0, 6)
    btn.MouseButton1Click:Connect(function()
        pcall(function() loadstring(code)() end)
    end)
end

AddScriptButton("Infinite Yield 👑", "loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()")
AddScriptButton("Fly Script 🕊️", "loadstring(game:HttpGet('https://raw.githubusercontent.com/jscripty/FlyScript/main/fly.lua'))()")
AddScriptButton("Rejoin Server 🔄", "game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId)")
AddScriptButton("Noclip 👻", "game:GetService('RunService').Stepped:Connect(function() for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do if v:IsA('BasePart') then v.CanCollide = false end end end)")
