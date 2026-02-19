local GUI_SCALE = 0.4

local COLORS = {
    Background = Color3.fromRGB(0, 0, 0),
    Primary = Color3.fromRGB(91, 51, 171),
    Text = Color3.fromRGB(255, 255, 255),
    TextActive = Color3.fromRGB(192, 161, 255),
    ScrollBar = Color3.fromRGB(120, 80, 180),
}

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "GHZ_MENU_RP"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

-- ═══════════════════════════════════════════════════════════════
-- BARRA SUPERIOR
-- ═══════════════════════════════════════════════════════════════
local topBar = Instance.new("Frame")
topBar.Name = "TopBar"
topBar.Size = UDim2.new(0, 1300 * GUI_SCALE, 0, 80 * GUI_SCALE)
topBar.Position = UDim2.new(0.5, 0, 0.05, 0)
topBar.AnchorPoint = Vector2.new(0.5, 0)
topBar.BackgroundColor3 = COLORS.Background
topBar.BorderSizePixel = 0
topBar.Active = true
topBar.Parent = screenGui

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
gapFrame.Size = UDim2.new(0, 1300 * GUI_SCALE, 0, 20 * GUI_SCALE)
gapFrame.Position = UDim2.new(0.5, 0, 0.05, 80 * GUI_SCALE)
gapFrame.AnchorPoint = Vector2.new(0.5, 0)
gapFrame.BackgroundTransparency = 1
gapFrame.BorderSizePixel = 0
gapFrame.Parent = screenGui

-- ═══════════════════════════════════════════════════════════════
-- MENU PRINCIPAL
-- ═══════════════════════════════════════════════════════════════
local mainContainer = Instance.new("Frame")
mainContainer.Name = "MainContainer"
mainContainer.Size = UDim2.new(0, 1300 * GUI_SCALE, 0, 570 * GUI_SCALE)
mainContainer.Position = UDim2.new(0.5, 0, 0.05, 100 * GUI_SCALE)
mainContainer.AnchorPoint = Vector2.new(0.5, 0)
mainContainer.BackgroundColor3 = COLORS.Background
mainContainer.BorderSizePixel = 0
mainContainer.Parent = screenGui

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
-- SCROLLBAR VISUAL (BARRA ROXA QUE ACOMPANHA O SCROLL)
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

-- Scrollbar thumb (a parte roxa que se move)
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

-- Atualizar posição da scrollbar conforme o scroll
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
    end)
end

-- Atualizar canvas size
sideMenuLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    sideMenu.CanvasSize = UDim2.new(0, 0, 0, sideMenuLayout.AbsoluteContentSize.Y)
    updateScrollBar()
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
-- SISTEMA DE ARRASTE (APENAS NA BARRA SUPERIOR)
-- ═══════════════════════════════════════════════════════════════
local dragging = false
local dragInput, mousePos, framePos

topBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        mousePos = input.Position
        framePos = topBar.Position
        
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
        
        -- Move a barra superior
        topBar.Position = UDim2.new(
            framePos.X.Scale,
            framePos.X.Offset + delta.X,
            framePos.Y.Scale,
            framePos.Y.Offset + delta.Y
        )
        
        -- Move o menu junto
        mainContainer.Position = UDim2.new(
            framePos.X.Scale,
            framePos.X.Offset + delta.X,
            mainContainer.Position.Y.Scale,
            mainContainer.Position.Y.Offset + delta.Y
        )
    end
end)

print("✅ BASE MENU COM ARRASTE - OK!")