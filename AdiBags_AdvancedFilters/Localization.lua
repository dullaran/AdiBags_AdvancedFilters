--[[
AdiBags_Garrison - Adds Garrison group in your bags, using AdiBags inventory manager.
Copyright 2016 Kiber_ (4thekiber@gmail.com)
All rights reserved.
--]]

local AddonName, AddonTable = ...

local L = setmetatable({}, {
	__index = function(self, key)
		if key ~= nil then
			--[===[@debug@
			AddonTable:Debug('Missing locale', tostring(key))
			--@end-debug@]===]
			rawset(self, key, tostring(key))
		end
		return tostring(key)
	end,
})
AddonTable.L = L

local locale = GetLocale()

------------------------ enUS ------------------------

L['Expansion prefix']
L['Displays prefix of expansion before category name']
L['Organize by expansion']
L['Group items according to the expansion that have been released']
L['Force the organization by expansion']
L['Force grouping items so that they are sorted according to the expansion']
L['Set as: Old expansion']
L['Groups items from the following expansions as: Old expansion']
L['Force Old expansion group']
L['Force grouping from the following expansions as: Old expansion']
L['Force subgroup']
L['This category will stay in a separate group (takes precedence over all other forcing tags)']
L['Split: ']
L['Includes the following subcategories in the main filter']
L['Divides the following subcategories into specific filters']

------------------------ frFR ------------------------
if locale == "frFR" then


------------------------ deDE ------------------------
elseif locale == "deDE" then

------------------------ esMX ------------------------
elseif locale == "esMX" then


------------------------ ruRU ------------------------
elseif locale == "ruRU" then


------------------------ esES ------------------------
elseif locale == "esES" then


------------------------ zhTW ------------------------
elseif locale == "zhTW" then


------------------------ zhCN ------------------------
elseif locale == "zhCN" then


------------------------ koKR ------------------------
elseif locale == "koKR" then


end

-- Replace remaining true values by their key
for k,v in pairs(L) do if v == true then L[k] = k end end