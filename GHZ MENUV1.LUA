--[[
══════════════════════════════════════════════════════════════════
    GHZ MENU RP - INTERFACE REDESENHADA (100% EXATA)
    Desenvolvedor: ghzmenu_developer & atr3uss_
══════════════════════════════════════════════════════════════════
]]--

local GUI_SCALE = 0.4

local COLORS = {
    Background = Color3.fromRGB(0, 0, 0),
    Primary = Color3.fromRGB(91, 51, 171),
    Text = Color3.fromRGB(255, 255, 255),
    TextActive = Color3.fromRGB(192, 161, 255),
    ToggleOff = Color3.fromRGB(80, 80, 80),
    ToggleOn = Color3.fromRGB(91, 51, 171),
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
-- FRAME PRINCIPAL
-- ═══════════════════════════════════════════════════════════════
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 1300 * GUI_SCALE, 0, 650 * GUI_SCALE)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = COLORS.Background
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Parent = screenGui

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = COLORS.Primary
mainStroke.Thickness = 3 * GUI_SCALE
mainStroke.Parent = mainFrame

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 20 * GUI_SCALE)
mainCorner.Parent = mainFrame

-- ═══════════════════════════════════════════════════════════════
-- HEADER
-- ═══════════════════════════════════════════════════════════════
local topBar = Instance.new("Frame")
topBar.Name = "TopBar"
topBar.Size = UDim2.new(1, 0, 0, 60 * GUI_SCALE)
topBar.Position = UDim2.new(0, 0, 0, 0)
topBar.BackgroundColor3 = COLORS.Background
topBar.BorderSizePixel = 0
topBar.Parent = mainFrame

local topBarStroke = Instance.new("UIStroke")
topBarStroke.Color = COLORS.Primary
topBarStroke.Thickness = 2 * GUI_SCALE
topBarStroke.Parent = topBar

