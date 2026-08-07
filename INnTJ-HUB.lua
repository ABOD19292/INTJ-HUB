-- // ============================================ //
-- //         تم تشغيل سكربت عبود 🤩             //
-- // ============================================ //

local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer

-- UI Library Build (Custom Crimson/Dark Red Theme)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AboodScriptUI"
ScreenGui.ResetOnSpawn = false

-- Safe Parent Check
if gethui then
    ScreenGui.Parent = gethui()
elseif syn and syn.protect_gui then
    syn.protect_gui(ScreenGui)
    ScreenGui.Parent = game:GetService("CoreGui")
else
    ScreenGui.Parent = game:GetService("CoreGui")
end

-- Notification Banner (الإشعار العلوي)
local NotificationFrame = Instance.new("Frame")
NotificationFrame.Name = "NotificationFrame"
NotificationFrame.Size = UDim2.new(0, 280, 0, 35)
NotificationFrame.Position = UDim2.new(0.5, -140, 0, 15)
NotificationFrame.BackgroundColor3 = Color3.fromRGB(120, 10, 20)
NotificationFrame.BorderSizePixel = 0
NotificationFrame.Parent = ScreenGui

local NotifUICorner = Instance.new("UICorner", NotificationFrame)
NotifUICorner.CornerRadius = UDim.new(0, 8)

local NotifUIStroke = Instance.new("UIStroke", NotificationFrame)
NotifUIStroke.Color = Color3.fromRGB(220, 30, 45)
NotifUIStroke.Thickness = 1.5

local NotifLabel = Instance.new("TextLabel")
NotifLabel.Size = UDim2.new(1, 0, 1, 0)
NotifLabel.BackgroundTransparency = 1
NotifLabel.Text = "تم تشغيل سكربت عبود 🤩"
NotifLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
NotifLabel.TextSize = 16
NotifLabel.Font = Enum.Font.SourceSansBold
NotifLabel.Parent = NotificationFrame

task.delay(4, function()
    NotificationFrame:Destroy()
end)

-- Main Toggle Arrow (زر السهم الأحمر)
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Name = "ToggleArrow"
ToggleBtn.Size = UDim2.new(0, 32, 0, 32)
ToggleBtn.Position = UDim2.new(1, -40, 0.5, -16)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(150, 15, 25)
ToggleBtn.Text = "◄"
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.TextSize = 18
ToggleBtn.Font = Enum.Font.SourceSansBold
ToggleBtn.Parent = ScreenGui

local ArrowUICorner = Instance.new("UICorner", ToggleBtn)
ArrowUICorner.CornerRadius = UDim.new(0, 6)

-- Main Frame (النافذة الرئيسية)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 520, 0, 360)
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -180)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = true
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainUICorner = Instance.new("UICorner", MainFrame)
MainUICorner.CornerRadius = UDim.new(0, 10)

local MainUIStroke = Instance.new("UIStroke", MainFrame)
MainUIStroke.Color = Color3.fromRGB(180, 20, 35)
MainUIStroke.Thickness = 2

-- Toggle UI Functionality
ToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
    ToggleBtn.Text = MainFrame.Visible and "◄" or "►"
end)

-- Top Navigation Bar (الأزرار الأربعة فقط)
local NavFrame = Instance.new("Frame")
NavFrame.Size = UDim2.new(1, -20, 0, 40)
NavFrame.Position = UDim2.new(0, 10, 0, 10)
NavFrame.BackgroundTransparency = 1
NavFrame.Parent = MainFrame

local UIListLayoutNav = Instance.new("UIListLayout", NavFrame)
UIListLayoutNav.FillDirection = Enum.FillDirection.Horizontal
UIListLayoutNav.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayoutNav.Padding = UDim.new(0, 8)

local Tabs = {"نسخ", "حماية", "تجهيز نسخ", "سكربتات إضافية"}
local TabButtons = {}
local TabPages = {}

-- Container for Pages
local Container = Instance.new("Frame")
Container.Size = UDim2.new(1, -20, 1, -65)
Container.Position = UDim2.new(0, 10, 0, 55)
Container.BackgroundTransparency = 1
Container.Parent = MainFrame

for _, tabName in ipairs(Tabs) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.23, 0, 1, 0)
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
    btn.Text = tabName
    btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 15
    btn.Parent = NavFrame
    
    local btnCorner = Instance.new("UICorner", btn)
    btnCorner.CornerRadius = UDim.new(0, 6)
    
    local page = Instance.new("Frame")
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.Visible = false
    page.Parent = Container
    
    TabButtons[tabName] = btn
    TabPages[tabName] = page
    
    btn.MouseButton1Click:Connect(function()
        for t, b in pairs(TabButtons) do
            b.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
            b.TextColor3 = Color3.fromRGB(200, 200, 200)
        end
        for t, p in pairs(TabPages) do
            p.Visible = false
        end
        btn.BackgroundColor3 = Color3.fromRGB(160, 20, 35)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        page.Visible = true
    end)
end

