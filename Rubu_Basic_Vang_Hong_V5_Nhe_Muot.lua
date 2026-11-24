-- Rubu Basic | Optimized bilingual overlay for Delta (Luau)
-- Text events instead of repeated full-tree scanning.
local SOURCE='https://raw.githubusercontent.com/bloxfruitsnokey/Fluent/refs/heads/main/Basic/v4.luau'
local ICON='rbxassetid://115355067968005'
local Players=game:GetService('Players')
local CoreGui=game:GetService('CoreGui')
local UIS=game:GetService('UserInputService')
local player=Players.LocalPlayer
local parent=(gethui and gethui()) or CoreGui
local old=parent:FindFirstChild('BasicHub_Bilingual_Control')
if old then old:Destroy() end
local dict = {
['Info And Status']='Thông Tin Và Trạng Thái',['Farming']='Cày Cuốc',['Setting']='Cài Đặt',['Fishing']='Câu Cá',['Quest And Item']='Nhiệm Vụ Và Vật Phẩm',['Halloween Event']='Sự Kiện Halloween',['Sea Event']='Sự Kiện Biển',['Mirage And Race']='Đảo Ảo Ảnh Và Tộc',['Volcano Event']='Sự Kiện Núi Lửa',['Stats And Esp']='Chỉ Số Và ESP',['Fruit And Raid']='Trái Ác Quỷ Và Raid',['Local Player']='Người Chơi',['Teleport']='Dịch Chuyển',['Shopping']='Cửa Hàng',['Server Webhook']='Webhook Máy Chủ',['Miscellaneous']='Khác',
['Fighting Style']='Võ Thuật',['Auto Superhuman']='Tự Động Lấy Superhuman',['Auto DeathStep']='Tự Động Lấy Death Step',['Auto Sharkman Karate']='Tự Động Lấy Karate Người Cá Mập',['Auto ElectricClaw']='Tự Động Lấy Electric Claw',['Auto DragonTalon']='Tự Động Lấy Dragon Talon',['Auto Godhuman']='Tự Động Lấy Godhuman',
['Sea Event Setting']='Cài Đặt Sự Kiện Biển',['Remove Lighting Effect']='Xóa Hiệu Ứng Ánh Sáng',['Ship Speed Modifier']='Chỉnh Tốc Độ Thuyền',['Ship Speed']='Tốc Độ Thuyền',['Auto Press W']='Tự Động Nhấn W',['No Clip Ship']='Thuyền Xuyên Vật Thể',['Select Boats']='Chọn Thuyền',['Buy Boats']='Mua Thuyền',['Select Sea Level']='Chọn Cấp Độ Biển',['Auto Sail Boat']='Tự Động Lái Thuyền',['Sea Event Entity']='Sinh Vật Biển',['Auto Shark']='Tự Động Đánh Cá Mập',['Auto Piranha']='Tự Động Đánh Cá Piranha',['Auto Terror Shark']='Tự Động Đánh Cá Mập Khủng Bố',['Auto Fish Crew Member']='Tự Động Đánh Thủy Thủ Cá',['Auto Haunted Crew Member']='Tự Động Đánh Thủy Thủ Ma',['Auto Attack Pirate Grand Brigade']='Tự Động Đánh Hạm Đội Hải Tặc',['Auto Attack Fish Boat']='Tự Động Đánh Thuyền Cá',
['Sea Event Crafting']='Chế Tạo Vật Phẩm Biển',['Craft SharkTooth']='Chế Tạo Răng Cá Mập',['Craft TerrorJaw']='Chế Tạo Hàm Cá Mập Khủng Bố',['Craft SharkAnchor']='Chế Tạo Mỏ Neo Cá Mập',['Craft LeviathanCrown']='Chế Tạo Vương Miện Leviathan',['Craft LeviathanShield']='Chế Tạo Khiên Leviathan',['Craft LeviathanBoat']='Chế Tạo Thuyền Leviathan',
['Kitsune Event']='Sự Kiện Kitsune',['Kitsune Island Status']='Trạng Thái Đảo Kitsune',['Auto Find Kitsune Island']='Tự Động Tìm Đảo Kitsune',['Auto Teleport to Activated Shrine']='Tự Động Đến Đền Đã Kích Hoạt',['Auto Collect Azure Ember']='Tự Động Nhặt Lửa Xanh',['Auto Trade Azure Ember']='Tự Động Đổi Lửa Xanh',['Trade Items Azure']='Đổi Vật Phẩm Lửa Xanh',['Talk to Kitsune Statue']='Nói Chuyện Với Tượng Kitsune',['Frozen Dimension']='Chiều Không Gian Băng',['Spy Status']='Trạng Thái Gián Điệp',['Buy Spy']='Mua Thông Tin Gián Điệp',['Auto Teleport Frozen Dimension']='Tự Động Đến Chiều Không Gian Băng',['Auto Drive To Hydra Island']='Tự Động Lái Đến Đảo Hydra',
['Mirage Island']='Đảo Ảo Ảnh',['Full Moon']='Trăng Tròn',['Auto Find Mirage Island']='Tự Động Tìm Đảo Ảo Ảnh',['Esp Mirage Island']='ESP Đảo Ảo Ảnh',['Auto Tween To Mirage Island']='Tự Động Bay Đến Đảo Ảo Ảnh',['Auto Collect Gear']='Tự Động Nhặt Bánh Răng',['Change Transparency can see']='Điều Chỉnh Độ Trong Suốt',['Auto Tween Advanced Fruit Dealer']='Tự Động Đến Người Bán Trái Cao Cấp',['Auto Collect Mirage Chest']='Tự Động Nhặt Rương Ảo Ảnh',['Talk With Stone']='Nói Chuyện Với Đá',['Auto Look At Moon']='Tự Động Nhìn Trăng',['Look Moon + Auto V3']='Nhìn Trăng + Tự Động V3',['Races V2 And V3']='Tộc V2 Và V3',['Auto Upgrade Mink']='Tự Động Nâng Tộc Thỏ',['Auto Upgrade Human']='Tự Động Nâng Tộc Người',['Auto Upgrade Angel']='Tự Động Nâng Tộc Thiên Thần',['Auto Upgrade FishMan']='Tự Động Nâng Tộc Người Cá',['Trial Race V4']='Thử Thách Tộc V4',['Race V4 Tier']='Cấp Tộc V4',['Auto Pull Lever']='Tự Động Kéo Cần Gạt',['Auto Train V4']='Tự Động Luyện V4',['Teleport to Temple of Time']='Dịch Chuyển Đến Đền Thời Gian',['Teleport to Ancient One']='Dịch Chuyển Đến Ancient One',['Teleport to Ancient Clock']='Dịch Chuyển Đến Đồng Hồ Cổ',['Auto Teleport to Race Doors']='Tự Động Đến Cửa Tộc',
['Dojo']='Võ Đường',['Teleport To Dragon Dojo']='Dịch Chuyển Đến Võ Đường Rồng',['Auto Dojo Trainer']='Tự Động Luyện Võ Đường',['Auto Dragon Hunter']='Tự Động Săn Rồng',['Draco Trial']='Thử Thách Draco',['Tween To Upgrade Droco Trial']='Bay Đến Nơi Nâng Cấp Draco',['Auto Droco V1']='Tự Động Draco V1',['Auto Droco V2']='Tự Động Draco V2',['Volcano Crafting']='Chế Tạo Núi Lửa',['Craft Dragonheart']='Chế Tạo Tim Rồng',['Craft Dragonstorm']='Chế Tạo Bão Rồng',['Craft Dino Hood']='Chế Tạo Mũ Khủng Long',['Craft T-Rex Skull']='Chế Tạo Sọ T-Rex',['Prehistoric Island']='Đảo Tiền Sử',['Prehistoric Island Status']='Trạng Thái Đảo Tiền Sử',['Craft Volcanic Magnet']='Chế Tạo Nam Châm Núi Lửa',['Auto Find Prehistoric Island']='Tự Động Tìm Đảo Tiền Sử',['Auto Start Prehistoric Event']='Tự Động Bắt Đầu Sự Kiện Tiền Sử',['Auto Patch Prehistoric Event']='Tự Động Sửa Sự Kiện Tiền Sử',['Kill Aura']='Hào Quang Tiêu Diệt',['Auto Collect Dino Bones']='Tự Động Nhặt Xương Khủng Long',['Auto Collect Dragon Eggs']='Tự Động Nhặt Trứng Rồng',
['Auto Random Fruit']='Tự Động Quay Trái',['Auto Drop Fruit']='Tự Động Thả Trái',['Auto Store Fruit']='Tự Động Cất Trái',['Auto Tween to Fruit']='Tự Động Bay Đến Trái',['Auto Collect Fruit']='Tự Động Nhặt Trái',['Select Fruit Shop']='Chọn Trái Trong Cửa Hàng',['Auto Buy Fruit Shop']='Tự Động Mua Trái',['Raid']='Đột Kích',['Select Chip']='Chọn Chip',['Auto Select Raid Chip']='Tự Động Chọn Chip Raid',['Get Fruit in Inventory Below 1M']='Lấy Trái Trong Kho Dưới 1M',['Buy Raid Chips Beli']='Mua Chip Raid Bằng Beli',['Buy Dungeon Chips Devil Fruit']='Mua Chip Dungeon Bằng Trái',['Auto Buy Chip Beli']='Tự Động Mua Chip Bằng Beli',['Law']='Law',['Buy Chip Law']='Mua Chip Law',['Start Law Raids']='Bắt Đầu Raid Law',['Auto Buy Chip Law']='Tự Động Mua Chip Law',['Auto Start Law']='Tự Động Bắt Đầu Law',['Auto Kill Law']='Tự Động Đánh Law',['Dungeon']='Hầm Ngục',['Auto Farm Dungeon']='Tự Động Cày Hầm Ngục',
['Combat']='Chiến Đấu',['Players on Server']='Người Chơi Trong Máy Chủ',['Aimbot Status']='Trạng Thái Aimbot',['Select Players']='Chọn Người Chơi',['Teleport To Select Players']='Dịch Chuyển Đến Người Đã Chọn',['Spectate Select Players']='Quan Sát Người Đã Chọn',['Sea']='Biển',['Travel Sea 1']='Đến Biển 1',['Travel Sea 2']='Đến Biển 2',['Travel Sea 3']='Đến Biển 3',['Island']='Đảo',['Select Island']='Chọn Đảo',['Teleport Island']='Dịch Chuyển Đến Đảo',['Portal']='Cổng Dịch Chuyển',
['Shop']='Cửa Hàng',['Weapon']='Vũ Khí',['Buy Buso']='Mua Haki Vũ Trang',['Buy Geppo']='Mua Nhảy Trên Không',['Buy Soru']='Mua Lướt Nhanh',['Buy Ken']='Mua Haki Quan Sát',['Buy Black Leg']='Mua Black Leg',['Buy Electro']='Mua Electro',['Buy DragonClaw']='Mua Dragon Claw',['Buy Superhuman']='Mua Superhuman',['Buy Death Step']='Mua Death Step',['Buy Sharkman Karate']='Mua Sharkman Karate',['Buy ElectricClaw']='Mua Electric Claw',['Buy DragonTalon']='Mua Dragon Talon',['Buy Tomoe Ring']='Mua Nhẫn Tomoe',['Buy Black Cape']='Mua Áo Choàng Đen',['Buy Swordsman Hat']='Mua Mũ Kiếm Sĩ',['Buy Bizarre Rifle']='Mua Súng Bizarre',['Buy Ghoul Mask']='Mua Mặt Nạ Ghoul',['Buy Cutlass']='Mua Kiếm Cutlass',['Buy Katana']='Mua Kiếm Katana',['Buy Iron Mace']='Mua Chùy Sắt',['Buy Duel Katana']='Mua Song Kiếm Katana',['Buy Triple Katana']='Mua Tam Kiếm Katana',['Buy Pipe']='Mua Ống Sắt',['Buy Dual-Headed Blade']='Mua Kiếm Hai Đầu',['Buy Bisento']='Mua Bisento',['Buy Slingshot']='Mua Ná',['Buy Musket']='Mua Súng Hỏa Mai',['Buy Dual Flintlock']='Mua Song Súng Flintlock',['Buy Flintlock']='Mua Súng Flintlock',['Buy Refined Flintlock']='Mua Súng Flintlock Cải Tiến',['Buy Cannon']='Mua Đại Bác',

['Basic Hub']='Rubu Basic',['Buy Cool Tank']='Mua Cool Tank',['Auto Sail Boat']='Tự Động Điều Khiển Thuyền',['Kitsune Island : False']='Đảo Kitsune: Chưa Xuất Hiện',['Mirage Island : False']='Đảo Ảo Ảnh: Chưa Xuất Hiện',['Frozen Dimension : False']='Chiều Không Gian Băng: Chưa Xuất Hiện',['Prehistoric Island : False']='Đảo Tiền Sử: Chưa Xuất Hiện',['Moon : 7 / 8']='Trăng: 7 / 8',['All Players : 8 / 12']='Tất Cả Người Chơi: 8 / 12',['Aimbot - Skills : False']='Ngắm Kỹ Năng: Tắt',['Spy Leviathan : 1']='Thông Tin Leviathan: 1',['Tiers - V4 : 6']='Cấp Độ V4: 6',['Guardian']='Thuyền Guardian',['Select Boats']='Chọn Loại Thuyền',['Select Sea Level']='Chọn Cấp Độ Nguy Hiểm Biển',['Select Fruit Shop']='Chọn Trái Trong Cửa Hàng',['Select Chip']='Chọn Loại Chip',['Select Island']='Chọn Đảo',['Select Players']='Chọn Người Chơi',['Auto Sharkman Karate']='Tự Động Lấy Võ Người Cá Mập',['Auto DeathStep']='Tự Động Lấy Death Step',['Auto ElectricClaw']='Tự Động Lấy Electric Claw',['Auto DragonTalon']='Tự Động Lấy Dragon Talon',['Buy Duel Katana']='Mua Song Katana',['Buy DragonClaw']='Mua Vuốt Rồng',['Buy Superhuman']='Mua Võ Siêu Nhân',['Buy Death Step']='Mua Bước Chân Tử Thần',['Buy Sharkman Karate']='Mua Karate Người Cá Mập',['Buy ElectricClaw']='Mua Vuốt Điện',['Buy DragonTalon']='Mua Vuốt Rồng',['Buy Bisento']='Mua Đao Bisento',['Buy Tomoe Ring']='Mua Nhẫn Tomoe',['Buy Ghoul Mask']='Mua Mặt Nạ Quỷ',['Buy Cool Tank']='Mua Cool Tank',

-- Additional translations from user screenshots (Farming / Settings)
['Auto Farm Level']='Tự Động Cày Cấp',
['Auto Farm Nearest']='Tự Động Đánh Quái Gần Nhất',
['Auto Factory Raid']='Tự Động Đánh Nhà Máy',
['Auto Pirate Raid']='Tự Động Đánh Hải Tặc',
['Auto Farm Ectoplasm']='Tự Động Cày Ectoplasm',
['Chest']='Rương',
['Auto Farm Chest']='Tự Động Nhặt Rương',
['Auto Chest Bypass']='Tự Động Nhặt Rương Bypass',
['Stop Farm for FOD & Chalice']='Dừng Cày Khi Có FOD & Chén Thánh',
['Berry']='Quả Berry',
['Auto Farm Berry']='Tự Động Thu Thập Berry',
['Auto Farm Berry + Hop']='Tự Động Thu Thập Berry Và Đổi Server',
['Farm Mob']='Cày Quái',
['Select Mob']='Chọn Quái',
['Auto Kill Mob']='Tự Động Đánh Quái',
['Farm Island']='Cày Theo Đảo',
['Auto Farm All Island']='Tự Động Cày Toàn Đảo',
['Elite Hunter']='Thợ Săn Elite',
['Auto Farm Elite']='Tự Động Săn Elite',
['Auto Farm Elite + Hop']='Tự Động Săn Elite Và Đổi Server',
['Rip Indra']='Rip Indra',
['Auto Attack Rip Indra']='Tự Động Đánh Rip Indra',
['Fast Attack']='Đánh Nhanh',
['Bring Mobs']='Gom Quái',
['Auto Hop Server with time']='Tự Động Đổi Server Theo Giờ',
['Hop Delay (Minutes)']='Thời Gian Đổi Server (Phút)',
['Auto Set Spawn Point']='Tự Động Đặt Điểm Hồi Sinh',
['Auto Turn on Buso']='Tự Động Bật Haki Vũ Trang',
['Auto Turn on Race V3']='Tự Động Bật Tộc V3',
['Auto Turn on Race V4']='Tự Động Bật Tộc V4',
['Auto Turn on Spin']='Tự Động Bật Xoay',
['Safe Mode']='Chế Độ An Toàn',
['Remove Hit VFX']='Tắt Hiệu Ứng Đòn Đánh',
['Remove Death & Respawn VFX']='Tắt Hiệu Ứng Chết Và Hồi Sinh',
['Status']='Trạng Thái',
['Killed']='Đã Hạ',
['All Players']='Tất Cả Người Chơi',
['Chọn Đảo']='Chọn Đảo',
}