-- Título
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "Title"
titleLabel.Size = UDim2.new(0, 500 * GUI_SCALE, 0, 60 * GUI_SCALE)
titleLabel.Position = UDim2.new(0, 20 * GUI_SCALE, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "GHZ MENU RP  [Sintonia Rp]"
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 28 * GUI_SCALE
titleLabel.TextColor3 = COLORS.Text
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.TextYAlignment = Enum.TextYAlignment.Center
titleLabel.Parent = topBar

-- Status
local statusLabel = Instance.new("TextLabel")
statusLabel.Name = "Status"
statusLabel.Size = UDim2.new(0, 300 * GUI_SCALE, 0, 60 * GUI_SCALE)
statusLabel.Position = UDim2.new(0, 550 * GUI_SCALE, 0, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "STATUS: ONLINE"
statusLabel.Font = Enum.Font.GothamBold
statusLabel.TextSize = 20 * GUI_SCALE
statusLabel.TextColor3 = COLORS.Text
statusLabel.TextXAlignment = Enum.TextXAlignment.Center
statusLabel.TextYAlignment = Enum.TextYAlignment.Center
statusLabel.Parent = topBar

-- Menu button
local minimizeButton = Instance.new("TextButton")
minimizeButton.Name = "MinimizeButton"
minimizeButton.Size = UDim2.new(0, 50 * GUI_SCALE, 0, 50 * GUI_SCALE)
minimizeButton.Position = UDim2.new(1, -60 * GUI_SCALE, 0.5, -25 * GUI_SCALE)
minimizeButton.BackgroundTransparency = 1
minimizeButton.Text = "☰"
minimizeButton.Font = Enum.Font.GothamBold
minimizeButton.TextSize = 32 * GUI_SCALE
minimizeButton.TextColor3 = COLORS.Text
minimizeButton.Parent = topBar

-- ═══════════════════════════════════════════════════════════════
-- GAP/ESPAÇO (15px)
-- ═══════════════════════════════════════════════════════════════
local gapFrame = Instance.new("Frame")
gapFrame.Name = "Gap"
gapFrame.Size = UDim2.new(1, 0, 0, 20 * GUI_SCALE)
gapFrame.Position = UDim2.new(0, 0, 0, 60 * GUI_SCALE)
gapFrame.BackgroundTransparency = 1
gapFrame.BorderSizePixel = 0
gapFrame.Parent = mainFrame

-- ═══════════════════════════════════════════════════════════════
-- SIDEBAR (APENAS TEXTO, SEM CONTAINERS)
-- ═══════════════════════════════════════════════════════════════
local sideMenu = Instance.new("Frame")
sideMenu.Name = "SideMenu"
sideMenu.Size = UDim2.new(0, 280 * GUI_SCALE, 0, 550 * GUI_SCALE)
sideMenu.Position = UDim2.new(0, 20 * GUI_SCALE, 0, 80 * GUI_SCALE)
sideMenu.BackgroundTransparency = 1
sideMenu.BorderSizePixel = 0
sideMenu.Parent = mainFrame

local tg = {}

local function mkMenuButton(p, txt, idx, fn_home, fn_combate, fn_visual, fn_car, fn_farm)
    local button = Instance.new("TextButton")
    button.Name = txt
    button.Size = UDim2.new(0.9, 0, 0, 50 * GUI_SCALE)
    button.Position = UDim2.new(0.05, 0, 0, (idx - 1) * 65 * GUI_SCALE)
    button.BackgroundTransparency = 1
    button.BorderSizePixel = 0
    button.Text = txt
    button.Font = Enum.Font.GothamBold
    button.TextSize = 22 * GUI_SCALE
    button.TextColor3 = COLORS.Text
    button.TextXAlignment = Enum.TextXAlignment.Left
    button.Parent = p
    
    button.MouseButton1Click:Connect(function()
        -- Resetar todas as cores
        for _, child in pairs(p:GetChildren()) do
            if child:IsA("TextButton") then
                child.TextColor3 = COLORS.Text
            end
        end
        -- Ativar este botão
        button.TextColor3 = COLORS.TextActive
        
        if txt == "HOME" then fn_home() end
        if txt == "COMBATE" then fn_combate() end
        if txt == "VISUAL" then fn_visual() end
        if txt == "CAR" then fn_car() end
        if txt == "AUTO FARM" then fn_farm() end
    end)
    
    if idx == 1 then
        button.TextColor3 = COLORS.TextActive
    end
end

-- Linha vertical roxa
local verticalLine = Instance.new("Frame")
verticalLine.Name = "VerticalLine"
verticalLine.Size = UDim2.new(0, 3 * GUI_SCALE, 0, 550 * GUI_SCALE)
verticalLine.Position = UDim2.new(0, 310 * GUI_SCALE, 0, 80 * GUI_SCALE)
verticalLine.BackgroundColor3 = COLORS.Primary
verticalLine.BorderSizePixel = 0
verticalLine.Parent = mainFrame

-- ═══════════════════════════════════════════════════════════════
-- CONTEÚDO
-- ═══════════════════════════════════════════════════════════════
local contentFrame = Instance.new("Frame")
contentFrame.Name = "ContentFrame"
contentFrame.Size = UDim2.new(0, 880 * GUI_SCALE, 0, 550 * GUI_SCALE)
contentFrame.Position = UDim2.new(0, 330 * GUI_SCALE, 0, 80 * GUI_SCALE)
contentFrame.BackgroundTransparency = 1
contentFrame.BorderSizePixel = 0
contentFrame.Parent = mainFrame

-- ═══════════════════════════════════════════════════════════════
-- FUNÇÕES DE TOGGLE
-- ═══════════════════════════════════════════════════════════════

local function mkToggle(p, txt, key, x, y)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0, 420 * GUI_SCALE, 0, 50 * GUI_SCALE)
    container.Position = UDim2.new(0, x, 0, y)
    container.BackgroundTransparency = 1
    container.BorderSizePixel = 0
    container.Parent = p
    
    -- Label
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0, 280 * GUI_SCALE, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = txt
    label.Font = Enum.Font.GothamBold
    label.TextSize = 20 * GUI_SCALE
    label.TextColor3 = COLORS.Text
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextYAlignment = Enum.TextYAlignment.Center
    label.Parent = container
    
    -- Toggle Button
    local toggleBtn = Instance.new("Frame")
    toggleBtn.Name = "ToggleBtn"
    toggleBtn.Size = UDim2.new(0, 100 * GUI_SCALE, 0, 40 * GUI_SCALE)
    toggleBtn.Position = UDim2.new(1, -100 * GUI_SCALE, 0.5, -20 * GUI_SCALE)
    toggleBtn.BackgroundColor3 = COLORS.ToggleOff
    toggleBtn.BorderSizePixel = 0
    toggleBtn.Parent = container
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(1, 0)
    toggleCorner.Parent = toggleBtn
    
    -- Toggle Circle
    local circle = Instance.new("Frame")
    circle.Name = "Circle"
    circle.Size = UDim2.new(0, 32 * GUI_SCALE, 0, 32 * GUI_SCALE)
    circle.Position = UDim2.new(0, 4 * GUI_SCALE, 0.5, -16 * GUI_SCALE)
    circle.BackgroundColor3 = COLORS.Text
    circle.BorderSizePixel = 0
    circle.Parent = toggleBtn
    
    local circleCorner = Instance.new("UICorner")
    circleCorner.CornerRadius = UDim.new(1, 0)
    circleCorner.Parent = circle
    
    tg[key] = false
    
    -- Clickable button
    local clickBtn = Instance.new("TextButton")
    clickBtn.Size = UDim2.new(1, 0, 1, 0)
    clickBtn.BackgroundTransparency = 1
    clickBtn.BorderSizePixel = 0
    clickBtn.Text = ""
    clickBtn.Parent = toggleBtn
    
    clickBtn.MouseButton1Click:Connect(function()
        tg[key] = not tg[key]
        
        if tg[key] then
            toggleBtn.BackgroundColor3 = COLORS.ToggleOn
            circle.Position = UDim2.new(1, -36 * GUI_SCALE, 0.5, -16 * GUI_SCALE)
        else
            toggleBtn.BackgroundColor3 = COLORS.ToggleOff
            circle.Position = UDim2.new(0, 4 * GUI_SCALE, 0.5, -16 * GUI_SCALE)
        end
    end)
end

-- ═══════════════════════════════════════════════════════════════
-- PÁGINAS
-- ═══════════════════════════════════════════════════════════════

local function clr()
    for _, v in pairs(contentFrame:GetChildren()) do
        v:Destroy()
    end
end

local function home()
    clr()
    
    local profileImg = Instance.new("ImageLabel")
    profileImg.Size = UDim2.new(0, 180 * GUI_SCALE, 0, 180 * GUI_SCALE)
    profileImg.Position = UDim2.new(0, 30 * GUI_SCALE, 0, 30 * GUI_SCALE)
    profileImg.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    profileImg.BorderSizePixel = 0
    profileImg.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. player.UserId .. "&width=420&height=420&format=png"
    profileImg.Parent = contentFrame
    
    local profileCorner = Instance.new("UICorner")
    profileCorner.CornerRadius = UDim.new(1, 0)
    profileCorner.Parent = profileImg
    
    local welcomeText = Instance.new("TextLabel")
    welcomeText.Size = UDim2.new(0, 500 * GUI_SCALE, 0, 50 * GUI_SCALE)
    welcomeText.Position = UDim2.new(0, 250 * GUI_SCALE, 0, 30 * GUI_SCALE)
    welcomeText.BackgroundTransparency = 1
    welcomeText.Text = "Olá, seja bem-vindo ao GHZ MENU RP"
    welcomeText.Font = Enum.Font.GothamBold
    welcomeText.TextSize = 20 * GUI_SCALE
    welcomeText.TextColor3 = COLORS.Text
    welcomeText.TextXAlignment = Enum.TextXAlignment.Left
    welcomeText.TextWrapped = true
    welcomeText.Parent = contentFrame
    
    local descText = Instance.new("TextLabel")
    descText.Size = UDim2.new(0, 500 * GUI_SCALE, 0, 60 * GUI_SCALE)
    descText.Position = UDim2.new(0, 250 * GUI_SCALE, 0, 90 * GUI_SCALE)
    descText.BackgroundTransparency = 1
    descText.Text = "O melhor menu legit para o mapa\nSINTONIA RP."
    descText.Font = Enum.Font.Gotham
    descText.TextSize = 18 * GUI_SCALE
    descText.TextColor3 = COLORS.Text
    descText.TextXAlignment = Enum.TextXAlignment.Left
    descText.TextWrapped = true
    descText.Parent = contentFrame
    
    local devTitle = Instance.new("TextLabel")
    devTitle.Size = UDim2.new(0, 500 * GUI_SCALE, 0, 40 * GUI_SCALE)
    devTitle.Position = UDim2.new(0, 250 * GUI_SCALE, 0, 180 * GUI_SCALE)
    devTitle.BackgroundTransparency = 1
    devTitle.Text = "Desenvolvedores"
    devTitle.Font = Enum.Font.GothamBold
    devTitle.TextSize = 22 * GUI_SCALE
    devTitle.TextColor3 = COLORS.Text
    devTitle.TextXAlignment = Enum.TextXAlignment.Center
    devTitle.Parent = contentFrame
    
    local dev1 = Instance.new("TextLabel")
    dev1.Size = UDim2.new(0, 500 * GUI_SCALE, 0, 30 * GUI_SCALE)
    dev1.Position = UDim2.new(0, 250 * GUI_SCALE, 0, 230 * GUI_SCALE)
    dev1.BackgroundTransparency = 1
    dev1.Text = "By: ghzstore"
    dev1.Font = Enum.Font.Gotham
    dev1.TextSize = 16 * GUI_SCALE
    dev1.TextColor3 = COLORS.Text
    dev1.TextXAlignment = Enum.TextXAlignment.Center
    dev1.Parent = contentFrame
    
    local dev2 = Instance.new("TextLabel")
    dev2.Size = UDim2.new(0, 500 * GUI_SCALE, 0, 30 * GUI_SCALE)
    dev2.Position = UDim2.new(0, 250 * GUI_SCALE, 0, 270 * GUI_SCALE)
    dev2.BackgroundTransparency = 1
    dev2.Text = "By: atr3uss_"
    dev2.Font = Enum.Font.Gotham
    dev2.TextSize = 16 * GUI_SCALE
    dev2.TextColor3 = COLORS.Text
    dev2.TextXAlignment = Enum.TextXAlignment.Center
    dev2.Parent = contentFrame
    
    local discordBtn = Instance.new("TextButton")
    discordBtn.Size = UDim2.new(0, 280 * GUI_SCALE, 0, 60 * GUI_SCALE)
    discordBtn.Position = UDim2.new(0, 350 * GUI_SCALE, 0, 320 * GUI_SCALE)
    discordBtn.BackgroundColor3 = COLORS.Primary
    discordBtn.BorderSizePixel = 0
    discordBtn.Text = "Discord.link"
    discordBtn.Font = Enum.Font.GothamBold
    discordBtn.TextSize = 22 * GUI_SCALE
    discordBtn.TextColor3 = COLORS.Text
    discordBtn.Parent = contentFrame
    
    local discordCorner = Instance.new("UICorner")
    discordCorner.CornerRadius = UDim.new(0, 30 * GUI_SCALE)
    discordCorner.Parent = discordBtn
    
    discordBtn.MouseButton1Click:Connect(function()
        setclipboard(DISCORD_LINK)
        discordBtn.Text = "✓ Copiado!"
        task.wait(1)
        discordBtn.Text = "Discord.link"
    end)
end

local function combate()
    clr()
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 50 * GUI_SCALE)
    title.Position = UDim2.new(0, 0, 0, 10 * GUI_SCALE)
    title.BackgroundTransparency = 1
    title.Text = "COMBATE"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 32 * GUI_SCALE
    title.TextColor3 = COLORS.TextActive
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = contentFrame
    
    mkToggle(contentFrame, "AIMBOT", "aimbot", 0, 70 * GUI_SCALE)
    mkToggle(contentFrame, "EMBREVE", "cb2", 0, 140 * GUI_SCALE)
    mkToggle(contentFrame, "EMBREVE", "cb3", 0, 210 * GUI_SCALE)
    mkToggle(contentFrame, "EMBREVE", "cb4", 0, 280 * GUI_SCALE)
    mkToggle(contentFrame, "EMBREVE", "f1", 0, 350 * GUI_SCALE)
    
    mkToggle(contentFrame, "EMBREVE", "f2", 450 * GUI_SCALE, 70 * GUI_SCALE)
    mkToggle(contentFrame, "EMBREVE", "f3", 450 * GUI_SCALE, 140 * GUI_SCALE)
    mkToggle(contentFrame, "EMBREVE", "f4", 450 * GUI_SCALE, 210 * GUI_SCALE)
    mkToggle(contentFrame, "EMBREVE", "f5", 450 * GUI_SCALE, 280 * GUI_SCALE)
    mkToggle(contentFrame, "EMBREVE", "f6", 450 * GUI_SCALE, 350 * GUI_SCALE)
