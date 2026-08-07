-- سكربت إدارة عبود المطور والمترابط بالكامل - ABOD LIGHT ADMIN
local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")
local LocalPlayer = Players.LocalPlayer

-- 1. إنشاء الواجهة الأساسية (ScreenGui) وتأمين عدم تكرارها
if LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("AbodAdminGui") then
    LocalPlayer.PlayerGui.AbodAdminGui:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AbodAdminGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- 2. الزر الأحمر الجانبي لفتح السكربت (بديل السهم الأخضر)
local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "AbodToggleButton"
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Position = UDim2.new(0.95, -50, 0.5, -25)
ToggleButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
ToggleButton.Text = "ABOD"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.TextSize = 14
ToggleButton.Parent = ScreenGui

local UICorner_Btn = Instance.new("UICorner")
UICorner_Btn.CornerRadius = UDim.new(0, 8)
UICorner_Btn.Parent = ToggleButton

-- 3. القائمة الرئيسية (تأخذ ربع الشاشة)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0.35, 0, 0.5, 0)
MainFrame.Position = UDim2.new(0.325, 0, 0.25, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

local UICorner_Main = Instance.new("UICorner")
UICorner_Main.CornerRadius = UDim.new(0, 12)
UICorner_Main.Parent = MainFrame

-- خلفية صورة لايت الشفافة (نص وجه)
local BgImage = Instance.new("ImageLabel")
BgImage.Name = "LightBg"
BgImage.Size = UDim2.new(1, 0, 1, 0)
BgImage.BackgroundTransparency = 1
BgImage.Image = "rbxassetid://13470005089" 
BgImage.ImageTransparency = 0.85
BgImage.Parent = MainFrame

-- العنوان العلوي اسم عبود
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, 0, 0.1, 0)
TitleLabel.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
TitleLabel.Text = "ABOD - LIGHT"
TitleLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
TitleLabel.Font = Enum.Font.FredokaOne
TitleLabel.TextSize = 22
TitleLabel.Parent = MainFrame

-- 4. التبويبات الثلاثة في الأعلى (النسخ، الحماية، تجهيز النسخ)
local TabBar = Instance.new("Frame")
TabBar.Size = UDim2.new(1, 0, 0.1, 0)
TabBar.Position = UDim2.new(0, 0, 0.1, 0)
TabBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TabBar.Parent = MainFrame

local Tab1 = Instance.new("TextButton")
Tab1.Size = UDim2.new(0.33, 0, 1, 0)
Tab1.Text = "النسخ"
Tab1.TextColor3 = Color3.fromRGB(255, 255, 255)
Tab1.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Tab1.Parent = TabBar

local Tab2 = Instance.new("TextButton")
Tab2.Size = UDim2.new(0.33, 0, 1, 0)
Tab2.Position = UDim2.new(0.33, 0, 0, 0)
Tab2.Text = "الحماية"
Tab2.TextColor3 = Color3.fromRGB(255, 255, 255)
Tab2.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Tab2.Parent = TabBar

local Tab3 = Instance.new("TextButton")
Tab3.Size = UDim2.new(0.34, 0, 1, 0)
Tab3.Position = UDim2.new(0.66, 0, 0, 0)
Tab3.Text = "تجهيز النسخ"
Tab3.TextColor3 = Color3.fromRGB(255, 255, 255)
Tab3.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Tab3.Parent = TabBar

local PagesContainer = Instance.new("Frame")
PagesContainer.Size = UDim2.new(1, 0, 0.8, 0)
PagesContainer.Position = UDim2.new(0, 0, 0.2, 0)
PagesContainer.BackgroundTransparency = 1
PagesContainer.Parent = MainFrame

-- [صفحة 1: النسخ]
local Page_Copy = Instance.new("Frame")
Page_Copy.Size = UDim2.new(1, 0, 1, 0)
Page_Copy.BackgroundTransparency = 1
Page_Copy.Visible = true
Page_Copy.Parent = PagesContainer

