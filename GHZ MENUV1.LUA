--[[
══════════════════════════════════════════════════════════════════
    GHZ MENU RP - Script para Roblox (VERSÃO FINAL - ATUALIZADA)
    Desenvolvedor: ghzmenu_developer & atr3uss_
    
    ⚙️ CONTROLE DE TAMANHO DA GUI - AJUSTE AQUI! ⚙️
══════════════════════════════════════════════════════════════════
]]--

local GUI_SCALE = 0.4
local MINI_MENU_SCALE = 0.3

-- Configurações de cores ATUALIZADAS
local COLORS = {
    Background = Color3.fromRGB(0, 0, 0),
    Primary = Color3.fromRGB(91, 51, 171), -- #5b33ab - Contorno roxo
    Secondary = Color3.fromRGB(91, 51, 171), -- Igual ao primary
    Text = Color3.fromRGB(255, 255, 255),
    Accent = Color3.fromRGB(91, 51, 171),
    SectionText = Color3.fromRGB(192, 161, 255), -- #c0a1ff - Nomes das seções
    ActiveToggle = Color3.fromRGB(41, 17, 87), -- #291157 - Botão ativado
    MinimizeButton = Color3.fromRGB(91, 51, 171),
}

local DISCORD_LINK = "https://discord.gg/JHmJCxyk2P"

local savedMainPosition = nil
local savedMiniPosition = nil

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "GHZ_MENU_RP"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

-- ═══════════════════════════════════════════════════════════════
-- FRAME PRINCIPAL (MENU COMPLETO)
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

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 20 * GUI_SCALE)
mainCorner.Parent = mainFrame

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = COLORS.Primary
mainStroke.Thickness = 2 * GUI_SCALE
mainStroke.Parent = mainFrame

-- ═══════════════════════════════════════════════════════════════
-- BARRA SUPERIOR (ALÇA DE ARRASTE)
-- ════════════════════════════════════════���══════════════════════
local topBar = Instance.new("Frame")
topBar.Name = "TopBar"
topBar.Size = UDim2.new(1, 0, 0, 80 * GUI_SCALE)
topBar.Position = UDim2.new(0, 0, 0, 0)
topBar.BackgroundColor3 = COLORS.Background
topBar.BorderSizePixel = 0
topBar.Active = true
topBar.Parent = mainFrame

local topBarStroke = Instance.new("UIStroke")
topBarStroke.Color = COLORS.Primary
topBarStroke.Thickness = 2 * GUI_SCALE
topBarStroke.Parent = topBar

