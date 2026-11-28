-- Redz V5: lop dich giao dien, khong sua logic goc
local Players = game:GetService('Players')
local CoreGui = game:GetService('CoreGui')
local playerGui = Players.LocalPlayer:WaitForChild('PlayerGui')
local env = getgenv and getgenv() or _G
if env.RedzTranslationCleanup then env.RedzTranslationCleanup() end
local roots = {playerGui, CoreGui}
if gethui then local ok,h = pcall(gethui); if ok and h and h ~= CoreGui and h ~= playerGui then table.insert(roots,h) end end
local dict = {
['Info And Status']='Thông tin và trạng thái', ['Farming']='Cày cuốc', ['Setting']='Cài đặt', ['Fishing']='Câu cá', ['Quest And Item']='Nhiệm vụ và vật phẩm', ['Sea Event']='Sự kiện biển', ['Volcano Event']='Sự kiện núi lửa', ['Mirage And Race']='Đảo bí ẩn và tộc', ['Stats And Esp']='Chỉ số và ESP', ['Fruit And Raid']='Trái ác quỷ và Raid', ['Local Player']='Nhân vật', ['Teleport']='Dịch chuyển', ['Shopping']='Cửa hàng', ['Miscellaneous']='Khác', ['Dojo']='Võ đường', ['Droco Trial']='Thử thách Draco', ['Volcano Crafting']='Chế tạo núi lửa', ['Prehistoric Island']='Đảo tiền sử', ['Mirage Island']='Đảo bí ẩn', ['FullMoon Status']='Trạng thái trăng tròn', ['Races V2 And V3']='Tộc V2 và V3', ['Trial Race V4']='Thử thách tộc V4', ['Stats']='Chỉ số', ['Stats Value']='Số điểm cộng', ['Fruit']='Trái ác quỷ', ['Stock Fruit']='Trái đang bán', ['Advance Fruit Stock']='Kho trái nâng cao', ['Normal Fruit Stock']='Kho trái thường', ['Error while retrieving data.']='Lỗi khi lấy dữ liệu.', ['Raid']='Đột kích', ['Dungeon']='Hầm ngục', ['Combat']='Chiến đấu', ['Quest Player']='Nhiệm vụ người chơi', ['Local Player Setting']='Cài đặt nhân vật', ['Sea']='Biển', ['Island']='Đảo', ['Portal']='Cổng', ['Shop']='Cửa hàng', ['Fighting Style']='Võ thuật', ['Accessories']='Phụ kiện', ['Weapon']='Vũ khí', ['Fragment']='Mảnh vỡ', ['Server']='Máy chủ', ['GUI']='Giao diện', ['Boost FPS']='Tăng FPS', ['Other']='Khác', ['ChangeBusoStage']='Đổi cấp Haki vũ trang', ['Turn on Time']='Bật thời gian đã chọn', ['Turn on increase Boats']='Bật tăng tốc thuyền', ['Turn on Low CPU']='Giảm tải CPU', ['Turn on Fast Mode']='Bật chế độ nhanh', ['Turn on RTX Mode']='Bật chế độ RTX', ['Turn on Full Bright']='Bật sáng tối đa', ['Remove Sky Fog']='Xóa sương mù', ['Rain Fruits (Client)']='Mưa trái ác quỷ (hiển thị cục bộ)', ['Set Pirate Team']='Chọn phe hải tặc', ['Set Marine Team']='Chọn phe hải quân', ['Unlock All Portals']='Mở tất cả cổng', ['Select Haki States']='Chọn cấp Haki', ['Turn on Walk on Water']='Bật đi trên nước', ['Turn on Ice Walk']='Bật đi trên băng', ['Disable Leader Board GUI']='Ẩn bảng xếp hạng', ['Redeem All Codes']='Nhập tất cả code', ['Rejoin Server']='Vào lại máy chủ', ['Hop Server']='Đổi máy chủ', ['Hop to Lowest Players']='Đổi sang máy chủ ít người nhất', ['Hop to Lowest Pings Server']='Đổi sang máy chủ ping thấp nhất', ['Input Job Id']='Nhập Job ID', ['Copy Job ID']='Sao chép Job ID', ['Open Awakenings Expert']='Mở chuyên gia thức tỉnh', ['Open Title Selection']='Mở chọn danh hiệu', ['Dash No Cooldown']='Lướt không hồi chiêu', ['Enable Fly']='Bật bay', ['Speed Fly Mode']='Tốc độ bay', ['Ignore Same Teams']='Bỏ qua cùng phe', ['Accept Allies']='Chấp nhận đồng minh', ['Get Fruit In Inventory Below 1M']='Lấy trái dưới 1 triệu trong kho', ['Kill Aura']='Tự diệt quái xung quanh', ['Change Transparency can see']='Điều chỉnh độ trong suốt để dễ nhìn', ['Swap Drago Race']='Đổi tộc Draco', ['Look Moon + Auto V3']='Nhìn trăng và tự bật V3', ['Talk With Stone']='Nói chuyện với phiến đá', ['All Players On Server']='Tất cả người chơi trong máy chủ', ['Aimbot Status']='Trạng thái tự ngắm', ['Aimbot Method Skills']='Tự ngắm kỹ năng', ['Aimbot Camera Closet Players']='Tự ngắm người gần camera', ['Instance Energy [ INF ]']='Năng lượng vô hạn', ['Instance Soru [ INF ]']='Soru vô hạn', ['Instance Mink V3 [ INF ]']='Mink V3 vô hạn', ['Instance Observation Range [ INF ]']='Tầm quan sát vô hạn',
}
local phrases = {
{'Prehistoric Island','Đảo tiền sử'}, {'Mirage Island','Đảo bí ẩn'}, {'Dragon Eggs','trứng rồng'}, {'Dino Bones','xương khủng long'}, {'Volcanic Magnet','nam châm núi lửa'}, {'Volcano Event','sự kiện núi lửa'}, {'Dragon Dojo','võ đường rồng'}, {'Advanced Fruit Dealer','đại lý trái nâng cao'}, {'Highest Point','điểm cao nhất'}, {'Mirage Chest','rương đảo bí ẩn'}, {'Race Doors','cửa tộc'}, {'Temple of Time','đền thời gian'}, {'Ancient Clock','đồng hồ cổ'}, {'Ancient One','người cổ đại'}, {'Legendary Sword','kiếm huyền thoại'}, {'Haki Color','màu Haki'}, {'Sea Event Island','đảo sự kiện biển'}, {'Advanced Dealer','đại lý nâng cao'}, {'Player Quest','nhiệm vụ người chơi'}, {'Select Players','người chơi đã chọn'}, {'Blox Fruit','trái ác quỷ'}, {'Refund Stats','đặt lại chỉ số'}, {'Reroll Race','đổi tộc ngẫu nhiên'}, {'Safe Mode','chế độ an toàn'}, {'Next Island','đảo tiếp theo'}, {'Raid Chip','chip Raid'}, {'Microchip Law','chip Law'}, {'Tween To','di chuyển đến'}, {'Tween to','di chuyển đến'}, {'Teleport To','dịch chuyển đến'}, {'Teleport to','dịch chuyển đến'}, {'Auto','Tự động'}, {'Select','Chọn'}, {'Upgrade','nâng cấp'}, {'Collect','thu thập'}, {'Find','tìm'}, {'Start','bắt đầu'}, {'Complete','hoàn thành'}, {'Train','luyện'}, {'Craft','chế tạo'}, {'Buy','mua'}, {'Kill','tiêu diệt'}, {'Store','cất'}, {'Drop','thả'}, {'Random','quay ngẫu nhiên'}, {'Travel','đến'}, {'Teleport','dịch chuyển'}, {'Tween','di chuyển'}, {'Status','trạng thái'}, {'Esp','ESP'}, {'Player','người chơi'}, {'Chest','rương'}, {'Fruit','trái ác quỷ'}, {'Flower','hoa'}, {'Berry','quả mọng'}, {'Island','đảo'}, {'Melee','võ thuật'}, {'Swords','kiếm'}, {'Sword','kiếm'}, {'Gun','súng'}, {'Defense','phòng thủ'}, {'Gear','bánh răng'}, {'Pull Lever','kéo cần gạt'}, {'Look At Moon','nhìn trăng'}, {'Awakening','thức tỉnh'}, {'Enable','bật'}, {'Get','lấy'}, {'Reset','đặt lại'}, {'False','Không'}, {'True','Có'}, {'Moon','Trăng'}, {'Next Night','Đêm tiếp theo'}, {'Sea','Biển'}, {'Exit','lối thoát'}, {'Spectate','quan sát'}, {'Aim Method','cách ngắm'}, {'Time','thời gian'}, {'Open','mở'}, {'Farm','cày'}, {'Boss','boss'}, {'Mastery','thông thạo'}, {'Level','cấp độ'}, {'Attack','tấn công'}, {'Skill','kỹ năng'}, {'Skills','kỹ năng'}, {'Fast','nhanh'}, {'Speed','tốc độ'}, {'Boat','thuyền'}, {'Fishing','câu cá'}, {'Quest','nhiệm vụ'}, {'Material','nguyên liệu'}, {'Chest','rương'}, {'Hop','đổi máy chủ'}, {'Health','máu'}, {'Distance','khoảng cách'}, {'Weapon','vũ khí'}, {'Refresh','làm mới'}, {'Stop','dừng'}, {'Enable','bật'}, {'Disable','tắt'}, {'Patch','vá'}, {'After','sau'}, {'When','khi'}, {'All','tất cả'}, {'Method','phương thức'}, {'Human','người'}, {'Angel','thiên thần'}, {'FishMan','người cá'}, {'Black Leg','Hắc Cước'}, {'ElectricClaw','Vuốt Điện'}, {'DragonTalon','Long Trảo'}, {'Fishman Karate','Karate Người Cá'}, {'Buso','Haki vũ trang'}, {'Ken','Haki quan sát'}, {'Geppo','nhảy trên không'}, {'Soru','lướt nhanh'},
}
local function translate(s)
 if dict[s] then return dict[s] end
 local out=s
 for _,p in ipairs(phrases) do out=out:gsub('%f[%w]'..p[1]..'%f[%W]',p[2]) end
 return out
