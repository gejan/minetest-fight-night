minetest.register_craftitem("technic_light:zinc_sulphide", {
	description = "Zinc Sulphide",
	inventory_image = "technic_light_zinc_sulphide.png",
})

minetest.register_craftitem("technic_light:radioluminescent_paint", {
	description = "Radioluminescent Paint",
	inventory_image = "technic_light_radioluminescent_paint.png",
})

minetest.register_craftitem("technic_light:phosphorescent_paint", {
	description = "Phosphorescent Paint",
	inventory_image = "technic_light_phosphorescent_paint.png",
})


minetest.register_craft({
	type = "shapeless",
	output = 'technic_light:radioluminescent_stick 2',
	recipe = {'technic_light:radioluminescent_paint', 'default:stick'}
})

minetest.register_craft({
	output = "technic_light:phosphorescent_night_off",
	recipe = {
        {'', 'technic_light:phosphorescent_paint', ''},
        {'technic_light:phosphorescent_paint', 'default:stone', 'technic_light:phosphorescent_paint'},
        {'', 'technic_light:phosphorescent_paint', ''},
        }
})

minetest.register_craft({
	output = "technic_light:radioluminescent",
	recipe = {
        {'', 'technic_light:radioluminescent_paint', ''},
        {'technic_light:radioluminescent_paint', 'default:stone', 'technic_light:radioluminescent_paint'},
        {'', 'technic_light:radioluminescent_paint', ''},
        }
})

minetest.register_craft({
	output = "technic_light:spotlight",
	recipe = {
        {'technic:stainless_steel_ingot', 'moreores:silver_ingot', 'technic:stainless_steel_ingot'},
        {'default:obsidian_glass', 'technic:machine_casing', 'moreores:silver_ingot'},
        {'technic:stainless_steel_ingot', 'technic:hv_cable0', 'technic:stainless_steel_ingot'},
        }
})

minetest.register_craft({
	output = "technic_light:mv_lamp",
	recipe = {
        {'technic:stainless_steel_ingot', 'default:glass', 'technic:stainless_steel_ingot'},
        {'default:glass', 'default:mese_crystal', 'default:glass'},
        {'technic:stainless_steel_ingot', 'technic:mv_cable0', 'technic:stainless_steel_ingot'},
        }
})


minetest.register_craft({
	output = "technic_light:lv_lamp",
	recipe = {
        {'technic:carbon_steel_ingot', 'default:glass', 'technic:carbon_steel_ingot'},
        {'default:glass', 'default:mese_crystal_fragment', 'default:glass'},
        {'technic:carbon_steel_ingot', 'technic:lv_cable0', 'technic:carbon_steel_ingot'},
        }
})






technic.register_alloy_recipe({input = {'technic:zinc_dust', 'technic:sulfur_dust'}, output = 'technic_light:zinc_sulphide 2', time = 6})

technic.register_alloy_recipe({input = {'technic_light:zinc_sulphide', 'technic:uranium_dust'}, output = 'technic_light:radioluminescent_paint 2', time = 6})

technic.register_alloy_recipe({input = {'technic_light:zinc_sulphide', 'technic:silver_dust'}, output = 'technic_light:phosphorescent_paint 4', time = 6})










