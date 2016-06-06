--Torch

-- time of an event
extinction_time = 10
-- chance of a single step on event
extinction_chance = 3


-- nodes
-- *

minetest.override_item("default:torch", {
	inventory_image = "extinction_torch_inv.png",
	wield_image = "extinction_torch_inv.png",
	groups = {choppy=2,dig_immediate=3,flammable=1,attached_node=1,torch=1},
	drop = "extinction:torch_1"
})

minetest.register_node("extinction:torch_1", {
	description = "Torch",
	drawtype = "torchlike",
	tiles = {
		{
			name = "default_torch_on_floor_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0
			},
		},
		{
			name="default_torch_on_ceiling_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0
			},
		},
		{
			name="default_torch_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0
			},
		},
	},
	inventory_image = "extinction_torch_inv_1.png",
	wield_image = "extinction_torch_inv_1.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	light_source = default.LIGHT_MAX - 2,
	selection_box = {
		type = "wallmounted",
		wall_top = {-0.1, 0.5-0.6, -0.1, 0.1, 0.5, 0.1},
		wall_bottom = {-0.1, -0.5, -0.1, 0.1, -0.5+0.6, 0.1},
		wall_side = {-0.5, -0.3, -0.1, -0.5+0.3, 0.3, 0.1},
	},
	groups = {choppy=2,dig_immediate=3,flammable=1,attached_node=1,torch=1},
	legacy_wallmounted = true,
	sounds = default.node_sound_defaults(),
	drop = "extinction:torch_2"
})

minetest.register_node("extinction:torch_2", {
	description = "Torch",
	drawtype = "torchlike",
	tiles = {
		{
			name = "default_torch_on_floor_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0
			},
		},
		{
			name="default_torch_on_ceiling_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0
			},
		},
		{
			name="default_torch_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0
			},
		},
	},
	inventory_image = "extinction_torch_inv_2.png",
	wield_image = "extinction_torch_inv_2.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	light_source = default.LIGHT_MAX - 2,
	selection_box = {
		type = "wallmounted",
		wall_top = {-0.1, 0.5-0.6, -0.1, 0.1, 0.5, 0.1},
		wall_bottom = {-0.1, -0.5, -0.1, 0.1, -0.5+0.6, 0.1},
		wall_side = {-0.5, -0.3, -0.1, -0.5+0.3, 0.3, 0.1},
	},
	groups = {choppy=2,dig_immediate=3,flammable=1,attached_node=1,torch=1},
	legacy_wallmounted = true,
	sounds = default.node_sound_defaults(),
	drop = "extinction:torch_extinct"
})

minetest.register_node("extinction:torch_extinct", {
	description = "Torch",
	drawtype = "torchlike",
	tiles = {
		{name = "extinction_torch_on_floor.png",},
		{name = "extinction_torch_on_ceiling.png",},
		{name = "extinction_torch.png",},},
	inventory_image = "extinction_torch_on_floor.png",
	wield_image = "extinction_torch_on_floor.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "wallmounted",
		wall_top = {-0.1, 0.5-0.6, -0.1, 0.1, 0.5, 0.1},
		wall_bottom = {-0.1, -0.5, -0.1, 0.1, -0.5+0.6, 0.1},
		wall_side = {-0.5, -0.3, -0.1, -0.5+0.3, 0.3, 0.1},
	},
	groups = {choppy=2,dig_immediate=3,flammable=1,attached_node=1},
	legacy_wallmounted = true,
	sounds = default.node_sound_defaults(),
	drop = "default:stick"
})


-- ABM
-- *

minetest.register_abm({
nodenames = {"default:torch"},
interval = extinction_time,
chance = extinction_chance,
action = function(pos, node, active_object_count, active_object_count_wider)
local replace = node
replace.name = "extinction:torch_1"
minetest.set_node({x = pos.x, y=pos.y, z=pos.z}, replace)
end})

minetest.register_abm({
nodenames = {"extinction:torch_1"},
interval = extinction_time,
chance = extinction_chance,
action = function(pos, node, active_object_count, active_object_count_wider)
local replace = node
replace.name = "extinction:torch_2"
minetest.set_node({x = pos.x, y=pos.y, z=pos.z}, replace)
end})

minetest.register_abm({
nodenames = {"extinction:torch_2"},
interval = extinction_time,
chance = extinction_chance,
action = function(pos, node, active_object_count, active_object_count_wider)
local replace = node
replace.name = "extinction:torch_extinct"
minetest.set_node({x = pos.x, y=pos.y, z=pos.z}, replace)
end})




