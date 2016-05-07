

local demand = 300
local tier = "HV"
local light = 15
local range = 3
local node_name = "spotlight"
local machine_name = "spotlight"


minetest.register_node("technic_light:"..node_name, {
	description = tier.." Lamp",
	tiles = {"technic_light_"..machine_name.."_side.png", "technic_light_"..machine_name.."_side.png",
"technic_light_"..machine_name.."_side.png",
"technic_light_"..machine_name.."_side.png",
"technic_light_"..machine_name.."_back.png",
"technic_light_"..machine_name.."_front.png"},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,
	infotext = tier.." Lamp(OFF)",
	groups = {
			snappy=2, choppy=2, oddly_breakable_by_hand=2, 
			technic_machine=1,
		},
	paramtype = "light",
	technic_run = function(pos, node)
		local meta         = minetest.get_meta(pos)
		local eu_input     = meta:get_int(tier.."_EU_input")
		meta:set_int(tier.."_EU_demand", demand)

		-- Setup meta data if it does not exist.
		if not eu_input then
			meta:set_int(tier.."_EU_demand", demand)
			meta:set_int(tier.."_EU_input", 0)
			return
		end

		if eu_input < demand then
			meta:set_string("infotext", machine_name.." Unpowered")
		elseif eu_input >= demand then
			minetest.swap_node(pos, {name = "technic_light:"..node_name.."_on", param2 = node.param2})
			local dir = minetest.facedir_to_dir(node.param2)
			local replaced = minetest.get_node({x = pos.x - range * dir.x, y = pos.y - range * dir.y, z = pos.z - range * dir.z}) 
			if replaced.name == "air" then
				minetest.set_node({x = pos.x - range * dir.x, y = pos.y - range * dir.y, z = pos.z - range * dir.z}, {name = "technic:light"})
			end
		end
	end,
})

minetest.register_node("technic_light:"..node_name.."_on", {
	description = tier.." Lamp",
	tiles = {"technic_light_"..machine_name.."_side.png", "technic_light_"..machine_name.."_side.png",
"technic_light_"..machine_name.."_side.png",
"technic_light_"..machine_name.."_side.png",
"technic_light_"..machine_name.."_back.png",
"technic_light_"..machine_name.."_front.png"},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,
	infotext = tier.." Lamp(ON)",
	groups = {
			snappy=2, choppy=2, oddly_breakable_by_hand=2, 
			technic_machine=1, not_in_creative_inventory=1
		},
	paramtype = "light",
	light_source = light,
	drop = "technic_light:"..node_name, 
	technic_run = function(pos, node)
		local meta         = minetest.get_meta(pos)
		local eu_input     = meta:get_int(tier.."_EU_input")
		meta:set_int(tier.."_EU_demand", demand)

		-- Setup meta data if it does not exist.
		if not eu_input then
			meta:set_int(tier.."_EU_demand", demand)
			meta:set_int(tier.."_EU_input", 0)
			return
		end

		if eu_input >= demand then
			meta:set_string("infotext", machine_name.." Active")
		elseif eu_input < demand then
			minetest.swap_node(pos, {name = "technic_light:"..node_name, param2 = node.param2})
		end

	end,
})

technic.register_machine(tier, "technic_light:"..node_name, technic.receiver)
technic.register_machine(tier, "technic_light:"..node_name.."_on", technic.receiver)







