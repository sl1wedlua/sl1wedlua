-- 🛑 ANTI LOOP (NAJWAŻNIEJSZE)
if getgenv().SL1WED_LOADED then
    return
end
getgenv().SL1WED_LOADED = true

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- 🔑 KEY
local key = (getgenv and getgenv().script_key) or nil
if not key then
    LocalPlayer:Kick("Buy The Lua First To Use It :<")
    return
end

-- 📥 KEYS REPO
local successKeys, rawKeys = pcall(function()
    return game:HttpGet("https://raw.githubusercontent.com/sl1wedlua/keyslua/main/keys.lua")
end)

if not successKeys or not rawKeys then
    LocalPlayer:Kick("Key system error.")
    return
end

-- 🧠 LOAD KEYS
local func = loadstring(rawKeys)
if not func then
    LocalPlayer:Kick("Key load error.")
    return
end

local ok, keys = pcall(func)
if not ok or type(keys) ~= "table" then
    LocalPlayer:Kick("Invalid key data.")
    return
end

-- ✅ CHECK KEY
if not keys[key] then
    LocalPlayer:Kick("Buy The Lua First To Use It :<")
    return
end

print("KEY OK ✅")

-- 📥 SCRIPT REPO
local successScript, rawScript = pcall(function()
    return game:HttpGet("https://raw.githubusercontent.com/sl1wedlua/fullsl1wedlua/main/sl1wed.lua")
end)

if not successScript or not rawScript then
    LocalPlayer:Kick("Script load error.")
    return
end

-- 🚀 EXECUTE SCRIPT
local scriptFunc = loadstring(rawScript)
if not scriptFunc then
    LocalPlayer:Kick("Script compile error.")
    return
end

local ok2, err = pcall(scriptFunc)
if not ok2 then
    warn("Script runtime error:", err)
    LocalPlayer:Kick("Script error.")
end
