
technic_light_switch = default.LIGHT_MAX - 3

local switch = technic_light_switch

minetest.register_abm({
nodenames = {"technic_light:phosphorescent_day"},
interval = 3,
chance = 1,
action = function(pos, node, active_object_count, 	active_object_count_wider)
	if not node.param2 then 
		node.param2 = 0
	end
	local energy = node.param2
	local light = minetest.get_node_light(pos)
	if light >= switch then
		if energy < 255 then
			node.param2 = energy + 1
			minetest.set_node(pos,node)
		end
	else
		if energy > 0 then
			node.name = 								"technic_light:phosphorescent_night_on"
		else
			node.name = 								"technic_light:phosphorescent_night_off"
		end
		minetest.set_node(pos, node)
	end
end})

minetest.register_abm({
nodenames = {"technic_light:phosphorescent_night_on"},
interval = 3,
chance = 1,
action = function(pos, node, active_object_count, 	active_object_count_wider)
	if not node.param2 then 
		node.param2 = 0
	end
	local energy = node.param2
	local light = minetest.get_node_light(pos)
	if light >= switch then
		node.name = "technic_light:phosphorescent_day"
		minetest.set_node(pos, node)
	else	
		if energy > 0 then
			node.param2 = energy - 1
			minetest.set_node(pos, node)	
		else
			node.name = "technic_light:phosphorescent_night_off"
			minetest.set_node(pos, node)
		end
	end
end})

minetest.register_abm({
nodenames = {"technic_light:phosphorescent_night_off"},
interval = 9,
chance = 1,
action = function(pos, node, active_object_count, 	active_object_count_wider)
	local light = minetest.get_node_light(pos)
	if light >= switch then
		node.name = "technic_light:phosphorescent_day"
		minetest.set_node(pos, node)
	end
end})





