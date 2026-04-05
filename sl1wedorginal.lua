-- 🛑 ANTI LOOP (NAJWAŻNIEJSZE)
if getgenv().SL1WED_LOADED then
    return
end
getgenv().SL1WED_LOADED = true

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local key = getgenv().script_key
if not key then
    LocalPlayer:Kick("Buy The Lua First To Use It :<")
    return
end

local rawKeys = game:HttpGet("https://raw.githubusercontent.com/sl1wedlua/keyslua/main/keys.lua")
local func = loadstring(rawKeys)

if not func then
    LocalPlayer:Kick("Error")
    return
end

local keys = func()
if not keys[key] then
    LocalPlayer:Kick("Buy The Lua First To Use It :<")
    return
end

print("KEY OK ✅")

local rawScript = game:HttpGet("https://raw.githubusercontent.com/sl1wedlua/fullsl1wedlua/main/sl1wed.lua")
local scriptFunc = loadstring(rawScript)

if scriptFunc then
    scriptFunc()
end