-- Set Default Active Tab
TabButtons["نسخ"].BackgroundColor3 = Color3.fromRGB(160, 20, 35)
TabButtons["نسخ"].TextColor3 = Color3.fromRGB(255, 255, 255)
TabPages["نسخ"].Visible = true

-- Chat Execution Function (حل مشكلة عدم وجود الشات)
local function SendChatMessage(msg)
    if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        local generalChannel = TextChatService.TextChannels:FindFirstChild("RBXGeneral")
        if generalChannel then
            generalChannel:SendAsync(msg)
        end
    else
        local chatRemote = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents") and ReplicatedStorage.DefaultChatSystemChatEvents:FindFirstChild("SayMessageRequest")
        if chatRemote then
            chatRemote:FireServer(msg, "All")
        end
    end
end

-- ============================================
-- 1. صفحة "نسخ" (Players & Command Selection)
-- ============================================
local CopyPage = TabPages["نسخ"]

local PlayersScroll = Instance.new("ScrollingFrame")
PlayersScroll.Size = UDim2.new(1, 0, 0, 120)
PlayersScroll.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
PlayersScroll.BorderSizePixel = 0
PlayersScroll.Parent = CopyPage

local Grid = Instance.new("UIGridLayout", PlayersScroll)
Grid.CellSize = UDim2.new(0.31, 0, 0, 30)
Grid.CellPadding = UDim2.new(0.02, 0, 0, 5)

local SelectedPlayers = {}

