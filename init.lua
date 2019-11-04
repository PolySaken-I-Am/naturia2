local modpath=minetest.get_modpath("naturia2")
local worldpath=minetest.get_worldpath()

naturia={worldpath=worldpath, modpath=modpath}

dofile(modpath.."/nodes.lua")
dofile(modpath.."/craft.lua")
dofile(modpath.."/items.lua")