end

local function visual()
    clr()
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 50 * GUI_SCALE)
    title.Position = UDim2.new(0, 0, 0, 10 * GUI_SCALE)
    title.BackgroundTransparency = 1
    title.Text = "VISUAL"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 32 * GUI_SCALE
    title.TextColor3 = COLORS.TextActive
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = contentFrame
    
    mkToggle(contentFrame, "ESP NAME", "espname", 0, 70 * GUI_SCALE)
    mkToggle(contentFrame, "ESP TRACE", "esptrace", 0, 140 * GUI_SCALE)
    mkToggle(contentFrame, "ESP HEAD", "esphead", 0, 210 * GUI_SCALE)
    mkToggle(contentFrame, "ESP LIFE", "esplife", 0, 280 * GUI_SCALE)
    mkToggle(contentFrame, "ESP BOX", "espbox", 0, 350 * GUI_SCALE)
    
    mkToggle(contentFrame, "ESP Distance", "espdist", 450 * GUI_SCALE, 70 * GUI_SCALE)
    mkToggle(contentFrame, "ESP BACKPACK", "espback", 450 * GUI_SCALE, 140 * GUI_SCALE)
    mkToggle(contentFrame, "EMBREVE", "espstaff", 450 * GUI_SCALE, 210 * GUI_SCALE)
    mkToggle(contentFrame, "EMBREVE", "c1", 450 * GUI_SCALE, 280 * GUI_SCALE)
    mkToggle(contentFrame, "EMBREVE", "c2", 450 * GUI_SCALE, 350 * GUI_SCALE)