-- Título na barra superior
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "Title"
titleLabel.Size = UDim2.new(0, 500 * GUI_SCALE, 0, 80 * GUI_SCALE)
titleLabel.Position = UDim2.new(0, 30 * GUI_SCALE, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "GHZ MENU RP  [Sintonia Rp]"
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 32 * GUI_SCALE
titleLabel.TextColor3 = COLORS.Text
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.TextYAlignment = Enum.TextYAlignment.Center
titleLabel.Parent = topBar

-- Status
local statusLabel = Instance.new("TextLabel")
statusLabel.Name = "Status"
statusLabel.Size = UDim2.new(0, 300 * GUI_SCALE, 0, 80 * GUI_SCALE)
statusLabel.Position = UDim2.new(0, 700 * GUI_SCALE, 0, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "STATUS: ONLINE"
statusLabel.Font = Enum.Font.GothamBold
statusLabel.TextSize = 24 * GUI_SCALE
statusLabel.TextColor3 = COLORS.Text
statusLabel.TextXAlignment = Enum.TextXAlignment.Center
statusLabel.TextYAlignment = Enum.TextYAlignment.Center
statusLabel.Parent = topBar

-- Botão minimizar (3 linhas)
local minimizeButton = Instance.new("TextButton")
minimizeButton.Name = "MinimizeButton"
minimizeButton.Size = UDim2.new(0, 60 * GUI_SCALE, 0, 60 * GUI_SCALE)
minimizeButton.Position = UDim2.new(1, -90 * GUI_SCALE, 0.5, -30 * GUI_SCALE)
minimizeButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
minimizeButton.BorderSizePixel = 0
minimizeButton.Text = "☰"
minimizeButton.Font = Enum.Font.GothamBold
minimizeButton.TextSize = 40 * GUI_SCALE
minimizeButton.TextColor3 = COLORS.Text
minimizeButton.Parent = topBar

local minimizeCorner = Instance.new("UICorner")
minimizeCorner.CornerRadius = UDim.new(0, 10 * GUI_SCALE)
minimizeCorner.Parent = minimizeButton

-- Menu lateral
local sideMenu = Instance.new("Frame")
sideMenu.Name = "SideMenu"
sideMenu.Size = UDim2.new(0, 300 * GUI_SCALE, 1, -80 * GUI_SCALE)
sideMenu.Position = UDim2.new(0, 20 * GUI_SCALE, 0, 80 * GUI_SCALE)
sideMenu.BackgroundTransparency = 1
sideMenu.Parent = mainFrame

-- Linha vertical
local verticalLine = Instance.new("Frame")
verticalLine.Name = "VerticalLine"
verticalLine.Size = UDim2.new(0, 2 * GUI_SCALE, 1, -80 * GUI_SCALE)
verticalLine.Position = UDim2.new(0, 340 * GUI_SCALE, 0, 80 * GUI_SCALE)
verticalLine.BackgroundColor3 = COLORS.Primary
verticalLine.BorderSizePixel = 0
verticalLine.Parent = mainFrame

-- Área de conteúdo
local contentFrame = Instance.new("Frame")
contentFrame.Name = "ContentFrame"
contentFrame.Size = UDim2.new(0, 900 * GUI_SCALE, 1, -80 * GUI_SCALE)
contentFrame.Position = UDim2.new(0, 370 * GUI_SCALE, 0, 80 * GUI_SCALE)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = mainFrame

-- ═══════════════════════════════════════════════════════════════
-- ESTADOS DOS TOGGLES
-- ═══════════════════════════════════════════════════════════════
local tg = {}

-- ✅ FUNÇÕES COM LOADSTRING PARA CADA TOGGLE
local fn = {
    -- COMBATE
    aimbot=function(s) 
        if s then 
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/AIMLOCK.ON.lua"))()
            end)
        else 
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/Aimlock.off.lua"))()
            end)
        end 
    end,
    
    noclip=function(s) 
        if s then 
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/NO%20CLIP%20On.lua"))()
            end)
        else 
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/NOCLIP%20OFF.lua"))()
            end)
        end 
    end,
    
    fly=function(s) 
        if s then 
            pcall(function()
                loadstring(game:HttpGet("seu link aqui - FLY ON"))()
            end)
        else 
            pcall(function()
                loadstring(game:HttpGet("seu link aqui - FLY OFF"))()
            end)
        end 
    end,
    
    nowall=function(s) 
        if s then 
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/NO%20WALL%20ON.LUA"))()
            end)
        else 
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/No%20wall%20off.lua"))()
            end)
        end 
    end,
    
    cb2=function(s) 
        if s then 
            pcall(function()
                loadstring(game:HttpGet("seu link aqui - CB2 ON"))()
            end)
        else 
            pcall(function()
                loadstring(game:HttpGet("seu link aqui - CB2 OFF"))()
            end)
        end 
    end,
    
    cb3=function(s) 
        if s then 
            pcall(function()
                loadstring(game:HttpGet("seu link aqui - CB3 ON"))()
            end)
        else 
            pcall(function()
                loadstring(game:HttpGet("seu link aqui - CB3 OFF"))()
            end)
        end 
    end,
    
    cb4=function(s) 
        if s then 
            pcall(function()
                loadstring(game:HttpGet("seu link aqui - CB4 ON"))()
            end)
        else 
            pcall(function()
                loadstring(game:HttpGet("seu link aqui - CB4 OFF"))()
            end)
        end 
    end,

    -- VISUAL
    espname=function(s) 
        if s then 
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/ESP%20NAME%20ON.lua"))()
            end)
        else 
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/ESP%20NAME%20OFF.lua"))()
            end)
        end 
    end,
    
    esptrace=function(s) 
        if s then 
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/ESP%20TRACE%20ON.lua"))()
            end)
        else 
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/ESP%20TRACE%20OFF.lua"))()
            end)
        end 
    end,
    
    espbox=function(s) 
        if s then 
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/ESP%20BOX%20ON.lua"))()
            end)
        else 
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/ESP%20BOX%20OFF.lua"))()
            end)
        end 
    end,
    
    esphead=function(s) 
        if s then 
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/ESP%20HEAD%20ON.lua"))()
            end)
        else 
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/ESP%20HEAD%20OFF.lua"))()
            end)
        end 
    end,
    
    espdist=function(s) 
        if s then 
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/ESP%20DIATANCIA%20ON.lua"))()
            end)
        else 
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/ESP%20DIATANCIA%20OFF.lua"))()
            end)
        end 
    end,
    
    espesqueleto=function(s) 
        if s then 
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/ESP%20ESQUELETO%20ON.lua"))()
            end)
        else 
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/ESP%20ESQUELETO%20OFF.lua"))()
            end)
        end 
    end,
    
    esplife=function(s) 
        if s then 
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/ESP%20LIFE%20ON.lua"))()
            end)
        else 
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/ESP%20LIFE%20OFF.lua"))()
            end)
        end 
    end,
    
    espstaff=function(s) 
        if s then 
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/Staff%20LIST%20ON.lua"))()
            end)
        else 
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/ghzmenu/GHZ-MENU-SCRIPTS-P-BLICOS/main/STAFF%20LIST%20OFF.lua"))()
            end)
        end 
    end,

    -- AUTO FARM
    f1=function(s) 
        if s then 
            pcall(function()
                loadstring(game:HttpGet("seu link aqui - FARM 1 ON"))()
            end)
        else 
            pcall(function()
                loadstring(game:HttpGet("seu link aqui - FARM 1 OFF"))()
            end)
        end 
    end,
    
    f2=function(s) 
        if s then 
            pcall(function()
                loadstring(game:HttpGet("seu link aqui - FARM 2 ON"))()
            end)
        else 
            pcall(function()
                loadstring(game:HttpGet("seu link aqui - FARM 2 OFF"))()
            end)
        end 
    end,
    
    f3=function(s) 
        if s then 
            pcall(function()
                loadstring(game:HttpGet("seu link aqui - FARM 3 ON"))()
            end)
        else 
            pcall(function()
                loadstring(game:HttpGet("seu link aqui - FARM 3 OFF"))()
            end)
        end 
    end,
    
    f4=function(s) 
        if s then 
            pcall(function()
                loadstring(game:HttpGet("seu link aqui - FARM 4 ON"))()
            end)
        else 
            pcall(function()
                loadstring(game:HttpGet("seu link aqui - FARM 4 OFF"))()
            end)
        end 
    end,
    
    f5=function(s) 
        if s then 
            pcall(function()
                loadstring(game:HttpGet("seu link aqui - FARM 5 ON"))()
            end)
        else 
            pcall(function()
                loadstring(game:HttpGet("seu link aqui - FARM 5 OFF"))()
            end)
        end 
    end,
    
    f6=function(s) 
        if s then 
            pcall(function()
                loadstring(game:HttpGet("seu link aqui - FARM 6 ON"))()
            end)
        else 
            pcall(function()
                loadstring(game:HttpGet("seu link aqui - FARM 6 OFF"))()
            end)
        end 
    end,
    
    f7=function(s) 
        if s then 
            pcall(function()
                loadstring(game:HttpGet("seu link aqui - FARM 7 ON"))()
            end)
        else 
            pcall(function()
                loadstring(game:HttpGet("seu link aqui - FARM 7 OFF"))()
            end)
        end 
    end,
    
    f8=function(s) 
        if s then 
            pcall(function()
                loadstring(game:HttpGet("seu link aqui - FARM 8 ON"))()
            end)
        else 
            pcall(function()
                loadstring(game:HttpGet("seu link aqui - FARM 8 OFF"))()
            end)
        end 
    end,

    -- CONFIG
    c1=function(s) 
        if s then 
            pcall(function()
                loadstring(game:HttpGet("seu link aqui - CONFIG 1 ON"))()
            end)
        else 
            pcall(function()
                loadstring(game:HttpGet("seu link aqui - CONFIG 1 OFF"))()
            end)
        end 
    end,
    
    c2=function(s) 
        if s then 
            pcall(function()
                loadstring(game:HttpGet("seu link aqui - CONFIG 2 ON"))()
            end)
        else 
            pcall(function()
                loadstring(game:HttpGet("seu link aqui - CONFIG 2 OFF"))()
            end)
        end 
    end,
    
    c3=function(s) 
        if s then 
            pcall(function()
                loadstring(game:HttpGet("seu link aqui - CONFIG 3 ON"))()
            end)
        else 
            pcall(function()
                loadstring(game:HttpGet("seu link aqui - CONFIG 3 OFF"))()
            end)
        end 
    end,
    
    c4=function(s) 
        if s then 
            pcall(function()
                loadstring(game:HttpGet("seu link aqui - CONFIG 4 ON"))()
            end)
        else 
            pcall(function()
                loadstring(game:HttpGet("seu link aqui - CONFIG 4 OFF"))()
            end)
        end 
    end,
    
    c5=function(s) 
        if s then 
            pcall(function()
                loadstring(game:HttpGet("seu link aqui - CONFIG 5 ON"))()
            end)
        else 
            pcall(function()
                loadstring(game:HttpGet("seu link aqui - CONFIG 5 OFF"))()
            end)
        end 
    end,
    
    c6=function(s) 
        if s then 
            pcall(function()
                loadstring(game:HttpGet("seu link aqui - CONFIG 6 ON"))()
            end)
        else 
            pcall(function()
                loadstring(game:HttpGet("seu link aqui - CONFIG 6 OFF"))()
            end)
        end 
    end,
    
    c7=function(s) 
        if s then 
            pcall(function()
                loadstring(game:HttpGet("seu link aqui - CONFIG 7 ON"))()
            end)
        else 
            pcall(function()
                loadstring(game:HttpGet("seu link aqui - CONFIG 7 OFF"))()
            end)
        end 
    end,
    
    c8=function(s) 
        if s then 
            pcall(function()
                loadstring(game:HttpGet("seu link aqui - CONFIG 8 ON"))()
            end)
        else 
            pcall(function()
                loadstring(game:HttpGet("seu link aqui - CONFIG 8 OFF"))()
            end)
        end 
    end,
}

