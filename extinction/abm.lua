minetest.register_abm({
nodenames = {"default:torch"},
interval = extinction_time,
chance = extinction_chance,
action = function(pos, node, active_object_count, active_object_count_wider)
local replace = node
replace.name = "extinction:torch_1"
minetest.set_node({x = pos.x, y=pos.y, z=pos.z}, replace)
end})

minetest.register_abm({
nodenames = {"extinction:torch_1"},
interval = extinction_time,
chance = extinction_chance,
action = function(pos, node, active_object_count, active_object_count_wider)
local replace = node
replace.name = "extinction:torch_2"
minetest.set_node({x = pos.x, y=pos.y, z=pos.z}, replace)
end})

minetest.register_abm({
nodenames = {"extinction:torch_2"},
interval = extinction_time,
chance = extinction_chance,
action = function(pos, node, active_object_count, active_object_count_wider)
local replace = node
replace.name = "extinction:torch_extinct"
minetest.set_node({x = pos.x, y=pos.y, z=pos.z}, replace)
end})