local gui=Instance.new('ScreenGui')
gui.Name='BasicHub_Bilingual_Control';gui.ResetOnSpawn=false;gui.IgnoreGuiInset=true;gui.DisplayOrder=999999;gui.Parent=parent
local alive=true
local connections={}
local function connect(sig,fn) local c=sig:Connect(fn);table.insert(connections,c);return c end
connect(gui.Destroying,function() alive=false;for _,c in ipairs(connections) do if c.Connected then c:Disconnect() end end end)
local function make(class,props,p)
 local x=Instance.new(class)
 for k,v in pairs(props) do x[k]=v end
 x.Parent=p;return x
end
local function corner(x,r) local c=Instance.new('UICorner');c.CornerRadius=UDim.new(0,r);c.Parent=x end
local bar=make('Frame',{Name='LanguageBar',Size=UDim2.fromOffset(232,43),Position=UDim2.new(.5,-116,0,8),BackgroundColor3=Color3.fromRGB(87,45,69),BackgroundTransparency=.08,BorderSizePixel=0,Active=true},gui);corner(bar,12)
local title=make('TextLabel',{Size=UDim2.fromOffset(95,43),Position=UDim2.fromOffset(6,0),BackgroundTransparency=1,Text='🌐 Ngôn ngữ',TextColor3=Color3.new(1,1,1),TextSize=12,Font=Enum.Font.GothamBold},bar)
local vi=make('TextButton',{Size=UDim2.fromOffset(56,31),Position=UDim2.fromOffset(105,6),Text='VI',TextSize=15,Font=Enum.Font.GothamBold,TextColor3=Color3.new(1,1,1),BackgroundColor3=Color3.fromRGB(245,142,183),BorderSizePixel=0},bar);corner(vi,8)
local en=make('TextButton',{Size=UDim2.fromOffset(56,31),Position=UDim2.fromOffset(168,6),Text='EN',TextSize=15,Font=Enum.Font.GothamBold,TextColor3=Color3.new(1,1,1),BackgroundColor3=Color3.fromRGB(115,72,91),BorderSizePixel=0},bar);corner(en,8)
local float=make('ImageButton',{Name='ToggleHub',Size=UDim2.fromOffset(49,49),Position=UDim2.new(0,12,.48,0),Image=ICON,BackgroundColor3=Color3.fromRGB(255,191,105),BorderSizePixel=0,Active=true},gui);corner(float,13)
local lang='VI'
local originals=setmetatable({},{__mode='k'})
local watched=setmetatable({},{__mode='k'})
local hubScreens=setmetatable({},{__mode='k'})
local hidden=false
local function translate(s)
 if s=='Basic Hub' or s=='Rubu Basic' then return 'Rubu Basic' end
 local exact=dict[s];if exact then return exact end
 local lead,rest=s:match('^(.-)(%s*:%s*.+)$')
 if lead and dict[lead] then return dict[lead]..rest end
 local pre,num=s:match('^(.-)(%s*:%s*[%d%s/]+)$')
 if pre and dict[pre] then return dict[pre]..num end
 return s
