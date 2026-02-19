local GUI_SCALE = 0.4

local COLORS = {
    Background = Color3.fromRGB(0, 0, 0),
    Primary = Color3.fromRGB(91, 51, 171),
    Text = Color3.fromRGB(255, 255, 255),
    TextActive = Color3.fromRGB(192, 161, 255),
    ScrollBar = Color3.fromRGB(120, 80, 180),
}

local DISCORD_LINK = "https://discord.gg/JHmJCxyk2P"

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "GHZ_MENU_RP"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

-- ═══════════════════════════════════════════════════════════════
-- CONTAINER PAI (PARA VINCULAR TUDO)
-- ═══════════════════════════════════════════════════════════════
local mainGroup = Instance.new("Frame")
mainGroup.Name = "MainGroup"
mainGroup.Size = UDim2.new(0, 1300 * GUI_SCALE, 0, 690 * GUI_SCALE)
mainGroup.Position = UDim2.new(0.5, 0, 0.05, 0)
mainGroup.AnchorPoint = Vector2.new(0.5, 0)
mainGroup.BackgroundTransparency = 1
mainGroup.BorderSizePixel = 0
mainGroup.Active = true
mainGroup.Parent = screenGui

-- ═══════════════════════════════════════════════════════════════
-- BARRA SUPERIOR
-- ═══════════════════════════════════════════════════════════════
local topBar = Instance.new("Frame")
topBar.Name = "TopBar"
topBar.Size = UDim2.new(1, 0, 0, 80 * GUI_SCALE)
topBar.Position = UDim2.new(0, 0, 0, 0)
topBar.BackgroundColor3 = COLORS.Background
topBar.BorderSizePixel = 0
topBar.Parent = mainGroup

local topBarCorner = Instance.new("UICorner")
topBarCorner.CornerRadius = UDim.new(0, 20 * GUI_SCALE)
topBarCorner.Parent = topBar

local topBarStroke = Instance.new("UIStroke")
topBarStroke.Color = COLORS.Primary
topBarStroke.Thickness = 3 * GUI_SCALE
topBarStroke.Parent = topBar

