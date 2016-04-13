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


technic.register_alloy_recipe({input = {'technic:zinc_dust', 'technic:sulfur_dust'}, output = 'technic_light:zinc_sulphide 2', time = 6})

technic.register_alloy_recipe({input = {'technic_light:zinc_sulphide', 'technic:uranium_dust'}, output = 'technic_light:radioluminescent_paint 2', time = 6})

technic.register_alloy_recipe({input = {'technic_light:zinc_sulphide', 'technic:silver_dust'}, output = 'technic_light:phosphorescent_paint 4', time = 6})










