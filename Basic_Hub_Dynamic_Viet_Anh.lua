
-- Basic Hub | Viet Hoa Dynamic VN/EN | Delta
-- Chi thay doi Text cua giao dien, khong thay doi logic farm.
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local parentGui = (gethui and gethui()) or CoreGui
local URL = "https://raw.githubusercontent.com/bloxfruitsnokey/Fluent/refs/heads/main/Basic/v4.luau"

-- Chỉ chứa từ điển Việt hóa, KHÔNG chạy menu hoặc đổi màu.
-- Dùng trong mã Lua khác: local phrases = dofile(...) nếu môi trường hỗ trợ.
local phrases = {
 -- Drakthon-specific labels, retaining all previous translation entries
 -- ['Drakthon Hub']='RuBu Kz1', -- tắt đổi tên theo yêu cầu
 ['Core & Farming']='Cốt lõi & Cày cấp',
 ['Home']='Trang chủ',
 ['Auto Farm']='Tự động cày',
 ['Combat']='Chiến đấu',
 ['Stats & Player']='Chỉ số & Người chơi',
 ['Quests, Raids &']='Nhiệm vụ, Raid &',
 ['Search']='Tìm kiếm',
 ['Level, Mob & Boss Farming']='Cày cấp, quái & Boss',
 ['Auto Farm (Main Toggle)']='Bật/tắt tự động cày',
 ['Starts farming using the selected mode below']='Bắt đầu cày theo chế độ đã chọn bên dưới',
 ['Farm Mode']='Chế độ cày',
 ['Pick Level quests, a specific Mob/Boss, Nearest mob, or All Bosses']='Chọn nhiệm vụ cấp, quái/Boss, quái gần nhất hoặc tất cả Boss',
 ['Selected Mob']='Quái đã chọn',
 ['Choose which mob to farm in']='Chọn quái để cày tại',
 ['Level...']='Cấp độ...',
 ['Nearest Mob']='Quái gần nhất',
 ['All Bosses']='Tất cả Boss',
 ['Bosses']='Boss',
 ['Minimize']='Thu nhỏ',
 ['Maximize']='Phóng to',

 -- ['Drakthon Hub']='RuBu Kz1', -- tắt đổi tên theo yêu cầu
 ['Plasma Hub']='RuBu Kz1',
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
 ['Baking Staff']='Nhân viên làm bánh',
 ['Refresh Account & World Summary']='Làm mới thông tin tài khoản và thế giới',
 ['Updates Beli, Fragments, Bounty, Race, and Stats']='Cập nhật Beli, Mảnh vỡ, Danh vọng, Tộc và Chỉ số',
 ['Join Discord Server (RuBu Kz1)']='Tham gia Discord RuBu Kz1',
 ['Copies our official Discord server invite link']='Sao chép liên kết mời vào Discord',
 ['Armament Haki']='Haki vũ trang', ['Instinct (Ken)']='Haki quan sát',
 ['Free Points']='Điểm chưa cộng', ['Defense']='Phòng thủ',
 ['Demon Fruit']='Trái ác quỷ', ['Sword']='Kiếm', ['Level']='Cấp độ',
 ['Fragments']='Mảnh vỡ', ['Stats']='Chỉ số', ['Fruit']='Trái',
 ['OFF']='TẮT', ['ON']='BẬT',
 ['Main Toggle']='Công tắc chính', ['Select Farm Mode']='Chọn chế độ cày',
 ['Selected Boss']='Boss đã chọn', ['Auto Quest']='Tự động nhận nhiệm vụ',
 ['Select Weapon']='Chọn vũ khí', ['Server Status']='Trạng thái máy chủ',
 ['Auto Farm Level']='Tự động cày cấp', ['Farm Mode']='Chế độ cày',
 ['Quest']='Nhiệm vụ', ['Raids']='Đột kích', ['Player']='Người chơi',
 ['Auto Farm']='Tự động cày', ['Farm']='Cày',
 ['Mob']='Quái', ['Nearest']='Gần nhất',
 ['Settings']='Cài đặt', ['Information']='Thông tin',
 ['Select']='Chọn', ['Refresh']='Làm mới',
 ['World Summary']='Tổng quan thế giới',
 ['All Boss & Targeted Drops']='Tất cả Boss & Vật phẩm mục tiêu',
 ['Auto Hunt All Spawned Boss']='Tự động săn tất cả Boss xuất hiện',
 ['Automatically fights every alive boss in the server one by one']='Tự động đánh lần lượt từng Boss còn sống trong máy chủ',
 ['Boss & Gear']='Boss & Trang bị',
 ['Quests & Puzzles']='Nhiệm vụ & Giải đố',
 ['Race & Mirage']='Chủng tộc & Đảo ảo ảnh',
 ['Race V2, V3 & V4 Temple of Time']='Tộc V2, V3 & V4 - Đền Thời Gian',
 ['Current Race Status']='Trạng thái chủng tộc hiện tại',
 ['Moon & Active Sea Islands']='Mặt trăng & các đảo đang xuất hiện',
 ['Live Sea Telemetry']='Thông tin biển trực tiếp',
 ['Boat Type']='Loại thuyền',
 ['Boat to buy automatically when you don\'t have one']='Thuyền tự mua khi bạn chưa có',
 ['Pick Danger Zone 1-6 or Infinite']='Chọn vùng nguy hiểm 1-6 hoặc vô hạn',
 ['Sea & Levi']='Biển & Leviathan',
 ['Fishing & Berries']='Câu cá & Quả mọng',
 ['Refresh Race & Moon Status']='Làm mới trạng thái tộc & mặt trăng',
 ['Updates Race tier, Moon phase & special islands']='Cập nhật cấp tộc, pha trăng và đảo đặc biệt',
 ['Target Sea Danger Level']='Cấp độ nguy hiểm trên biển',
 ['Select Boss / Drop']='Chọn Boss / Vật phẩm',
 ['Includes Sea 1, 2 & 3 bosses']='Bao gồm Boss Biển 1, 2 & 3',
 ['Status: Idle']='Trạng thái: Đang chờ',
 ['No Boat Spawned']='Chưa có thuyền',
 ['No Boat']='Không có thuyền',
 ['Night']='Đêm',
 ['Status']='Trạng thái',
 ['Time']='Thời gian',
 ['SeaBeasts']='Quái biển',
 ['Mirage']='Đảo ảo ảnh',
 ['Kitsune']='Kitsune',
 ['Prehistoric']='Tiền sử',
 ['Frozen']='Băng giá',
 ['Idle']='Đang chờ',
 ['no']='không'
}