local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "Title"
titleLabel.Size = UDim2.new(0, 500 * GUI_SCALE, 0, 80 * GUI_SCALE)
titleLabel.Position = UDim2.new(0, 30 * GUI_SCALE, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "GHZ MENU RP  [Sintonia Rp]"
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 30 * GUI_SCALE
titleLabel.TextColor3 = COLORS.Text
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.TextYAlignment = Enum.TextYAlignment.Center
titleLabel.Parent = topBar

local statusLabel = Instance.new("TextLabel")
statusLabel.Name = "Status"
statusLabel.Size = UDim2.new(0, 300 * GUI_SCALE, 0, 80 * GUI_SCALE)
statusLabel.Position = UDim2.new(1, -380 * GUI_SCALE, 0, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "STATUS: ONLINE"
statusLabel.Font = Enum.Font.GothamBold
statusLabel.TextSize = 24 * GUI_SCALE
statusLabel.TextColor3 = COLORS.Text
statusLabel.TextXAlignment = Enum.TextXAlignment.Center
statusLabel.TextYAlignment = Enum.TextYAlignment.Center
statusLabel.Parent = topBar

local minimizeButton = Instance.new("TextButton")
minimizeButton.Name = "MinimizeButton"
minimizeButton.Size = UDim2.new(0, 60 * GUI_SCALE, 0, 60 * GUI_SCALE)
minimizeButton.Position = UDim2.new(1, -80 * GUI_SCALE, 0.5, -30 * GUI_SCALE)
minimizeButton.BackgroundTransparency = 1
minimizeButton.BorderSizePixel = 0
minimizeButton.Text = "☰"
minimizeButton.Font = Enum.Font.GothamBold
minimizeButton.TextSize = 40 * GUI_SCALE
minimizeButton.TextColor3 = COLORS.Text
minimizeButton.Parent = topBar

-- ═══════════════════════════════════════════════════════════════
-- GAP INVISÍVEL
-- ═══════════════════════════════════════════════════════════════
local gapFrame = Instance.new("Frame")
gapFrame.Name = "Gap"
gapFrame.Size = UDim2.new(1, 0, 0, 20 * GUI_SCALE)
gapFrame.Position = UDim2.new(0, 0, 0, 80 * GUI_SCALE)
gapFrame.BackgroundTransparency = 1
gapFrame.BorderSizePixel = 0
gapFrame.Parent = mainGroup

-- ═══════════════════════════════════════════════════════════════
-- MENU PRINCIPAL
-- ══════════���════════════════════════════════════════════════════
local mainContainer = Instance.new("Frame")
mainContainer.Name = "MainContainer"
mainContainer.Size = UDim2.new(1, 0, 0, 570 * GUI_SCALE)
mainContainer.Position = UDim2.new(0, 0, 0, 100 * GUI_SCALE)
mainContainer.BackgroundColor3 = COLORS.Background
mainContainer.BorderSizePixel = 0
mainContainer.Parent = mainGroup

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 20 * GUI_SCALE)
mainCorner.Parent = mainContainer

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = COLORS.Primary
mainStroke.Thickness = 3 * GUI_SCALE
mainStroke.Parent = mainContainer

-- ═══════════════════════════════════════════════════════════════
-- SIDEBAR COM SCROLL
-- ═══════════════════════════════════════════════════════════════
local sideMenuContainer = Instance.new("Frame")
sideMenuContainer.Name = "SideMenuContainer"
sideMenuContainer.Size = UDim2.new(0, 350 * GUI_SCALE, 1, 0)
sideMenuContainer.Position = UDim2.new(0, 0, 0, 0)
sideMenuContainer.BackgroundTransparency = 1
sideMenuContainer.BorderSizePixel = 0
sideMenuContainer.ClipsDescendants = true
sideMenuContainer.Parent = mainContainer

-- ScrollingFrame para o sidebar
local sideMenu = Instance.new("ScrollingFrame")
sideMenu.Name = "SideMenu"
sideMenu.Size = UDim2.new(1, 0, 1, 0)
sideMenu.Position = UDim2.new(0, 0, 0, 0)
sideMenu.BackgroundTransparency = 1
sideMenu.BorderSizePixel = 0
sideMenu.ScrollBarThickness = 0
sideMenu.CanvasSize = UDim2.new(0, 0, 0, 0)
sideMenu.Parent = sideMenuContainer

-- Layout para scroll
local sideMenuLayout = Instance.new("UIListLayout")
sideMenuLayout.Padding = UDim.new(0, 25 * GUI_SCALE)
sideMenuLayout.SortOrder = Enum.SortOrder.LayoutOrder
sideMenuLayout.FillDirection = Enum.FillDirection.Vertical
sideMenuLayout.Parent = sideMenu

-- Padding inicial
local sidePadding = Instance.new("UIPadding")
sidePadding.PaddingTop = UDim.new(0, 40 * GUI_SCALE)
sidePadding.PaddingLeft = UDim.new(0, 50 * GUI_SCALE)
sidePadding.PaddingRight = UDim.new(0, 20 * GUI_SCALE)
sidePadding.Parent = sideMenu

-- ═══════════════════════════════════════════════════════════════
-- SCROLLBAR VISUAL
-- ═══════════════════════════════════════════════════════════════
local scrollBarBackground = Instance.new("Frame")
scrollBarBackground.Name = "ScrollBarBackground"
scrollBarBackground.Size = UDim2.new(0, 20 * GUI_SCALE, 0.9, 0)
scrollBarBackground.Position = UDim2.new(1, -35 * GUI_SCALE, 0.05, 0)
scrollBarBackground.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
scrollBarBackground.BorderSizePixel = 0
scrollBarBackground.Parent = sideMenuContainer

local scrollBarCorner = Instance.new("UICorner")
scrollBarCorner.CornerRadius = UDim.new(1, 0)
scrollBarCorner.Parent = scrollBarBackground

-- Scrollbar thumb
local scrollBarThumb = Instance.new("Frame")
scrollBarThumb.Name = "ScrollBarThumb"
scrollBarThumb.Size = UDim2.new(1, 0, 0.3, 0)
scrollBarThumb.Position = UDim2.new(0, 0, 0, 0)
scrollBarThumb.BackgroundColor3 = COLORS.ScrollBar
scrollBarThumb.BorderSizePixel = 0
scrollBarThumb.Parent = scrollBarBackground

local thumbCorner = Instance.new("UICorner")
thumbCorner.CornerRadius = UDim.new(1, 0)
thumbCorner.Parent = scrollBarThumb

-- Atualizar posição da scrollbar
local function updateScrollBar()
    local canvasSize = sideMenu.CanvasSize.Y.Offset
    local viewportSize = sideMenu.AbsoluteSize.Y
    
    if canvasSize > viewportSize then
        local scrollRatio = sideMenu.CanvasPosition.Y / (canvasSize - viewportSize)
        local thumbHeight = (viewportSize / canvasSize)
        
        scrollBarThumb.Size = UDim2.new(1, 0, thumbHeight, 0)
        scrollBarThumb.Position = UDim2.new(0, 0, scrollRatio * (1 - thumbHeight), 0)
    end
end

sideMenu.Changed:Connect(function(prop)
    if prop == "CanvasPosition" or prop == "CanvasSize" then
        updateScrollBar()
    end
end)

-- ═══════════════════════════════════════════════════════════════
-- ÁREA DE CONTEÚDO
-- ═══════════════════════════════════════════════════════════════
local contentFrame = Instance.new("Frame")
contentFrame.Name = "ContentFrame"
contentFrame.Size = UDim2.new(1, -354 * GUI_SCALE, 1, 0)
contentFrame.Position = UDim2.new(0, 354 * GUI_SCALE, 0, 0)
contentFrame.BackgroundTransparency = 1
contentFrame.BorderSizePixel = 0
contentFrame.Parent = mainContainer

-- ═══════════════════════════════════════════════════════════════
-- LIMPAR CONTEÚDO
-- ═══════════════════════════════════════════════════════════════
local function clr()
    for _, v in pairs(contentFrame:GetChildren()) do
        v:Destroy()
    end
end

-- ═══════════════════════════════════════════════════════════════
-- CRIAR TOGGLE
-- ═══════════════════════════════════════════════════════════════
local function mkT(p, txt, x, y)
    local f = Instance.new("Frame")
    f.Size = UDim2.new(0, 360 * GUI_SCALE, 0, 50 * GUI_SCALE)
    f.Position = UDim2.new(0, x, 0, y)
    f.BackgroundTransparency = 1
    f.Parent = p
    
    local l = Instance.new("TextLabel")
    l.Size = UDim2.new(0, 250 * GUI_SCALE, 1, 0)
    l.BackgroundTransparency = 1
    l.Text = txt
    l.Font = Enum.Font.GothamBold
    l.TextSize = 22 * GUI_SCALE
    l.TextColor3 = COLORS.Text
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.Parent = f
    
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0, 70 * GUI_SCALE, 0, 35 * GUI_SCALE)
    b.Position = UDim2.new(1, -70 * GUI_SCALE, 0.5, 0)
    b.AnchorPoint = Vector2.new(0, 0.5)
    b.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    b.BorderSizePixel = 0
    b.Text = ""
    b.Parent = f
    
    local bc = Instance.new("UICorner")
    bc.CornerRadius = UDim.new(1, 0)
    bc.Parent = b
    
    local c = Instance.new("Frame")
    c.Size = UDim2.new(0, 29 * GUI_SCALE, 0, 29 * GUI_SCALE)
    c.Position = UDim2.new(0, 3 * GUI_SCALE, 0.5, 0)
    c.AnchorPoint = Vector2.new(0, 0.5)
    c.BackgroundColor3 = COLORS.Primary
    c.BorderSizePixel = 0
    c.Parent = b
    
    local cc = Instance.new("UICorner")
    cc.CornerRadius = UDim.new(1, 0)
    cc.Parent = c
    
    local toggled = false
    
    b.MouseButton1Click:Connect(function()
        toggled = not toggled
        if toggled then
            b.BackgroundColor3 = COLORS.Primary
            c.Position = UDim2.new(1, -32 * GUI_SCALE, 0.5, 0)
        else
            b.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            c.Position = UDim2.new(0, 3 * GUI_SCALE, 0.5, 0)
        end
    end)
