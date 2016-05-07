playereffects.register_effect_type("photox", "Phototoxicity", "sunburn_sun.png", {}, 
function(player)
	sunburn.set_burn_factor(player, 3)
end, 
function(effect, player)
	sunburn.set_burn_factor(player, 1)
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



