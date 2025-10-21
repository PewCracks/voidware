local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")

if shared.UPDATE_LOG_EXECUTED then 
    shared.UPDATE_LOG_EXECUTED = false
    return 
end
shared.UPDATE_LOG_EXECUTED = true

local function loadJson(path)
    local suc, res = pcall(function()
        return HttpService:JSONDecode(readfile(path))
    end)
    return suc and type(res) == 'table' and res or nil, res
end

local function retry(func, attempts, slowmode)
    attempts = attempts and tonumber(attempts) or 3
    slowmode = slowmode and tonumber(slowmode) or 1
    assert(func ~= nil and type(func) == "function", `function expected got {tostring(type(func))}!`)
    local res = nil
    repeat
        attempts = attempts - 1
        local suc, err = pcall(func)
        if suc then
            res = err
            attempts = -1
        end
        task.wait(slowmode)
    until attempts <= 0
    return res
end

local changelogData = (shared.UpdateLogDevMode and loadJson("VW_Update_Log.json")) or (retry(function()
    return HttpService:JSONDecode([==[[{"body":"<b><font color=\"#00FF00\">[VOIDWARE HALLOWEEN TAB UPDATE] 🎃🕸️🔥</font></b>\n\n<b>🌟 Major Highlights</b>\n\n<b>🕸️ BRAND NEW HALLOWEEN TAB 🎃</b>\n- 🎃 <b>Bring Pumpkins Button</b> – Summon spooky gourds instantly!\n- 🕯️ <b>Bring Halloween Candle Button</b> – Light up your haunt with ease!\n\n<b>🏠 TELEPORT TO HALLOWEEN HOUSE 👻</b>\n- 📍 <b>Halloween Houses Dropdown</b> – Pick your perfect haunted pad!\n- 🚀 <b>Teleport Button</b> – Warp there in a flash, no tricks needed!\n\n<b>⚡ AURA & FARM UPGRADES 💥</b>\n- 🔓 <b>Require Hand Check Toggle</b>: Disable for tool-free Aura power! 🔥\n- 🚀 <b>Auto TP to Targets</b>: Jump to foes beyond 200 studs (patched range workaround :c)\n- 🌳 <b>Small Webbed Tree Support</b>: Tree Farm now webs up those eerie trees!\n\n<b>🍁 BRING ITEMS EXPANSION 🕷️</b>\n- 🎃 <b>Pumpkin in Bring Food</b>\n- 🕯️🍬 <b>Halloween Candle & Candy in Bring Others</b>\n\n<b>💎 KEYS RESTOCKED!</b>\n- 🔑 Grab fresh keys at https://voidware.mysellauth.com – don't miss out! ⚡\n\n<b>👻 Get festive and stay ahead in the Halloween chaos!</b>","date":"10/18/2025","image":{"aspectRatio":1,"assetId":"rbxassetid://140020077242180","banner":true},"images":["rbxassetid://140020077242180"],"new":true,"title":"VOIDWARE UPDATE – SPOOKY HALLOWEEN TAB & KEYS RESTOCK! 🎃🕸️🔥","updateLogId":38,"videos":[{"title":"NEW HALLOWEEN TAB IN ACTION!","image":"rbxassetid://140020077242180","url":"https://youtu.be/CM61XKbcIHA"}],"visible":true},{"body":"<b><font color=\"#00FF00\">[VOIDWARE LOADING & TELEPORT UPDATE] 🎨🏦🚀</font></b>\n\n<b>🌟 Major Highlights</b>\n\n<b>🎨 LOADING SCREEN UPGRADE ✨</b>\n- 😄 <b>Brand New Loading Screen</b> – A sleek, exciting revamp\n\n<b>📍 TELEPORT ENHANCEMENTS 💥</b>\n- 🏦 <b>Teleport to Bank Button</b> – Teleports to the brand new bank structure!\n\n<b>🔨 Other</b>\n- ⚔️ <b>Aura Range Adjustments</b>: Updated Killaura, Tree Farm, Ore Aura, and Ice Aura to max 250 range (devs patched it :c ) \n- 🔥 <b>Chop Status Visualiser</b>: Brought back the option to disable tree farm visuals!\n\n<b>⚡ Dive into smoother gameplay with these fresh tweaks and stay OP!</b>","date":"10/11/2025","image":{"aspectRatio":1,"assetId":"rbxassetid://122528710350039","banner":true},"images":["rbxassetid://122528710350039","rbxassetid://75521483217159"],"new":false,"title":"VOIDWARE UPDATE – NEW LOADING SCREEN & NEW TELEPORT! 🎨🏦🚀","updateLogId":37,"videos":[{"title":"NEW LOADING SCREEN!","image":"rbxassetid://75521483217159","url":"https://streamable.com/ov46od"}],"visible":true},{"body":"<b><font color=\"#00FF00\">[VOIDWARE TAMING + RESTOCK UPDATE] 🐾🔑🚀</font></b>\n\n<b>🌟 Major Highlights</b>\n\n<b>🐻 TAMING UPDATE SUPPORT 🛠️</b>\n- 🧢 Equip <b>Zookeeper Class</b> (FREE!)\n- 🥕 Bring <b>Carrots</b> & 🥩 <b>Steak</b> to tame new creatures!\n- 💯 <b>100% Taming Success Rate</b> – guaranteed every time!\n- ⚡ <b>Instant Taming Minigame</b> – no delay, super OP!\n\n<b>💎 STORE UPDATE 🔥</b>\n- 🔑 <b>Keys have been RESTOCKED!</b>\n- 🌐 <a href=\"https://voidware.mysellauth.com/product/voidware-private\">voidware.mysellauth.com/product/voidware-private</a>\n- ⚡ Grab yours before they sell out again!\n\n<b>🔨 Fixes & Improvements</b>\n- 🌳 <b>Fixed Build Saplings in Circle</b> – works perfectly again!\n\n<b>🌀 UI Enhancements</b>\n- Updated visuals for the <b>Bring Menu</b> and <b>Taming Interface</b>.\n- Improved responsiveness and animations.\n\n<b>⚡ Get ready for smoother gameplay and even more OP features!</b>","date":"10/04/2025","image":{"aspectRatio":1,"assetId":"rbxassetid://112236751902614","banner":true},"images":["rbxassetid://112236751902614"],"new":false,"title":"VOIDWARE UPDATE – TAMING SUPPORT + RESTOCKED KEYS! 🐾🔑🚀","updateLogId":36,"videos":[{"title":"NEW TAMING UPDATE SHOWCASE!","image":"rbxassetid://112236751902614","url":"https://youtu.be/22fjmjUwZB4"}],"visible":true},{"body":"<b><font color=\"#00FF00\">[VOIDWARE UPDATE] 🚀🛠️🎉</font></b>\n\n<b>🌟 Major Highlights</b>\n\n<b>🛡️ NEW MODULE – BECOME INVINCIBLE 🔥</b>\n- 💥 Become Invincible:\n  - Makes you <b>unhittable by all entities</b>.\n  - You also <b>can’t die from hunger</b>.\n  - The ultimate survival buff! ⚡\n\n<b>🐸 Forest Expansion</b>\n- 👑 Added FrogKing to Killaura Support.\n- 🐸 Added Frog Key to Bring Other Items.\n\n<b>⚡ Bring System Overhaul</b>\n- 🛡️ NEW: \"Untouchable by Others\" toggle – items you bring cannot be touched by others unless you pick & drop them.\n- 📦 Fixed Bring Limit being capped at 200 – now truly infinite.\n\n<b>🔨 Gameplay Improvements</b>\n- ⚒️ Fixed Anvil TP (smoother than ever).\n- ⛏️ Added Ore Aura.\n- 🐨 Fixed TP to Children (Koala & Squid Kid now teleport correctly).\n\n<b>🎨 UI & Style</b>\n- 🌀 Wind UI fully refreshed.\n- 📏 Window Scaling: Menu is now <b>smaller & optimized</b> to fit more devices.\n- 🎣 Fishing Tab: Moved to the <b>Main Tab</b> for easier access.\n- ⚙️ Performance Tab: Now includes Cleanup Big Trees 🌲 & Cleanup Logs 🪵.\n- 🌈 NEW THEMES PACK: Neon Blue, Neon Pink, Neon Green, Neon Yellow, Cyberpunk.\n\n<b>⚡ These themes are brighter, glowing, and perfect for futuristic vibes!</b>","date":"10/02/2025","image":{"aspectRatio":1,"assetId":"rbxassetid://71748011306944","banner":true},"images":["rbxassetid://71748011306944","rbxassetid://102398813289309","rbxassetid://99069921531589","rbxassetid://91409943951732"],"new":false,"title":"VOIDWARE UPDATE - BIG NEW FEATURES & FIXES! 🚀🎉","updateLogId":35,"videos":[{"title":"NEW VIDEO!","image":"rbxassetid://102398813289309","url":"https://youtu.be/p1gmLeqKDFI"}],"visible":true},{"body":"<b><font color=\"#00FF00\">[99 NIGHTS IN THE FOREST UPDATE] 🦌🎉</font></b>\n\n<b>🌟 Highlights</b>\n\n<b>🌐 Translations</b>\n- Spanish 🇪🇸, Portuguese 🇵🇹, Portuguese (Brazil) 🇧🇷\n- Japanese 🇯🇵, Korean 🇰🇷\n- Russian 🇷🇺, German 🇩🇪, French 🇫🇷, Italian 🇮🇹\n- Vietnamese 🇻🇳, Tagalog 🇵🇭, Norwegian 🇳🇴, Danish 🇩🇰, Polish 🇵🇱, Catalan 🇪🇸\n\n<b>⚙️ Bring Stuff – Settings</b>\n- 📥 New Bring Method dropdown.\n- ⚡ NEW: ULTRA FAST Method (overpowered).\n\n<b>🔥 Bring Cultists</b>\n- 🎭 Cultist Choice dropdown.\n- 🧲 Bring Cultists button.\n\n<b>🪄 Bring Other</b>\n- Added Wildfire Potion.\n- Added Sacrifice Totem.\n\n<b>🛡️ Bring Guns & Armor</b>\n- Added Infernal Sword.\n- Added Morningstar.\n- Added Crossbow.\n\n<b>💥 Killaura</b>\n- Added support: Hellephant, Naill, Ram.\n\n<b>🗝️ Auto Chest – Upgraded 🔥</b>\n- Fully reworked Auto Chest system.\n- 📍 Bring Location dropdown: Player, Workbench.\n- ⚡ Loot Method dropdown:\n  - Simple Mode – Opens chest, waits for item, moves to next.\n  - Safe Mode – Opens all chests fast, then teleports to items.\n- 📏 Loot Radius Slider: Adjust range.","date":"09/20/2025","image":{"aspectRatio":1,"assetId":"rbxassetid://119793671438914","banner":true},"images":["rbxassetid://119793671438914","rbxassetid://116431548889956","rbxassetid://101600487375780"],"new":false,"title":"99 NIGHTS IN THE FOREST UPDATE UPDATE! 🦌🎉","updateLogId":34,"videos":[{"title":"NEW VIDEO!","image":"rbxassetid://987654321098765","url":"https://youtu.be/F30wadIQp28"}],"visible":true},{"body":"<b><font color=\"#00FF00\">[99 NIGHTS IN THE FOREST UPDATE] 🦌</font></b>\n\n<b>🌟 Highlights</b>\n\n<b>🌲 99 Nights In The Forest</b>\n- <b>🚀 Teleports</b>\n  - 🏰 Cultist Generator Base: Added teleport button.\n  - 🌋 Volcano: Added teleport.\n- <b>💪 Entities</b>\n  - 🦂 Scorpion: Added to valid entities (Killaura support).\n- <b>⚡ Improvements</b>\n  - ⚡ Bring Speed: Upgraded A LOT.\n- <b>🌐 Translations</b>\n  - Chinese Simplified and Turkish added.\n- <b>🎨 UI</b>\n  - 🌀 Wind UI Refresh.\n- <b>🍲 Auto Cooking</b>\n  - NEW: Auto Crock Pot (Work In Progress).\n  - 🥘 Bring Food To Cook Pot: Added.\n  - 🍖 Food Choice added.","date":"09/13/2025","image":{"aspectRatio":1,"assetId":"rbxassetid://123946469657031","banner":true},"images":["rbxassetid://123946469657031","rbxassetid://113852932649070","rbxassetid://92203647814891"],"new":false,"title":"99 NIGHTS IN THE FOREST UPDATE! 🦌","updateLogId":33,"videos":[{"title":"New Bring Method","image":"rbxassetid://113852932649070","url":"https://streamable.com/s41lkr"},{"title":"Translations","image":"rbxassetid://92203647814891","url":"https://streamable.com/jd4xb4"}],"visible":true},{"body":"<b><font color=\"#00FF00\">[INK GAME & 99 NIGHTS IN THE FOREST UPDATE] 🦑🦌</font></b>\n\n<b>🌟 Highlights</b>\n\n<b>🎨 Ink Game</b>\n- <b>🛠️ Fixes</b>\n  - ⚡ Lighting God Awakening: Fixed not working.\n  - 🚫 Disable Games: Fixed toggle not working.\n- <b>🎉 Minigames</b>\n  - 🔥 Dalgona: Free Lighter option added.\n  - 💢 Mingle: New Rage Mode.\n\n<b>🌲 99 Nights In The Forest</b>\n- <b>🚀 Teleports</b>\n  - 🏰 Stronghold: New teleport button.\n  - 💎 Stronghold Diamond Chest: New teleport button.\n- <b>💪 Entity Godmode</b>\n  - Makes you completely unhitable by entities.\n- <b>🛠️ Fixes & Improvements</b>\n  - 🥣 Auto Eat: Stew & Steak Dinner now supported.\n  - ⛑️ Auto Bandage: MedKit support added.\n  - 🌸 Auto Pickup Flowers: Optimised, added visualisers, plus new Stop button.\n  - 💰 Auto Pickup Gold Stacks: Optimised with visualisers.\n  - ⚡ Bring Items Speed: Now a LOT faster.\n- <b>🎨 New Themes</b>\n  - 🌸 Lavender – soft purple / pastel theme\n  - 🌊 Ocean – deep ocean blue theme\n  - 🪸 Coral – coral pink/orange theme\n  - 🌅 Sunset – warm orange/red gradient-inspired theme\n  - 🌲 Forest – deep green nature theme\n  - 🌌 Midnight – dark indigo/purple night theme\n  - 🍋 Citrus – bright yellow/orange theme\n  - 💧 Aqua – vibrant cyan/teal theme\n  - 🍑 Peach – soft peachy orange theme\n  - ❄️ Aurora – northern lights inspired turquoise/green theme","date":"09/09/2025","image":{"aspectRatio":1,"assetId":"rbxassetid://96259313381768","banner":true},"images":["rbxassetid://126544347283964","rbxassetid://84598133667635","rbxassetid://96259313381768","rbxassetid://88166567452884","rbxassetid://84598133667635"],"new":false,"title":"INK GAME & 99 NIGHTS IN THE FOREST UPDATE! 🦑🦌","updateLogId":32,"videos":[{"title":"Ink Game 🦑","image":"rbxassetid://126544347283964","url":"https://youtu.be/Tllc9uNggyg"},{"title":"99 Nights In The Forest 🦌","image":"rbxassetid://84598133667635","url":"https://youtu.be/XfxTGhsdUco"}],"visible":true},{"body":"<b><font color=\"#00FF00\">[BEDWARS, 99 NIGHTS IN THE FOREST, INK GAME UPDATE] 🛠️🚀</font></b>\n\n<b>🌟 Highlights</b>\n\n<b>🎮 Bedwars</b>\n- 🌊 Water Ambient: Immersive water effects added.\n\n<b>🌲 99 Nights In The Forest</b>\n- <b>🛠️ Fixes</b>\n  - 🪵 Bring Logs: Fixed the Stop button not working.\n- <b>🎣 Fishing</b>\n  - 🏠 Fishing Hut TP: Teleport to fishing spots.\n  - 👀 ESP: Highlights Fishing Hut & Water Hole.\n  - 🐟 Food ESP: Tracks Markel, Salmon.\n  - 🎣 100% Fishing Success: Never fail.\n  - ⚡ Instant Catch: Immediate catches.\n- <b>🚀 Main Updates</b>\n  - ❄️ Ice Aura: Auto-breaks frozen objects.\n  - 🍖 Ribs: In Food & Healing tab.\n  - 🪶 Feather: In Other Items tab.\n  - 🥣 Auto Eat Stew: Enabled.\n  - 🔄 Synced: Matches latest game version.\n\n<b>🎨 Ink Game</b>\n- <b>🛠️ Fixes</b>\n  - ⚙️ Performance: Less lag, fixed Fling Aura crash.\n  - 👗 VIP Clothing: Color glitches fixed.\n  - 👁️ Hiders ESP: Works in Hide and Seek.\n  - 🏃 Safe Spot TP: Fixed for Hide and Seek.\n  - 🛡️ Rebel Guards: TP in front for combat.\n  - 🚀 Anti-Fling: Improved protection.\n- <b>🚫 Disabled Games</b>\n  - Dalgona, Sky Squid, Jump Rope, Hide and Seek, Glass Bridge.\n- <b>💪 Tug of War</b>\n  - 🛠️ Pull Mode: Legit, Moderate, Rage options.\n- <b>🤝 Mingle</b>\n  - ⚡ Auto QTE V1: Old version (for bad executors mainly).\n  - 🌟 Auto QTE V2: New and Enhanced version.\n- <b>☁️ Sky Game</b>\n  - 🏃‍♂️ Infinite Stamina [BETA]: Run without limits.\n  - 🚫 Fall Detection Off [BETA]: Disables fall detection.\n  - 🧗 Auto Climb [BETA]: Effortless climbing.\n  - 🤝 Auto Pickup Pole: Useful.\n- <b>🎉 Fun</b>\n  - 🏃 Sprint Dash: Unlocked for style.\n- <b>🔍 Other</b>\n  - 👥 Killaura Whitelist: For Player Attach & Hiders.\n  - 😎 Jerk Emote: Added to Emotes.\n  - 📏 Sort Targets: By Distance or Health.","date":"08/21/2025","image":{"aspectRatio":1,"assetId":"rbxassetid://122640216199797","banner":true},"images":["rbxassetid://122640216199797","rbxassetid://72630125124386"],"new":false,"title":"BEDWARS, 99 NIGHTS IN THE FOREST, INK GAME UPDATE! 🛠️🚀","updateLogId":31,"video":{"image":"rbxassetid://122640216199797","url":"https://youtu.be/6D8GMIkF7PI"},"visible":true},{"body":"<b><font color=\"#00FF00\">[ANTICHEAT PATCH UPDATE] 🎉🔒</font></b> 🚀\n\n<b>[Main Updates]</b> 🌟\n+ ANTICHEAT PATCHED 🎉🔒\n! Added warning ⚠️ for using Aimbot until we verify that we have fully patched the detection for that 🛡️\n- Removed Gun Mods 🔫 until we patch the detection for them 🚫\n- RLGL Godmode 😎💪\n- Dalgona Immunity 🛡️🍬","date":"08/08/2025","image":{"aspectRatio":1,"assetId":"rbxassetid://70900965938139","banner":true},"images":["rbxassetid://70900965938139","rbxassetid://75315084046877"],"new":false,"title":"ANTICHEAT PATCH UPDATE! 🎉🔒","updateLogId":30,"video":{"image":"rbxassetid://70900965938139","url":"https://youtu.be/6D8GMIkF7PI"},"visible":true},{"body":"<b><font color=\"#FF0000\">[FORSAKEN SCRIPT LAUNCH] 🖤⚔️</font></b> 🚀\n\n<b>[Main Features]</b> 🌟\n+ Infinite Stamina ♾️\n+ Kill Aura with customizable range ⚔️\n+ Auto Win for seamless victories 🏆\n+ Auto Fix Generators for survivors 🔧\n+ Anti Death to stay alive 🛡️\n+ Auto Complete Flow Game for quick wins 🎮\n+ Full Bright Loop for better visibility ☀️\n+ Player Attach with multiple movement types 👥\n\n<b>[Player Modifications]</b> 🧑\n+ Anti AFK to prevent kicks 🕒\n+ Noclip with keybind for freedom 🚫\n+ Infinite Jump for mobility 🦘\n+ FOV Adjustment for better vision 👁️\n+ Interaction Reach Multiplier for easier interactions 📏\n+ Instant Interact for faster actions 🚀\n\n<b>[ESP Features]</b> 👀\n+ Player ESP to track others ❤️\n+ Killer ESP to spot threats 😈\n+ Survivor ESP for team awareness 🏃\n+ Generator ESP to locate objectives ⚡️\n+ Customizable ESP settings (Highlight, Distance, Transparency, Text Size) 🌟\n\n<b>[Visual & Performance]</b> 🖥️\n+ Full Bright Toggle for clear visuals ☀️\n+ Low GFX Mode for better performance ⚙️\n+ Show Coordinates for navigation 📍\n+ Anti Void to prevent falling 🕳️\n+ Reset Camera for view fixes 📷\n\n<b>[UI Settings]</b> ⚙️\n+ Open Keybind Menu for easy controls 🎹\n+ Custom Cursor Toggle for style 🖱️\n+ Menu Keybind Customization for accessibility 🔧\n+ Theme Management for personalization 🎨\n+ Save and Reset Configuration for convenience 💾","date":"08/06/2025","image":{"aspectRatio":1,"assetId":"rbxassetid://98928321910770","banner":true},"images":["rbxassetid://98928321910770","rbxassetid://118610595163186"],"new":false,"title":"FORSAKEN SCRIPT LAUNCH! 🖤⚔️","updateLogId":29,"video":{"image":"rbxassetid://98928321910770","url":"https://youtu.be/5l5IBuBDTo8"},"visible":true},{"body":"<b><font color=\"#00FF00\">[AUTO CHOP, NEW THINGS & UI OVERHAUL] 🌟⚙️</font></b> 🚀\n\n<b>[FIXES]</b> 🛠️\n+ Fixed Linoria Library not working ✅\n+ Fixed Bring Items not working on Delta 🔧\n+ Fixed Killaura not working ⚔️\n+ Created new system for bring items 🆕\n+ Added default values to a bunch of dropdowns to save you time ⏱️\n\n<b>[UI Changes]</b> 🎨\n+ Redesigned dropdowns 📋\n+ Redesigned Inputs ✍️\n+ Moved from sliders to inputs in some areas 🔄\n+ Moved every bring mode in a single tab for easier use 📑\n+ Major tab redesign ✨\n\n<b>[ESP]</b> 👁️\n+ Added Children ESP 🧒\n\n<b>[Main]</b> 🚀\n+ Auto Campfire 🔥\n+ Auto Open Seed Boxes 🌱\n+ Tree Farm 🌳\n+ Auto Eat 🍽️\n+ Auto Bandage 🩹\n+ Hitbox Expansion 🎯\n\n<b>[Teleport]</b> 🌌\n+ Auto TP to Warm Place ☀️\n+ Chest TP [BETA] 🧰\n+ Child TP 👶\n+ Structure TP 🏛️\n+ Teleport to Camp ⛺\n+ Teleport to Caravan 🚛\n+ Teleport to Fairy 🧚\n+ Teleport to Anvil 🔨\n\n<b>[Auto Collect]</b> 🤖\n+ Auto Pickup Flowers 💐\n+ Auto Collect Coin Stacks 💰","date":"08/05/2025","image":{"aspectRatio":1,"assetId":"rbxassetid://93848933990798","banner":true},"images":["rbxassetid://93848933990798","rbxassetid://84705356833041","rbxassetid://131391079683185"],"new":false,"title":"AUTO CHOP, NEW THINGS & UI OVERHAUL! 🌟⚙️","updateLogId":28,"video":{"image":"rbxassetid://93848933990798","url":"https://youtu.be/pYuiKESAWPU"},"visible":true},{"body":"<b><font color=\"#00FF00\">[99 NIGHTS IN THE FOREST SCRIPT LAUNCH] 🌲🔥</font></b> 🚀\n\n<b>[Main Features]</b> 🛠️\n+ Reveal entire map for exploration 🗺️\n+ Teleport trees, chests, and entities (wolves, bears, aliens, etc.) 🌳🎁🐺\n+ Auto pickup flowers and gold stacks 💐💰\n+ Plant saplings and build log walls in circles 🌱🏯\n+ Cleanup logs to workbench or fire 🪵\n\n<b>[Player Modifications]</b> 🧑\n+ Adjustable walk speed and FOV 🚶👁️\n+ Toggleable speed, noclip, and infinite jump ⚡🚫🦘\n+ Anti AFK to stay active 🕒\n\n<b>[ESP Features]</b> 👀\n+ Player ESP with health and distance display ❤️📏\n+ Customizable ESP highlight, transparency, and text size 🌟\n\n<b>[Visual & Performance]</b> 🖥️\n+ Fullbright, remove fog/sky, and low GFX mode ☀️🌫️\n+ Show coordinates and instant interact 📍🚀\n\n<b>[UI Settings]</b> ⚙️\n+ Customizable keybinds, cursor, and themes 🎹🖱️🎨\n+ Save and load configurations 💾","date":"08/02/2025","image":{"aspectRatio":1,"assetId":"rbxassetid://108826121095875","banner":true},"images":["rbxassetid://108826121095875","rbxassetid://76023795066587","rbxassetid://71199378532210"],"new":false,"title":"99 NIGHTS IN THE FOREST SCRIPT LAUNCH! 🌲🔥","updateLogId":27,"video":{"image":"rbxassetid://108826121095875","url":"https://youtu.be/xWp5AXAa_v8"},"visible":true},{"body":"<b><font color=\"#00FF00\">[NEON TRACES & WAVE TRAILS UPDATE] 🌟🌊</font></b> 🚀\n\n<b>[Fixes]</b> 🛠️\n+ Fixed Killaura on cheat engines (if there are still issues please report in #report-bugs) 🐛\n+ Optimised the Remote Middleware to prevent ping spikes 📡\n+ Optimised Killaura ⚔️\n+ Fixed cat Long Jump 🐱\n\n<b>[Neon Traces]</b> ✨\n+ Added in the Misc/World Window 🖼️\n+ Orbit Speed slider 🚀\n+ Number Circles slider 🔢\n+ Circle Size slider 📏\n+ Color Mode dropdown [Single, Gradient] 🎨\n+ 3 Color Sliders 🌈\n\n<b>[Wave Trails]</b> 🌊\n+ Added in the Misc/World Window 🖼️\n+ Fade in Color Picker 🎨\n+ Fade out Color Picker 🎨\n+ Enable Explosion Effect toggle 💥","date":"07/28/2025","image":{"aspectRatio":1,"assetId":"rbxassetid://103353460466407","banner":true},"images":["rbxassetid://70739733098310","rbxassetid://103353460466407"],"new":false,"title":"NEON TRACES & WAVE TRAILS UPDATE! 🌟🌊","updateLogId":26,"video":{"image":"rbxassetid://70739733098310","url":"https://youtu.be/Fng16a881Ig"},"visible":true},{"body":"<b><font color=\"#FFD700\">[NEW WIND UI & ANTICHEAT BYPASS] 🎉💨</font></b> 🚀\n\n<b>[Fixes]</b> 🛠️\n+ Fixed Player Attach attacking anyone in Hide And Seek ✅\n+ Fixed Guard ESP not updating when new guards spawn ✅\n\n<b>[Autowin]</b> 🏆\n+ Added Autowin Seeker support in Hide And Seek ✅\n\n<b>[Ambient]</b> 🌌\n+ Added Rich Shader ✨\n+ Added Lighting Theme 💡\n+ Added Aesthetic Lighting 🌟\n\n<b>[VIP]</b> 👑\n+ Added VIP Tag Toggle 🏷️\n+ Added Custom Clothing Toggle 👕\n+ Added Clothing Color Slider 🎨\n+ Added Custom Player Tag Toggle 📛\n+ Added Tag Input ✍️\n\n<b>[Bring Injured Player]</b> 🚑\n+ Added Bring Mode [Help, Kill, Troll] 🚀\n+ Help - Get them to the end 🤝\n+ Kill - TP them to the void 💀\n+ Troll - TP them to the start 😜\n\n<b>[FUN]</b> 🎮\n+ Added Unlock Phantom Dash 🏃‍♂️\n\n<b>[Anticheat Bypass]</b> 🛡️\n+ Patched yet another detection made by the ink game devs 💀","date":"07/24/2025","image":{"aspectRatio":1,"assetId":"rbxassetid://86444289619555","banner":true},"images":["rbxassetid://103056715406956","rbxassetid://86444289619555","rbxassetid://88524428154798","rbxassetid://85935188652297"],"new":false,"title":"NEW WIND UI & ANTICHEAT BYPASS! 🎉💨","updateLogId":25,"video":{"image":"rbxassetid://103056715406956","url":"https://youtu.be/rKq2LhL6O6w"},"visible":true},{"body":"<b><font color=\"#FFD700\">[ANTICHEAT PATCH UPGRADES & JUMP ROPE] 🦑⚔️</font></b> 🚀\n\n<b>[Fixes]</b> 🛠️\n+ Fixed Auto Pull not working ✅\n+ Fixed Auto Skip Dialogue resulting in fps drops (50% chance it fixes itself) 📉\n\n<b>[Anticheat Patch] - UPGRADED</b> 🚀\n+ Added Block Anticheat Remote 🔒\n+ Added Spoof Fling Velocity 🛡️\n+ Added Fling Character Hook 🎣\n+ Added Anticheat Patch Version for Bad Executors 🌟\n\n<b>[Jump Rope]</b> 🪢\n+ Added Complete Jump Rope Game 🎮\n+ Added Anti Fall [beta] 🛑\n+ Added Auto Perfect [beta] ✨\n+ Added Destroy Fall Detection [beta] 💥\n\n<b>[Autowin]</b> 🏆\n+ Added Jump Rope support 🪢\n\n<b>[Coordinates]</b> 📍\n+ Added Coordinates to Misc Tab - by 3rfe#0 🗺️\n\n<b>[Killaura]</b> ⚔️\n+ Added Range Slider 🎚️","date":"07/20/2025","image":{"aspectRatio":1,"assetId":"rbxassetid://72385929509787","banner":true},"images":["rbxassetid://72385929509787"],"new":false,"title":"ANTICHEAT PATCH UPGRADES & JUMP ROPE! 🦑⚔️","updateLogId":24,"visible":true},{"body":"<b><font color=\"#FFD700\">[PERFORMANCE & UPCOMING FEATURES] 🔨🌧️</font></b> 🚀\n\n<b>[Fixes]</b> 🛠️\n+ Fixed Adetunde Exploit resulting in ping spikes and attempting to upgrade hammer even when we don't have it 🔨\n+ Fixed Game Weather Rain module not working 🌧️\n+ Fixed Chest Stealer 🧰\n+ Optimised Remote Middleware to prevent ping spikes and fix killaura working slowly on some executors ⚡\n\n<b>[Planned]</b> 📅\n! New Profiles 👤\n! Wave Trails 🌊\n! Neon Traces ✨\n! And more 🎉","date":"07/20/2025","image":{"aspectRatio":1,"assetId":"rbxassetid://127944074932833","banner":true},"images":["rbxassetid://127944074932833"],"new":false,"title":"PERFORMANCE & UPCOMING FEATURES! 🔨🌧️","updateLogId":23,"visible":true},{"body":"<b><font color=\"#FFD700\">[REBEL FIXES & More]🦑⚔️</font></b> 🚀\n\n<b>[Fixes]</b> 🛠️\n+ Fixed Voidware sometimes failing to load and inf looping into errors 🔄\n+ Fixed Anti Death not properly working while Player Attach is enabled ⚡\n+ Fixed Anti Death preventing you from teleporting to safe place 🛡️\n+ Fixed Anti Void not cleaning up after unloading Voidware 🧹\n+ Fixed Anti Death looping through safe teleporting 🔄\n+ Fixed Keys ESP in Hide And Seek 🔍\n+ Fixed Guard Aimbot not working 🎯\n\n<b>[Autowin - GlassBridge]</b> 🌉\n+ Added cooldown before teleporting to the end of the bridge to prevent noclipping and dying (15 seconds) ⏱️\n\n<b>[Killaura]</b> ⚔️\n+ Added Push Aura 💨\n\n<b>[Rebel]</b> 🏴‍☠️\n+ Added Auto Steal Guns 🔫\n\n<b>[Auto Vote]</b> 🗳️\n+ Added Auto Vote toggle ✅\n+ Added Vote Options dropdown 📜","date":"07/18/2025","image":{"aspectRatio":1,"assetId":"rbxassetid://95503745833878","banner":true},"images":["rbxassetid://116005117928958","rbxassetid://99854514828179","rbxassetid://95503745833878"],"new":false,"title":"REBEL FIXES & More! 🦑⚔️","updateLogId":22,"video":{"image":"rbxassetid://116005117928958","url":"https://youtu.be/qdHeo6fwRWg"},"visible":true},{"body":"<b><font color=\"#FFD700\">[NEW PROFILES, KILLAURA & More]✨⚔️</font></b> 🚀\n\n<b>[Fixes]</b> 🛠️\n+ Fixed Voidware Packet not loading 🚀\n+ Fixed AutoBank on Voidware Packet 💰\n+ Optimised Chest Stealer to reduce ping spikes and fps drops ⚡\n+ Fixed Projectile Aura resulting in huge fps drops on Voidware Packet, Rise & Old 🎯\n\n<b>[All Versions]</b> 🌟\n+ NEW PROFILES Voidware Golden! ✨\n\n<b>[Killaura]</b> ⚔️\n+ Added Kaida Kit Support 🐉\n+ Added Sigrid Check toggle ✅\n+ Added Preserve Mobile Icon toggle (for mobile) 📱\n\n<b>[Misc]</b> 🛠️\n+ Added UICleanup to Cheat Engine Mode 🧹","date":"07/16/2025","image":{"aspectRatio":1,"assetId":"rbxassetid://82008369010391","banner":true},"images":["rbxassetid://74979655716847","rbxassetid://82008369010391"],"new":false,"title":"NEW PROFILES, KILLAURA & More! ✨⚔️","updateLogId":21,"video":{"image":"rbxassetid://82008369010391","url":"https://youtu.be/F1txZFrqmzc"},"visible":true},{"body":"<b><font color=\"#FFD700\">[NEW UI, PLAYER ATTACH & More]🦑🎉</font></b> 🚀\n\n<b>[Fixes]</b> 🛠️\n+ Fixed Players/Guards getting invisible after completion of the dalgona game 🫥\n+ Fixed Complete Dalgona Game breaking the game camera and shiftlock 📸\n+ Fixed Guard Expand Hitbox expanding the hitbox of non-guards 🎯\n+ Fixed Guard ESP not deleting itself after the guard dies 💀\n+ Optimised Aimbot reducing fps drops significantly 🚀\n+ Fixed Cutscenes breaking after using Fix Camera 🎬\n+ Added Health Check to Aimbot ❤️\n\n<b>[Interaction]</b> 🤝\n+ Added Instant Interact ⚡\n+ Added Interaction Reach Multiplier slider 📏\n+ Added Interaction Reach ✋\n\n<b>[Red Light Green Light]</b> 🚦\n+ Added Bring Injured Player 🩹\n\n<b>[Useful Stuff]</b> 🛠️\n+ Added Auto Skip Dialogue ⏭️\n+ Added Fullbright 💡\n\n<b>[Rebel]</b> 😈\n+ Added Bring All Guards 🛡️\n\n<b>[Guard ESP]</b> 👀\n+ Added Health Checks ❤️\n\n<b>[Hide And Seek]</b> 🙈\n+ Added Infinite Stamina 🏃‍♂️\n+ Added Teleport to Safe Hiding Spot 🏠\n\n<b>[Player Attach]</b> 🧲\n+ Player Attach 🤝\n+ Attach Range 📏\n+ Movement Type [Tween, Teleport, Velocity] 🚀\n+ Stay Behind Target 👥\n+ Behind Distance ↔️\n\n<b>[Misc]</b> 🛠️\n+ Made Teleport To Safe Place teleport you back to your original position when disabled 🔄\n\n<b>[Aimbot]</b> 🎯\n+ Added Player Aimbot 👤\n+ Renamed -> Guard Aimbot 🛡️\n+ Added Wall Check 🏯\n\n<b>[Hide And Seek ESP]</b> 👀\n+ Added Escape Door ESP 🚪","date":"07/14/2025","image":{"aspectRatio":1,"assetId":"rbxassetid://109814965715244","banner":true},"images":["rbxassetid://111386082317943","rbxassetid://118055690122787","rbxassetid://109814965715244"],"new":false,"title":"NEW UI, PLAYER ATTACH & More! 🦑🎉","updateLogId":20,"video":{"image":"rbxassetid://118055690122787","url":"https://youtu.be/4Gsc-rPdcCg"},"visible":true},{"body":"<b><font color=\"#FFD700\">[Aimbot, Gun Mods, Anticheat Patch & Fixes]🦑🎲</font></b> 🚀\n\n<b>[Fixes]</b> 🛠️\n+ Fixed Anti Fling preventing the game from teleporting u to the next stage 🚀\n+ Fixed the anticheat patches preventing some of the game's core functions from not working 🛡️\n+ Fixed Complete Dalgona Game not working on some executors 🍬\n+ Fixed Complete Glass Bridge not checking the game state 🌉\n+ Fixed the keybind menu being visible on mobile 📱\n+ Fixed Speed not disabling when toggled off ⚡\n+ Fixed Glass Bridge Autowin not working 🏆\n+ Fixed Fling Aura completely ✨\n+ Fixed Autowin Glass Bridge 🎯\n\n<b>[Rebel]</b> ⚔️\n+ Added Gun Mods 🔫\n+ Added Aimbot 🔍\n\n<b>[Misc]</b> 🛠️\n+ Added Keybind for Teleport To Safe Place 🏠\n\n<b>[Hide And Seek]</b> 🙈\n+ Added Keybind for Teleport To Hider 📍\n\n<b>[Fun]</b> 🎉\n+ Added Ghost Mode (beta version) 👻\n\n<b>[Security]</b> 🔒\n+ Added Anticheat Patch (this will fix Fling Aura not working and bypass some new anticheat detections) 🛡️\n\n<b>[Information]</b> ℹ️\n+ Added Save Settings button to make it even easier to save your settings 💾\n+ Added Reset Settings button 🔄","date":"07/12/2025","image":{"aspectRatio":1,"assetId":"rbxassetid://139810278323928","banner":true},"images":["rbxassetid://134208497971108","rbxassetid://139810278323928"],"new":false,"title":"Aimbot, Gun Mods, Anticheat Patch & Fixes! 🦑🎲","updateLogId":19,"visible":true},{"body":"<b><font color=\"#FFD700\">[New Ink Game Support Update]🦑✨</font></b> 🎮✨\n\n<b>[Fun]</b> 🎉\n+ Autowin [Lights Out, HideAndSeek, RedLightGreenLight, TugOfWar, Mingle, Dalgona Support] 🏆\n+ Anti Fling (beta version) 🚀\n+ Fling Aura 🔥\n+ Killaura 🔪\n\n<b>[Red Light / Green Light]</b> 🚦\n+ Godmode 😇\n+ Remove Injured Walking 🚑\n\n<b>[Dalgona]</b> 🍬\n+ Immune Dalgona Game (beta version) 🛡️\n\n<b>[Mingle]</b> 🤝\n+ Auto Mingle (beta version) 😄\n\n<b>[Glass Bridge]</b> 🌉\n+ Complete Glass Bridge Game ✅\n\n<b>[Hide And Seek]</b> 🙈\n+ Teleport To Hider 📍\n\n<b>[Rebel]</b> ⚔️\n+ Expand Guard Hitbox 🎯\n\n<b>[Misc]</b> 🛠️\n+ Emotes List 😃\n+ Play Emote 💃\n+ Stop Emoting 🛑\n+ Enable Spectator Mode 👻\n+ Teleport To Safe Place 🏠\n+ Fix Players Visibility 👀\n\n<b>[Security]</b> 🔒\n+ Anti AFK ⏰\n+ Staff Detector 🕵️","date":"07/10/2025","image":{"aspectRatio":1,"assetId":"rbxassetid://100256144467619","banner":true},"images":["rbxassetid://100256144467619"],"new":false,"title":"New Ink Game Support Update! 🦑✨","updateLogId":18,"visible":true},{"body":"<b><font color=\"#FFD700\">[INK GAME SUPPORT LAUNCH]</font></b> 🦑 🎲\n\n<b>[Ink Game - Main Features]</b> 🌟\n+ Complete Red Light / Green Light 🏃‍♂️\n+ Complete Dalgona Game 🍬\n+ Reveal Glass Bridge 🥾\n+ Auto Pull (Tug of War) 💪\n+ Perfect Pull (Tug of War) 🎯\n+ Remove Ragdoll Effect 🧍\n+ Anti Ragdoll + No Stun 🚫\n+ Fix Camera 📷\n+ Join Discord Server 🔗\n+ Unload Script 🗑️\n\n<b>[Ink Game - Player Modifications]</b> 🧑\n+ Walk Speed Adjustment 🚶\n+ Speed Toggle (with Keybind) ⚡\n+ Noclip (with Keybind) 🚫\n+ Infinite Jump 🦘\n+ Fly ✈️\n+ Fly Speed Adjustment 🛩️\n+ FOV Adjustment 👁️\n\n<b>[Ink Game - ESP Features]</b> 👀\n+ Player ESP ❤️\n+ Guard ESP 🛡️\n+ Hider ESP 🙈\n+ Seeker ESP 🔍\n+ Key ESP 🔑\n+ Door ESP 🚪\n+ ESP Highlight Toggle 🌟\n+ Show Distance on ESP 📏\n+ ESP Fill Transparency Slider 🌫️\n+ ESP Outline Transparency Slider 🖼️\n+ ESP Text Size Slider 🔠\n\n<b>[Ink Game - UI Settings]</b> ⚙️\n+ Open Keybind Menu 🎹\n+ Custom Cursor Toggle 🖱️\n+ Menu Keybind Customization 🔧\n+ Theme Management 🎨\n+ Save Configuration 💾","date":"07/09/2025","image":{"aspectRatio":1,"assetId":"rbxassetid://130181744053779","banner":true},"images":["rbxassetid://130181744053779","rbxassetid://84789762481311"],"new":false,"title":"Ink Game Support Launch! 🦑 🎲","updateLogId":17,"video":{"image":"rbxassetid://84789762481311","url":"https://youtu.be/2t3WgitelCs"},"visible":true},{"body":"<b><font color=\"#FFD700\">[ALL VERSIONS]</font></b> 🌟\n+ ✨ Added working Invisibility module (thanks pandacrazycrazy#0)\n+ ⚡ Optimised Autowin & Fixed a lot of issues with it\n+ 🎯 Added new Damage Indicator\n+ 🎭 Added PlayerAttach\n+ 💬 Added new stuff to Custom Chat\n+ 🎨 Added Hotbar Visuals\n\n<b><font color=\"#00FFFF\">[[ Player Attach ]]</font></b> 🎭\n+ 📏 Range slider\n+ 🔄 Movement Type dropdown (Teleport, Tween, Velocity)\n+ ⏱️ Tween Duration slider\n+ 🔙 Stay Behind Target toggle\n+ 📐 Behind Distance slider\n\n<b><font color=\"#00FFFF\">[[ Damage Indicator ]]</font></b> 🎯\n+ 🌈 Color Mode dropdown (Rainbow, Custom, Lunar)\n+ 🌈 Rainbow Style dropdown (Gradient, Paint)\n+ 📝 Text Mode dropdown (Rainbow, Custom, Lunar)\n+ 🎨 Custom Color toggle\n+ 🎨 Text Color color slider\n+ ✍️ Custom Text toggle\n+ 💬 Custom Messages text list\n+ 🔤 Custom Font toggle\n+ 🔤 Font dropdown\n\n<b><font color=\"#00FFFF\">[[ Custom Chat ]]</font></b> 💬\n+ 🌟 Gradient toggle\n+ 🎨 Chat Color 1 color slider\n+ 🎨 Chat Color 2 color slider\n+ 🎨 Chat Color 3 color slider\n+ 🔧 Third Chat Color toggle\n\n<b><font color=\"#00FFFF\">[[ Hotbar Visuals ]]</font></b> 🎨\n+ 🎨 Slot Color toggle\n+ 🌟 Gradient Slot Color toggle\n+ 🌈 Animated Gradient toggle\n+ 🎨 Gradient Color color slider\n+ 🎨 Gradient Color 2 color slider\n+ 🎨 Slot Color color slider\n+ 🔲 Rounding toggle\n+ 🔲 Corner Radius color slider\n+ ✨ Outline Highlight toggle\n+ 🎨 Highlight Color color slider\n+ 🔢 No Slot Numbers toggle\n\n<b><font color=\"#FFD700\">[VW REWRITE]</font></b> 🔧\n+ 👾 Added Amongus Changer\n\n<b><font color=\"#00FFFF\">[[ Autowin ]]</font></b> 🏆\n+ 📏 Added Scaffold Disable Distance slider\n+ ⚡ Optimised suffocation checks","date":"07/07/2025","image":{"aspectRatio":1,"assetId":"rbxassetid://136542351992560","banner":true},"images":["rbxassetid://136542351992560","rbxassetid://83549195159691"],"new":false,"title":"Invisibility, PlayerAttach & Damage Indicator! 🚀","updateLogId":16,"video":{"image":"rbxassetid://83549195159691","url":"https://youtu.be/WZsV4Azwl1U"},"visible":true},{"body":"<b><font color=\"#228B22\">[99 NIGHTS IN THE FOREST SUPPORT]</font></b> 🌲\n+ 🌟 Initial Support for 99 Nights in the Forest\n<b>Features:</b> ✨\n+ 👀 ESP Modules (Health, Fuel, Food, Scrappable, Other)\n+ 🪓 Auto Chop Trees Module\n+ 🛍️ Auto Collect Items with Custom Filters\n+ 🍲 Auto Consume & Cooking Enhancements\n+ 🔥 Teleport to Fire & Back\n+ 💡 Fullbright with Adjustable Brightness\n+ 🚶‍♂️ Teleport Walk with Speed Slider\n+ 🚫 NoClip Module\n+ ⚡ Instant Proximity Prompts\n+ 🔍 Zoom Unlocker (Infinite & Custom Modes)\n+ 🗑️ Drop, Scrap, Biofuel, and Cook Stew All Modules\n+ 🪟 GUI Window Sorting & Uninject Options\n+ 🔄 Play Again & Lobby Teleport\n<b>Enhancements:</b> ✨\n+ 🛠️ CustomRoact UI for Healthbars\n+ 📡 Optimized Resource Tracking\n+ 🐛 Bug Fixes for Stable Execution","date":"07/01/2025","image":{"aspectRatio":1,"assetId":"rbxassetid://99929390025841","banner":true},"images":["rbxassetid://99929390025841","rbxassetid://71056658426481"],"new":false,"title":"99 Nights in the Forest Support Launch! 🌲✨","updateLogId":15,"video":{"image":"rbxassetid://71056658426481","url":"https://youtu.be/xvMTM1wfV7E"},"visible":true},{"body":"<b><font color=\"#FFD700\">[ALL VW VERSIONS]</font></b> 🚀\n+ 💬 Custom Chat Enhancements\n<b>Features:</b> ✨\n+ ✅ Display Joins Toggle\n+ 🚪 Display Leaves Toggle\n+ 🔨 Nuker Improvements\n<b>Features:</b> ✨\n+ 💥 Break Closest Block Toggle (Work In Progress)\n+ 🏦 AutoBank Enhancements\n<b>Features:</b> ✨\n+ 🔧 Activation Dropdown (On Key, Toggle)\n+ 🛏️ BedAssist Module\n<b>Features:</b> ✨\n+ 📏 Assist Range Slider\n+ ⚡ Aim Speed Slider\n+ 📐 Max Angle Slider\n+ 🎥 First Person Only Toggle\n+ 🏪 Shop Check Toggle\n+ 📡 VW Packet Updates\n<b>Features:</b> ✨\n+ 🔍 Added AC Mod View\n+ 🏦 Added AutoBank","date":"06/06/2025","image":{"aspectRatio":1,"assetId":"rbxassetid://78518944194839","banner":true},"images":["rbxassetid://129919589240643","rbxassetid://78518944194839"],"new":false,"title":"Nuker & BedAssist Upgrades! 🚀","updateLogId":14,"video":{"image":"rbxassetid://129919589240643","url":"https://youtu.be/QoQLO3GjlYs"},"visible":true},{"body":"<b><font color=\"#FFD700\">[ALL VW VERSIONS]</font></b> 🎮\n+ AC Mod View ✨\nFeatures:\n+ Remove Disguises 🕵️‍♂️\n+ Add AC mod controls (ban, kick - visual only) 🚫\n+ Parties viewer 🎉\n+ Autowin! 🏆\nFeatures:\n+ Heal Threshold ❤️\n+ Advanced anti-death system 🛡️\n+ Advanced moving system 🚀\n+ Movement Type - TP/Tween 🔄","date":"05/21/2025","image":{"aspectRatio":1,"assetId":"rbxassetid://80415871728757","banner":true},"images":["rbxassetid://114973835703278","rbxassetid://126788607836429","rbxassetid://80415871728757"],"new":false,"title":"AC Mod View & Autowin Features! 🚀","updateLogId":13,"video":{"image":"rbxassetid://114973835703278","url":"https://youtu.be/I0-m_ITJkBA"},"visible":true},{"body":"<b><font color=\"#FFD700\">[VW REWRITE]</font></b> 🚗\n- ❌ Removed ScrollGUI\n+ 📱 Optimised Mobile GUI Auto Resizing\n<b><font color=\"#FFD700\">[ALL VOIDWARE VERSIONS]</font></b> 🌌\n+ 📲 Brought back Mobile Legacy Layout (supported executors only)\n<b><font color=\"#FFD700\">[LegacyLayout]</font></b> 🌍\n- World Window/Category","date":"05/04/2025","image":{"aspectRatio":1,"assetId":"rbxassetid://136573482019511","banner":true},"images":["rbxassetid://74895788839955"],"new":false,"title":"Mobile Legacy Layout & GUI Optimizations! 🚀","updateLogId":12.1,"video":{"image":"rbxassetid://72016135124042","url":"https://youtu.be/zF6Gjwfhq9Q"},"visible":true},{"body":"<b><font color=\"#FFD700\">[VW REWRITE]</font></b> 🎉\n+ 📱 On mobile the gui is now <b>scrollable</b>!\n<b><font color=\"#FFD700\">[ALL VOIDWARE VERSIONS]</font></b> 🚀\n+ 🛡️ Upgraded StaffDetector\n+ 🕵️ Added StaffFetcher\n<b><font color=\"#FFD700\">[BetterSpectator]</font></b> 👀\n+ 🏆 Added BetterSpectator (could be useful in ranked)\n<b>Features:</b> ✨\n+ 📸 Camera locking\n+ 🎒 Inventory syncing\n+ ❤️ Health syncing\n+ 🪄 Enchants syncing\n+ 🔧 Hotbar syncing","date":"03/05/2025","image":{"aspectRatio":1,"assetId":"rbxassetid://132359597726251","banner":true},"images":["rbxassetid://132359597726251","rbxassetid://136036218357806"],"new":false,"title":"Scrollable GUI, BetterSpectator & Module Fixes! 🚀","updateLogId":11,"video":{"image":"rbxassetid://136519967947367","url":"https://streamable.com/v5uxts"},"visible":true},{"body":"<b><font color=\"#FFD700\">[VW PACKET, REWRITE, RISE & OLD]</font></b> 🌟\n<b><font color=\"#FFD700\">[Killaura]</font></b> ⚔️\n- ❌ Removed Charge Ratio\n+ ✅ Added OneTap Cooldown for higher damage per hit\n+ 🛠️ Fixed LegitAura not properly working\n<b><font color=\"#FFD700\">[AimAssist]</font></b> 🎯\n+ 🛠️ Fixed not working when ClickAim is enabled\n<b><font color=\"#FFD700\">[Nuker]</font></b> 💣\n+ 🛠️ Fixed functionality for reliable block breaking\n<b><font color=\"#FFD700\">[AutoClicker]</font></b> 🖱️\n+ 🛠️ Fixed automatic clicking for swords and blocks\n<b><font color=\"#FFD700\">[TriggerBot]</font></b> 🔫\n+ 🛠️ Fixed trigger mechanics for accurate activation\n<b><font color=\"#FFD700\">[AutoVoidDrop & Other Modules]</font></b> 🌌\n+ 🛠️ Fixed improper match state handling to prevent yielding\n<b><font color=\"#FFD700\">[AutoBuy]</font></b> 🛒\n+ 🛠️ Fixed purchasing logic for consistent operation","date":"26/04/2025","image":{"aspectRatio":1,"assetId":"rbxassetid://134529768377808","banner":true},"new":false,"title":"Module Fixes & OneTap Cooldown! 🚀","updateLogId":10,"visible":true},{"body":"<b><font color=\"#FFD700\">[VW PACKET, REWRITE, RISE & OLD]</font></b> 🌟\n+ ✅ Fixed Inventory issues\n+ ✅ Fixed Killaura functionality\n+ ⚡ Optimized Killaura target finding (improved performance by fixing training room dummies check)\n+ 🛠️ Fixed lagging issues caused by UI Cleanup (temporarily removed for this emergency update)\n+ ✅ Fixed AdetundeExploit attempting upgrades without a sword\n- ❌ Removed UI Cleanup (until fixed)\n- ❌ Removed Interface (until fixed)\n- ❌ Removed HitFix (until fixed)","date":"19/04/2025","image":{"aspectRatio":1,"assetId":"rbxassetid://139388446834629","banner":true},"new":false,"title":"Emergency Fixes & Optimizations 🛠️","updateLogId":9,"visible":true},{"body":"<b><font color=\"#FFD700\">[CustomChat]</font></b> - NEW! 🌟\n+ ⭐ Customise your chat for even better experience\n+ ✨ Added CustomChat module which lets you customise your chat into your very own one :D\n+ 🛠️ Added fixes to the chat tags (clan tags, etc.) not appearing when executing VW\n<b>Toggles:</b>\n+ ✅ Display Kills\n+ ✅ Display Win\n+ ✅ Display Defeat\n+ ✅ Display Bed break\n+ ✅ Typewriter effect\n\n<b><font color=\"#FFD700\">[StreamerMode]</font></b> - NEW! 🌟\n+ 🎥 Added StreamerMode which will help you when making videos/showcases/etc. by hiding your name, display name and userid (not server sided)\n\n<b><font color=\"#FFD700\">[VW PACKET]</font></b> ⭐\n<b>[AutoDodge]</b>\n+ 🛠️ Fixed not working\n\n<b><font color=\"#FFD700\">[VW PACKET, RISE, OLD & REWRITE]</font></b> ⭐\n<b>[Nuker]</b>\n+ ⚡ Optimised Nuker to now ignore other blocks if its breaking a bed\n<b>[Scaffold]</b>\n+ ✨ Added AutoSwitch toggle to automatically switch to the block being placed\n<b>[Antihit V2]</b> - NEW! 🌟\n+ 🛡️ Added Antihit V2 (In a few days i'll review what the opinions on the new antihit are and choose if I'll delete the old antihit or not)","date":"18/04/2025","image":{"aspectRatio":1,"assetId":"rbxassetid://126689006623766","banner":true,"height":0},"images":["rbxassetid://125253820043581","rbxassetid://126488166170838"],"new":false,"title":"CustomChat, StreamerMode & Antihit V2! 🌟","updateLogId":8,"video":{"image":"rbxassetid://126488166170838","url":"https://youtu.be/y04vS2_siW0"},"visible":true},{"body":"<b><font color=\"#FFD700\">[VW REWRITE, PACKET, OLD, RISE]</font></b>\n+ 🛠️ Fixed Nuker functionality for more reliable block breaking\n+ ✨ Added NoClickDelay for instant interactions\n+ 🤝 Added AutoKit for automated kit management\n\n<b><font color=\"#FFD700\">[BedProtector]</font></b>\n+ ✋ Added Hand Check to ensure correct item usage\n+ 🔄 Added AutoSwitch toggle (enabled by default) to automatically switch to the block being placed, bypassing HandCheck\n+ 🛠️ Added customizable BlockTypeCheck toggle (enabled by default) for flexible block type validation\n\n<b><font color=\"#FFD700\">[AutoWhisper]</font></b>\n+ ⚡ Optimized ground check for better performance\n+ 📏 Added Below Map Trigger toggle to activate abilities when below the map\n+ 🎚️ Added Map Threshold slider to fine-tune below-map activation\n\n<b><font color=\"#FFD700\">[BlockIn]</font></b>\n+ 🔄 Added AutoSwitch toggle (enabled by default) to automatically switch to the block being placed, bypassing HandCheck\n\n<b><font color=\"#FFD700\">[Projectile Aimbot]</font></b>\n+ 🛠️ Fixed ProjectileAimbot causing FPS drops on mobile devices\n+ 🛠️ Fixed ProjectileAimbot target visualizer running when not holding a projectile\n+ 👁️ Added TargetVisualiser toggle (enabled by default) for customizable visuals\n\n<b><font color=\"#FFD700\">[Cheat Engine Mode - VW REWRITE, OLD, PACKET, RISE]</font></b>\n+ 🛠️ Fixed Projectiles not working correctly\n+ 🎯 Added ProjectileAura support with highlight visuals for targeted entities","date":"14/04/2025","image":{"aspectRatio":1,"assetId":"rbxassetid://139573733848120","banner":true,"height":0},"images":["rbxassetid://90853197071579"],"new":false,"title":"Fixes & ProjectileAura Highlights 🚀","updateLogId":7,"video":{"image":"rbxassetid://84112738077754","url":"https://youtu.be/n2MSIKxti7s"},"visible":true},{"body":"<b><font color=\"#FFD700\">[VW REWRITE, PACKET, OLD, RISE]</font></b>\n+ 🌟 Added images to the UpdateLog\n+ 🚀 VW PACKET IS BACK!\n\n<b><font color=\"#FFD700\">[VW REWRITE, PACKET]</font></b>\n+ ⚡ Optimised the nuker A LOT\n+ 🛠️ Fixed Scaffold [WoolOnly] check\n\n<b><font color=\"#FFD700\">[VW OLD, RISE]</font></b>\n+ ✨ Added block breaking gui from VW Rewrite\n\n<b><font color=\"#FFD700\">[VW REWRITE, PACKET, OLD, RISE]</font></b>\n+ ⚡ Optimised AutoWhisper - Thanks groya9633#0\n+ 🥚 Added /eggclaim chat command to claim the Cheatcode Egg!","date":"12/04/2025","image":{"aspectRatio":1,"assetId":"rbxassetid://85850875702741","banner":true,"height":0},"images":["rbxassetid://108262912857461","rbxassetid://123355421196561"],"new":false,"title":"Images in UpdateLog + Packet Returns! 🌟","updateLogId":6,"visible":true},{"body":"<b><font color=\"#FFD700\">[VW Rewrite, Packet, Rise & Old]</font></b>\n+ 🛠️ Fixed Killaura not working properly across multiple scenarios\n+ 🛠️ Fixed DamageIndicator not rendering correctly\n\n<b><font color=\"#FFD700\">[VW Rewrite, Old & Rise]</font></b>\n+ ⚡ Optimized KillEffects and Killaura for smoother performance\n+ 🛠️ Fixed lagging issues on mobile devices when using ProjectileAimbot\n\n<b><font color=\"#FFD700\">[VW Rewrite]</font></b>\n+ 🛡️ Added error handling system to profiles saving for better reliability","date":"11/04/2025","image":{"aspectRatio":1,"assetId":"rbxassetid://114630000561755","banner":true,"height":0},"new":false,"title":"Quick Hotfixes for Stability! 🛠️","updateLogId":5,"visible":true},{"body":"<b><font color=\"#FFD700\">[VW Rewrite, Packet, Rise & Old]</font></b>\n+ 🌟 INTRODUCING: VW UPDATE LOG! Directly integrated into the script\n+ 🔄 Rewrote completely the config installer\n+ ⏳ (soon) Introducing system to share configs with friends and the Voidware community in just a few easy steps!\n\n<b><font color=\"#00FFFF\">[CORE VOIDWARE FIXES]</font></b>\n+ 🛠️ Fixed Voidware not loading on Ember Executor\n+ 🛠️ Fixed Voidware not loading on Ronix Executor\n\n<b><font color=\"#FFD700\">[VW Old & Rise]</font></b>\n+ 🛠️ Fixed Lumen, Umeko, Whim ProjectileAura not working\n+ 🤝 Added GinerBreadMan AutoKit support (auto destroys gumdrops)\n+ ✨ Added AutoSuffocate\n+ ✨ Added AutoVoidDrop\n+ 🛠️ Fixed DamageIndicator\n+ 🛠️ Fixed WeatherMods\n+ 🔄 Renamed GameFixer -> HitFix\n+ 🔄 Moved HitFix [Legit -> Combat Category]\n+ 🛠️ Fixed StaffFetcher not working\n+ 🛠️ Fixed QueueCardMods not properly updating the gradient\n+ ✨ Added AutoPearl\n+ 🛠️ Fixed Killaura breaking\n+ 🛠️ Fixed NightmareEmote sometimes breaking\n\n<b><font color=\"#FFD700\">[VW Rewrite, Packet]</font></b>\n+ 🔄 Moved HitFix [Legit -> Combat Category]\n+ 🛠️ Fixed AutoPearl\n\n<b><font color=\"#FFD700\">[CE Mode - VW Old, Rise] ⚙️</font></b>\n+ 🛠️ Fixed Killaura breaking\n\n<b><font color=\"#FFD700\">[CE Mode - VW Rewrite, Packet] ⚙️</font></b>\n+ 🛠️ Fixed Sword Animation not working on Killaura when [Swing Only] toggle is enabled\n\n<b><font color=\"#FFD700\">[VW Rewrite, Packet, Rise & Old]</font></b>\n+ 🛠️ Fixed Fly ProgressBar sometimes resulting in fps drops\n+ ✨ Added AutoWhisper - Thanks nonamebetoo#0 for making this\n+ 🛠️ Fixed StaffDetector running into issues\n+ ⚡ Fixed fps drop issues on executing Voidware\n+ ✨ Added [Wool Only] toggle to Scaffold\n\n<b><font color=\"#00FFFF\">[ProjectileAimbot Enhancements] 🎮</font></b>\n+ ⚡ Added Range Slider\n+ ✨ Added Outline creation on targets\n+ 🎯 Added Automatical Target Locking\n\n<b><font color=\"#00FFFF\">[AutoBuy Updates] 🏪</font></b>\n+ ✨ Added Buy Axolotls toggle\n+ 🔥 Added Pyro flamethrower support (will be purchased after emerald sword)\n\n<b><font color=\"#FFD700\">[CE Mode - VW Rewrite, Packet, Rise & Old] ⚙️</font></b>\n+ ✨ Added AutoSuffocate\n+ ✨ Added AutoVoidDrop\n+ 🛠️ Fixed issues with KitESP\n+ ✨ Added [Wool Only] toggle to Scaffold\n+ 🛠️ Fixed Nuker crashing on failing to break a block\n+ 🌟 Added little visualiser telling you when Nuker is breaking a block","date":"10/04/2025","image":{"aspectRatio":1,"assetId":"rbxassetid://116729730341460","banner":true,"height":0},"new":false,"title":"VW UPDATE LOG INTEGRATION + FIXES! 🚀","updateLogId":4,"visible":true},{"body":"<b><font color=\"#FFD700\">[VW Rewrite, Rise, Packet & Old]</font></b>\n+ 🛡️ Fixed BedProtector using bad blocks for bed defense & improved the \"too far\" message for better clarity\n+ 🛠️ Fixed BetterDavey not AutoShooting properly & breaking the cannon on shoot\n+ 📱 Added MobileControls to Fly for easier use on touch devices\n+ 🌟 Added Priority TextList to BedProtector to prioritise certain blocks as important layers\n\n<b><font color=\"#FFD700\">[VW Rewrite, Packet]</font></b>\n+ ⏳ Added Fly ProgressBar to Fly for a visual flight timer\n\n<b><font color=\"#FFD700\">[CE Mode - VW Rewrite, Packet] ⚙️</font></b>\n+ 🛠️ Fixed Fly, LongJump, and Scaffold GUIs not appearing\n+ 🛠️ Fixed Fly TP Down not functioning\n+ ✨ Fixed Performance issues with Ping\n\n<b><font color=\"#FFD700\">[VW Packet]</font></b>\n+ 🛠️ Fixed Fly TP Down not working","date":"2/04/2025","image":{"aspectRatio":1,"assetId":"rbxassetid://81472197220689","banner":true,"height":0},"new":false,"title":"Some fixes and life optimisations 🌟","updateLogId":3,"visible":true},{"body":"<b><font color=\"#FFD700\">[Voidware Update Log - VW Rewrite, Packet, Rise & Old Editions]</font></b>\n\n<b><font color=\"#00FFFF\">[Core Improvements] 🛠️</font></b>\n+ ✨ Added a new system to stop Voidware from loading unnecessary components, greatly improving performance and reducing crashes on low-end devices\n+ 🐛 Fixed the core switch so it now properly shows tool switching\n+ 🛠️ Fixed ShopCheck in AimAssist for better reliability\n+ ✋ Added HandCheck to BlockIn for improved accuracy\n+ 🛠️ Resolved occasional AutoBuy failures\n+ ⏳ Slowed down the core error notification for a smoother experience\n+ 🎯 Added FirstPersonCheck to AimAssist for precision\n+ 🛡️ Added an Error Handler to the GamingChair module for stability\n+ 🤝 Added Hannah AutoKit support (HannahExploit merged into it)\n- ❌ Removed HannahExploit (now part of AutoKit)\n+ 🌟 Introduced BetterDavey for a slick upgrade\n+ ⚡ BedProtector now has INF Range!\n+ ⚡ BedProtector now has CPS Slider!\n\n<b><font color=\"#00FFFF\">[Projectile Aimbot Enhancements] 🎮</font></b>\n+ ✨ Added Whim and Umeko to projectile aimbot\n\n<b><font color=\"#00FFFF\">[Projectile Aura Optimizations] 🚀</font></b>\n+ ⚡ Optimized Whim, Umeko, and Lumen for top performance\n+ 🛠️ Fixed Wallcheck to work as intended\n\n<b><font color=\"#FFD700\">[CE Mode - VW Rewrite, Packet, Rise & Old] ⚙️</font></b>\n+ 🎯 Added FirstPersonCheck to AimAssist\n+ 🛠️ Fixed AutoBuy not triggering properly\n+ 🛠️ Fixed NoFall breaking down\n+ 🛠️ Fixed AimAssist glitches\n+ 🛠️ Fixed Killaura in Legit Aura mode\n+ ⚡ Optimized Nuker for faster operation\n+ ⚡ BedProtector now has INF Range!\n+ ⚡ BedProtector now has CPS Slider!\n+ ✨ Added Legit Mode to AutoKit for safer play\n+ 🤝 Added Hannah AutoKit support (HannahExploit merged into it)\n- ❌ Removed HannahExploit (now part of AutoKit)\n\n<b><font color=\"#FFD700\">[VW Rewrite-Specific Updates] 🔧</font></b>\n+ 🛠️ Fixed ProfilesSaver so it saves correctly\n+ 🤝 Added Crypt AutoKit support\n+ 🛠️ Fixed NameTags display issues\n\n<b><font color=\"#FFD700\">[VW Packet-Specific Updates] 📦</font></b>\n! 🔄 Renamed \"Breaker\" to \"Nuker\" for clarity\n\n<b><font color=\"#FFD700\">[VW Rise & Old-Specific Updates] 🕰️</font></b>\n+ 🛠️ Fixed BlockIn functionality\n+ 🛠️ Fixed lobby loading failures\n+ 🛠️ Fixed remotes not responding\n+ 🛠️ Fixed Killaura not attacking Marina Jellyfishes\n+ 🛠️ Fixed AutoBuy consistency\n+ 🤝 Added Zeno AutoKit support\n+ 🎯 Improved Killaura MouseDown check\n- ❌ Removed ScytheExploit (patched)\n- ❌ Removed AntiLagback (patched)\n\n<b><font color=\"#FFD700\">[Code Rewrites - VW Rewrite, Packet, Rise & Old] 💻</font></b>\n+ 🔄 Rewrote QueueCardMods for better performance\n+ 🔄 Revamped HackerDetector for sharper detection\n+ ✨ Rewrote StaffDetector into StaffDetector [Enhanced] with new features\n+ 🔄 Rewrote AutoBuyDiamondUpgrades for seamless upgrades\n+ 🔄 Overhauled Invisibility for reliability\n\n<b><font color=\"#FFD700\">[VW Rise & Old-Specific Rewrites] 🕰️💻</font></b>\n+ 🔄 Rewrote HighlightVisuals for crisper visuals\n+ ✨ Upgraded StaffDetector-Roblox to StaffFetcher-Roblox with enhanced power\n+ 🔄 Revamped DamageIndicator for clearer combat feedback\n+ 🔄 Rewrote WeatherMods for better customization","date":"1/04/2025","image":{"aspectRatio":1,"assetId":"rbxassetid://120638959707703","banner":true,"height":0},"new":false,"title":"HUGE VOIDWARE UPDATE! 🚀","updateLogId":2,"visible":true},{"body":"<b><font color=\"#FFD700\">[VW REWRITE & PACKET & OLD & RISE]</font></b>\n<b><font color=\"#00FFFF\">[---- AUTOKIT UPDATE ----]</font></b>\n+ ✅ Fixed KALIYAH AutoKit\n+ ✅ Fixed MetalDetector AutoKit\n+ ✅ Fixed ElderTree AutoKit\n+ ✅ Fixed Cobalt AutoKit\n+ ✅ Fixed Zurot AutoKit\n+ ✅ Fixed Eldric AutoKit\n+ ✅ Fixed Hannah AutoKit\n+ ✅ Fixed Miner AutoKit\n\n+ ➕ Added Kaida Killaura support\n+ 🔄 ReAdded Wallcheck to Killaura\n+ 🎯 Added Testing Dummies in Testing Mode as valid targets\n+ 🛡️ Fixed Panic not disabling Profiles Saving resulting in your Profiles getting lost\n+ 🔄 Fixed BedPlates not auto updating\n+ 🏪 Added ShopCheck to AimAssist\n+ 🔴 Fixed Killaura Range Circle not being created after restarting Killaura\n+ 🛠️ Fixed not being able to build when KA Range Circle is enabled\n- ❌ Removed DoubleHighJump (patched)\n\n<b><font color=\"#00FFFF\">[---- ,,Failure fetching remote'' fixes ----]</font></b>\n+ ✅ Fixed finding WarlockTarget remote\n+ ✅ Fixed finding SpawnRaven remote\n\n<b><font color=\"#00FFFF\">[---- LAGGING ISSUES FIX ----]</font></b>\n+ ⚡ Fixed lag issues with Voidware caused by the new switchTool function\n\n<b><font color=\"#00FFFF\">[---- CORE FIX ----]</font></b>\n+ 🆕 Added a new system which will prevent Voidware from breaking every time the Bedwars devs rename something 💀\n<i>Reconfigured remotes: 15+</i>\n\n<b><font color=\"#FFD700\">[VW OLD & VW RISE]</font></b>\n+ 🔄 Rewrote AutoBuy\n\n<b><font color=\"#FFD700\">[VW OLD & RISE & REWRITE & PACKET] - CE MODE</font></b>\n+ ✅ Fixed AimAssist\n+ 🧱 Added Wallcheck to AimAssist\n+ 🏪 Added Shop Check to AimAssist\n<b><font color=\"#00FFFF\">[---- AUTOKIT UPDATE ----]</font></b>\n+ ➕ Added Eldric AutoKit\n+ ➕ Added Zeno AutoKit\n\n<b><font color=\"#FFD700\">[VW REWRITE & PACKET] - CE MODE</font></b>\n+ ✅ Fixed Limit to Items Killaura\n+ ✅ Fixed not loading in Lobby\n\n<b><font color=\"#00FFFF\">[CONFIG INSTALLER]</font></b>\n+ 🔧 The installer will now auto uninject Voidware to properly install the profiles","date":"23/03/2025","image":{"aspectRatio":1,"assetId":"rbxassetid://93751776432268","height":0},"new":false,"title":"A BIG VOIDWARE UPDATE! 🌟","updateLogId":1,"visible":true}]]==])
        
        --(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VWExtra/main/UpdateMeta.json", true))
end, 10, 3) or loadJson("VW_Update_Log.json"))

if not changelogData then warn("[VW Update Log]: Failure loading changelogData!"); return end
pcall(function() writefile("VW_Update_Log.json", HttpService:JSONEncode(changelogData)) end)

local localData = loadJson("Local_VW_Update_Log.json") or {lastRead = ""}

local function getNewestUpdate()
    for i,v in pairs(changelogData) do
        if v.new then return v end
    end
    return nil
end

local newest = getNewestUpdate()
if not newest then warn("[VW Update Log]: Failure getting newest update!"); return end

if (not (shared.UpdateLogBypass or shared.UpdateLogDevMode)) and localData.lastRead == tostring(newest.updateLogId) then return end

local NotificationSystem = {}
NotificationSystem.__index = NotificationSystem

local function getCoreGui()
    local suc, err = pcall(function()
        return game:GetService("CoreGui")
    end)
    return suc and err
end

function NotificationSystem.new()
    local self = setmetatable({}, NotificationSystem)
    self.ScreenGui = Instance.new("ScreenGui")
    self.ScreenGui.Name = "NotificationGui"
    self.ScreenGui.Parent = getCoreGui() or Players.LocalPlayer:WaitForChild("PlayerGui")
    self.ScreenGui.ResetOnSpawn = false
    self.Notifications = {}
    return self
end

local function save()
    localData.lastRead = tostring(newest.updateLogId)
    writefile("Local_VW_Update_Log.json", HttpService:JSONEncode(localData))
end

local isActive = false

function NotificationSystem:CreateNotification(title, message, isInteractive, onYes, onNo)
    repeat task.wait() until not isActive
    isActive = true
    local notificationFrame = Instance.new("Frame")
    notificationFrame.Size = UDim2.new(0, 300, 0, 120)
    notificationFrame.Position = UDim2.new(1, 20, 0, -150)
    notificationFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    notificationFrame.BorderSizePixel = 0
    notificationFrame.Parent = self.ScreenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = notificationFrame

    local blur = Instance.new("ImageLabel")
    blur.Name = "Blur"
    blur.Size = UDim2.new(1, 89, 1, 52)
    blur.Position = UDim2.fromOffset(-48, -31)
    blur.BackgroundTransparency = 1
    blur.Image = "rbxassetid://14898786664"
    blur.ScaleType = Enum.ScaleType.Slice
    blur.SliceCenter = Rect.new(52, 31, 261, 502)
    blur.Parent = notificationFrame

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -20, 0, 30)
    titleLabel.Position = UDim2.new(0, 10, 0, 10)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Font = Enum.Font.FredokaOne
    titleLabel.TextSize = 20
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = notificationFrame

    local messageLabel = Instance.new("TextLabel")
    messageLabel.Size = UDim2.new(1, -20, 0, 40)
    messageLabel.Position = UDim2.new(0, 10, 0, 40)
    messageLabel.BackgroundTransparency = 1
    messageLabel.Text = message
    messageLabel.TextColor3 = Color3.fromRGB(200, 200, 220)
    messageLabel.Font = Enum.Font.SourceSans
    messageLabel.TextSize = 16
    messageLabel.TextXAlignment = Enum.TextXAlignment.Left
    messageLabel.TextWrapped = true
    messageLabel.Parent = notificationFrame

    local tweenIn = TweenService:Create(notificationFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        Position = UDim2.new(1, -320, 0, 20)
    })
    tweenIn:Play()

    if isInteractive then
        local yesButton = Instance.new("TextButton")
        yesButton.Size = UDim2.new(0, 60, 0, 30)
        yesButton.Position = UDim2.new(0, 150, 0, 80)
        yesButton.BackgroundColor3 = Color3.fromRGB(80, 255, 80)
        yesButton.Text = "Yes"
        yesButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        yesButton.Font = Enum.Font.SourceSansBold
        yesButton.TextSize = 18
        yesButton.Parent = notificationFrame

        local yesCorner = Instance.new("UICorner")
        yesCorner.CornerRadius = UDim.new(0, 8)
        yesCorner.Parent = yesButton

        local noButton = Instance.new("TextButton")
        noButton.Size = UDim2.new(0, 60, 0, 30)
        noButton.Position = UDim2.new(0, 220, 0, 80)
        noButton.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
        noButton.Text = "No"
        noButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        noButton.Font = Enum.Font.SourceSansBold
        noButton.TextSize = 18
        noButton.Parent = notificationFrame

        local noCorner = Instance.new("UICorner")
        noCorner.CornerRadius = UDim.new(0, 8)
        noCorner.Parent = noButton

        yesButton.MouseEnter:Connect(function()
            TweenService:Create(yesButton, TweenInfo.new(0.2), { BackgroundColor3 = Color3.fromRGB(120, 255, 120) }):Play()
        end)
        yesButton.MouseLeave:Connect(function()
            TweenService:Create(yesButton, TweenInfo.new(0.2), { BackgroundColor3 = Color3.fromRGB(80, 255, 80) }):Play()
        end)
        noButton.MouseEnter:Connect(function()
            TweenService:Create(noButton, TweenInfo.new(0.2), { BackgroundColor3 = Color3.fromRGB(255, 120, 120) }):Play()
        end)
        noButton.MouseLeave:Connect(function()
            TweenService:Create(noButton, TweenInfo.new(0.2), { BackgroundColor3 = Color3.fromRGB(255, 80, 80) }):Play()
        end)

        local function closeNotification()
            local tweenOut = TweenService:Create(notificationFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                Position = UDim2.new(1, 20, 0, 20)
            })
            tweenOut:Play()
            tweenOut.Completed:Connect(function()
                notificationFrame:Destroy()
            end)
            isActive = false
        end

        yesButton.MouseButton1Click:Connect(function()
            if onYes then onYes() end
            closeNotification()
        end)
        noButton.MouseButton1Click:Connect(function()
            if onNo then onNo() end
            closeNotification()
        end)

        task.delay(15, function()
            if notificationFrame.Parent then
                closeNotification()
            end
        end)
    else
        task.delay(5, function()
            if notificationFrame.Parent then
                local tweenOut = TweenService:Create(notificationFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                    Position = UDim2.new(1, 20, 0, 20)
                })
                tweenOut:Play()
                tweenOut.Completed:Connect(function()
                    notificationFrame:Destroy()
                end)
            end
            isActive = false
        end)
    end

    table.insert(self.Notifications, notificationFrame)
    return notificationFrame