end

-- ═══════════════════════════════════════════════════════════════
-- FUNÇÃO HOME
-- ══════════════���════════════════════════════════════════════════
local function home()
    clr()
    
    local imageFrame = Instance.new("ImageLabel")
    imageFrame.Name = "ProfileImage"
    imageFrame.Size = UDim2.new(0, 200 * GUI_SCALE, 0, 200 * GUI_SCALE)
    imageFrame.Position = UDim2.new(0, 40 * GUI_SCALE, 0.5, -100 * GUI_SCALE)
    imageFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    imageFrame.BorderSizePixel = 0
    imageFrame.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. player.UserId .. "&width=420&height=420&format=png"
    imageFrame.Parent = contentFrame

    local imageCorner = Instance.new("UICorner")
    imageCorner.CornerRadius = UDim.new(1, 0)
    imageCorner.Parent = imageFrame

    local usernameLabel = Instance.new("TextLabel")
    usernameLabel.Name = "UsernameLabel"
    usernameLabel.Size = UDim2.new(0, 200 * GUI_SCALE, 0, 40 * GUI_SCALE)
    usernameLabel.Position = UDim2.new(0, 40 * GUI_SCALE, 0.5, 110 * GUI_SCALE)
    usernameLabel.BackgroundTransparency = 1
    usernameLabel.Text = "NICK DO USUÁRIO"
    usernameLabel.Font = Enum.Font.GothamBold
    usernameLabel.TextSize = 18 * GUI_SCALE
    usernameLabel.TextColor3 = COLORS.Text
    usernameLabel.TextXAlignment = Enum.TextXAlignment.Center
    usernameLabel.TextWrapped = true
    usernameLabel.Parent = contentFrame

    local welcomeText = Instance.new("TextLabel")
    welcomeText.Name = "WelcomeText"
    welcomeText.Size = UDim2.new(0, 420 * GUI_SCALE, 0, 80 * GUI_SCALE)
    welcomeText.Position = UDim2.new(0, 320 * GUI_SCALE, 0, 30 * GUI_SCALE)
    welcomeText.BackgroundTransparency = 1
    welcomeText.Text = "Olá, seja bem vindo ao GHZ MENU\nO melhor menu legit para o mapa SINTONIA RP."
    welcomeText.Font = Enum.Font.GothamBold
    welcomeText.TextSize = 20 * GUI_SCALE
    welcomeText.TextColor3 = COLORS.Text
    welcomeText.TextXAlignment = Enum.TextXAlignment.Left
    welcomeText.TextYAlignment = Enum.TextYAlignment.Top
    welcomeText.TextWrapped = true
    welcomeText.Parent = contentFrame

    local devTitle = Instance.new("TextLabel")
    devTitle.Name = "DevTitle"
    devTitle.Size = UDim2.new(0, 200 * GUI_SCALE, 0, 40 * GUI_SCALE)
    devTitle.Position = UDim2.new(0, 770 * GUI_SCALE, 0, 30 * GUI_SCALE)
    devTitle.BackgroundTransparency = 1
    devTitle.Text = "Desenvolvedores"
    devTitle.Font = Enum.Font.GothamBold
    devTitle.TextSize = 22 * GUI_SCALE
    devTitle.TextColor3 = COLORS.Text
    devTitle.TextXAlignment = Enum.TextXAlignment.Left
    devTitle.Parent = contentFrame

    local dev1 = Instance.new("TextLabel")
    dev1.Name = "Dev1"
    dev1.Size = UDim2.new(0, 200 * GUI_SCALE, 0, 25 * GUI_SCALE)
    dev1.Position = UDim2.new(0, 770 * GUI_SCALE, 0, 80 * GUI_SCALE)
    dev1.BackgroundTransparency = 1
    dev1.Text = "By: ghzstore"
    dev1.Font = Enum.Font.Gotham
    dev1.TextSize = 16 * GUI_SCALE
    dev1.TextColor3 = COLORS.Text
    dev1.TextXAlignment = Enum.TextXAlignment.Left
    dev1.Parent = contentFrame

    local dev2 = Instance.new("TextLabel")
    dev2.Name = "Dev2"
    dev2.Size = UDim2.new(0, 200 * GUI_SCALE, 0, 25 * GUI_SCALE)
    dev2.Position = UDim2.new(0, 770 * GUI_SCALE, 0, 110 * GUI_SCALE)
    dev2.BackgroundTransparency = 1
    dev2.Text = "By: atr3uss_"
    dev2.Font = Enum.Font.Gotham
    dev2.TextSize = 16 * GUI_SCALE
    dev2.TextColor3 = COLORS.Text
    dev2.TextXAlignment = Enum.TextXAlignment.Left
    dev2.Parent = contentFrame

    local bugReportText = Instance.new("TextLabel")
    bugReportText.Name = "BugReportText"
    bugReportText.Size = UDim2.new(0, 420 * GUI_SCALE, 0, 60 * GUI_SCALE)
    bugReportText.Position = UDim2.new(0, 320 * GUI_SCALE, 0.5, -20 * GUI_SCALE)
    bugReportText.BackgroundTransparency = 1
    bugReportText.Text = "Deseja relatar algum bug?\nEntre em nosso servidor do discord!"
    bugReportText.Font = Enum.Font.Gotham
    bugReportText.TextSize = 16 * GUI_SCALE
    bugReportText.TextColor3 = COLORS.Text
    bugReportText.TextXAlignment = Enum.TextXAlignment.Center
    bugReportText.TextYAlignment = Enum.TextYAlignment.Center
    bugReportText.TextWrapped = true
    bugReportText.Parent = contentFrame

    local discordButton = Instance.new("TextButton")
    discordButton.Name = "DiscordButton"
    discordButton.Size = UDim2.new(0, 300 * GUI_SCALE, 0, 55 * GUI_SCALE)
    discordButton.Position = UDim2.new(0, 370 * GUI_SCALE, 0.5, 80 * GUI_SCALE)
    discordButton.BackgroundColor3 = COLORS.Primary
    discordButton.BorderSizePixel = 0
    discordButton.Text = "Discord.link"
    discordButton.Font = Enum.Font.GothamBold
    discordButton.TextSize = 24 * GUI_SCALE
    discordButton.TextColor3 = COLORS.Text
    discordButton.Parent = contentFrame

    local discordCorner = Instance.new("UICorner")
    discordCorner.CornerRadius = UDim.new(1, 0)
    discordCorner.Parent = discordButton

    discordButton.MouseButton1Click:Connect(function()
        setclipboard(DISCORD_LINK)
        local originalText = discordButton.Text
        discordButton.Text = "✓ Link copiado!"
        task.wait(1.5)
        discordButton.Text = originalText
    end)
