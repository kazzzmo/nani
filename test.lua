
local URL = "https://raw.githubusercontent.com/kazzzmo/nani/main/RuBu_Kz_V5.lua"

local function notify(message)
    pcall(function()
        game:GetService("StarterGui"):SetCore(
            "SendNotification", {
                Title = "RuBu Kz Debug",
                Text = tostring(message):sub(1, 180),
                Duration = 10
            }
        )
    end)
    warn("[RuBu Debug]", message)
end

notify("1. Dang tai GitHub...")

local ok, source = pcall(function()
    return game:HttpGet(URL, true)
end)

if not ok then
    notify("LOI TAI: " .. tostring(source))
    return
end

notify("2. Da tai " .. #source .. " bytes")

local fn, compileError = loadstring(source)
if not fn then
    notify("LOI LUA: " .. tostring(compileError))
    return
end

notify("3. Dang chay script...")

local success, runtimeError = xpcall(
    fn,
    function(err)
        return tostring(err)
    end
)

if success then
    notify("4. Script da thuc thi")
else
    notify("LOI CHAY: " .. runtimeError)
end
