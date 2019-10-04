
-- playername -> timeout
local data = {}

minetest.register_globalstep(function(dtime)
	for playername in pairs(data) do
		local time = data[playername]
		time = time - dtime

		if time < 0 then
			time = nil
			local player = minetest.get_player_by_name(playername)
			if player then
				player_monoids.speed:del_change(player, "damocles:coffee")
			end
		end
		data[playername] = time
	end
end)


minetest.register_on_item_eat(function(_, _, itemstack, player)
	local name = itemstack:get_name()
	if name == "farming:coffee_cup_hot" then
		player_monoids.speed:add_change(player, 2, "damocles:coffee")
		data[player:get_player_name()] = 5
	end
end)