local function RefreshPlayerList()
    for _, child in ipairs(PlayersScroll:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    for _, plr in ipairs(Players:GetPlayers()) do
        local pBtn = Instance.new("TextButton")
        pBtn.Text = plr.DisplayName
        pBtn.BackgroundColor3 = SelectedPlayers[plr.Name] and Color3.fromRGB(180, 20, 35) or Color3.fromRGB(40, 40, 50)
        pBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        pBtn.Font = Enum.Font.SourceSans
        pBtn.TextSize = 14
        pBtn.Parent = PlayersScroll
        
        local corner = Instance.new("UICorner", pBtn)
        corner.CornerRadius = UDim.new(0, 4)
        
        pBtn.MouseButton1Click:Connect(function()
            if SelectedPlayers[plr.Name] then
                SelectedPlayers[plr.Name] = nil
                pBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
            else
                SelectedPlayers[plr.Name] = true
                pBtn.BackgroundColor3 = Color3.fromRGB(180, 20, 35)
            end
        end)
    end
end

Players.PlayerAdded:Connect(RefreshPlayerList)
Players.PlayerRemoving:Connect(RefreshPlayerList)
RefreshPlayerList()

-- Custom Command Input
local CmdInput = Instance.new("TextBox")
CmdInput.Size = UDim2.new(0.7, 0, 0, 35)
CmdInput.Position = UDim2.new(0, 0, 0, 130)
CmdInput.PlaceholderText = "أضف أمر إلى قائمة النسخ (مثال: ;re أو ;jail)"
CmdInput.Text = ""
CmdInput.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
CmdInput.TextColor3 = Color3.fromRGB(255, 255, 255)
CmdInput.Parent = CopyPage

local AddCmdBtn = Instance.new("TextButton")
AddCmdBtn.Size = UDim2.new(0.28, 0, 0, 35)
AddCmdBtn.Position = UDim2.new(0.72, 0, 0, 130)
AddCmdBtn.Text = "إضافة"
AddCmdBtn.BackgroundColor3 = Color3.fromRGB(160, 20, 35)
AddCmdBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AddCmdBtn.Font = Enum.Font.SourceSansBold
AddCmdBtn.Parent = CopyPage

-- Spam / Execute Button
local RunSpamBtn = Instance.new("TextButton")
RunSpamBtn.Size = UDim2.new(1, 0, 0, 40)
RunSpamBtn.Position = UDim2.new(0, 0, 1, -40)
RunSpamBtn.Text = "تشغيل الـ Spam والأوامر على اللاعبين المحselected 🔥"
RunSpamBtn.BackgroundColor3 = Color3.fromRGB(180, 20, 35)
RunSpamBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
RunSpamBtn.Font = Enum.Font.SourceSansBold
RunSpamBtn.TextSize = 16
RunSpamBtn.Parent = CopyPage

-- ============================================
-- 2. صفحة "حماية" (Protection Tab)
-- ============================================
local ProtectPage = TabPages["حماية"]

local ProtectToggle = Instance.new("TextButton")
ProtectToggle.Size = UDim2.new(1, 0, 0, 45)
ProtectToggle.Position = UDim2.new(0, 0, 0, 10)
ProtectToggle.Text = "تفعيل الحماية (معلق) 🛡️"
ProtectToggle.BackgroundColor3 = Color3.fromRGB(150, 20, 20)
ProtectToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
ProtectToggle.Font = Enum.Font.SourceSansBold
ProtectToggle.TextSize = 16
ProtectToggle.Parent = ProtectPage

local ProtectActive = false
ProtectToggle.MouseButton1Click:Connect(function()
    ProtectActive = not ProtectActive
    if ProtectActive then
        ProtectToggle.Text = "الحماية مفعلة شغال 🛡️"
        ProtectToggle.BackgroundColor3 = Color3.fromRGB(20, 150, 50)
        
        task.spawn(function()
            while ProtectActive do
                SendChatMessage("/unjc")
                task.wait(0.1)
                SendChatMessage("/unice")
                task.wait(0.2)
            end
        end)
    else
        ProtectToggle.Text = "تفعيل الحماية (معلق) 🛡️"
        ProtectToggle.BackgroundColor3 = Color3.fromRGB(150, 20, 20)
    end
end)

-- ============================================
-- 3. صفحة "تجهيز نسخ" (Command Text Replacer)
-- ============================================
local PrepPage = TabPages["تجهيز نسخ"]

local OldText = Instance.new("TextBox")
OldText.Size = UDim2.new(1, 0, 0, 60)
OldText.Position = UDim2.new(0, 0, 0, 0)
OldText.MultiLine = true
OldText.ClearTextOnFocus = false
OldText.Text = ";jail Svr, ;jail2 Svr, ;freeze Svr, ;kill Svr, ;loopkill Svr, ;respawn Svr, ;refresh Svr, ;void Svr, ;fire Svr, ;bring Svr, ;to Svr, ;teleport Svr, ;handTo Svr, ;box Svr, ;dog Svr, ;worm Svr, ;wormify Svr, ;chibify Svr, ;plushify Svr, ;freaky Svr, ;frogly Svr, ;spongify Svr, ;bigify Svr, ;creepify Svr, ;dinofy Svr, ;fatify Svr, ;ghost Svr, ;squash Svr, ;fat Svr, ;thin Svr, ;giantDwarf Svr, ;dwarf Svr, ;headSize Svr, ;bodyTypeScale Svr, ;depth Svr, ;potatoHead Svr, ;char Svr, ;cmdbar Svr, ;logs Svr, ;chatLogs Svr"
OldText.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
OldText.TextColor3 = Color3.fromRGB(200, 200, 200)
OldText.TextWrapped = true
OldText.Parent = PrepPage

local TargetName = Instance.new("TextBox")
TargetName.Size = UDim2.new(0.48, 0, 0, 35)
TargetName.Position = UDim2.new(0, 0, 0, 70)
TargetName.PlaceholderText = "الاسم القديم (مثال: Svr)"
TargetName.Text = "Svr"
TargetName.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
TargetName.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetName.Parent = PrepPage

local NewName = Instance.new("TextBox")
NewName.Size = UDim2.new(0.48, 0, 0, 35)
NewName.Position = UDim2.new(0.52, 0, 0, 70)
NewName.PlaceholderText = "الاسم الجديد (مثال: Mohammed)"
NewName.Text = ""
NewName.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
NewName.TextColor3 = Color3.fromRGB(255, 255, 255)
NewName.Parent = PrepPage

local ResultBox = Instance.new("TextBox")
ResultBox.Size = UDim2.new(1, 0, 0, 70)
ResultBox.Position = UDim2.new(0, 0, 0, 115)
ResultBox.MultiLine = true
ResultBox.PlaceholderText = "النسخ الجديد يظهر هنا..."
ResultBox.Text = ""
ResultBox.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
ResultBox.TextColor3 = Color3.fromRGB(0, 255, 150)
ResultBox.TextWrapped = true
ResultBox.Parent = PrepPage

local ConvertBtn = Instance.new("TextButton")
ConvertBtn.Size = UDim2.new(1, 0, 0, 35)
ConvertBtn.Position = UDim2.new(0, 0, 0, 195)
ConvertBtn.Text = "تحديث واستبدال النص ⚡"
ConvertBtn.BackgroundColor3 = Color3.fromRGB(160, 20, 35)
ConvertBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ConvertBtn.Font = Enum.Font.SourceSansBold
ConvertBtn.Parent = PrepPage

ConvertBtn.MouseButton1Click:Connect(function()
    local source = OldText.Text
    local oldN = TargetName.Text
    local newN = NewName.Text
    
    if oldN ~= "" and newN ~= "" then
        local updated = string.gsub(source, oldN, newN)
        ResultBox.Text = updated
        if setclipboard then
            setclipboard(updated)
            ConvertBtn.Text = "تم النسخ إلى الحافظة تلقائياً! ✅"
            task.wait(2)
            ConvertBtn.Text = "تحديث واستبدال النص ⚡"
        end
    end
end)

-- ============================================
-- 4. صفحة "سكربتات إضافية" (Extra Scripts)
-- ============================================
local ExtraPage = TabPages["سكربتات إضافية"]

local InfoLabel = Instance.new("TextLabel")
InfoLabel.Size = UDim2.new(1, 0, 1, 0)
InfoLabel.BackgroundTransparency = 1
InfoLabel.Text = "قسم السكربتات الإضافية جاهز لإضافة أدواتك الخاصة 🔥"
InfoLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
InfoLabel.Font = Enum.Font.SourceSansBold
InfoLabel.TextSize = 16
InfoLabel.Parent = ExtraPage
