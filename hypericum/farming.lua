
--= Hypericum

-- Plant
-- *

--items will be overwritten by farming

--seed
minetest.register_node("hypericum:seed_hypericum", {})

minetest.register_node("hypericum:hypericum_1", {})

minetest.register_node("hypericum:hypericum_2", {})

minetest.register_node("hypericum:hypericum_3", {})

minetest.register_node("hypericum:hypericum_4", {})


-- Harvested Hypericum Blossom

minetest.register_craftitem("hypericum:hypericum", {})


farming.register_plant("hypericum:hypericum", {
	description = "Hypericum Seed",
	
	inventory_image = "hypericum_seed.png",
	steps = 4,	
	minlight = 13,
	maxlight = default.LIGHT_MAX
})



-- Tea
-- *

minetest.register_craftitem("hypericum:tea", {
	description = "Hypericum Tea",
	inventory_image = "hypericum_tea.png",
	stack_max = 1,
	on_use = function (itemstack, player, pointing)
		playereffects.apply_effect_type("photox", 120, player)
		playereffects.apply_effect_type("sense", 10, player)
		return ItemStack("vessels:drinking_glass")
	end,
})


minetest.register_craft( {
	output = "hypericum:tea",
	recipe = {
		{"vessels:drinking_glass", "hypericum:hypericum","bucket:bucket_water"},
		{"","",""},
		{"","",""}
	},
	replacements = {{"bucket:bucket_water", "bucket:bucket_empty"}}
})




