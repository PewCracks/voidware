if game.PlaceId == 79546208627805 then
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Voidware - Cracked | 99 Nights In The Forest",
            Text = "Go In Game for Voidware to load :D [You are in lobby currently]",
            Duration = 10
        })
    end)
    return
end 

if isfunctionhooked(game.HttpGet) then
    restorefunction(game.HttpGet)
end;

local baseUrl = "https://raw.githubusercontent.com/PewCracks/voidware/refs/heads/main/";
local hosted = {
    "VWUpdateLog.lua",
    "Helper.lua",
    "Languages.json",
    "NightsInTheForest.json",
    "hash.lua",
    "obfuscated.lua"
};

local old;
old = hookfunction(game.HttpGet, newcclosure(function(self, url, ...)
    local parts = string.split(url, "/")

    -- UI
    local uiLibrary = string.find(url, "Obsidian") and "Obsidian" or string.find(url, "LinoriaLib") and "Linoria" or false;
    if uiLibrary then
        return old(self, string.format("%s%s/%s", baseUrl, uiLibrary, parts[#parts]))
    end;
    
    -- Whitelist
    if url == "https://whitelist.vapevoidware.xyz" then
        return [[{"Announcement":{"expiretime":1971012321.4514153,"targets":"all","text":"Pew was here"},"BlacklistedUsers":{},"KillVape":false,"WhitelistedTags":{},"WhitelistedUsers":{}}]];
    elseif string.find(url, "hashsearch") then
        return [[{"123":{"attackable":false,"hash":"CrackedByPew","level":2,"hidetag":false,"tags":[{"text":"VOIDWARE PRIVATE","color":[210,43,43]}]}}]];
    end;

    if table.find(hosted, parts[#parts]) then
        return old(self, baseUrl .. parts[#parts])
    end;

    return old(self, url, ...)
end))

loadstring(game.HttpGet(game, "Pew was here/obfuscated.lua"))()