end
local function isText(x) return x:IsA('TextLabel') or x:IsA('TextButton') or x:IsA('TextBox') end
local function apply(x)
 if not alive or not x.Parent or x:IsDescendantOf(gui) then return end
 local current=x.Text
 local original=originals[x]
 if not original then original=current;originals[x]=original end
 local translated=translate(original)
 if current~=original and current~=translated then
  -- Dynamic value from hub: keep its original English source.
  original=current;originals[x]=original;translated=translate(original)
 end
 local wanted=(original=='Basic Hub' or original=='Rubu Basic') and 'Rubu Basic' or (lang=='VI' and translated or original)
 if current~=wanted then x.Text=wanted end
 if original=='Basic Hub' or original=='Rubu Basic' then
  local p=x.Parent
  while p and not p:IsA('ScreenGui') do p=p.Parent end
  if p and p~=gui then hubScreens[p]=true;if hidden then p.Enabled=false end end
 end
end
local function watch(x)
 if not isText(x) or watched[x] or x:IsDescendantOf(gui) then return end
 watched[x]=true
 apply(x)
 connect(x:GetPropertyChangedSignal('Text'),function() if alive then apply(x) end end)
end
local roots={CoreGui,player:WaitForChild('PlayerGui')}
local function register(root)
 for _,x in ipairs(root:GetDescendants()) do watch(x) end
 connect(root.DescendantAdded,function(x)
  if isText(x) then watch(x) end
 end)