end

local function car()
    clr()
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 50 * GUI_SCALE)
    title.Position = UDim2.new(0, 0, 0, 10 * GUI_SCALE)
    title.BackgroundTransparency = 1
    title.Text = "CAR"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 32 * GUI_SCALE
    title.TextColor3 = COLORS.TextActive
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = contentFrame
    
    mkToggle(contentFrame, "ESP UNLOCKED", "f1", 0, 70 * GUI_SCALE)
    mkToggle(contentFrame, "FLY CAR", "f2", 0, 140 * GUI_SCALE)
    mkToggle(contentFrame, "NOCLIP CAR", "f3", 0, 210 * GUI_SCALE)
    mkToggle(contentFrame, "ANT BLIND", "f4", 0, 280 * GUI_SCALE)
    mkToggle(contentFrame, "EMBREVE", "f5", 0, 350 * GUI_SCALE)
    
    mkToggle(contentFrame, "EMBREVE", "f6", 450 * GUI_SCALE, 70 * GUI_SCALE)
    mkToggle(contentFrame, "EMBREVE", "f7", 450 * GUI_SCALE, 140 * GUI_SCALE)
    mkToggle(contentFrame, "EMBREVE", "f8", 450 * GUI_SCALE, 210 * GUI_SCALE)
    mkToggle(contentFrame, "EMBREVE", "c1", 450 * GUI_SCALE, 280 * GUI_SCALE)
    mkToggle(contentFrame, "EMBREVE", "c2", 450 * GUI_SCALE, 350 * GUI_SCALE)
