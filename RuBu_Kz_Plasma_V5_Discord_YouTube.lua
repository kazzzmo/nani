-- RuBu Kz V4 | Vietnamese / English compact dynamic translator
-- Client-side UI text translation layer; does not modify the remote script.
local Players = game:GetService('Players')
local TweenService = game:GetService('TweenService')
local CoreGui = game:GetService('CoreGui')
local player = Players.LocalPlayer
local playerGui = player:WaitForChild('PlayerGui')
local originalURL = 'https://raw.githubusercontent.com/bloxfruitsnokey/Arcylic/refs/heads/main/Plasma/v3.luau'

local phrases = {
 ['Plasma Hub']='RuBu Kz',
 ['Status Server']='Trạng thái máy chủ',
 ['Main']='Chính',
 ['Halloween Event']='Sự kiện Halloween',
 ['Game Time']='Thời gian trong game',
 ['Mirage Island']='Đảo ảo ảnh',
 ['Kitsune Island']='Đảo Kitsune',
 ['Prehistoric Island']='Đảo tiền sử',
 ['Status:']='Trạng thái:',
 ['Hour (h)']='Giờ',
 ['Minute (m)']='Phút',
 ['Second (s)']='Giây',
 ['Search section or Func']='Tìm chức năng',
 ['Info And Status']='Thông tin và trạng thái',
 ['Scythe Hub Blox Fruits Script']='RuBu Kz Blox Fruits Script',
 ['Auto Turn on Race V3']='Tự động bật tộc V3',
 ['Auto Turn on Race V4']='Tự động bật tộc V4',
 ['Auto Turn on Spin xyz']='Tự động xoay XYZ',
 ['Safe Mode']='Chế độ an toàn',
 ['Remove Hit VFX']='Tắt hiệu ứng đòn đánh',
 ['Remove Death & Respawned VFX']='Tắt hiệu ứng chết và hồi sinh',
 ['Disable Notify']='Tắt thông báo',
 ['Anti AFK']='Chống AFK',
 ['Accessories']='Phụ kiện',
 ["Auto Usoap's Hat"]='Tự động lấy mũ Usopp',
 ['Auto Marine Coat']='Tự động lấy áo choàng Hải quân',
 ['Auto Swan Coat']='Tự động lấy áo choàng Swan',
 ['Auto Swan Glasses']='Tự động lấy kính Swan',
 ['Auto Lei Accessory']='Tự động lấy vòng hoa Lei',
 ['Gun']='Súng',
 ['Auto Serpent Bow']='Tự động lấy cung Serpent',
 ['Auto Cybrog']='Tự động mở tộc Cyborg',
 ['Auto Cyborg']='Tự động mở tộc Cyborg',
 ['Auto Darkbeard']='Tự động đánh Darkbeard',
 ['Auto Unlocked DonSwan']='Tự động mở khóa Don Swan',
 ['Auto Done Bartilo Quest']='Tự động hoàn thành nhiệm vụ Bartilo',
 ['Auto Done Citizen Quest']='Tự động hoàn thành nhiệm vụ Công dân',
 ['Auto Training Dummy']='Tự động đánh hình nộm',
 ['Haki Color']='Màu Haki',
 ['Buy Buso Colors']='Mua màu Haki Buso',
 ['Auto Rainbow Haki']='Tự động lấy Haki cầu vồng',
 ['Accept Rainbow Haki Quest']='Nhận nhiệm vụ Haki cầu vồng',
 ['Observation']='Haki quan sát',
 ['Auto Farm Observation']='Tự động luyện Haki quan sát',
 ['Auto Observation V2']='Tự động mở Haki quan sát V2',
 ['Fighting Style']='Võ thuật',
 ['Auto Superhuman']='Tự động lấy Superhuman',
 ['Auto DeathStep']='Tự động lấy Death Step',
 ['Auto Sharkman Karate']='Tự động lấy Sharkman Karate',
 ['Auto ElectricClaw']='Tự động lấy Electric Claw',
 ['Auto DragonTalon']='Tự động lấy Dragon Talon',
 ['Auto Godhuman']='Tự động lấy Godhuman',
 ['Auto SanguineArt']='Tự động lấy Sanguine Art',
 ['Auto Shark']='Tự động đánh cá mập',
 ['Auto Piranha']='Tự động đánh cá Piranha',
 ['Auto Terror Shark']='Tự động đánh Terror Shark',
 ['Auto Fish Crew Member']='Tự động đánh thủy thủ người cá',
 ['Auto Haunted Crew Member']='Tự động đánh thủy thủ ma',
 ['Auto Attack PirateGrandBrigade']='Tự động tấn công tàu hải tặc lớn',
 ['Auto Attack Fish Boat']='Tự động tấn công thuyền người cá',
 ['Auto Attack Sea Beast']='Tự động đánh Sea Beast',
 ['Auto Upgrade Mink']='Tự động nâng cấp tộc Thỏ',
 ['Auto Upgrade Human']='Tự động nâng cấp tộc Người',
 ['Auto Upgrade Angel']='Tự động nâng cấp tộc Thiên thần',
 ['Auto Upgrade FishMan']='Tự động nâng cấp tộc Người cá',
 ['Trial Race V4']='Thử thách tộc V4',
 ['Current Tier:']='Bậc hiện tại:',
 ['Auto Pull Lever']='Tự động kéo cần gạt',
 ['Auto Train V4']='Tự động luyện tộc V4',
 ['Tween To Upgrade Droco Trial']='Di chuyển đến nơi nâng cấp thử thách Draco',
 ['Tween To Upgrade Draco Trial']='Di chuyển đến nơi nâng cấp thử thách Draco',
 ['Auto Draco V1']='Tự động mở Draco V1',
 ['Auto Draco V2']='Tự động mở Draco V2',
 ['Auto Draco V3']='Tự động mở Draco V3',
 ['Auto Relic Draco Trial']='Tự động làm di vật thử thách Draco',
 ['Auto Train Draco V4']='Tự động luyện Draco V4',
 ['Tween to Draco Trials']='Di chuyển đến thử thách Draco',
 ['Swap Draco Race']='Đổi sang tộc Draco',
 ['Auto Random Fruit']='Tự động quay trái ác quỷ',
 ['Auto Drop Fruit']='Tự động thả trái',
 ['Auto Store Fruit']='Tự động cất trái',
 ['Auto Tween to Fruit']='Tự động di chuyển đến trái',
 ['Auto Collect Fruit']='Tự động nhặt trái',
 ['Select Fruit Shop:']='Chọn trái trong cửa hàng:',
 ['Auto Buy Fruit Shop']='Tự động mua trái trong cửa hàng',
 ['Raid']='Đột kích',
 ['Local Player']='Người chơi',
 ['Teleport']='Dịch chuyển',
 ['Shopping']='Mua sắm',
 ['All Players :']='Tất cả người chơi:',
 ['Aimbot - Skills :']='Ngắm tự động - kỹ năng:',
 ['Select Players:']='Chọn người chơi:',
 ['Teleport To Select Players']='Dịch chuyển đến người chơi đã chọn',
 ['Spectate Select Players']='Theo dõi người chơi đã chọn',
 ['Select Aim Method:']='Chọn cách ngắm:',
 ['Aim Player']='Ngắm người chơi',
 ['Aimbot Method Skills']='Ngắm tự động bằng kỹ năng',
 ['Aimbot Camera Closet Players']='Camera ngắm người chơi gần nhất',
 ['Quests Players']='Nhiệm vụ người chơi',
 ['Click']='Nhấn',
 ['False']='Tắt',
 ['True']='Bật',
 ['Search section or Function']='Tìm mục hoặc chức năng',
 ['Info And Status']='Thông tin và trạng thái', ['Farming']='Cày tự động',
 ['Setting']='Cài đặt', ['Fishing']='Câu cá', ['Quest And Item']='Nhiệm vụ và vật phẩm',
 ['Sea Event']='Sự kiện biển', ['Mirage And Race']='Đảo ảo ảnh và tộc',
 ['Volcano Event']='Sự kiện núi lửa', ['Stats And Esp']='Chỉ số và ESP',
 ['Fruit And Raid']='Trái ác quỷ và Raid', ['Game Time']='Thời gian chơi',
 ['Mirage Island']='Đảo ảo ảnh', ['Kitsune Island']='Đảo Kitsune',
 ['Prehistoric Island']='Đảo tiền sử', ['Select Weapon']='Chọn vũ khí',
 ['Auto Farm Level']='Tự động cày cấp', ['Auto Farm Nearest']='Tự động đánh quái gần nhất',
 ['Auto Factory Raid']='Tự động Raid nhà máy', ['Auto Pirate Raid']='Tự động Raid hải tặc',
 ['Auto Farm Ectoplasm']='Tự động cày Ectoplasm', ['Chest']='Rương',
 ['Auto Farm Chest']='Tự động nhặt rương', ['Auto Chest Bypass']='Tự động vượt giới hạn rương',
 ['Stop Farm for FOD & Chalice']='Dừng cày khi có FOD và Chalice',
 ['Berry']='Quả mọng', ['Auto Farm Berry']='Tự động nhặt Berry',
 ['Auto Farm Berry + Hop']='Tự động nhặt Berry + đổi máy chủ',
 ['Farm Mob']='Cày quái', ['Auto Farm Mob']='Tự động cày quái',
 ['Farm Island']='Cày theo đảo', ['Auto Farm Island']='Tự động cày theo đảo',
 ['Elite Hunter']='Thợ săn tinh anh', ['Auto Farm Elite Hunter']='Tự động săn Elite',
 ['Auto Farm Elite Hunter + Hop']='Tự động săn Elite + đổi máy chủ',
 ['Rip Indra']='Rip Indra', ['Auto Farm Rip Indra']='Tự động đánh Rip Indra',
 ['Auto Unlocked Haki']='Tự động mở khóa Haki', ['Cake Prince']='Hoàng tử Bánh',
 ['Auto Farm Cake Prince']='Tự động đánh Cake Prince',
 ['Accept Quests']='Nhận nhiệm vụ', ['Auto Summon Cake Prince']='Tự động triệu hồi Cake Prince',
 ['Auto Farm Dough King']='Tự động đánh Dough King',
 ['Auto Farm Dough King Fully']='Tự động đánh Dough King toàn diện',
 ['Auto Farm Dough King + Hop']='Tự động đánh Dough King + đổi máy chủ',
 ['Bone']='Xương', ['Auto Farm Bone']='Tự động cày xương',
 ['Auto Random Bones']='Tự động quay xương', ['Auto Soul Reaper']='Tự động đánh Soul Reaper',
 ['Auto Try Luck Gravestone']='Tự động thử vận may bia mộ',
 ['Auto Pray Gravestone']='Tự động cầu nguyện bia mộ',
 ['Tyrant of the Skies']='Bạo chúa bầu trời',
 ['Auto Farm Tyrant of the Skies']='Tự động đánh Bạo chúa bầu trời',
 ['Auto Summon Tyrant of the Skies']='Tự động triệu hồi Bạo chúa bầu trời',
 ['Farm Material']='Cày nguyên liệu', ['Auto Farm Materials']='Tự động cày nguyên liệu',
 ['Farm Boss']='Cày Boss', ['Auto Farm Boss']='Tự động đánh Boss',
 ['Auto Farm All Boss']='Tự động đánh tất cả Boss', ['Mastery']='Thông thạo',
 ['Health Percentage']='Phần trăm máu', ['Select Skill Mastery:']='Chọn kỹ năng thông thạo:',
 ['Auto Mastery Fruits']='Tự động tăng thông thạo trái',
 ['Auto Mastery Gun']='Tự động tăng thông thạo súng',
 ['Auto Mastery All Sword']='Tự động tăng thông thạo kiếm',
 ['Settings / Configure']='Cài đặt / Tùy chỉnh', ['Fast Attack']='Đánh nhanh',
 ['Bring Mobs']='Gom quái', ['Auto Hop Server with time']='Tự động đổi máy chủ theo giờ',
 ['Hop Delay (Minutes)']='Thời gian đổi máy chủ (phút)',
 ['Auto Set Spawn Point']='Tự động đặt điểm hồi sinh',
 ['Auto Turn on Buso']='Tự động bật Buso',
 ['Auto Haki Observation']='Tự động bật Haki quan sát',
 ['Search section or Func']='Tìm mục hoặc chức năng',
 ['Status:']='Trạng thái:', ['Killed :']='Đã hạ:',
 ['Destroyed Cannons :']='Pháo đã phá:', ['You Have:']='Bạn có:',
 ['Elite Spawn: Status:']='Elite xuất hiện: Trạng thái:',
 ['Select Weapon:']='Chọn vũ khí:', ['Select Mob:']='Chọn quái:',
 ['Select Island:']='Chọn đảo:', ['Select Material:']='Chọn nguyên liệu:',
 ['Select Boss:']='Chọn Boss:', ['Choose Location:']='Chọn địa điểm:',
 ['Hour (h)']='giờ', ['Minute (m)']='phút', ['Second (s)']='giây',
 ['Melee']='Võ thuật', ['Scrap Metal']='Sắt vụn', ['Floating Turtle']='Đảo Rùa Bay',
 ['Baking Staff']='Nhân viên làm bánh'
}