-- V11 additional exact UI strings from screenshots
phrases[[=[All Boss & Targeted Drops]=]] = [=[Tất cả Boss & vật phẩm mục tiêu]=]
phrases[[=[Auto Hunt All Spawned Boss]=]] = [=[Tự động săn mọi Boss đã xuất hiện]=]
phrases[[=[Automatically fights every alive boss in the server one by one]=]] = [=[Tự động đánh lần lượt các Boss còn sống trong máy chủ]=]
phrases[[=[Boss & Gear]=]] = [=[Boss & Trang bị]=]
phrases[[=[Quests & Puzzles]=]] = [=[Nhiệm vụ & Giải đố]=]
phrases[[=[Race & Mirage]=]] = [=[Chủng tộc & Đảo ảo ảnh]=]
phrases[[=[Race V2, V3 & V4 Temple of Time]=]] = [=[Tộc V2, V3 & V4 – Đền Thời Gian]=]
phrases[[=[Current Race Status]=]] = [=[Trạng thái chủng tộc hiện tại]=]
phrases[[=[Moon & Active Sea Islands]=]] = [=[Mặt trăng & các đảo biển đang xuất hiện]=]
phrases[[=[Refresh Race & Moon Status]=]] = [=[Làm mới trạng thái tộc & mặt trăng]=]
phrases[[=[Updates Race tier, Moon phase & special islands]=]] = [=[Cập nhật cấp tộc, pha trăng & các đảo đặc biệt]=]
phrases[[=[Live Sea Telemetry]=]] = [=[Thông tin biển trực tiếp]=]
phrases[[=[Target Sea Danger Level]=]] = [=[Cấp độ nguy hiểm biển mục tiêu]=]
phrases[[=[Pick Danger Zone 1-6 or Infinite]=]] = [=[Chọn vùng nguy hiểm 1–6 hoặc Vô hạn]=]
phrases[[=[Boat Type]=]] = [=[Loại thuyền]=]
phrases[[=[Boat to buy automatically when you don't have one]=]] = [=[Thuyền tự mua khi bạn chưa có thuyền]=]
phrases[[=[Sea & Levi]=]] = [=[Biển & Leviathan]=]
phrases[[=[Fishing & Berries]=]] = [=[Câu cá & Quả mọng]=]
phrases[[=[Sea Travel & Submarine]=]] = [=[Di chuyển biển & Tàu ngầm]=]
phrases[[=[Submarine: Tiki Outpost → Submerged Island]=]] = [=[Tàu ngầm: Tiền đồn Tiki → Đảo chìm]=]
phrases[[=[Submarine: Submerged Island → Tiki Outpost]=]] = [=[Tàu ngầm: Đảo chìm → Tiền đồn Tiki]=]
phrases[[=[Flies to Submarine Worker & enters Submerged Island]=]] = [=[Bay đến nhân viên tàu ngầm và vào Đảo chìm]=]
phrases[[=[Flies to Submarine Exit & returns to Tiki Outpost]=]] = [=[Bay đến lối ra tàu ngầm và trở về Tiền đồn Tiki]=]
phrases[[=[Emergency Exit Submerged Island]=]] = [=[Thoát khẩn cấp khỏi Đảo chìm]=]
phrases[[=[Teleports & NPC]=]] = [=[Dịch chuyển & NPC]=]
phrases[[=[ESP & Visuals]=]] = [=[ESP & Hiển thị]=]
phrases[[=[Shop & Settings]=]] = [=[Cửa hàng & Cài đặt]=]
phrases[[=[Travel, Visual & Settings]=]] = [=[Di chuyển, Hiển thị & Cài đặt]=]
phrases[[=[Includes Sea 1, 2 & 3 bosses (Dark Dagger, Spikey Trident, Tushita, Tyrant, etc.)]=]] = [=[Bao gồm Boss Biển 1, 2 & 3 (Dark Dagger, Spikey Trident, Tushita, Tyrant, v.v.)]=]
phrases[[=[No Boat Spawned]=]] = [=[Chưa triệu hồi thuyền]=]
phrases[[=[Idle]=]] = [=[Đang chờ]=]




local extra = {
 ["Basic Hub"]="Basic Hub", ["Info And Status"]="Thông tin & Trạng thái",
 ["Farming"]="Cày cấp", ["Setting"]="Cài đặt", ["Fishing"]="Câu cá",
 ["Quest And Item"]="Nhiệm vụ & Vật phẩm", ["Sea Event"]="Sự kiện biển",
 ["Mirage And Race"]="Đảo ảo ảnh & Tộc", ["Status Server"]="Trạng thái máy chủ",
 ["Game Time"]="Thời gian trong game", ["Halloween Event"]="Sự kiện Halloween",
 ["Status:"]="Trạng thái:", ["Status"]="Trạng thái", ["Search"]="Tìm kiếm",
 ["Minimize"]="Thu nhỏ", ["Maximize"]="Phóng to",
}
for k,v in pairs(extra) do phrases[k]=v end

local previous = parentGui:FindFirstChild("BasicHub_LanguageDynamic") or playerGui:FindFirstChild("BasicHub_LanguageDynamic")
if previous then previous:Destroy() end
local oldState = (getgenv and getgenv().BasicHubLanguageState)
if oldState and oldState.stop then pcall(oldState.stop) end
local state = {lang="vi", running=true, root=nil, hidden=false, connections={}, original=setmetatable({}, {__mode="k"}), writing=setmetatable({}, {__mode="k"})}
if getgenv then getgenv().BasicHubLanguageState=state end

local function translate(s)
 if type(s)~="string" then return s end
 if phrases[s] then return phrases[s] end
 local a,b,c=s:match("^(%s*)(.-)(%s*)$")
 if phrases[b] then return a..phrases[b]..c end
 -- Translate text segments while preserving live counters, time and status values.
 local result=s
 for _,key in ipairs({"Hour (h)","Minute (m)","Second (s)","Status:","Game Time"}) do
  if phrases[key] then result=result:gsub(key:gsub("([^%w])","%%%1"),function() return phrases[key] end) end
 end
 return result
end
local function track(conn) table.insert(state.connections,conn) end
local function isText(obj)
 return obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox")
end
local function update(obj)
 if not state.running or not obj or not obj.Parent or not isText(obj) then return end
 local original=state.original[obj]
 if original==nil then original=obj.Text; state.original[obj]=original end
 local target=state.lang=="vi" and translate(original) or original
 if obj.Text~=target then
  state.writing[obj]=true
  pcall(function() obj.Text=target end)
  state.writing[obj]=nil
 end
end
local function register(obj)
 if not isText(obj) or state.original[obj]~=nil then return end
 state.original[obj]=obj.Text
 track(obj:GetPropertyChangedSignal("Text"):Connect(function()
  if not state.running or state.writing[obj] then return end
  local current=obj.Text
  local original=state.original[obj]
  if current==translate(original) or current==original then return end
  state.original[obj]=current
  update(obj)
 end))
 update(obj)
end
local function attach(root)
 if state.root==root then return end
 state.root=root
 for _,obj in ipairs(root:GetDescendants()) do register(obj) end
 track(root.DescendantAdded:Connect(function(obj)
  task.defer(function() if state.running and state.root==root then register(obj) end end)
 end))
end
local function findRoot()
 for _,container in ipairs({parentGui,CoreGui,playerGui}) do
  local ok,items=pcall(function() return container:GetDescendants() end)
  if ok then
   for _,obj in ipairs(items) do
    if isText(obj) and (obj.Text=="Basic Hub" or obj.Text=="Info And Status" or obj.Text=="Thông tin & Trạng thái") then
     local gui=obj:FindFirstAncestorWhichIsA("ScreenGui")
     if gui and gui.Name~="BasicHub_LanguageDynamic" then return gui end
    end
   end
  end
 end
 return nil
end

local ui=Instance.new("ScreenGui")
ui.Name="BasicHub_LanguageDynamic"
ui.ResetOnSpawn=false
ui.IgnoreGuiInset=true
ui.DisplayOrder=999999
pcall(function() ui.Parent=parentGui end)
if not ui.Parent then ui.Parent=playerGui end
local function corner(o,r)
 local c=Instance.new("UICorner");c.CornerRadius=UDim.new(0,r);c.Parent=o
end
local function stroke(o,col,trans)
 local s=Instance.new("UIStroke");s.Color=col;s.Transparency=trans;s.Thickness=1;s.Parent=o
end
local function button(parent,name,text,width)
 local b=Instance.new("TextButton")
 b.Name=name;b.Size=UDim2.fromOffset(width,34);b.BackgroundColor3=Color3.fromRGB(39,62,69)
 b.Text=text;b.TextColor3=Color3.fromRGB(235,250,250)
 b.Font=Enum.Font.GothamSemibold;b.TextSize=12;b.AutoButtonColor=true;b.Parent=parent
 corner(b,11);return b
end
local bar=Instance.new("Frame")
bar.Name="DynamicLanguageBar";bar.AnchorPoint=Vector2.new(.5,0)
bar.Position=UDim2.new(.5,0,0,8);bar.Size=UDim2.fromOffset(325,48)
bar.BackgroundColor3=Color3.fromRGB(19,35,43);bar.BackgroundTransparency=.06
bar.Parent=ui;corner(bar,16);stroke(bar,Color3.fromRGB(83,174,174),.4)
local layout=Instance.new("UIListLayout")
layout.FillDirection=Enum.FillDirection.Horizontal;layout.VerticalAlignment=Enum.VerticalAlignment.Center
layout.HorizontalAlignment=Enum.HorizontalAlignment.Center;layout.Padding=UDim.new(0,7);layout.Parent=bar
local title=Instance.new("TextLabel")
title.BackgroundTransparency=1;title.Size=UDim2.fromOffset(75,34)
title.Text="DYNAMIC";title.Font=Enum.Font.GothamBold;title.TextSize=12
 title.TextColor3=Color3.fromRGB(119,225,218);title.Parent=bar
local vi=button(bar,"Vietnamese","VN",62)
local en=button(bar,"English","EN",62)
local hide=button(bar,"HideBar","Ẩn",62)
local launcher=Instance.new("ImageButton")
launcher.Name="ToggleMenu";launcher.Size=UDim2.fromOffset(49,49)
launcher.Position=UDim2.new(0,15,.5,-25)
launcher.BackgroundColor3=Color3.fromRGB(21,45,51)
launcher.Image="rbxassetid://115355067968005"
launcher.ScaleType=Enum.ScaleType.Fit;launcher.Parent=ui
corner(launcher,14);stroke(launcher,Color3.fromRGB(94,215,207),.15)
local function repaint()
 vi.BackgroundColor3=state.lang=="vi" and Color3.fromRGB(17,139,128) or Color3.fromRGB(39,62,69)
 en.BackgroundColor3=state.lang=="en" and Color3.fromRGB(17,139,128) or Color3.fromRGB(39,62,69)
end
local function setLanguage(lang)
 state.lang=lang
 for obj in pairs(state.original) do if obj.Parent then update(obj) end end
 repaint()
end
vi.MouseButton1Click:Connect(function() setLanguage("vi") end)
en.MouseButton1Click:Connect(function() setLanguage("en") end)
hide.MouseButton1Click:Connect(function() bar.Visible=false end)
local function toggleMenu()
 if not state.root or not state.root.Parent then state.root=findRoot() end
 if state.root then
  if state.root:IsA("ScreenGui") then state.root.Enabled=not state.root.Enabled
  elseif state.root:IsA("GuiObject") then state.root.Visible=not state.root.Visible end
 else
  bar.Visible=not bar.Visible
 end
end
launcher.MouseButton1Click:Connect(toggleMenu)
-- Long press launcher not needed: bar can be reopened by right-click on PC.
launcher.MouseButton2Click:Connect(function() bar.Visible=not bar.Visible end)
-- On mobile, double-tap the launcher to show the language bar.
local lastTap=0
launcher.Activated:Connect(function()
 local now=os.clock()
 if now-lastTap<.35 then bar.Visible=not bar.Visible end
 lastTap=now
end)
state.stop=function()
 state.running=false
 for _,c in ipairs(state.connections) do pcall(function() c:Disconnect() end) end
 if ui then ui:Destroy() end
end
repaint()

-- Load the original script once; errors will be visible in executor console.
task.spawn(function()
 local ok,err=pcall(function()
  loadstring(game:HttpGet(URL))()
 end)
 if not ok then warn("[Basic Hub Dynamic] Original script load failed: "..tostring(err)) end
end)
-- Discover the UI after it has been created; no fixed 3/4 loading dependency.
task.spawn(function()
 while state.running do
  if not state.root or not state.root.Parent then
   local root=findRoot()
   if root then attach(root) end
  end
  task.wait(1)
 end
end)
