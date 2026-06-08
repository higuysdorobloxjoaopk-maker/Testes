--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @uniquadev
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 

Transformado em Library Funcional Completa
]=]

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local UniquaLib = {}

function UniquaLib:CreateWindow(options)
    local titleText = options.Title or "exemple"
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "UniquaUI"
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui") -- Em exploits, mude para CoreGui se necessário

    -- === CAPTCHA SYSTEM ===
    local Recapta = Instance.new("ImageButton")
    Recapta.BorderSizePixel = 0
    Recapta.BackgroundTransparency = 1
    Recapta.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Recapta.ZIndex = 5
    Recapta.Image = "rbxassetid://130686085122631"
    Recapta.Size = UDim2.new(0, 202, 0, 60)
    Recapta.Name = "Recapta"
    Recapta.Position = UDim2.new(0, 276, 0, 102)
    Recapta.Parent = ScreenGui

    local sucess = Instance.new("ImageLabel")
    sucess.BorderSizePixel = 0
    sucess.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    sucess.Image = "rbxassetid://17368190066"
    sucess.Size = UDim2.new(0, 16, 0, 16)
    sucess.Visible = false
    sucess.BackgroundTransparency = 1
    sucess.Name = "sucess"
    sucess.Position = UDim2.new(0, 12, 0, 22)
    sucess.Parent = Recapta

    local loading = Instance.new("ImageLabel")
    loading.BorderSizePixel = 0
    loading.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    loading.Image = "rbxassetid://17687447043"
    loading.Size = UDim2.new(0, 16, 0, 16)
    loading.Visible = false
    loading.BackgroundTransparency = 1
    loading.Name = "loading"
    loading.Position = UDim2.new(0, 12, 0, 22)
    loading.Parent = Recapta

    -- === MAIN FRAME (OCULTO INICIALMENTE) ===
    local MainFrame = Instance.new("Frame")
    MainFrame.Visible = false
    MainFrame.BorderSizePixel = 0
    MainFrame.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
    MainFrame.Size = UDim2.new(0, 142, 0, 192)
    MainFrame.Position = UDim2.new(0, 354, 0, -24)
    MainFrame.Name = "MainFrame"
    MainFrame.BackgroundTransparency = 0.4
    MainFrame.ClipsDescendants = true
    MainFrame.Parent = ScreenGui

    local UIDragDetector = Instance.new("UIDragDetector")
    UIDragDetector.Parent = MainFrame

    local TopBar = Instance.new("Frame")
    TopBar.BorderSizePixel = 0
    TopBar.BackgroundColor3 = Color3.fromRGB(64, 200, 255)
    TopBar.Size = UDim2.new(0, 154, 0, 22)
    TopBar.Position = UDim2.new(0, -6, 0, 0)
    TopBar.Parent = MainFrame

    local TopUICorner = Instance.new("UICorner")
    TopUICorner.Parent = TopBar

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.BorderSizePixel = 0
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Size = UDim2.new(0, 106, 0, 2)
    TitleLabel.Text = titleText
    TitleLabel.Position = UDim2.new(0, 6, 0, 10)
    TitleLabel.Parent = TopBar

    local MinimilizeButton = Instance.new("ImageButton")
    MinimilizeButton.BorderSizePixel = 0
    MinimilizeButton.BackgroundTransparency = 1
    MinimilizeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MinimilizeButton.Image = "rbxassetid://85152676952251"
    MinimilizeButton.Size = UDim2.new(0, 18, 0, 18)
    MinimilizeButton.Name = "MinimilizeButton"
    MinimilizeButton.Position = UDim2.new(0, 132, 0, 2)
    MinimilizeButton.Parent = TopBar

    local ContentFrame = Instance.new("Frame")
    ContentFrame.BorderSizePixel = 0
    ContentFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ContentFrame.Size = UDim2.new(0, 138, 0, 148)
    ContentFrame.Position = UDim2.new(0, 2, 0, 22)
    ContentFrame.BackgroundTransparency = 1
    ContentFrame.Parent = MainFrame

    local ScrollingFrame = Instance.new("ScrollingFrame")
    ScrollingFrame.BorderSizePixel = 0
    ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ScrollingFrame.Size = UDim2.new(0, 138, 0, 168)
    ScrollingFrame.ScrollBarThickness = 0
    ScrollingFrame.BackgroundTransparency = 1
    ScrollingFrame.Parent = ContentFrame

    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Parent = ScrollingFrame

    -- Logica Minimizador
    local isMinimized = false
    MinimilizeButton.MouseButton1Click:Connect(function()
        isMinimized = not isMinimized
        if isMinimized then
            TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 142, 0, 22)}):Play()
        else
            TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 142, 0, 192)}):Play()
        end
    end)

    -- Logica Captcha
    local captchaCompleted = false
    Recapta.MouseButton1Click:Connect(function()
        if captchaCompleted then return end
        captchaCompleted = true
        loading.Visible = true
        
        -- Animação de rotação infinita
        local tween = TweenService:Create(loading, TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {Rotation = 360})
        tween:Play()
        
        task.wait(1.5) -- Tempo simulado de verificação
        
        tween:Cancel()
        loading.Visible = false
        loading.Rotation = 0
        sucess.Visible = true
        
        task.wait(0.5)
        TweenService:Create(Recapta, TweenInfo.new(0.5), {ImageTransparency = 1}):Play()
        TweenService:Create(sucess, TweenInfo.new(0.5), {ImageTransparency = 1}):Play()
        task.wait(0.5)
        
        Recapta:Destroy()
        MainFrame.Visible = true
        MainFrame.Position = UDim2.new(0, 354, 0, 300) -- Animação de entrada
        TweenService:Create(MainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(0, 354, 0, -24)}):Play()
    end)

    local WindowAPI = {}

    function WindowAPI:SetTitle(newTitle)
        TitleLabel.Text = newTitle
    end

    function WindowAPI:CreateToggle(tOptions)
        local tName = tOptions.Name or "Toggle"
        local tCallback = tOptions.Callback or function() end
        local tState = tOptions.Default or false

        local HitFrameToggle = Instance.new("Frame")
        HitFrameToggle.BorderSizePixel = 0
        HitFrameToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        HitFrameToggle.Size = UDim2.new(0, 138, 0, 34)
        HitFrameToggle.Name = "HitFrame(Toggle)"
        HitFrameToggle.BackgroundTransparency = 1
        HitFrameToggle.Parent = ScrollingFrame

        local TextLabel = Instance.new("TextLabel")
        TextLabel.BorderSizePixel = 0
        TextLabel.TextXAlignment = Enum.TextXAlignment.Left
        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.Size = UDim2.new(0, 64, 0, 0)
        TextLabel.Text = tName
        TextLabel.Position = UDim2.new(0, 4, 0, 16)
        TextLabel.BackgroundTransparency = 1
        TextLabel.Parent = HitFrameToggle

        local Frame_c = Instance.new("Frame")
        Frame_c.BorderSizePixel = 0
        Frame_c.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Frame_c.Size = UDim2.new(0, 24, 0, 10)
        Frame_c.Position = UDim2.new(0, 108, 0, 12)
        Frame_c.Parent = HitFrameToggle
        Instance.new("UICorner", Frame_c)

        local Frame_d = Instance.new("Frame") -- A bolinha / slider do toggle
        Frame_d.BorderSizePixel = 0
        Frame_d.BackgroundColor3 = Color3.fromRGB(119, 119, 119)
        Frame_d.Size = UDim2.new(0, 6, 0, 18)
        Frame_d.Position = UDim2.new(0, -2, 0, -4)
        Frame_d.Parent = Frame_c
        Instance.new("UICorner", Frame_d)

        local ClickDetector = Instance.new("ImageButton")
        ClickDetector.ZIndex = 2
        ClickDetector.BorderSizePixel = 0
        ClickDetector.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ClickDetector.ImageTransparency = 1
        ClickDetector.Size = UDim2.new(0, 28, 0, 18)
        ClickDetector.BackgroundTransparency = 1
        ClickDetector.Name = "ClickDetector"
        ClickDetector.Position = UDim2.new(0, -2, 0, -4)
        ClickDetector.Parent = Frame_c

        local function updateVisual()
            local xPos = tState and 20 or -2
            local color = tState and Color3.fromRGB(64, 200, 255) or Color3.fromRGB(119, 119, 119)
            TweenService:Create(Frame_d, TweenInfo.new(0.2), {Position = UDim2.new(0, xPos, 0, -4), BackgroundColor3 = color}):Play()
        end

        updateVisual()

        ClickDetector.MouseButton1Click:Connect(function()
            tState = not tState
            updateVisual()
            tCallback(tState)
        end)

        return {
            Set = function(self, state)
                tState = state
                updateVisual()
                tCallback(tState)
            end
        }
    end

    function WindowAPI:CreateButton(bOptions)
        local bName = bOptions.Name or "Button"
        local bCallback = bOptions.Callback or function() end

        local HitFrameButton = Instance.new("Frame")
        HitFrameButton.BorderSizePixel = 0
        HitFrameButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        HitFrameButton.Size = UDim2.new(0, 138, 0, 34)
        HitFrameButton.Name = "HitFrame(Button)"
        HitFrameButton.BackgroundTransparency = 1
        HitFrameButton.Parent = ScrollingFrame

        local TextLabel = Instance.new("TextLabel")
        TextLabel.BorderSizePixel = 0
        TextLabel.TextXAlignment = Enum.TextXAlignment.Left
        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.Size = UDim2.new(0, 64, 0, 0)
        TextLabel.Text = bName
        TextLabel.BackgroundTransparency = 1
        TextLabel.Position = UDim2.new(0, 4, 0, 16)
        TextLabel.Parent = HitFrameButton

        local Frame_14 = Instance.new("Frame")
        Frame_14.BorderSizePixel = 0
        Frame_14.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Frame_14.Size = UDim2.new(0, 10, 0, 10)
        Frame_14.Position = UDim2.new(0, 118, 0, 12)
        Frame_14.BackgroundTransparency = 1
        Frame_14.Parent = HitFrameButton

        local ClickDetector = Instance.new("ImageButton")
        ClickDetector.ZIndex = 2
        ClickDetector.BorderSizePixel = 0
        ClickDetector.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ClickDetector.Image = "rbxassetid://17293879614"
        ClickDetector.Size = UDim2.new(0, 14, 0, 14)
        ClickDetector.BackgroundTransparency = 1
        ClickDetector.Name = "ClickDetector"
        ClickDetector.Position = UDim2.new(0, -4, 0, -2)
        ClickDetector.Parent = Frame_14

        ClickDetector.MouseButton1Down:Connect(function()
            TweenService:Create(ClickDetector, TweenInfo.new(0.1), {Size = UDim2.new(0, 10, 0, 10), Position = UDim2.new(0, -2, 0, 0)}):Play()
        end)
        ClickDetector.MouseButton1Up:Connect(function()
            TweenService:Create(ClickDetector, TweenInfo.new(0.1), {Size = UDim2.new(0, 14, 0, 14), Position = UDim2.new(0, -4, 0, -2)}):Play()
            bCallback()
        end)
    end

    function WindowAPI:CreateTextBox(tbOptions)
        local tbName = tbOptions.Name or "TextBox"
        local tbCallback = tbOptions.Callback or function() end

        local HitFrameTextBox = Instance.new("Frame")
        HitFrameTextBox.BorderSizePixel = 0
        HitFrameTextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        HitFrameTextBox.Size = UDim2.new(0, 138, 0, 34)
        HitFrameTextBox.Name = "HitFrame(TextBox)"
        HitFrameTextBox.BackgroundTransparency = 1
        HitFrameTextBox.Parent = ScrollingFrame

        local TextLabel = Instance.new("TextLabel")
        TextLabel.BorderSizePixel = 0
        TextLabel.TextXAlignment = Enum.TextXAlignment.Left
        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.Size = UDim2.new(0, 64, 0, 0)
        TextLabel.Text = tbName
        TextLabel.Position = UDim2.new(0, 4, 0, 16)
        TextLabel.BackgroundTransparency = 1
        TextLabel.Parent = HitFrameTextBox

        local Frame_18 = Instance.new("Frame")
        Frame_18.BorderSizePixel = 0
        Frame_18.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Frame_18.Size = UDim2.new(0, 48, 0, 10)
        Frame_18.Position = UDim2.new(0, 84, 0, 12)
        Frame_18.Parent = HitFrameTextBox
        Instance.new("UICorner", Frame_18)

        local textbox = Instance.new("TextBox")
        textbox.Name = "textbox"
        textbox.PlaceholderColor3 = Color3.fromRGB(25, 94, 128)
        textbox.BorderSizePixel = 0
        textbox.TextColor3 = Color3.fromRGB(65, 166, 255)
        textbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        textbox.PlaceholderText = "..."
        textbox.Size = UDim2.new(0, 48, 0, 10)
        textbox.Text = ""
        textbox.BackgroundTransparency = 1
        textbox.Parent = Frame_18

        textbox.FocusLost:Connect(function()
            tbCallback(textbox.Text)
        end)
    end

    function WindowAPI:CreateSlider(sOptions)
        local sName = sOptions.Name or "Slider"
        local sMin = sOptions.Min or 0
        local sMax = sOptions.Max or 100
        local sDefault = sOptions.Default or sMin
        local sCallback = sOptions.Callback or function() end

        local HitFrameSlider = Instance.new("Frame")
        HitFrameSlider.BorderSizePixel = 0
        HitFrameSlider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        HitFrameSlider.Size = UDim2.new(0, 138, 0, 34)
        HitFrameSlider.Name = "HitFrame(slider)"
        HitFrameSlider.BackgroundTransparency = 1
        HitFrameSlider.Parent = ScrollingFrame

        local TextLabel = Instance.new("TextLabel")
        TextLabel.BorderSizePixel = 0
        TextLabel.TextXAlignment = Enum.TextXAlignment.Left
        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.Size = UDim2.new(0, 64, 0, 0)
        TextLabel.Text = sName
        TextLabel.Position = UDim2.new(0, 4, 0, 16)
        TextLabel.BackgroundTransparency = 1
        TextLabel.Parent = HitFrameSlider

        local Frame_1d = Instance.new("Frame")
        Frame_1d.BorderSizePixel = 0
        Frame_1d.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Frame_1d.Size = UDim2.new(0, 48, 0, 10)
        Frame_1d.Position = UDim2.new(0, 84, 0, 12)
        Frame_1d.Parent = HitFrameSlider
        Instance.new("UICorner", Frame_1d)

        local Frame_1f = Instance.new("Frame") -- Knob do slider
        Frame_1f.BorderSizePixel = 0
        Frame_1f.BackgroundColor3 = Color3.fromRGB(119, 119, 119)
        Frame_1f.Size = UDim2.new(0, 6, 0, 18)
        Frame_1f.Position = UDim2.new(0, -2, 0, -4)
        Frame_1f.Parent = Frame_1d
        Instance.new("UICorner", Frame_1f)

        local ValueLabel = Instance.new("TextLabel")
        ValueLabel.TextWrapped = true
        ValueLabel.BorderSizePixel = 0
        ValueLabel.TextSize = 5 -- Literal do código gerado
        ValueLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ValueLabel.TextColor3 = Color3.fromRGB(88, 190, 255)
        ValueLabel.Size = UDim2.new(0, 48, 0, 0)
        ValueLabel.Text = tostring(sDefault)
        ValueLabel.Position = UDim2.new(0, 0, 0, 4)
        ValueLabel.BackgroundTransparency = 1
        ValueLabel.Parent = Frame_1d

        local dragging = false

        local function updateSlider(input)
            local percent = math.clamp((input.Position.X - Frame_1d.AbsolutePosition.X) / Frame_1d.AbsoluteSize.X, 0, 1)
            local value = math.floor(sMin + (sMax - sMin) * percent)
            ValueLabel.Text = tostring(value)
            
            -- Calculando posição do Knob (-2 inicial até 42)
            TweenService:Create(Frame_1f, TweenInfo.new(0.05), {Position = UDim2.new(0, -2 + (percent * 44), 0, -4)}):Play()
            sCallback(value)
        end

        Frame_1d.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                updateSlider(input)
            end
        end)

        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = false
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                updateSlider(input)
            end
        end)

        -- set initial
        local initialPercent = (sDefault - sMin) / (sMax - sMin)
        Frame_1f.Position = UDim2.new(0, -2 + (initialPercent * 44), 0, -4)
    end

    function WindowAPI:CreateDropdown(dOptions)
        local dName = dOptions.Name or "Dropdown"
        local dItems = dOptions.Items or {}
        local dCallback = dOptions.Callback or function() end

        local HitFrameDropdown = Instance.new("Frame")
        HitFrameDropdown.BorderSizePixel = 0
        HitFrameDropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        HitFrameDropdown.Size = UDim2.new(0, 138, 0, 34)
        HitFrameDropdown.Name = "HitFrame(dropdown)"
        HitFrameDropdown.BackgroundTransparency = 1
        HitFrameDropdown.Parent = ScrollingFrame

        local TextLabel = Instance.new("TextLabel")
        TextLabel.BorderSizePixel = 0
        TextLabel.TextXAlignment = Enum.TextXAlignment.Left
        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.Size = UDim2.new(0, 64, 0, 0)
        TextLabel.Text = dName
        TextLabel.Position = UDim2.new(0, 4, 0, 16)
        TextLabel.BackgroundTransparency = 1
        TextLabel.Parent = HitFrameDropdown

        local Frame_24 = Instance.new("Frame")
        Frame_24.BorderSizePixel = 0
        Frame_24.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Frame_24.Size = UDim2.new(0, 10, 0, 10)
        Frame_24.Position = UDim2.new(0, 118, 0, 12)
        Frame_24.BackgroundTransparency = 1
        Frame_24.Parent = HitFrameDropdown

        local ClickDetector = Instance.new("ImageButton")
        ClickDetector.ZIndex = 2
        ClickDetector.BorderSizePixel = 0
        ClickDetector.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ClickDetector.Image = "rbxassetid://75236819313507"
        ClickDetector.Size = UDim2.new(0, 14, 0, 14)
        ClickDetector.BackgroundTransparency = 1
        ClickDetector.Name = "ClickDetector"
        ClickDetector.Position = UDim2.new(0, -4, 0, -2)
        ClickDetector.Parent = Frame_24

        local Frame_26 = Instance.new("Frame")
        Frame_26.Visible = false
        Frame_26.ZIndex = 3
        Frame_26.BorderSizePixel = 0
        Frame_26.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
        Frame_26.Size = UDim2.new(0, 70, 0, 82)
        Frame_26.Position = UDim2.new(0, 64, 0, 12)
        Frame_26.BackgroundTransparency = 0.4
        Frame_26.Parent = HitFrameDropdown
        Instance.new("UICorner", Frame_26)

        local DropdownScroll = Instance.new("ScrollingFrame")
        DropdownScroll.BorderSizePixel = 0
        DropdownScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        DropdownScroll.Size = UDim2.new(0, 72, 0, 82)
        DropdownScroll.ScrollBarThickness = 0
        DropdownScroll.BackgroundTransparency = 1
        DropdownScroll.Parent = Frame_26

        local DListLayout = Instance.new("UIListLayout")
        DListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        DListLayout.Padding = UDim.new(0, 5)
        DListLayout.Parent = DropdownScroll

        local isOpen = false
        ClickDetector.MouseButton1Click:Connect(function()
            isOpen = not isOpen
            Frame_26.Visible = isOpen
        end)

        local uiItems = {}

        for _, itemStr in pairs(dItems) do
            local ItemFrame = Instance.new("TextButton")
            ItemFrame.BorderSizePixel = 0
            ItemFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ItemFrame.Size = UDim2.new(0, 70, 0, 10)
            ItemFrame.Name = "item"
            ItemFrame.BackgroundTransparency = 1
            ItemFrame.Text = ""
            ItemFrame.Parent = DropdownScroll

            local ItemLabel = Instance.new("TextLabel")
            ItemLabel.BorderSizePixel = 0
            ItemLabel.TextXAlignment = Enum.TextXAlignment.Left
            ItemLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ItemLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            ItemLabel.Size = UDim2.new(0, 64, 0, 0)
            ItemLabel.Text = itemStr
            ItemLabel.Position = UDim2.new(0, 4, 0, 8)
            ItemLabel.BackgroundTransparency = 1
            ItemLabel.Parent = ItemFrame

            table.insert(uiItems, ItemLabel)

            ItemFrame.MouseButton1Click:Connect(function()
                for _, lbl in pairs(uiItems) do
                    lbl.TextColor3 = Color3.fromRGB(255, 255, 255) -- Unselected
                end
                ItemLabel.TextColor3 = Color3.fromRGB(72, 192, 255) -- Selected color
                isOpen = false
                Frame_26.Visible = false
                TextLabel.Text = dName .. " (" .. itemStr .. ")"
                dCallback(itemStr)
            end)
        end
    end

    function WindowAPI:CreateKeybind(kOptions)
        local kName = kOptions.Name or "KeyBind"
        local kDefault = kOptions.Default or Enum.KeyCode.Z
        local kCallback = kOptions.Callback or function() end

        local HitFrameKeyBind = Instance.new("Frame")
        HitFrameKeyBind.BorderSizePixel = 0
        HitFrameKeyBind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        HitFrameKeyBind.Size = UDim2.new(0, 138, 0, 34)
        HitFrameKeyBind.Name = "HitFrame(KeyBind)"
        HitFrameKeyBind.BackgroundTransparency = 1
        HitFrameKeyBind.Parent = ScrollingFrame

        local TextLabel = Instance.new("TextLabel")
        TextLabel.BorderSizePixel = 0
        TextLabel.TextXAlignment = Enum.TextXAlignment.Left
        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.Size = UDim2.new(0, 64, 0, 0)
        TextLabel.Text = kName
        TextLabel.Position = UDim2.new(0, 4, 0, 16)
        TextLabel.BackgroundTransparency = 1
        TextLabel.Parent = HitFrameKeyBind

        local Frame_30 = Instance.new("Frame")
        Frame_30.BorderSizePixel = 0
        Frame_30.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Frame_30.Size = UDim2.new(0, 10, 0, 10)
        Frame_30.Position = UDim2.new(0, 118, 0, 12)
        Frame_30.BackgroundTransparency = 1
        Frame_30.Parent = HitFrameKeyBind

        local ClickDetector = Instance.new("ImageButton")
        ClickDetector.ZIndex = 2
        ClickDetector.BorderSizePixel = 0
        ClickDetector.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ClickDetector.Image = "rbxassetid://13045815791"
        ClickDetector.Size = UDim2.new(0, 18, 0, 18)
        ClickDetector.BackgroundTransparency = 1
        ClickDetector.Name = "ClickDetector"
        ClickDetector.Position = UDim2.new(0, -6, 0, -4)
        ClickDetector.Parent = Frame_30

        local Key = Instance.new("TextLabel")
        Key.ZIndex = 3
        Key.BorderSizePixel = 0
        Key.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Key.Size = UDim2.new(0, 2, 0, 0)
        Key.Text = string.lower(kDefault.Name)
        Key.Name = "Key"
        Key.Position = UDim2.new(0, 0, 0, 4)
        Key.BackgroundTransparency = 1
        Key.Parent = Frame_30

        local currentKey = kDefault
        local listening = false

        ClickDetector.MouseButton1Click:Connect(function()
            listening = true
            Key.Text = "..."
        end)

        UserInputService.InputBegan:Connect(function(input, gpe)
            if listening and input.UserInputType == Enum.UserInputType.Keyboard then
                listening = false
                currentKey = input.KeyCode
                Key.Text = string.lower(currentKey.Name)
            elseif not listening and not gpe and input.KeyCode == currentKey then
                kCallback()
            end
        end)
    end

    -- Update ScrollingFrame CanvasSize based on items
    ScrollingFrame.ChildAdded:Connect(function()
        task.wait(0.1)
        ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)
    end)

    return WindowAPI