end

local function addBlur(parent)
    local blur = Instance.new('ImageLabel')
    blur.Name = 'Blur'
    blur.Size = UDim2.new(1, 89, 1, 52)
    blur.Position = UDim2.fromOffset(-48, -31)
    blur.BackgroundTransparency = 1
    blur.Image = 'rbxassetid://14898786664'
    blur.ScaleType = Enum.ScaleType.Slice
    blur.SliceCenter = Rect.new(52, 31, 261, 502)
    blur.Parent = parent
    return blur
end

local notificationSys = NotificationSystem.new()

local function createChangelogUI()
    local player = Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "ChangelogUI"
    screenGui.Parent = getCoreGui() or playerGui
    screenGui.ResetOnSpawn = false

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0.85, 0, 0.9, 0)
    mainFrame.Position = UDim2.new(0.5, 0, 1.05, 0)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0)
    mainFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    mainFrame.BorderSizePixel = 0
    mainFrame.BackgroundTransparency = 1
    mainFrame.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 20)
    corner.Parent = mainFrame

    local titleBar = Instance.new("Frame")
    titleBar.Size = UDim2.new(1, 0, 0, 40)
    titleBar.BackgroundColor3 = Color3.fromRGB(80, 80, 120)
    titleBar.BorderSizePixel = 0
    titleBar.Parent = mainFrame

    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0, 20)
    titleCorner.Parent = titleBar

    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0, 30, 0, 30)
    closeButton.Position = UDim2.new(1, -40, 0, 5)
    closeButton.BackgroundColor3 = Color3.fromRGB(129, 145, 186)
    closeButton.Text = "x"
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.Font = Enum.Font.SourceSansBold
    closeButton.TextSize = 20
    closeButton.Parent = titleBar

    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0, 8)
    closeCorner.Parent = closeButton

    local logtitle = Instance.new("TextLabel")
    logtitle.TextScaled = true
    logtitle.Font = Enum.Font.FredokaOne
    logtitle.Position = UDim2.new(0.5, 0, 0, 5)
    logtitle.AnchorPoint = Vector2.new(0.5, 0)
    logtitle.Parent = titleBar
    logtitle.Text = "VW Update Log"
    logtitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    logtitle.AutomaticSize = Enum.AutomaticSize.X
    logtitle.Size = UDim2.new(0, 100, 0, 30)
    logtitle.BackgroundTransparency = 1

    local logstroke = Instance.new("UIStroke")
    logstroke.Parent = logtitle
    logstroke.Color = Color3.fromRGB(0, 0, 0)
    logstroke.Thickness = 2

    local scrollingFrame = Instance.new("ScrollingFrame")
    scrollingFrame.Size = UDim2.new(1, -30, 1, -50)
    scrollingFrame.Position = UDim2.new(0, 19, 0, 45)
    scrollingFrame.BackgroundTransparency = 1
    scrollingFrame.BorderSizePixel = 0
    scrollingFrame.ScrollBarThickness = 10
    scrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 140)
    scrollingFrame.ScrollingEnabled = true
    scrollingFrame.ScrollingDirection = Enum.ScrollingDirection.Y
    scrollingFrame.Parent = mainFrame

    local listLayout = Instance.new("UIListLayout")
    listLayout.Padding = UDim.new(0, 15)
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.Parent = scrollingFrame

    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    local mainTween = TweenService:Create(mainFrame, tweenInfo, {
        Position = UDim2.new(0.5, 0, 0.05, 0),
        BackgroundTransparency = 0
    })
    mainTween:Play()

    closeButton.MouseEnter:Connect(function()
        TweenService:Create(closeButton, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(255, 80, 80)
        }):Play()
    end)
    closeButton.MouseLeave:Connect(function()
        TweenService:Create(closeButton, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(129, 145, 186)
        }):Play()
    end)

    local function createUpdateEntry(updateData)
        if not updateData.visible then return end

        local entryFrame = Instance.new("Frame")
        entryFrame.BackgroundColor3 = Color3.fromRGB(70, 70, 100)
        entryFrame.BorderSizePixel = 0
        entryFrame.BackgroundTransparency = 1

        local entryCorner = Instance.new("UICorner")
        entryCorner.CornerRadius = UDim.new(0, 15)
        entryCorner.Parent = entryFrame

        local titleLabel = Instance.new("TextLabel")
        titleLabel.Size = UDim2.new(0.6, 0, 0, 50)
        titleLabel.Position = UDim2.new(0, 15, 0, 15)
        titleLabel.BackgroundTransparency = 1
        titleLabel.Text = updateData.title
        titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        titleLabel.Font = Enum.Font.SourceSansBold
        titleLabel.TextSize = 32
        titleLabel.TextXAlignment = Enum.TextXAlignment.Left
        titleLabel.Parent = entryFrame

        local dateLabel = Instance.new("TextLabel")
        dateLabel.Size = UDim2.new(0, 240, 0, 30)
        dateLabel.Position = UDim2.new(0, 15, 0, 65)
        dateLabel.BackgroundTransparency = 1
        dateLabel.Text = updateData.date
        dateLabel.TextColor3 = Color3.fromRGB(200, 200, 220)
        dateLabel.Font = Enum.Font.SourceSans
        dateLabel.TextSize = 20
        dateLabel.TextXAlignment = Enum.TextXAlignment.Left
        dateLabel.Parent = entryFrame

        if updateData.new then
            local newBadge = Instance.new("TextLabel")
            newBadge.Size = UDim2.new(0, 80, 0, 30)
            newBadge.Position = UDim2.new(0, 265, 0, 65)
            newBadge.BackgroundColor3 = Color3.fromRGB(80, 255, 80)
            newBadge.Text = "NEW"
            newBadge.TextColor3 = Color3.fromRGB(255, 255, 255)
            newBadge.Font = Enum.Font.SourceSansBold
            newBadge.TextSize = 18
            newBadge.Parent = entryFrame

            addBlur(newBadge)

            local badgeStroke = Instance.new("UIStroke", newBadge)

            local badgeCorner = Instance.new("UICorner")
            badgeCorner.CornerRadius = UDim.new(0, 8)
            badgeCorner.Parent = newBadge

            newBadge.MouseEnter:Connect(function()
                local hoverTween = TweenService:Create(newBadge, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    Size = UDim2.new(0, 90, 0, 34),
                    BackgroundColor3 = Color3.fromRGB(120, 255, 120)
                })
                local strokeTween = TweenService:Create(badgeStroke, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    Thickness = 2
                })
                hoverTween:Play()
                strokeTween:Play()

                task.spawn(function()
                    while newBadge:IsDescendantOf(game) do
                        TweenService:Create(newBadge, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                            BackgroundColor3 = Color3.fromRGB(80, 255, 80)
                        }):Play()
                        task.wait(0.5)
                        TweenService:Create(newBadge, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                            BackgroundColor3 = Color3.fromRGB(120, 255, 120)
                        }):Play()
                        task.wait(0.5)
                    end
                end)
            end)

            newBadge.MouseLeave:Connect(function()
                local leaveTween = TweenService:Create(newBadge, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    Size = UDim2.new(0, 80, 0, 30),
                    BackgroundColor3 = Color3.fromRGB(80, 255, 80)
                })
                local strokeTween = TweenService:Create(badgeStroke, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    Thickness = 1
                })
                leaveTween:Play()
                strokeTween:Play()
            end)
        end

        local videoYPosition = 15
        if updateData.image and updateData.image.assetId then
            local imageLabel = Instance.new("ImageLabel")
            imageLabel.Size = UDim2.new(0, updateData.image.banner and 200 or 100, 0, 100 * updateData.image.aspectRatio)
            imageLabel.Position = UDim2.new(1, updateData.image.banner and -220 or -120, 0, 15)
            imageLabel.BackgroundTransparency = 1
            imageLabel.Image = updateData.image.assetId
            imageLabel.Parent = entryFrame

            addBlur(imageLabel)

            local imageCorner = Instance.new("UICorner")
            imageCorner.CornerRadius = UDim.new(0, 8)
            imageCorner.Parent = imageLabel

            videoYPosition = videoYPosition + (updateData.image.banner and 200 or 100) + 15
        end

        if updateData.video and type(updateData.video) == "table" then
            if not updateData.videos then
                updateData.videos = {}
            end
            table.insert(updateData.videos, updateData.video)
            updateData.video = nil
        end

        --[[if updateData.video and type(updateData.video) == "table" and updateData.video.url and updateData.video.image then
            local thumbnailLabel = Instance.new("ImageLabel")
            thumbnailLabel.Size = UDim2.new(0, 240, 0, 135)
            thumbnailLabel.Position = UDim2.new(1, -260, 0, videoYPosition)
            thumbnailLabel.BackgroundTransparency = 1
            thumbnailLabel.Image = updateData.video.image
            thumbnailLabel.Parent = entryFrame

            addBlur(thumbnailLabel)

            local thumbnailCorner = Instance.new("UICorner")
            thumbnailCorner.CornerRadius = UDim.new(0, 8)
            thumbnailCorner.Parent = thumbnailLabel

            local showcaseLabel = Instance.new("TextLabel")
            showcaseLabel.Size = UDim2.new(0, 240, 0, 30)
            showcaseLabel.Position = UDim2.new(1, -260, 0, videoYPosition + 135 + 15)
            showcaseLabel.BackgroundTransparency = 1
            showcaseLabel.Text = "Showcase Available"
            showcaseLabel.TextColor3 = Color3.fromRGB(200, 200, 220)
            showcaseLabel.Font = Enum.Font.SourceSans
            showcaseLabel.TextSize = 20
            showcaseLabel.TextXAlignment = Enum.TextXAlignment.Left
            showcaseLabel.Parent = entryFrame

            local copyButton = Instance.new("TextButton")
            copyButton.Size = UDim2.new(0, 120, 0, 30)
            copyButton.Position = UDim2.new(1, -260, 0, videoYPosition + 135 + 45)
            copyButton.BackgroundColor3 = Color3.fromRGB(80, 120, 255)
            copyButton.Text = "Copy Video URL"
            copyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            copyButton.Font = Enum.Font.SourceSansBold
            copyButton.TextSize = 18
            copyButton.Parent = entryFrame

            local copyCorner = Instance.new("UICorner")
            copyCorner.CornerRadius = UDim.new(0, 8)
            copyCorner.Parent = copyButton

            addBlur(copyButton)

            local copyStroke = Instance.new("UIStroke", copyButton)
            copyStroke.Thickness = 1

            copyButton.MouseEnter:Connect(function()
                TweenService:Create(copyButton, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    Size = UDim2.new(0, 130, 0, 34),
                    BackgroundColor3 = Color3.fromRGB(120, 160, 255)
                }):Play()
                TweenService:Create(copyStroke, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    Thickness = 2
                }):Play()
            end)

            copyButton.MouseLeave:Connect(function()
                TweenService:Create(copyButton, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    Size = UDim2.new(0, 120, 0, 30),
                    BackgroundColor3 = Color3.fromRGB(80, 120, 255)
                }):Play()
                TweenService:Create(copyStroke, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    Thickness = 1
                }):Play()
            end)

            copyButton.MouseButton1Click:Connect(function()
                local success, err = pcall(function()
                    setclipboard(updateData.video.url)
                end)
                if success then
                    print("Copied video URL to clipboard: ", updateData.video.url)
					copyButton.Text = "Copied!"
					task.delay(0.5, function()
						copyButton.Text = "Copy Video URL"
					end)
                else
                    warn("Failed to copy video URL: ", err)
                end
            end)
        end--]]

        if updateData.videos and type(updateData.videos) == "table" and #updateData.videos > 0 then
            local currentY = videoYPosition
            for i, videoData in ipairs(updateData.videos) do
                if videoData.url and videoData.image then
                    local thumbnailLabel = Instance.new("ImageLabel")
                    thumbnailLabel.Size = UDim2.new(0, 240, 0, 135)
                    thumbnailLabel.Position = UDim2.new(1, -260, 0, currentY)
                    thumbnailLabel.BackgroundTransparency = 1
                    thumbnailLabel.Image = videoData.image
                    thumbnailLabel.Parent = entryFrame
        
                    addBlur(thumbnailLabel)
        
                    local thumbnailCorner = Instance.new("UICorner")
                    thumbnailCorner.CornerRadius = UDim.new(0, 8)
                    thumbnailCorner.Parent = thumbnailLabel
        
                    local showcaseLabel = Instance.new("TextLabel")
                    showcaseLabel.Size = UDim2.new(0, 240, 0, 30)
                    showcaseLabel.Position = UDim2.new(1, -260, 0, currentY + 135 + 15)
                    showcaseLabel.BackgroundTransparency = 1
                    showcaseLabel.Text = videoData.title or "Showcase " .. i
                    showcaseLabel.TextColor3 = Color3.fromRGB(200, 200, 220)
                    showcaseLabel.Font = Enum.Font.SourceSans
                    showcaseLabel.TextSize = 20
                    showcaseLabel.TextXAlignment = Enum.TextXAlignment.Left
                    showcaseLabel.Parent = entryFrame
        
                    local copyButton = Instance.new("TextButton")
                    copyButton.Size = UDim2.new(0, 120, 0, 30)
                    copyButton.Position = UDim2.new(1, -260, 0, currentY + 135 + 45)
                    copyButton.BackgroundColor3 = Color3.fromRGB(80, 120, 255)
                    copyButton.Text = "Copy Video URL"
                    copyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                    copyButton.Font = Enum.Font.SourceSansBold
                    copyButton.TextSize = 18
                    copyButton.Parent = entryFrame
        
                    local copyCorner = Instance.new("UICorner")
                    copyCorner.CornerRadius = UDim.new(0, 8)
                    copyCorner.Parent = copyButton
        
                    addBlur(copyButton)
        
                    local copyStroke = Instance.new("UIStroke", copyButton)
                    copyStroke.Thickness = 1
        
                    copyButton.MouseEnter:Connect(function()
                        TweenService:Create(copyButton, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                            Size = UDim2.new(0, 130, 0, 34),
                            BackgroundColor3 = Color3.fromRGB(120, 160, 255)
                        }):Play()
                        TweenService:Create(copyStroke, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                            Thickness = 2
                        }):Play()
                    end)
        
                    copyButton.MouseLeave:Connect(function()
                        TweenService:Create(copyButton, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                            Size = UDim2.new(0, 120, 0, 30),
                            BackgroundColor3 = Color3.fromRGB(80, 120, 255)
                        }):Play()
                        TweenService:Create(copyStroke, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                            Thickness = 1
                        }):Play()
                    end)
        
                    copyButton.MouseButton1Click:Connect(function()
                        local success, err = pcall(function()
                            setclipboard(videoData.url)
                        end)
                        if success then
                            print("Copied video URL to clipboard: ", videoData.url)
                            copyButton.Text = "Copied!"
                            task.delay(0.5, function()
                                copyButton.Text = "Copy Video URL"
                            end)
                        else
                            warn("Failed to copy video URL: ", err)
                        end
                    end)
        
                    currentY = currentY + 135 + 90
                end
            end
        end

        local bodyLabel = Instance.new("TextLabel")
        bodyLabel.Size = UDim2.new(1, -280, 0, 0)
        bodyLabel.Position = UDim2.new(0, 15, 0, 110)
        bodyLabel.BackgroundTransparency = 1
        bodyLabel.Text = updateData.body
        bodyLabel.TextColor3 = Color3.fromRGB(230, 230, 255)
        bodyLabel.Font = Enum.Font.SourceSans
        bodyLabel.TextSize = 22
        bodyLabel.TextXAlignment = Enum.TextXAlignment.Left
        bodyLabel.TextYAlignment = Enum.TextYAlignment.Top
        bodyLabel.TextWrapped = true
        bodyLabel.RichText = true
        bodyLabel.Parent = entryFrame

        task.wait()
        local textHeight = bodyLabel.TextBounds.Y
        if textHeight == 0 then
            local lineCount = select(2, updateData.body:gsub("\n", "")) + 1
            textHeight = lineCount * bodyLabel.TextSize
        end
        local padding = 125

        local imageScrollingFrame = nil
        if updateData.images and type(updateData.images) == "table" and #updateData.images > 0 then
            imageScrollingFrame = Instance.new("ScrollingFrame")
            imageScrollingFrame.Size = UDim2.new(1, -280, 0, 180)
            imageScrollingFrame.Position = UDim2.new(0, 15, 0, 110 + textHeight + 15)
            imageScrollingFrame.BackgroundTransparency = 1
            imageScrollingFrame.BorderSizePixel = 0
            imageScrollingFrame.ScrollBarThickness = 8
            imageScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 140)
            imageScrollingFrame.ScrollingDirection = Enum.ScrollingDirection.X
            imageScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
            imageScrollingFrame.Parent = entryFrame

            local imageListLayout = Instance.new("UIListLayout")
            imageListLayout.FillDirection = Enum.FillDirection.Horizontal
            imageListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            imageListLayout.Padding = UDim.new(0, 10)
            imageListLayout.Parent = imageScrollingFrame

            for i, imageAsset in ipairs(updateData.images) do
                local imageLabel = Instance.new("ImageLabel")
                imageLabel.Size = UDim2.new(0, 300, 0, 169)
                imageLabel.BackgroundTransparency = 1
                imageLabel.Image = imageAsset
                imageLabel.Parent = imageScrollingFrame

                local imageCorner = Instance.new("UICorner")
                imageCorner.CornerRadius = UDim.new(0, 8)
                imageCorner.Parent = imageLabel

                addBlur(imageLabel)
            end

            local imageCount = #updateData.images
            imageScrollingFrame.CanvasSize = UDim2.new(0, (300 * imageCount) + (10 * (imageCount - 1)), 0, 169)
            padding = padding + 180 + 15
        end

        bodyLabel.Size = UDim2.new(1, -280, 0, textHeight)
        entryFrame.Size = UDim2.new(1, 0, 0, textHeight + padding)

        entryFrame.Parent = scrollingFrame
        local entryTween = TweenService:Create(entryFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundTransparency = 0
        })
        entryTween:Play()

        task.spawn(function()
            task.wait(0.1)
            local finalHeight = bodyLabel.TextBounds.Y
            if finalHeight ~= textHeight then
                bodyLabel.Size = UDim2.new(1, -280, 0, finalHeight)
                if imageScrollingFrame then
                    imageScrollingFrame.Position = UDim2.new(0, 15, 0, 110 + finalHeight + 15)
                end
                local newPadding = padding - textHeight + finalHeight
                entryFrame.Size = UDim2.new(1, 0, 0, finalHeight + newPadding)
                scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 30)
            end
        end)
    end

    for _, update in ipairs(changelogData) do
        createUpdateEntry(update)
        task.wait(0.1)
    end

    task.wait()
    scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 30)

    closeButton.MouseButton1Click:Connect(function()
        local closeTween = TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
            Position = UDim2.new(0.5, 0, 1.05, 0),
            BackgroundTransparency = 1
        })
        closeTween:Play()
        closeTween.Completed:Connect(function()
            screenGui:Destroy()
            save()
        end)
    end)
end

notificationSys:CreateNotification(
    "New Patch Note!",
    "A new patch note (" .. (newest.title or "v" .. newest.updateLogId) .. ") is available! Open the changelog?",
    true,
    function()
        createChangelogUI()
    end,
    function()
        save()
        shared.UPDATE_LOG_EXECUTED = false
    end
)
