local set_small_burn_factor = function(player)
	--value set by sunburn
	if sunburn.get_burn_factor(player) == 1 then	
		sunburn.set_burn_factor(player,0.1)
	end
end 


minetest.register_on_respawnplayer(set_small_burn_factor)
minetest.register_on_newplayer(set_small_burn_factor)
minetest.register_on_joinplayer(set_small_burn_factor)


playereffects.register_effect_type("photox", "Phototoxicity", "sunburn_sun.png", {}, 
function(player)
	sunburn.set_burn_factor(player, 1.1) -- != 1
end, 
function(effect, player)
	sunburn.set_burn_factor(player, 0.1)
end)

playereffects.register_effect_type("sense", "Sense", "bewarethedark_eye.png", {}, 
function(player)
	local value = persistent_player_attributes.get_value(
		player ,'bewarethedark_sanity')
	value = value + 1
	if value > 20 then
		value = 20
	end
	persistent_player_attributes.set_value(player,'bewarethedark_sanity',value)
end, 
nil, nil, nil, 5)



