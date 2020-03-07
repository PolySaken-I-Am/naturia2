local modpath=minetest.get_modpath("naturia2")
local worldpath=minetest.get_worldpath()

naturia={worldpath=worldpath, modpath=modpath, expowers={}}

dofile(modpath.."/nodes.lua")
dofile(modpath.."/craft.lua")
dofile(modpath.."/items.lua")
if minetest.get_modpath("guidebooks") then
	dofile(modpath.."/guide.lua")
end
dofile(modpath.."/rcraft.lua")