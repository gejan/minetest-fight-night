minetest.register_node("technic_light:radioluminescent_stick", {
	description = "Radioluminescent Stick",
	drawtype = "torchlike",
	tiles = {
		{name = "technic_rl_stick_on_floor.png"},
		{name = "technic_rl_stick_on_ceiling.png"},
		{name = "technic_rl_stick.png"}},              
	inventory_image = "technic_rl_stick_on_floor.png",
	wield_image = "technic_rl_stick_on_floor.png",
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
	groups = {choppy=2,dig_immediate=3,attached_node=1},
	legacy_wallmounted = true,
	sounds = default.node_sound_defaults(),
	drop = "technic_light:radioluminescent_stick"
})

minetest.register_node("technic_light:radioluminescent", {
	description = "Radioluminescent Stone",
	groups = {cracky=2,},
	sunlight_propagates = true,
	light_source = default.LIGHT_MAX - 2,
	paramtype = "light",
	drawtype = "allfaces",
	tiles = {"technic_light_radioluminescent.png"},
	sounds = default.node_sound_stone_defaults(),
	drop = "technic_light:radioluminescent", 
})


minetest.register_node("technic_light:phosphorescent_day", {
	description = "Phosphorescent Stone",
	groups = {cracky=2, not_in_creative_inventory=1},
	sunlight_propagates = false,
	paramtype = "light",
	drawtype = "allfaces",
	tiles = {"technic_light_phosphorescent.png"},
	sounds = default.node_sound_stone_defaults(),
	drop = "technic_light:phosphorescent_night_off", 
})

minetest.register_node("technic_light:phosphorescent_night_on", {
	description = "Phosphorescent Stone",
	groups = {cracky=2, not_in_creative_inventory=1},
	sunlight_propagates = false,
	paramtype = "light",
	light_source = technic_light_switch - 1,
	drawtype = "allfaces",
	tiles = {"technic_light_phosphorescent.png"},
	sounds = default.node_sound_stone_defaults(),
	drop = "technic_light:phosphorescent_night_off", 
})

minetest.register_node("technic_light:phosphorescent_night_off", {
	description = "Phosphorescent Stone",
	groups = {cracky=2},
	sunlight_propagates = false,
	paramtype = "light",
	drawtype = "allfaces",
	tiles = {"technic_light_phosphorescent.png"},
	sounds = default.node_sound_stone_defaults(),
	drop = "technic_light:phosphorescent_night_off", 
})








