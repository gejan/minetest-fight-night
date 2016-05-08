-- 

if minetest.registered_tools["technic:flashlight"] then 


local flashlight_max_charge = 30000

local S = technic.getter

technic.register_power_tool("technic_light:flashlight_off", flashlight_max_charge)
      
minetest.register_tool(":technic:flashlight", {
	description = S("Flashlight"),
	groups = {not_in_creative_inventory=1},
	inventory_image = "technic_flashlight_on.png",
	wield_image = "technic_flashlight.png",
	stack_max = 1,
	wear_represents = "technic_RE_charge",
	on_refill = technic.refill_RE_charge,
	on_use = function(itemstack, user, pointed) 
		itemstack:set_name("technic_light:flashlight_off")
		return itemstack
	end,
})

minetest.register_tool("technic_light:flashlight_off", {
	description = S("Flashlight off"),
	inventory_image = "technic_flashlight.png",
	wield_image = "technic_flashlight.png",
	stack_max = 1,
	wear_represents = "technic_RE_charge",
	on_refill = technic.refill_RE_charge,
	on_use = function(itemstack, user, pointed) 
		itemstack:set_name("technic:flashlight")
		return itemstack
	end,

})


end