end
local active=true
local vietnamese=true
local tracked=setmetatable({}, {__mode='k'})
local connections={}
local targets={}
local function connect(signal,fn) local c=signal:Connect(fn); table.insert(connections,c); return c end
local function isText(o) return o:IsA('TextLabel') or o:IsA('TextButton') or o:IsA('TextBox') end
local function apply(o,r) if not active or not o.Parent then return end; local v=vietnamese and translate(r.original) or r.original; if o.Text~=v then r.writing=true; o.Text=v; r.writing=false end end
local function track(o)
 if not isText(o) or o:IsA('TextBox') or tracked[o] then return end
 local r={original=o.Text}; tracked[o]=r
 connect(o:GetPropertyChangedSignal('Text'),function() if not r.writing then r.original=o.Text; apply(o,r) end end)
 apply(o,r)
end
local function scan(root) for _,o in ipairs(root:GetDescendants()) do track(o) end end
local function identify(o)
 if not isText(o) then return end
 local s=o.Text:lower()
 if not s:find('redz hub',1,true) then return end
 local root=o:FindFirstAncestorWhichIsA('ScreenGui')
 if not root or targets[root] then return end
 targets[root]=true; scan(root); connect(root.DescendantAdded,track)
end
local gui=Instance.new('ScreenGui'); gui.Name='RedzLanguageSwitch'; gui.ResetOnSpawn=false; gui.DisplayOrder=10000
local ok=pcall(function() gui.Parent=roots[#roots] end); if not ok then gui.Parent=playerGui end
local bar=Instance.new('Frame',gui); bar.Size=UDim2.fromOffset(156,34); bar.Position=UDim2.new(.5,-78,0,-41); bar.BackgroundColor3=Color3.fromRGB(23,24,32); bar.BorderSizePixel=0
local corner=Instance.new('UICorner',bar); corner.CornerRadius=UDim.new(0,17)
local function button(s,x) local b=Instance.new('TextButton',bar); b.Size=UDim2.fromOffset(70,28); b.Position=UDim2.fromOffset(x,3); b.Text=s; b.TextSize=13; b.Font=Enum.Font.GothamBold; b.TextColor3=Color3.new(1,1,1); b.BorderSizePixel=0; Instance.new('UICorner',b).CornerRadius=UDim.new(0,14); return b end
local vi,en=button('VI • Việt',5),button('EN • Anh',81)
local function switch(v) vietnamese=v; vi.BackgroundColor3=v and Color3.fromRGB(85,88,220) or Color3.fromRGB(40,41,48); en.BackgroundColor3=not v and Color3.fromRGB(85,88,220) or Color3.fromRGB(40,41,48); for o,r in pairs(tracked) do apply(o,r) end end
connect(vi.Activated,function() switch(true) end); connect(en.Activated,function() switch(false) end); switch(true)
for _,root in ipairs(roots) do pcall(function() connect(root.DescendantAdded,function(o) if isText(o) then task.defer(function() if active and o.Parent then identify(o) end end) end end); for _,o in ipairs(root:GetDescendants()) do identify(o) end end) end
env.RedzTranslationCleanup=function() active=false; for _,c in ipairs(connections) do c:Disconnect() end; for o,r in pairs(tracked) do pcall(function() o.Text=r.original end) end; gui:Destroy() end
local success,err=pcall(function() loadstring(game:HttpGet('https://raw.githubusercontent.com/bloxfruitsnokey/Redz/refs/heads/main/Redz/v5.luau'))() end)
if not success then warn('Redz V5: '..tostring(err)) end