-- ═══════════════════════════════════════════════════════════════
-- FUNÇÕES AUXILIARES
-- ═══════════════════════════════════════════════════════════════

-- Criar toggle com design novo
local function mkT(p, txt, k, x, y)
    local f = Instance.new("Frame")
    f.Size = UDim2.new(0, 420 * GUI_SCALE, 0, 50 * GUI_SCALE)
    f.Position = UDim2.new(0, x, 0, y)
    f.BackgroundTransparency = 1
    f.Parent = p
    
    local l = Instance.new("TextLabel")
    l.Size = UDim2.new(0, 280 * GUI_SCALE, 1, 0)
    l.BackgroundTransparency = 1
    l.Text = txt
    l.Font = Enum.Font.GothamBold
    l.TextSize = 24 * GUI_SCALE
    l.TextColor3 = COLORS.Text
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.Parent = f
    
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0, 110 * GUI_SCALE, 0, 45 * GUI_SCALE)
    b.Position = UDim2.new(1, -110 * GUI_SCALE, 0.5, 0)
    b.AnchorPoint = Vector2.new(0, 0.5)
    b.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    b.BorderSizePixel = 0
    b.Text = ""
    b.Parent = f
    
    local bc = Instance.new("UICorner")
    bc.CornerRadius = UDim.new(1, 0)
    bc.Parent = b
    
    local c = Instance.new("Frame")
    c.Size = UDim2.new(0, 37 * GUI_SCALE, 0, 37 * GUI_SCALE)
    c.Position = UDim2.new(0, 4 * GUI_SCALE, 0.5, 0)
    c.AnchorPoint = Vector2.new(0, 0.5)
    c.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    c.BorderSizePixel = 0
    c.Parent = b
    
    local cc = Instance.new("UICorner")
    cc.CornerRadius = UDim.new(1, 0)
    cc.Parent = c
    
    tg[k] = false
    
    b.MouseButton1Click:Connect(function()
        tg[k] = not tg[k]
        if tg[k] then
            b.BackgroundColor3 = COLORS.ActiveToggle
            c.Position = UDim2.new(1, -41 * GUI_SCALE, 0.5, 0)
        else
            b.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            c.Position = UDim2.new(0, 4 * GUI_SCALE, 0.5, 0)
        end
        if fn[k] then
            fn[k](tg[k])
        end
    end)
