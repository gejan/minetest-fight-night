
--= Hypericum

-- Hypericum Seed

farming.register_plant("hypericum", {
	description = "Hypericum Seed",
	inventory_image = "hypericum_seed.png",
	steps = 4,	
	minlight = 13,
	maxlight = default.LIGHT_MAX
})


-- Harvested Hypericum Blossom

minetest.register_craftitem("hypericum:hypericum", {
	description = "Hypericum",
	inventory_image = "hypericum.png",
})


--------------------------------------------------

-- Tea

minetest.register_craftitem("hypericum:tea", {
	description = "Hypericum Tea",
	inventory_image = "hypericum_tea.png",
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
	output = "hypericum:tea",
	recipe = {
		{"vessels:drinking_glass", "hypericum:hypericum","bucket:bucket_water"},
		{"","",""},
		{"","",""}
	},
	replacements = {{"bucket:bucket_water", "bucket:bucket_empty"}}
})


--------------------------------------------------------


-- Change Drop


minetest.register_node(":farming:hypericum_4", {
	drop = {
		items = {
			{items = {'farming:hypericum'}, rarity = 1},
			{items = {'farming:hypericum'}, rarity = 3},
			{items = {'farming:seed_hypericum'}, rarity = 1},
			{items = {'farming:seed_hypericum'}, rarity = 3},
		}
	},
})






