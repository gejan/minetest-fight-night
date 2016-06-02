--Pumpkin

local extinction_time = 5
local extinction_chance = 2
local extinction_steps = 20


-- nodes
-- *

minetest.register_node(":farming:jackolantern_on", {
	description = "Jack 'O Lantern",
	tiles = {
		"farming_pumpkin_top.png",
		"farming_pumpkin_top.png",
		"farming_pumpkin_side.png",
		"farming_pumpkin_side.png",
		"farming_pumpkin_side.png",
		"farming_pumpkin_face_on.png"
	},
	light_source = default.LIGHT_MAX - 1,
	paramtype1 = "none", --is used by extinction
	paramtype2 = "facedir",
	groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	drop = "extinction:jackolantern_empty",
	on_punch = function(pos, node, puncher)
		node.name = "farming:jackolantern"
		minetest.set_node(pos, node)
	end,
})

minetest.register_node(":farming:jackolantern", {
	description = "Jack 'O Lantern",
	tiles = {
		"farming_pumpkin_top.png",
		"farming_pumpkin_top.png",
		"farming_pumpkin_side.png",
		"farming_pumpkin_side.png",
		"farming_pumpkin_side.png",
		"farming_pumpkin_face_off.png"
	},
	-- param1 is used by extinction
	paramtype2 = "facedir",
	groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_punch = function(pos, node, puncher)
		node.name = "farming:jackolantern_on"
		minetest.set_node(pos, node)
	end,
	drop = "extinction:jackolantern_empty",
})

minetest.register_node("extinction:jackolantern_empty", {
	description = "Empty Jack 'O Lantern",
	tiles = {
		"farming_pumpkin_top.png",
		"farming_pumpkin_top.png",
		"farming_pumpkin_side.png",
		"farming_pumpkin_side.png",
		"farming_pumpkin_side.png",
		"farming_pumpkin_face_off.png"
	},
	paramtype2 = "facedir",
	groups = {choppy = 1, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
})



-- ABM
-- *

minetest.register_abm({
nodenames = {"farming:jackolantern_on"},
interval = extinction_time,
chance = extinction_chance,
action = function(pos, node, active_object_count, active_object_count_wider)
if node.param1 then
	node.param1 = node.param1 + 1
else
	node.param1 = 0
end
if node.param1 > extinction_steps then
	node.name = "extinction:jackolantern_empty"
end
minetest.set_node({x = pos.x, y=pos.y, z=pos.z}, node)
end})


-- crafting
-- *

minetest.register_craft({
	output = "farming:jackolantern",
	type = "shapeless",
	recipe = {"extinction:jackolantern_empty","default:torch"}
})




