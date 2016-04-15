
--= Hypericum

-- Hypericum Seed

--minetest.register_craftitem("farming:seed_hypericum", {
--	description = "Hypericum Seed",
--	inventory_image = "farming_hypericum_seed.png",
--	on_place = function(itemstack, placer, pointed_thing)
--		return farming.place_seed(itemstack, placer, pointed_thing, "farming:hypericum_1")
--	end,
--})

minetest.register_node("farming:seed_hypericum", {
	description = "Hypericum Seed",
	tiles = {"farming_hypericum_seed.png"},
	inventory_image = "farming_hypericum_seed.png",
	wield_image = "farming_hypericum_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:hypericum_1")
	end,
})

-- Harvested Hypericum

minetest.register_craftitem("farming:hypericum", {
	description = "Hypericum",
	inventory_image = "farming_hypericum.png",
})


--------------------------------------------------

-- Tea

minetest.register_craftitem("farming:hypericum_tea", {
	description = "Hypericum Tea",
	inventory_image = "farming_hypericum_tea.png",
	stack_max = 1,
	on_use = function (itemstack, player, pointing)
--[[		
local value = persistent_player_attributes.get_value(player ,'bewarethedark_sanity')
value = value + 2
if value > 20 then
	value = 20
--]]--replaced by:
playereffects.apply_effect_type("photox", 120, player)
playereffects.apply_effect_type("sense", 45, player)
--replaced end

end
persistent_player_attributes.set_value(player,'bewarethedark_sanity',value)

return ItemStack("vessels:drinking_glass")

end,
})


minetest.register_craft( {
	output = "farming:hypericum_tea",
	recipe = {
		{"vessels:drinking_glass", "farming:hypericum","bucket:bucket_water"},
		{"","",""},
		{"","",""}
	},
	replacements = {{"bucket:bucket_water", "bucket:bucket_empty"}}
})


--------------------------------------------------------


-- Define Hypericum growth stages

minetest.register_node("farming:hypericum_1", {
	drawtype = "plantlike",
	tiles = {"farming_hypericum_1.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	drop = "",
	selection_box = farming.select,
	groups = {
		snappy = 3, flammable = 2, plant = 1, attached_node = 1,
		not_in_creative_inventory = 1, growing=1
	},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming:hypericum_2", {
	drawtype = "plantlike",
	tiles = {"farming_hypericum_2.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	drop = "",
	selection_box = farming.select,
	groups = {
		snappy = 3, flammable = 2, plant = 1, attached_node = 1,
		not_in_creative_inventory = 1, growing = 1
	},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming:hypericum_3", {
	drawtype = "plantlike",
	tiles = {"farming_hypericum_3.png"},
	paramtype = "light",
	sunlight_propagates = true,
	waving = 1,
	walkable = false,
	buildable_to = true,
	drop = "",
	selection_box = farming.select,
	groups = {
		snappy = 3, flammable = 2, plant = 1, attached_node = 1,
		not_in_creative_inventory = 1, growing = 1
	},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming:hypericum_4", {
	drawtype = "plantlike",
	tiles = {"farming_hypericum_4.png"},
	paramtype = "light",
	sunlight_propagates = true,
	waving = 1,
	walkable = false,
	buildable_to = true,
	drop = {
		items = {
			{items = {'farming:hypericum'}, rarity = 1},
			{items = {'farming:hypericum'}, rarity = 3},
			{items = {'farming:seed_hypericum'}, rarity = 1},
			{items = {'farming:seed_hypericum'}, rarity = 3},
		}
	},

	selection_box = farming.select,
	groups = {
		snappy = 3, flammable = 2, plant = 1, attached_node = 1,
		not_in_creative_inventory = 1
	},
	sounds = default.node_sound_leaves_defaults(),
})