end

-- Criar botão teleport
local function mkB(p, txt, x, y)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0, 260 * GUI_SCALE, 0, 60 * GUI_SCALE)
    b.Position = UDim2.new(0, x, 0, y)
    b.BackgroundColor3 = COLORS.Secondary
    b.BorderSizePixel = 0
    b.Text = txt
    b.Font = Enum.Font.GothamBold
    b.TextSize = 24 * GUI_SCALE
    b.TextColor3 = COLORS.Text
    b.Parent = p
    
    local bc = Instance.new("UICorner")
    bc.CornerRadius = UDim.new(0, 30 * GUI_SCALE)
    bc.Parent = b
    
    b.MouseEnter:Connect(function()
        b.BackgroundColor3 = COLORS.Accent
    end)
    
    b.MouseLeave:Connect(function()
        b.BackgroundColor3 = COLORS.Secondary
    end)
    
    b.MouseButton1Click:Connect(function()
    end)
end

-- Limpar conteúdo
local function clr()
    for _, v in pairs(contentFrame:GetChildren()) do
        v:Destroy()
    end
end

-- ═══════════════════════════════════════════════════════════════
-- FUNÇÕES DAS ABAS
-- ═══════════════════════════════════════════════════════════════

local function home()
    clr()
    
    local imageFrame = Instance.new("ImageLabel")
    imageFrame.Name = "ProfileImage"
    imageFrame.Size = UDim2.new(0, 240 * GUI_SCALE, 0, 240 * GUI_SCALE)
    imageFrame.Position = UDim2.new(0, 30 * GUI_SCALE, 0, 40 * GUI_SCALE)
    imageFrame.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    imageFrame.BorderSizePixel = 0
    imageFrame.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. player.UserId .. "&width=420&height=420&format=png"
    imageFrame.Parent = contentFrame

    local imageCorner = Instance.new("UICorner")
    imageCorner.CornerRadius = UDim.new(1, 0)
    imageCorner.Parent = imageFrame

    local usernameLabel = Instance.new("TextLabel")
    usernameLabel.Name = "UsernameLabel"
    usernameLabel.Size = UDim2.new(0, 240 * GUI_SCALE, 0, 40 * GUI_SCALE)
    usernameLabel.Position = UDim2.new(0, 30 * GUI_SCALE, 0, 295 * GUI_SCALE)
    usernameLabel.BackgroundTransparency = 1
    usernameLabel.Text = player.Name
    usernameLabel.Font = Enum.Font.GothamBold
    usernameLabel.TextSize = 18 * GUI_SCALE
    usernameLabel.TextColor3 = COLORS.Text
    usernameLabel.TextXAlignment = Enum.TextXAlignment.Center
    usernameLabel.Parent = contentFrame

    local welcomeText = Instance.new("TextLabel")
    welcomeText.Name = "WelcomeText"
    welcomeText.Size = UDim2.new(0, 580 * GUI_SCALE, 0, 40 * GUI_SCALE)
    welcomeText.Position = UDim2.new(0, 290 * GUI_SCALE, 0, 30 * GUI_SCALE)
    welcomeText.BackgroundTransparency = 1
    welcomeText.Text = "Olá, seja bem-vindo ao GHZ MENU RP"
    welcomeText.Font = Enum.Font.GothamBold
    welcomeText.TextSize = 22 * GUI_SCALE
    welcomeText.TextColor3 = COLORS.Text
    welcomeText.TextXAlignment = Enum.TextXAlignment.Left
    welcomeText.TextWrapped = true
    welcomeText.Parent = contentFrame

    local descriptionText = Instance.new("TextLabel")
    descriptionText.Name = "DescriptionText"
    descriptionText.Size = UDim2.new(0, 580 * GUI_SCALE, 0, 60 * GUI_SCALE)
    descriptionText.Position = UDim2.new(0, 290 * GUI_SCALE, 0, 75 * GUI_SCALE)
    descriptionText.BackgroundTransparency = 1
    descriptionText.Text = "O melhor menu legit para o mapa\nSINTONIA RP."
    descriptionText.Font = Enum.Font.Gotham
    descriptionText.TextSize = 20 * GUI_SCALE
    descriptionText.TextColor3 = COLORS.Text
    descriptionText.TextXAlignment = Enum.TextXAlignment.Left
    descriptionText.TextWrapped = true
    descriptionText.Parent = contentFrame

    local devTitle = Instance.new("TextLabel")
    devTitle.Name = "DevTitle"
    devTitle.Size = UDim2.new(0, 580 * GUI_SCALE, 0, 40 * GUI_SCALE)
    devTitle.Position = UDim2.new(0, 290 * GUI_SCALE, 0, 160 * GUI_SCALE)
    devTitle.BackgroundTransparency = 1
    devTitle.Text = "Desenvolvedores"
    devTitle.Font = Enum.Font.GothamBold
    devTitle.TextSize = 26 * GUI_SCALE
    devTitle.TextColor3 = COLORS.Text
    devTitle.TextXAlignment = Enum.TextXAlignment.Center
    devTitle.Parent = contentFrame

    local dev1 = Instance.new("TextLabel")
    dev1.Name = "Dev1"
    dev1.Size = UDim2.new(0, 580 * GUI_SCALE, 0, 35 * GUI_SCALE)
    dev1.Position = UDim2.new(0, 290 * GUI_SCALE, 0, 205 * GUI_SCALE)
    dev1.BackgroundTransparency = 1
    dev1.Text = "By: ghzstore"
    dev1.Font = Enum.Font.Gotham
    dev1.TextSize = 19 * GUI_SCALE
    dev1.TextColor3 = COLORS.Text
    dev1.TextXAlignment = Enum.TextXAlignment.Center
    dev1.Parent = contentFrame

    local dev2 = Instance.new("TextLabel")
    dev2.Name = "Dev2"
    dev2.Size = UDim2.new(0, 580 * GUI_SCALE, 0, 35 * GUI_SCALE)
    dev2.Position = UDim2.new(0, 290 * GUI_SCALE, 0, 240 * GUI_SCALE)
    dev2.BackgroundTransparency = 1
    dev2.Text = "By: atr3uss_"
    dev2.Font = Enum.Font.Gotham
    dev2.TextSize = 19 * GUI_SCALE
    dev2.TextColor3 = COLORS.Text
    dev2.TextXAlignment = Enum.TextXAlignment.Center
    dev2.Parent = contentFrame

    local discordButton = Instance.new("TextButton")
    discordButton.Name = "DiscordButton"
    discordButton.Size = UDim2.new(0, 300 * GUI_SCALE, 0, 70 * GUI_SCALE)
    discordButton.Position = UDim2.new(0, 430 * GUI_SCALE, 0, 295 * GUI_SCALE)
    discordButton.BackgroundColor3 = COLORS.ActiveToggle
    discordButton.BorderSizePixel = 0
    discordButton.Text = "Discord.link"
    discordButton.Font = Enum.Font.GothamBold
    discordButton.TextSize = 26 * GUI_SCALE
    discordButton.TextColor3 = COLORS.Text
    discordButton.Parent = contentFrame

    local discordCorner = Instance.new("UICorner")
    discordCorner.CornerRadius = UDim.new(0, 35 * GUI_SCALE)
    discordCorner.Parent = discordButton

    discordButton.MouseEnter:Connect(function()
        discordButton.BackgroundColor3 = COLORS.Primary
    end)

    discordButton.MouseLeave:Connect(function()
        discordButton.BackgroundColor3 = COLORS.ActiveToggle
    end)

    discordButton.MouseButton1Click:Connect(function()
        setclipboard(DISCORD_LINK)
        local originalText = discordButton.Text
        discordButton.Text = "✓ Link copiado!"
        discordButton.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
        task.wait(1.5)
        discordButton.Text = originalText
        discordButton.BackgroundColor3 = COLORS.ActiveToggle
    end)

    local bugReportText = Instance.new("TextLabel")
    bugReportText.Name = "BugReportText"
    bugReportText.Size = UDim2.new(0, 600 * GUI_SCALE, 0, 60 * GUI_SCALE)
    bugReportText.Position = UDim2.new(0, 30 * GUI_SCALE, 0, 395 * GUI_SCALE)
    bugReportText.BackgroundTransparency = 1
    bugReportText.Text = "Deseja relatar algum bug?\nEntre em nosso servidor do discord!"
    bugReportText.Font = Enum.Font.Gotham
    bugReportText.TextSize = 18 * GUI_SCALE
    bugReportText.TextColor3 = COLORS.Text
    bugReportText.TextXAlignment = Enum.TextXAlignment.Center
    bugReportText.TextYAlignment = Enum.TextYAlignment.Center
    bugReportText.TextWrapped = true
    bugReportText.Parent = contentFrame