end

local function farm()
    clr()
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 50 * GUI_SCALE)
    title.Position = UDim2.new(0, 0, 0, 10 * GUI_SCALE)
    title.BackgroundTransparency = 1
    title.Text = "AUTO FARM"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 32 * GUI_SCALE
    title.TextColor3 = COLORS.TextActive
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = contentFrame
    
    mkToggle(contentFrame, "AUTO TRASH", "f1", 0, 70 * GUI_SCALE)
    mkToggle(contentFrame, "EMBREVE", "f2", 0, 140 * GUI_SCALE)
    mkToggle(contentFrame, "EMBREVE", "f3", 0, 210 * GUI_SCALE)
    mkToggle(contentFrame, "EMBREVE", "f4", 0, 280 * GUI_SCALE)
    mkToggle(contentFrame, "EMBREVE", "f5", 0, 350 * GUI_SCALE)
    
    mkToggle(contentFrame, "EMBREVE", "f6", 450 * GUI_SCALE, 70 * GUI_SCALE)
    mkToggle(contentFrame, "EMBREVE", "f7", 450 * GUI_SCALE, 140 * GUI_SCALE)
    mkToggle(contentFrame, "EMBREVE", "f8", 450 * GUI_SCALE, 210 * GUI_SCALE)
    mkToggle(contentFrame, "EMBREVE", "c1", 450 * GUI_SCALE, 280 * GUI_SCALE)
    mkToggle(contentFrame, "EMBREVE", "c2", 450 * GUI_SCALE, 350 * GUI_SCALE)