local PlayerDropdown = Instance.new("TextBox")
PlayerDropdown.Size = UDim2.new(0.8, 0, 0.2, 0)
PlayerDropdown.Position = UDim2.new(0.1, 0, 0.1, 0)
PlayerDropdown.PlaceholderText = "اسم اللاعب المستهدف..."
PlayerDropdown.Text = ""
PlayerDropdown.Parent = Page_Copy

local StartCopyBtn = Instance.new("TextButton")
StartCopyBtn.Size = UDim2.new(0.8, 0, 0.2, 0)
StartCopyBtn.Position = UDim2.new(0.1, 0, 0.4, 0)
StartCopyBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
StartCopyBtn.Text = "ابدأ النسخ 🤩"
StartCopyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
StartCopyBtn.Parent = Page_Copy

-- [صفحة 2: الحماية]
local Page_Protect = Instance.new("Frame")
Page_Protect.Size = UDim2.new(1, 0, 1, 0)
Page_Protect.BackgroundTransparency = 1
Page_Protect.Visible = false
Page_Protect.Parent = PagesContainer

local ProtectBtn = Instance.new("TextButton")
ProtectBtn.Size = UDim2.new(0.8, 0, 0.2, 0)
ProtectBtn.Position = UDim2.new(0.1, 0, 0.3, 0)
ProtectBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
ProtectBtn.Text = "تشغيل الحماية الخاصة ب سكربت عبود 🔥"
ProtectBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ProtectBtn.Parent = Page_Protect

-- [صفحة 3: تجهيز النسخ]
local Page_Setup = Instance.new("Frame")
Page_Setup.Size = UDim2.new(1, 0, 1, 0)
Page_Setup.BackgroundTransparency = 1
Page_Setup.Visible = false
Page_Setup.Parent = PagesContainer

local SetupTitle = Instance.new("TextLabel")
SetupTitle.Size = UDim2.new(1, 0, 0.15, 0)
SetupTitle.Text = "نسخ قديم"
SetupTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
SetupTitle.BackgroundTransparency = 1
SetupTitle.Parent = Page_Setup

local OldNameInput = Instance.new("TextBox")
OldNameInput.Size = UDim2.new(0.4, 0, 0.15, 0)
OldNameInput.Position = UDim2.new(0.05, 0, 0.25, 0)
OldNameInput.Text = "9x"
OldNameInput.Parent = Page_Setup

local NewNameInput = Instance.new("TextBox")
NewNameInput.Size = UDim2.new(0.4, 0, 0.15, 0)
NewNameInput.Position = UDim2.new(0.55, 0, 0.25, 0)
NewNameInput.PlaceholderText = "الاسم الجديد"
NewNameInput.Text = ""
NewNameInput.Parent = Page_Setup

local ProcessSetupBtn = Instance.new("TextButton")
ProcessSetupBtn.Size = UDim2.new(0.8, 0, 0.2, 0)
ProcessSetupBtn.Position = UDim2.new(0.1, 0, 0.55, 0)
ProcessSetupBtn.BackgroundColor3 = Color3.fromRGB(100, 0, 150)
ProcessSetupBtn.Text = "تجهيز النسخ بالاسم الجديد"
ProcessSetupBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ProcessSetupBtn.Parent = Page_Setup

-- ================= نظام معالجة الأوامر المترابط السحابي =================

local baseCommands = ";jail 9x, ;jail2 9x, ;freeze 9x, ;kill 9x, ;loopkill 9x, ;respawn 9x, ;refresh 9x, ;void 9x, ;fire 9x, ;bring 9x, ;to 9x, ;teleport 9x, ;handTo 9x, ;box 9x, ;dog 9x, ;worm 9x, ;wormify 9x, ;chibify 9x, ;plushify 9x, ;freaky 9x, ;frogly 9x, ;spongify 9x, ;bigify 9x, ;creepify 9x, ;dinofy 9x, ;fatify 9x, ;ghost 9x, ;squash 9x, ;fat 9x, ;thin 9x, ;giantDwarf 9x, ;dwarf 9x, ;headSize 9x, ;bodyTypeScale 9x, ;depth 9x, ;potatoHead 9x, ;char 9x, ;cmdbar 9x, ;logs 9x ;ap 9x inf"

ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