end
local function setLang(value)
 lang=value
 vi.BackgroundColor3=value=='VI' and Color3.fromRGB(245,142,183) or Color3.fromRGB(115,72,91)
 en.BackgroundColor3=value=='EN' and Color3.fromRGB(245,142,183) or Color3.fromRGB(115,72,91)
 for x in pairs(watched) do if x.Parent then apply(x) end end
end
connect(vi.MouseButton1Click,function() setLang('VI') end)
connect(en.MouseButton1Click,function() setLang('EN') end)
connect(float.MouseButton1Click,function()
 hidden=not hidden
 for screen in pairs(hubScreens) do if screen.Parent then screen.Enabled=not hidden end end
end)
local function drag(target,handle)
 local dragging=false;local start,origin,dragInput
 connect(handle.InputBegan,function(input)
  if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
   dragging=true;start=input.Position;origin=target.Position;dragInput=input
  end
 end)
 connect(handle.InputEnded,function(input) if input==dragInput then dragging=false end end)
 connect(UIS.InputChanged,function(input)
  if dragging and (input==dragInput or input.UserInputType==Enum.UserInputType.MouseMovement) then
   local d=input.Position-start
   target.Position=UDim2.new(origin.X.Scale,origin.X.Offset+d.X,origin.Y.Scale,origin.Y.Offset+d.Y)
  end
 end)