end

local function combate()
    clr()
    
    local t = Instance.new("TextLabel")
    t.Size = UDim2.new(1, -40 * GUI_SCALE, 0, 60 * GUI_SCALE)
    t.Position = UDim2.new(0, 20 * GUI_SCALE, 0, 20 * GUI_SCALE)
    t.BackgroundTransparency = 1
    t.Text = "COMBATE"
    t.Font = Enum.Font.GothamBold
    t.TextSize = 36 * GUI_SCALE
    t.TextColor3 = COLORS.SectionText
    t.Parent = contentFrame
    
    mkT(contentFrame, "AIMBOT", "aimbot", 20 * GUI_SCALE, 100 * GUI_SCALE)
    mkT(contentFrame, "NOCLIP", "noclip", 20 * GUI_SCALE, 170 * GUI_SCALE) -- ✅ NOCLIP AQUI COM LOADSTRING
    mkT(contentFrame, "EMBREVE", "cb3", 20 * GUI_SCALE, 240 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", "cb4", 20 * GUI_SCALE, 310 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", "cb2", 460 * GUI_SCALE, 100 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", "c1", 460 * GUI_SCALE, 170 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", "c2", 460 * GUI_SCALE, 240 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", "c3", 460 * GUI_SCALE, 310 * GUI_SCALE)
end

local function visual()
    clr()
    
    local t = Instance.new("TextLabel")
    t.Size = UDim2.new(1, -40 * GUI_SCALE, 0, 60 * GUI_SCALE)
    t.Position = UDim2.new(0, 20 * GUI_SCALE, 0, 20 * GUI_SCALE)
    t.BackgroundTransparency = 1
    t.Text = "VISUAL"
    t.Font = Enum.Font.GothamBold
    t.TextSize = 36 * GUI_SCALE
    t.TextColor3 = COLORS.SectionText
    t.Parent = contentFrame
    
    mkT(contentFrame, "ESP NAME", "espname", 20 * GUI_SCALE, 100 * GUI_SCALE)
    mkT(contentFrame, "ESP TRACE", "esptrace", 20 * GUI_SCALE, 170 * GUI_SCALE)
    mkT(contentFrame, "ESP HEAD", "esphead", 20 * GUI_SCALE, 240 * GUI_SCALE)
    mkT(contentFrame, "ESP LIFE", "esplife", 20 * GUI_SCALE, 310 * GUI_SCALE)
    mkT(contentFrame, "ESP Distance", "espdist", 460 * GUI_SCALE, 100 * GUI_SCALE)
    mkT(contentFrame, "ESP BACKPACK", "espesqueleto", 460 * GUI_SCALE, 170 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", "espbox", 460 * GUI_SCALE, 240 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", "espstaff", 460 * GUI_SCALE, 310 * GUI_SCALE)
end

local function car()
    clr()
    
    local t = Instance.new("TextLabel")
    t.Size = UDim2.new(1, -40 * GUI_SCALE, 0, 60 * GUI_SCALE)
    t.Position = UDim2.new(0, 20 * GUI_SCALE, 0, 20 * GUI_SCALE)
    t.BackgroundTransparency = 1
    t.Text = "CAR"
    t.Font = Enum.Font.GothamBold
    t.TextSize = 36 * GUI_SCALE
    t.TextColor3 = COLORS.SectionText
    t.Parent = contentFrame
    
    mkT(contentFrame, "ESP UNLOCKED", "f1", 20 * GUI_SCALE, 100 * GUI_SCALE)
    mkT(contentFrame, "FLY CAR", "f2", 20 * GUI_SCALE, 170 * GUI_SCALE)
    mkT(contentFrame, "NOCLIP CAR", "f3", 20 * GUI_SCALE, 240 * GUI_SCALE)
    mkT(contentFrame, "ANT BLIND", "f4", 20 * GUI_SCALE, 310 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", "f5", 460 * GUI_SCALE, 100 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", "f6", 460 * GUI_SCALE, 170 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", "f7", 460 * GUI_SCALE, 240 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", "f8", 460 * GUI_SCALE, 310 * GUI_SCALE)
end

local function farm()
    clr()
    
    local t = Instance.new("TextLabel")
    t.Size = UDim2.new(1, -40 * GUI_SCALE, 0, 60 * GUI_SCALE)
    t.Position = UDim2.new(0, 20 * GUI_SCALE, 0, 20 * GUI_SCALE)
    t.BackgroundTransparency = 1
    t.Text = "AUTO FARM"
    t.Font = Enum.Font.GothamBold
    t.TextSize = 36 * GUI_SCALE
    t.TextColor3 = COLORS.SectionText
    t.Parent = contentFrame
    
    mkT(contentFrame, "AUTO TRASH", "f1", 20 * GUI_SCALE, 100 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", "f2", 20 * GUI_SCALE, 170 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", "f3", 20 * GUI_SCALE, 240 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", "f4", 20 * GUI_SCALE, 310 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", "f5", 460 * GUI_SCALE, 100 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", "f6", 460 * GUI_SCALE, 170 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", "f7", 460 * GUI_SCALE, 240 * GUI_SCALE)
    mkT(contentFrame, "EMBREVE", "f8", 460 * GUI_SCALE, 310 * GUI_SCALE)
end

-- ═══════════════════════════════════════════════════════════════
-- CRIAÇÃO DOS BOTÕES DO MENU LATERAL
-- ══════════════════════════════════��════════════════════════════

local menuButtons = {"HOME", "COMBATE", "VISUAL", "CAR", "AUTO FARM"}

for i, buttonName in ipairs(menuButtons) do
    local button = Instance.new("TextButton")
    button.Name = buttonName
    button.Size = UDim2.new(1, 0, 0, 70 * GUI_SCALE)
    button.Position = UDim2.new(0, 0, 0, (i - 1) * 80 * GUI_SCALE)
    button.BackgroundColor3 = (i == 1) and Color3.fromRGB(20, 20, 20) or Color3.fromRGB(20, 20, 20)
    button.BorderSizePixel = 0
    button.Text = buttonName
    button.Font = Enum.Font.GothamBold
    button.TextSize = 24 * GUI_SCALE
    button.TextColor3 = (i == 1) and COLORS.SectionText or COLORS.Text
    button.Parent = sideMenu
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 15 * GUI_SCALE)
    buttonCorner.Parent = button
    
    button.MouseButton1Click:Connect(function()
        for _, child in pairs(sideMenu:GetChildren()) do
            if child:IsA("TextButton") then
                child.TextColor3 = COLORS.Text
            end
        end
        button.TextColor3 = COLORS.SectionText
        
        if buttonName == "HOME" then
            home()
        elseif buttonName == "COMBATE" then
            combate()
        elseif buttonName == "VISUAL" then
            visual()
        elseif buttonName == "CAR" then
            car()
        elseif buttonName == "AUTO FARM" then
            farm()
        end
    end)
    
    button.MouseEnter:Connect(function()
        if button.TextColor3 ~= COLORS.SectionText then
            button.TextColor3 = COLORS.SectionText
        end
    end)
    
    button.MouseLeave:Connect(function()
        if button.TextColor3 == COLORS.SectionText then
            -- Keep it
        else
            button.TextColor3 = COLORS.Text
        end
    end)