end

-- ═══════════════════════════════════════════════════════════════
-- FUNÇÃO COMBATE
-- ═══════════════════════════════════════════════════════════════
local function combate()
    clr()
    mkT(contentFrame, "AIMBOT", 40 * GUI_SCALE, 40 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", 40 * GUI_SCALE, 110 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", 40 * GUI_SCALE, 180 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", 40 * GUI_SCALE, 250 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", 420 * GUI_SCALE, 40 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", 420 * GUI_SCALE, 110 * GUI_SCALE)
end

-- ═══════════════════════════════════════════════════════════════
-- FUNÇÃO VISUAL
-- ═══════════════════════════════════════════════════════════════
local function visual()
    clr()
    mkT(contentFrame, "ESP NAME", 40 * GUI_SCALE, 40 * GUI_SCALE)
    mkT(contentFrame, "ESP DISTANCE", 420 * GUI_SCALE, 40 * GUI_SCALE)
    mkT(contentFrame, "ESP TRACE", 40 * GUI_SCALE, 110 * GUI_SCALE)
    mkT(contentFrame, "ESP BACKPACK", 420 * GUI_SCALE, 110 * GUI_SCALE)
    mkT(contentFrame, "ESP HEAD", 40 * GUI_SCALE, 180 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", 420 * GUI_SCALE, 180 * GUI_SCALE)
    mkT(contentFrame, "ESP LIFE", 40 * GUI_SCALE, 250 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", 420 * GUI_SCALE, 250 * GUI_SCALE)
    mkT(contentFrame, "ESP BOX", 40 * GUI_SCALE, 320 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", 420 * GUI_SCALE, 320 * GUI_SCALE)
end

-- ═══════════════════════════════════════════════════════════════
-- FUNÇÃO CAR
-- ═══════════════════════════════════════════════════════════════
local function car()
    clr()
    mkT(contentFrame, "ESP UNLOCKED", 40 * GUI_SCALE, 40 * GUI_SCALE)
    mkT(contentFrame, "FLY CAR", 420 * GUI_SCALE, 40 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", 40 * GUI_SCALE, 110 * GUI_SCALE)
    mkT(contentFrame, "NOCLIP CAR", 420 * GUI_SCALE, 110 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", 40 * GUI_SCALE, 180 * GUI_SCALE)
    mkT(contentFrame, "ANT BLIND", 420 * GUI_SCALE, 180 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", 40 * GUI_SCALE, 250 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", 420 * GUI_SCALE, 250 * GUI_SCALE)
end

-- ═══════════════════════════════════════════════════════════════
-- FUNÇÃO AUTO FARM
-- ═══════════════════════════════════════════════════════════════
local function autofarm()
    clr()
    mkT(contentFrame, "AUTO TRASH", 40 * GUI_SCALE, 40 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", 420 * GUI_SCALE, 40 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", 40 * GUI_SCALE, 110 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", 420 * GUI_SCALE, 110 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", 40 * GUI_SCALE, 180 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", 420 * GUI_SCALE, 180 * GUI_SCALE)
end

-- ═══════════════════════════════════════════════════════════════
-- FUNÇÃO DESTRY
-- ═══════════════════════════════════════════════════════════════
local function destry()
    clr()
    mkT(contentFrame, "NO WALL", 40 * GUI_SCALE, 40 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", 420 * GUI_SCALE, 40 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", 40 * GUI_SCALE, 110 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", 420 * GUI_SCALE, 110 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", 40 * GUI_SCALE, 180 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", 420 * GUI_SCALE, 180 * GUI_SCALE)
end

-- ═══════════════════════════════════════════════════════════════
-- FUNÇÃO ACTION
-- ═══════════════════════════════════════════════════════════════
local function action()
    clr()
    mkT(contentFrame, "ESP BANCO BR", 40 * GUI_SCALE, 40 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", 420 * GUI_SCALE, 40 * GUI_SCALE)
    mkT(contentFrame, "ESP JOALHERIA", 40 * GUI_SCALE, 110 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", 420 * GUI_SCALE, 110 * GUI_SCALE)
    mkT(contentFrame, "ESP CASSINO", 40 * GUI_SCALE, 180 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", 420 * GUI_SCALE, 180 * GUI_SCALE)
    mkT(contentFrame, "ESP CAIXINHAS", 40 * GUI_SCALE, 250 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", 420 * GUI_SCALE, 250 * GUI_SCALE)
end

-- ═══════════════════════════════════════════════════════════════
-- FUNÇÃO PURCHASE
-- ═══════════════════════════════════════════════════════════════
local function purchase()
    clr()
    mkT(contentFrame, "EMBREVE", 40 * GUI_SCALE, 40 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", 420 * GUI_SCALE, 40 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", 40 * GUI_SCALE, 110 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", 420 * GUI_SCALE, 110 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", 40 * GUI_SCALE, 180 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", 420 * GUI_SCALE, 180 * GUI_SCALE)
end

-- ═════════════════��═════════════════════════════════════════════
-- FUNÇÃO MORE
-- ═══════════════════════════════════════════════════════════════
local function more()
    clr()
    mkT(contentFrame, "ESP STAFF", 40 * GUI_SCALE, 40 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", 420 * GUI_SCALE, 40 * GUI_SCALE)
    mkT(contentFrame, "STAFF LIST", 40 * GUI_SCALE, 110 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", 420 * GUI_SCALE, 110 * GUI_SCALE)
    mkT(contentFrame, "ANT STAFF", 40 * GUI_SCALE, 180 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", 420 * GUI_SCALE, 180 * GUI_SCALE)
end

-- ═══════════════════════════════════════════════════════════════
-- BOTÕES DO MENU
-- ═══════════════════════════════════════════════════════════════
local menuItems = {
    "HOME", 
    "COMBATE", 
    "VISUAL", 
    "CAR", 
    "AUTO FARM",
    "DESTRY",
    "ACTION",
    "PURCHASE",
    "MORE"
}

for i, itemName in ipairs(menuItems) do
    local button = Instance.new("TextButton")
    button.Name = itemName
    button.Size = UDim2.new(0, 250 * GUI_SCALE, 0, 105 * GUI_SCALE)
    button.BackgroundTransparency = 1
    button.BorderSizePixel = 0
    button.Text = itemName
    button.Font = Enum.Font.GothamBold
    button.TextSize = 36.4 * GUI_SCALE
    button.TextColor3 = (i == 1) and COLORS.TextActive or COLORS.Text
    button.TextXAlignment = Enum.TextXAlignment.Left
    button.TextYAlignment = Enum.TextYAlignment.Center
    button.LayoutOrder = i
    button.Parent = sideMenu
    
    button.MouseButton1Click:Connect(function()
        for _, child in pairs(sideMenu:GetChildren()) do
            if child:IsA("TextButton") then
                child.TextColor3 = COLORS.Text
            end
        end
        button.TextColor3 = COLORS.TextActive
        
        if itemName == "HOME" then
            home()
        elseif itemName == "COMBATE" then
            combate()
        elseif itemName == "VISUAL" then
            visual()
        elseif itemName == "CAR" then
            car()
        elseif itemName == "AUTO FARM" then
            autofarm()
        elseif itemName == "DESTRY" then
            destry()
        elseif itemName == "ACTION" then
            action()
        elseif itemName == "PURCHASE" then
            purchase()
        elseif itemName == "MORE" then
            more()
        end
    end)
end

-- Atualizar canvas size
sideMenuLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    sideMenu.CanvasSize = UDim2.new(0, 0, 0, sideMenuLayout.AbsoluteContentSize.Y)
    updateScrollBar()
end)

-- ═══════════════════════════════════════════════════════════════
-- SISTEMA DE ARRASTE (NO CONTAINER PAI - VINCULADO!)
-- ═══════════════════════════════════════════════════════════════
local dragging = false
local dragInput, mousePos, framePos

topBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        mousePos = input.Position
        framePos = mainGroup.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

topBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        local delta = input.Position - mousePos
        
        -- Move o CONTAINER PAI (que contém tudo vinculado)
        mainGroup.Position = UDim2.new(
            framePos.X.Scale,
            framePos.X.Offset + delta.X,
            framePos.Y.Scale,
            framePos.Y.Offset + delta.Y
        )
    end
end)

-- ═══════════════════════════════════════════════════════════════
-- INICIALIZAR COM HOME
-- ═══════════════════════════════════════════════════════════════
home()

print("✅ MENU COMPLETO COM TODAS AS SESSÕES - OK!")