end
drag(bar,title);drag(float,float)
-- V5: low-load gold / rose theme; one delayed refresh, no color-change loops.
local themed=setmetatable({},{__mode='k'})
local function warm(c)
 local r,g,b=c.R,c.G,c.B
 -- Only replace cyan/teal backgrounds and accents; leave switches and game UI untouched.
 if g>r*1.10 and g>b*.78 and b>r*.95 then
  local brightness=math.max(r,g,b)
  if brightness>.53 then return Color3.fromRGB(249,151,187) end
  if brightness>.30 then return Color3.fromRGB(156,87,112) end
  return Color3.fromRGB(91,48,76)
 end
 return nil
end
local busy=setmetatable({},{__mode='k'})
local function themeOne(x)
 if themed[x] or not x.Parent then return end
 themed[x]=true
 local prop
 if x:IsA('Frame') or x:IsA('ScrollingFrame') or x:IsA('TextButton') or x:IsA('ImageButton') then
  prop='BackgroundColor3'
 elseif x:IsA('UIStroke') then
  prop='Color'
 elseif x:IsA('UIGradient') then
  prop='Color'
 end
 if not prop then return end
 local function repaint()
  if not alive or not x.Parent or busy[x] then return end
  local desired
  if x:IsA('UIGradient') then
   -- Preserve the hub's gradients but replace teal/cyan stops with warm shades.
   local keys={};local changed=false
   for _,kp in ipairs(x.Color.Keypoints) do
    local replacement=warm(kp.Value)
    if replacement then changed=true end
    table.insert(keys,ColorSequenceKeypoint.new(kp.Time,replacement or kp.Value))
   end
   if changed then desired=ColorSequence.new(keys) end
  else
   if prop=='BackgroundColor3' and x.BackgroundTransparency>=1 then return end
   desired=warm(x[prop])
   if prop=='Color' and desired then desired=Color3.fromRGB(255,197,115) end
  end
  if desired then
   busy[x]=true
   x[prop]=desired
   busy[x]=nil
  end
 end
 repaint()
 -- No per-element color listener: prevents expensive event storms on Delta.