end

-- ═══════════════════════════════════════════════════════════════
-- MINI GUI (MENU MINIMIZADO) - APENAS 3 LINHAS
-- ═══════════════════════════════════════════════════════════════

local miniFrame = Instance.new("Frame")
miniFrame.Name = "MiniFrame"
miniFrame.Size = UDim2.new(0, 150 * MINI_MENU_SCALE, 0, 120 * MINI_MENU_SCALE)
miniFrame.Position = UDim2.new(0.5, 0, 0.1, 0)
miniFrame.AnchorPoint = Vector2.new(0.5, 0)
miniFrame.BackgroundColor3 = COLORS.Background
miniFrame.BorderSizePixel = 0
miniFrame.Visible = false
miniFrame.Active = true
miniFrame.Parent = screenGui

local miniCorner = Instance.new("UICorner")
miniCorner.CornerRadius = UDim.new(0, 20 * MINI_MENU_SCALE)
miniCorner.Parent = miniFrame

local miniStroke = Instance.new("UIStroke")
miniStroke.Color = COLORS.Primary
miniStroke.Thickness = 2 * MINI_MENU_SCALE
miniStroke.Parent = miniFrame

local expandButton = Instance.new("TextButton")
expandButton.Size = UDim2.new(1, 0, 1, 0)
expandButton.BackgroundColor3 = COLORS.Background
expandButton.BorderSizePixel = 0
expandButton.Text = "☰"
expandButton.Font = Enum.Font.GothamBold
expandButton.TextSize = 48 * MINI_MENU_SCALE
expandButton.TextColor3 = COLORS.Text
expandButton.Parent = miniFrame

