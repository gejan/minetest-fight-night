-- Minetest Technic Light Mod
-- by Gerald

local modpath = minetest.get_modpath("technic_light")

--lamps
dofile(modpath.."/register_lamp.lua")
dofile(modpath.."/lamps.lua")
dofile(modpath.."/spotlight.lua")

dofile(modpath.."/phosphorescent_abm.lua")

dofile(modpath.."/nodes.lua")
dofile(modpath.."/crafting.lua")

if minetest.registered_tools["technic:flashlight"] then
	dofile(modpath.."/flashlight.lua")
end