end
local function themeScreen(screen)
 for _,x in ipairs(screen:GetDescendants()) do themeOne(x) end
 connect(screen.DescendantAdded,function(x)
  if alive and x.Parent then themeOne(x) end
 end)
end
local registered=setmetatable({},{__mode='k'})
local function findScreen(x)
 local p=x
 while p and not p:IsA('ScreenGui') do p=p.Parent end
 return p
end
local function detect(x)
 if not isText(x) or not x.Parent or x:IsDescendantOf(gui) then return end
 if x.Text~='Basic Hub' and x.Text~='Rubu Basic' then return end
 local screen=findScreen(x)
 if screen and screen~=gui and not registered[screen] then
  registered[screen]=true
  hubScreens[screen]=true
  register(screen)
  themeScreen(screen)
  task.delay(2,function()
   if alive and screen.Parent then
    for _,part in ipairs(screen:GetDescendants()) do
     themed[part]=nil
     themeOne(part)
    end
   end
  end)
 end
end
for _,root in ipairs(roots) do
 for _,x in ipairs(root:GetDescendants()) do detect(x) end
 connect(root.DescendantAdded,function(x)
  if isText(x) then task.defer(function() if alive then detect(x) end end) end
 end)
end
-- Avoid loading the hub twice when replacing an older translation overlay.
local existing=false
for _,screen in pairs(roots) do
 for _,x in ipairs(screen:GetDescendants()) do
  if isText(x) and (x.Text=='Basic Hub' or x.Text=='Rubu Basic') then existing=true;break end
 end
 if existing then break end
end
if not existing then
 task.spawn(function()
  local ok,err=pcall(function() loadstring(game:HttpGet(SOURCE))() end)
  if not ok then warn('[Rubu Basic] Hub loader error: '..tostring(err)) end
 end)
end