local expandCorner = Instance.new("UICorner")
expandCorner.CornerRadius = UDim.new(0, 20 * MINI_MENU_SCALE)
expandCorner.Parent = expandButton

-- ═══════════════════════════════════════════════════════════════
-- SISTEMA DE ARRASTE (APENAS BARRA SUPERIOR)
-- ═══════════════════════════════════════════════════════════════

local dragging = false
local dragInput, mousePos, framePos

local function updateDrag(input)
    local delta = input.Position - mousePos
    mainFrame.Position = UDim2.new(
        framePos.X.Scale,
        framePos.X.Offset + delta.X,
        framePos.Y.Scale,
        framePos.Y.Offset + delta.Y
    )
end

topBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
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
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        updateDrag(input)
    end
end)

-- Arraste do mini menu
local miniDragging = false
local miniDragInput, miniMousePos, miniFramePos

local function updateMiniDrag(input)
    local delta = input.Position - miniMousePos
    miniFrame.Position = UDim2.new(
        miniFramePos.X.Scale,
        miniFramePos.X.Offset + delta.X,
        miniFramePos.Y.Scale,
        miniFramePos.Y.Offset + delta.Y
    )
end

miniFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        miniDragging = true
        miniMousePos = input.Position
        miniFramePos = miniFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                miniDragging = false
            end
        end)
    end