end

return UniquaLib

--[[
==========================================
EXEMPLO DE USO (Como rodar este script)
==========================================

-- Instancia a Lib
local Lib = UniquaLib

-- Cria a janela primária (Primeiro aparece o Captcha!)
local Window = Lib:CreateWindow({
    Title = "Meu Hub"
})

-- Criar um Toggle (botão de ligar e desligar)
local MeuToggle = Window:CreateToggle({
    Name = "Auto Farm",
    Default = false,
    Callback = function(Value)
        print("Auto Farm está:", Value)
    end
})

-- Alterando o toggle via Script
task.wait(5)
MeuToggle:Set(true) -- Liga o toggle sozinho após 5 segundos
Window:SetTitle("Novo Titulo Oculto") -- Muda o titulo via Script

-- Criar um Botão normal
Window:CreateButton({
    Name = "Matar Todos",
    Callback = function()
        print("Botão Clicado!")
    end
})

-- Criar uma Caixa de Texto
Window:CreateTextBox({
    Name = "Velocidade",
    Callback = function(Value)
        print("Velocidade alterada para:", Value)
    end
})

-- Criar um Slider
Window:CreateSlider({
    Name = "Aura Dist",
    Min = 0,
    Max = 100,
    Default = 50,
    Callback = function(Value)
        print("Slider no valor:", Value)
    end
})

-- Criar um Dropdown
Window:CreateDropdown({
    Name = "Armas",
    Items = {"Espada", "Pistola", "Faca"},
    Callback = function(Value)
        print("Arma selecionada:", Value)
    end
})

-- Criar um Keybind
Window:CreateKeybind({
    Name = "Voar",
    Default = Enum.KeyCode.Z,
    Callback = function()
        print("Tecla de voo ativada!")
    end
})

]]