local language = 'VI'
local originals = setmetatable({}, {__mode='k'})
local owned = setmetatable({}, {__mode='k'})
local applying = false
local keys = {}
for k in pairs(phrases) do keys[#keys+1] = k end
table.sort(keys,function(a,b) return #a > #b end)
local function translate(s)
    if phrases[s] then return phrases[s] end
    local out = s
    -- Translate each original span once, avoiding replacements inside Vietnamese results.
    local pieces, i = {}, 1
    while i <= #out do
        local match
        for _,k in ipairs(keys) do
            if out:sub(i,i+#k-1) == k then
                local before = i==1 and '' or out:sub(i-1,i-1)
                local after = out:sub(i+#k,i+#k)
                local leftOk = before == '' or not before:match('[%w]')
                local rightOk = after == '' or not after:match('[%w]')
                if leftOk and rightOk then match=k;break end
            end
        end
        if match then
            pieces[#pieces+1]=phrases[match]
            i=i+#match
        else
            pieces[#pieces+1]=out:sub(i,i)
            i=i+1
        end
    end
    return table.concat(pieces)
end
local function isText(obj)
    return obj:IsA('TextLabel') or obj:IsA('TextButton') or obj:IsA('TextBox')
end
-- Only touch the Plasma interface identified by its original title.
local plasmaRoot = nil
local gui
local function discover(root)
    for _,obj in ipairs(root:GetDescendants()) do
        if isText(obj) and (obj.Text == 'Plasma Hub' or obj.Text == 'RuBu Kz') then
            local p=obj
            while p and not p:IsA('ScreenGui') do p=p.Parent end
            if p and p~=gui then plasmaRoot=p;return end
        end
    end
end
local function relevant(obj)
    return plasmaRoot and obj:IsDescendantOf(plasmaRoot)
end
local function update(obj)
    if not isText(obj) or owned[obj] or not relevant(obj) then return end
    if originals[obj]==nil then originals[obj]=obj.Text end
    local source=originals[obj]:gsub('Plasma Hub','RuBu Kz')
    local wanted=language=='VI' and translate(source) or source
    if obj.Text~=wanted then
        applying=true
        obj.Text=wanted
        applying=false
    end
end
local function scan(root)
    for _,obj in ipairs(root:GetDescendants()) do
        if isText(obj) then update(obj) end
    end
end

-- Compact floating Dynamic Island; drag using its title area.
local old = playerGui:FindFirstChild('RuBuPlasmaLanguageDynamic')
if old then old:Destroy() end
gui=Instance.new('ScreenGui')
gui.Name='RuBuPlasmaLanguageDynamic';gui.ResetOnSpawn=false;gui.IgnoreGuiInset=true
gui.DisplayOrder=9999;gui.Parent=playerGui
local bar=Instance.new('Frame')
bar.Name='DynamicIsland';bar.AnchorPoint=Vector2.new(.5,0)
bar.Position=UDim2.new(.5,0,0,9);bar.Size=UDim2.fromOffset(260,40)
bar.BackgroundColor3=Color3.fromRGB(17,19,25);bar.BackgroundTransparency=.06
bar.BorderSizePixel=0;bar.Parent=gui
Instance.new('UICorner',bar).CornerRadius=UDim.new(1,0)
local stroke=Instance.new('UIStroke',bar)
stroke.Color=Color3.fromRGB(185,112,255);stroke.Thickness=1.25;stroke.Transparency=.25
local grad=Instance.new('UIGradient',bar)
grad.Color=ColorSequence.new(Color3.fromRGB(38,27,58),Color3.fromRGB(18,13,32))
grad.Rotation=12
local shadow=Instance.new('Frame',bar)
shadow.Name='Accent';shadow.BackgroundColor3=Color3.fromRGB(177,98,255)
shadow.BackgroundTransparency=.2;shadow.Size=UDim2.fromOffset(3,19)
shadow.Position=UDim2.fromOffset(13,10);shadow.BorderSizePixel=0
Instance.new('UICorner',shadow).CornerRadius=UDim.new(1,0)
local title=Instance.new('TextLabel',bar)
title.BackgroundTransparency=1;title.Position=UDim2.fromOffset(23,0)
title.Size=UDim2.fromOffset(96,40);title.Font=Enum.Font.GothamBold
 title.Text='RuBu Kz';title.TextSize=12;title.TextColor3=Color3.fromRGB(238,215,255)
title.TextXAlignment=Enum.TextXAlignment.Left
local function makeButton(name,txt,x)
    local b=Instance.new('TextButton',bar)
    b.Name=name;b.Position=UDim2.fromOffset(x,5);b.Size=UDim2.fromOffset(61,30)
    b.BackgroundColor3=Color3.fromRGB(43,43,51);b.BorderSizePixel=0
    b.AutoButtonColor=false;b.Text=txt;b.Font=Enum.Font.GothamBold
    b.TextSize=12;b.TextColor3=Color3.fromRGB(234,232,230)
    Instance.new('UICorner',b).CornerRadius=UDim.new(1,0)
    owned[b]=true
    return b
end
owned[title]=true
local vi=makeButton('Vietnamese','VI',125)
local en=makeButton('English','EN',191)
local tweenInfo=TweenInfo.new(.2,Enum.EasingStyle.Quart,Enum.EasingDirection.Out)
local function switch(lang)
    if language ~= lang then language=lang end
    for obj in pairs(originals) do if obj.Parent then update(obj) end end
    TweenService:Create(vi,tweenInfo,{BackgroundColor3=lang=='VI' and Color3.fromRGB(128,64,207) or Color3.fromRGB(43,43,51)}):Play()
    TweenService:Create(en,tweenInfo,{BackgroundColor3=lang=='EN' and Color3.fromRGB(128,64,207) or Color3.fromRGB(43,43,51)}):Play()
    TweenService:Create(stroke,tweenInfo,{Color=lang=='VI' and Color3.fromRGB(192,126,255) or Color3.fromRGB(151,113,255)}):Play()
end
vi.MouseButton1Click:Connect(function() switch('VI') end)
en.MouseButton1Click:Connect(function() switch('EN') end)
-- Expandable social links: only appears after tapping the RuBu Kz title.
local socialPanel=Instance.new('Frame',bar)
socialPanel.Name='SocialLinks'
socialPanel.Position=UDim2.fromOffset(0,45)
socialPanel.Size=UDim2.fromOffset(260,0)
socialPanel.BackgroundColor3=Color3.fromRGB(23,15,39)
socialPanel.BackgroundTransparency=.04
socialPanel.BorderSizePixel=0
socialPanel.ClipsDescendants=true
socialPanel.Visible=false
Instance.new('UICorner',socialPanel).CornerRadius=UDim.new(0,16)
local socialStroke=Instance.new('UIStroke',socialPanel)
socialStroke.Color=Color3.fromRGB(165,92,240)
socialStroke.Transparency=.25
socialStroke.Thickness=1.2
local socialOpen=false
local socialTween=TweenInfo.new(.23,Enum.EasingStyle.Quart,Enum.EasingDirection.Out)
local function socialLink(label,url,y)
    local button=Instance.new('TextButton',socialPanel)
    button.Name=label
    button.Size=UDim2.fromOffset(240,34)
    button.Position=UDim2.fromOffset(10,y)
    button.BackgroundColor3=Color3.fromRGB(49,31,75)
    button.BorderSizePixel=0
    button.Text=label..'  ↗'
    button.TextColor3=Color3.fromRGB(245,231,255)
    button.Font=Enum.Font.GothamSemibold
    button.TextSize=12
    button.AutoButtonColor=false
    Instance.new('UICorner',button).CornerRadius=UDim.new(0,11)
    button.MouseButton1Click:Connect(function()
        local copied=false
        if typeof(setclipboard)=='function' then
            copied=pcall(setclipboard,url)
        elseif typeof(toclipboard)=='function' then
            copied=pcall(toclipboard,url)
        end
        button.Text=copied and '✓ Đã sao chép liên kết' or 'Không hỗ trợ sao chép'
        task.delay(1.6,function()
            if button.Parent then button.Text=label..'  ↗' end
        end)
    end)
end
socialLink('Join Discord','https://discord.gg/fw8hW9HnTy',9)
socialLink('Kênh YouTube','https://youtube.com/@rubutv_roblox?si=b2FMTvlKWrsgMxWQ',49)
local function setSocialOpen(open)
    socialOpen=open
    if open then socialPanel.Visible=true end
    local tw=TweenService:Create(socialPanel,socialTween,{Size=UDim2.fromOffset(260,92)})
    if not open then
        tw=TweenService:Create(socialPanel,socialTween,{Size=UDim2.fromOffset(260,0)})
    end
    tw:Play()
    if not open then
        tw.Completed:Connect(function()
            if not socialOpen and socialPanel.Parent then socialPanel.Visible=false end
        end)
    end
end
local titleButton=Instance.new('TextButton',bar)
titleButton.Name='OpenSocialLinks'
titleButton.Position=UDim2.fromOffset(20,0)
titleButton.Size=UDim2.fromOffset(102,40)
titleButton.BackgroundTransparency=1
titleButton.Text=''
titleButton.ZIndex=title.ZIndex+1
titleButton.MouseButton1Click:Connect(function()
    setSocialOpen(not socialOpen)
end)
local scale=Instance.new('UIScale',bar)
local function resize()
    local cam=workspace.CurrentCamera
    if cam then scale.Scale=math.clamp(cam.ViewportSize.X/360,.72,1) end
end
resize()
if workspace.CurrentCamera then workspace.CurrentCamera:GetPropertyChangedSignal('ViewportSize'):Connect(resize) end
local UIS=game:GetService('UserInputService')
local dragging,dragStart,startPos,dragInput=false,nil,nil,nil
titleButton.InputBegan:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
        dragging=true;dragStart=input.Position;startPos=bar.Position;dragInput=input
    end
end)
UIS.InputEnded:Connect(function(input)
    if input==dragInput then dragging=false;dragInput=nil end
end)
UIS.InputChanged:Connect(function(input)
    if dragging and dragStart and (input==dragInput or input.UserInputType==Enum.UserInputType.MouseMovement) then
        local delta=input.Position-dragStart
        bar.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+delta.X,startPos.Y.Scale,startPos.Y.Offset+delta.Y)
    end
end)


-- Event-driven UI adapter: no full-tree polling every second.
local purple = {
    dark=Color3.fromRGB(18,12,31),
    panel=Color3.fromRGB(29,19,46),
    card=Color3.fromRGB(39,25,57),
    accent=Color3.fromRGB(155,85,230),
    edge=Color3.fromRGB(107,62,155),
}
local observed=setmetatable({}, {__mode='k'})
local styled=setmetatable({}, {__mode='k'})
local rootConnections={}
local queue={}
local queued=setmetatable({}, {__mode='k'})
local busy=false
local function recolor(obj)
    if styled[obj] or not obj:IsDescendantOf(plasmaRoot) then return end
    styled[obj]=true
    if obj:IsA('UIStroke') then
        local c=obj.Color
        if c.G>c.R*1.12 and c.G>c.B*1.05 then obj.Color=purple.edge end
    elseif obj:IsA('Frame') or obj:IsA('ScrollingFrame') or obj:IsA('TextButton') then
        local c=obj.BackgroundColor3
        -- Target the original green surfaces only, preserving buttons and game HUD.
        if c.G>c.R*1.16 and c.G>c.B*1.08 and c.G>.07 then
            obj.BackgroundColor3=(obj:IsA('TextButton') and purple.card or purple.panel)
        end
        if obj:IsA('ScrollingFrame') then
            local sc=obj.ScrollBarImageColor3
            if sc.G>sc.R*1.12 and sc.G>sc.B then obj.ScrollBarImageColor3=purple.accent end
        end
    elseif obj:IsA('UIGradient') then
        -- Gradients are intentionally untouched to avoid overriding dynamic game effects.
    end
end
local function observe(obj)
    if not plasmaRoot or not obj:IsDescendantOf(plasmaRoot) then return end
    recolor(obj)
    if not isText(obj) or owned[obj] or observed[obj] then return end
    observed[obj]=true
    originals[obj]=obj.Text
    update(obj)
    obj:GetPropertyChangedSignal('Text'):Connect(function()
        if applying or not obj.Parent then return end
        local now=obj.Text
        local prev=originals[obj]
        local expected=translate((prev or ''):gsub('Plasma Hub','RuBu Kz'))
        if now==prev or now==expected or now==(prev or ''):gsub('Plasma Hub','RuBu Kz') then return end
        originals[obj]=now
        update(obj)
    end)
end
local function enqueue(obj)
    if queued[obj] then return end
    queued[obj]=true
    queue[#queue+1]=obj
    if busy then return end
    busy=true
    task.defer(function()
        while #queue>0 and gui.Parent do
            local count=math.min(#queue,60)
            for i=1,count do
                local item=table.remove(queue)
                queued[item]=nil
                if item and item.Parent then observe(item) end
            end
            if #queue>0 then task.wait() end
        end
        busy=false
    end)
end
local menuOpen = true
local function attach(root)
    if root and root:IsA("ScreenGui") then root.Enabled = menuOpen end
    if plasmaRoot==root then return end
    plasmaRoot=root
    for _,obj in ipairs(root:GetDescendants()) do observe(obj) end
    root.DescendantAdded:Connect(function(obj) observe(obj) end)
end
local function findRoot()
    if plasmaRoot and plasmaRoot.Parent then return true end
    plasmaRoot=nil
    discover(playerGui)
    if not plasmaRoot then pcall(function() discover(CoreGui) end) end
    if plasmaRoot then
        local found=plasmaRoot
        plasmaRoot=nil
        attach(found)
        return true
    end
    return false
end
-- Watch UI creation BEFORE running the remote loader to reduce initial green/title flash.
-- The source may create a whole ScreenGui in one operation, so process its existing
-- descendants immediately once the title becomes identifiable.
local function inspectCandidate(obj)
    if not obj or not obj.Parent or obj==gui or obj:IsDescendantOf(gui) then return end
    if isText(obj) and (obj.Text=='Plasma Hub' or obj.Text=='RuBu Kz') then
        local root=obj
        while root and not root:IsA('ScreenGui') do root=root.Parent end
        if root and root~=gui then
            if plasmaRoot~=root then attach(root) end
            observe(obj)
            -- Do not wait for the batched queue on the first frame.
            for _,child in ipairs(root:GetDescendants()) do
                observe(child)
            end
        end
    end
end
local preConnections={}
for _,parent in ipairs({playerGui,CoreGui}) do
    local okWatch,connection=pcall(function()
        return parent.DescendantAdded:Connect(function(obj)
            inspectCandidate(obj)
        end)
    end)
    if okWatch then preConnections[#preConnections+1]=connection end
end
-- Also cover a pre-existing Plasma GUI.
findRoot()
-- Floating corner toggle: independent of the Plasma menu so it stays visible.
local toggle = Instance.new('ImageButton')
toggle.Name = 'RuBuMenuToggle'
toggle.AnchorPoint = Vector2.new(1, 0)
toggle.Position = UDim2.new(1, -18, 0, 104)
toggle.Size = UDim2.fromOffset(48, 48)
toggle.BackgroundColor3 = Color3.fromRGB(28, 16, 46)
toggle.BackgroundTransparency = 0.08
toggle.BorderSizePixel = 0
toggle.Image = 'rbxassetid://115355067968005'
toggle.ScaleType = Enum.ScaleType.Fit
toggle.AutoButtonColor = false
toggle.ZIndex = 20
toggle.Parent = gui
Instance.new('UICorner', toggle).CornerRadius = UDim.new(0, 15)
local toggleStroke = Instance.new('UIStroke', toggle)
toggleStroke.Color = Color3.fromRGB(182, 105, 255)
toggleStroke.Thickness = 1.8
local toggleScale = Instance.new('UIScale', toggle)
local toggleBusy = false
local function setMenuOpen(nextOpen)
    menuOpen = nextOpen
    if not (plasmaRoot and plasmaRoot.Parent) then findRoot() end
    if plasmaRoot and plasmaRoot:IsA('ScreenGui') then
        plasmaRoot.Enabled = menuOpen
    end
    TweenService:Create(toggleStroke, TweenInfo.new(.17), {
        Color = menuOpen and Color3.fromRGB(182,105,255) or Color3.fromRGB(115,78,155)
    }):Play()
end
toggle.MouseButton1Click:Connect(function()
    if toggleBusy then return end
    toggleBusy = true
    TweenService:Create(toggleScale, TweenInfo.new(.09, Enum.EasingStyle.Quad), {Scale=.89}):Play()
    setMenuOpen(not menuOpen)
    task.delay(.1, function()
        if toggle.Parent then
            TweenService:Create(toggleScale, TweenInfo.new(.16, Enum.EasingStyle.Back), {Scale=1}):Play()
        end
        toggleBusy = false
    end)
end)
-- No continuous polling is used; menu toggles only on click.
-- Load the original functionality unchanged.
local ok,err=pcall(function() loadstring(game:HttpGet(originalURL))() end)
if not ok then warn('[RuBu Kz] Plasma loader error:',err) end
switch('VI')
if not findRoot() then
    task.spawn(function()
        for i=1,30 do
            if not gui.Parent or findRoot() then return end
            task.wait(.25)
        end
        warn('[RuBu Kz] Không tìm thấy Plasma Hub UI để đổi màu và dịch.')
    end)
end