end)

miniFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        miniDragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if miniDragging and input == miniDragInput then
        updateMiniDrag(input)
    end
end)

-- ═══════════════════════════════════════════════════════════════
-- MINIMIZAR E EXPANDIR
-- ═══════════════════════════════════════════════════════════════

minimizeButton.MouseButton1Click:Connect(function()
    savedMainPosition = mainFrame.Position
    
    if savedMiniPosition then
        miniFrame.Position = savedMiniPosition
    else
        miniFrame.Position = mainFrame.Position
    end
    
    mainFrame.Visible = false
    miniFrame.Visible = true
end)

expandButton.MouseButton1Click:Connect(function()
    savedMiniPosition = miniFrame.Position
    
    if savedMainPosition then
        mainFrame.Position = savedMainPosition
    end
    
    miniFrame.Visible = false
    mainFrame.Visible = true
end)

expandButton.MouseEnter:Connect(function()
    expandButton.BackgroundColor3 = COLORS.Primary
end)

expandButton.MouseLeave:Connect(function()
    expandButton.BackgroundColor3 = COLORS.Background
end)

-- ═══════════════════════════════════════════════════════════════
-- INICIALIZAR COM HOME
-- ═══════════════════════════════════════════════════════════════

home()

print("GHZ MENU INICIALIZADO COM SUCESSO!")