Tab1.MouseButton1Click:Connect(function() Page_Copy.Visible = true; Page_Protect.Visible = false; Page_Setup.Visible = false end)
Tab2.MouseButton1Click:Connect(function() Page_Copy.Visible = false; Page_Protect.Visible = true; Page_Setup.Visible = false end)
Tab3.MouseButton1Click:Connect(function() Page_Copy.Visible = false; Page_Protect.Visible = false; Page_Setup.Visible = true end)

local function SendChatCommand(cmdText)
    if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        local channel = TextChatService.TextChannels.RBXGeneral
        if channel then channel:SendAsync(cmdText) end
    else
        local sayEvent = game:GetService("ReplicatedStorage"):FindFirstChild("SayMessageRequest", true)
        if sayEvent then sayEvent:FireServer(cmdText, "All") end
    end
end

-- الربط البرمجي الكامل والتحويل المباشر للأسماء للاستخدام بالقسم الأول
ProcessSetupBtn.MouseButton1Click:Connect(function()
    local oldTarget = OldNameInput.Text
    local newTarget = NewNameInput.Text
    
    if oldTarget == "" or newTarget == "" then return end
    
    baseCommands = string.gsub(baseCommands, oldTarget, newTarget)
    PlayerDropdown.Text = newTarget
    OldNameInput.Text = newTarget
    
    ProcessSetupBtn.Text = "✅ تم الربط تلقائياً بـ: " .. newTarget
    task.wait(1.5)
    ProcessSetupBtn.Text = "تجهيز النسخ بالاسم الجديد"
end)

local isCopying = false
StartCopyBtn.MouseButton1Click:Connect(function()
    if isCopying then
        isCopying = false
        StartCopyBtn.Text = "ابدأ النسخ 🤩"
        return
    end
    
    local finalPlayerName = PlayerDropdown.Text
    if finalPlayerName == "" then return end
    
    isCopying = true
    StartCopyBtn.Text = "إيقاف النسخ 🛑"
    
    local customizedCommands = string.gsub(baseCommands, "9x", finalPlayerName)
    
    task.spawn(function()
        while isCopying do
            for cmd in string.gmatch(customizedCommands, "[^,]+") do
                if not isCopying then break end
                SendChatCommand(string.gsub(cmd, "^%s*(.-)%s*$", "%1"))
                task.wait(0.04)
            end
            task.wait(0.3)
        end
    end)
end)

local isProtecting = false
ProtectBtn.MouseButton1Click:Connect(function()
    if isProtecting then
        isProtecting = false
        ProtectBtn.Text = "تشغيل الحماية الخاصة ب سكربت عبود 🔥"
        ProtectBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        return
    end
    
    isProtecting = true
    ProtectBtn.Text = "الحماية تعمل الآن (اضغط للإيقاف) 🛡️"
    ProtectBtn.BackgroundColor3 = Color3.fromRGB(200, 100, 0)
    
    local protectCommands = {";unjc", ";unice", ";unloopwarp", ";unwarp"}
    
    task.spawn(function()
        while isProtecting do
            for _, cmd in ipairs(protectCommands) do
                if not isProtecting then break end
                SendChatCommand(cmd)
                task.wait(0.02)
            end
            task.wait(0.1)
        end
    end)
end)

-- 5. إشعار المالك اللامع كل ربع ساعة
task.spawn(function()
    while true do
        task.wait(900)
        
        local NoticeFrame = Instance.new("Frame")
        NoticeFrame.Size = UDim2.new(0.4, 0, 0.15, 0)
