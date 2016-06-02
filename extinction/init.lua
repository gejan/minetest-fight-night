-- Minetest Extinction Mod
-- by Gerald



dofile(minetest.get_modpath("extinction").."/torch.lua")

if farming.mod == "redo" then
	dofile(minetest.get_modpath("extinction").."/pumpkin.lua")
end