end

-- ═══════════════════════════════════════════════════════════════
-- CRIAR BOTÕES DO MENU
-- ═══════════════════════════════════════════════════════════════

mkMenuButton(sideMenu, "HOME", 1, home, combate, visual, car, farm)
mkMenuButton(sideMenu, "COMBATE", 2, home, combate, visual, car, farm)
mkMenuButton(sideMenu, "VISUAL", 3, home, combate, visual, car, farm)
mkMenuButton(sideMenu, "CAR", 4, home, combate, visual, car, farm)
mkMenuButton(sideMenu, "AUTO FARM", 5, home, combate, visual, car, farm)

-- ═══════════════════════════════════════════════════════════════
-- DRAG
-- ═══════════════════════════════════════════════════════════════

local dragging = false
local dragInput, mousePos, framePos

topBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        mousePos = input.Position
        framePos = mainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

topBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        local delta = input.Position - mousePos
        mainFrame.Position = UDim2.new(
            framePos.X.Scale,
            framePos.X.Offset + delta.X,
            framePos.Y.Scale,
            framePos.Y.Offset + delta.Y
        )
    end
end)

-- ═══════════════════════════════════════════════════════════════
-- INICIALIZAR
-- ═══════════════════════════════════════════════════════════════

home()

print("✅ GHZ MENU INICIADO COM SUCESSO!")