

function technic_light_register_lamp(data)

local demand = data.demand
local tier = data.tier
local light = data.light
local node_name = data.node_name
local machine_name = data.machine_name


minetest.register_node("technic_light:"..node_name, {
	description = tier.." Lamp",
	tiles = {"technic_light_lamp_off.png"},
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
			minetest.swap_node(pos, {name="technic_light:"..node_name.."_on"})
		end
	end,
})

minetest.register_node("technic_light:"..node_name.."_on", {
	description = tier.." Lamp",
	tiles = {"technic_light_lamp_on.png"},
	infotext = tier.." Lamp(ON)",
	groups = {
			snappy=2, choppy=2, oddly_breakable_by_hand=2, 
			technic_machine=1, not_in_creative_inventory=1
		},
	paramtype = "light",
	light_source = light,
	drop = "technic_light:"..node_name, 
	technic_disabled_machine_name = "technic_light:"..node_name;
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
			minetest.swap_node(pos, {name="technic_light:"..node_name})
		end

	end,
})

technic.register_machine(tier, "technic_light:"..node_name, technic.receiver)
technic.register_machine(tier, "technic_light:"..node_name.."_on", technic.receiver)

end





