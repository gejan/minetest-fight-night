

local demand = 300
local tier = "HV"
local light = 15
local range = 4
local node_name = "spotlight"
local machine_name = "spotlight"


local light_name
if minetest.registered_nodes["technic:light"] then
  light_name = "technic:light"
  minetest.register_alias("technic_light:light","technic:light")
else
  minetest.register_node("technic_light:light", {
	drawtype = "glasslike",
	tiles = {"technic_light.png"},
	paramtype = "light",
	groups = {not_in_creative_inventory=1},
	drop = "",
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	light_source = default.LIGHT_MAX,
	pointable = false,
  })
  light_name = "technic_light:light"
end



local function spotlight_place_light(pos, dir)
	local even = false
	for i = 1, range, 1 do
	pos = vector.subtract(pos, dir)
	local replaced = minetest.get_node(pos)
	if even then
		if replaced.name == "air" then
		minetest.set_node(pos, {name = light_name})
		elseif not minetest.registered_nodes[replaced.name].sunlight_propagates then
			return
		end
		even = false
	else
		if minetest.registered_nodes[replaced.name].sunlight_propagates then
			even = true
		else
			return
		end
	end
	end
end 

local function spotlight_remove_light(pos, dir)
	for i = 1, range, 1 do
		pos = vector.subtract(pos, dir)
		local replaced = minetest.get_node(pos) 
		if replaced.name == light_name then
			minetest.set_node(pos, {name = "air"})
		end		
	end
end 



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
			spotlight_place_light(pos,dir)
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
	on_dig = function(pos, node, player)
		spotlight_remove_light(pos, minetest.facedir_to_dir(node.param2))
		minetest.node_dig(pos, node, player)
	end,
	technic_on_disable = function(pos, node)
		spotlight_remove_light(pos, minetest.facedir_to_dir(node.param2))
		minetest.swap_node(pos, {name = "technic_light:"..node_name, param2 = node.param2})
	end,
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
			local dir = minetest.facedir_to_dir(node.param2)
			spotlight_remove_light(pos,dir)
		end

	end,
})

technic.register_machine(tier, "technic_light:"..node_name, technic.receiver)
technic.register_machine(tier, "technic_light:"..node_name.."_on", technic.receiver)







