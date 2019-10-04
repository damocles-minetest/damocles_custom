

local function register_food_effect(foodname, monoid, id, value, seconds)

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
					monoid:del_change(player, foodname)
				end
			end
			data[playername] = time
		end
	end)


	minetest.register_on_item_eat(function(_, _, itemstack, player)
		local name = itemstack:get_name()
		if name == foodname then
			monoid:add_change(player, value, foodname)
			data[player:get_player_name()] = seconds
		end
	end)
end



register_food_effect("farming:coffee_cup_hot", player_monoids.speed, 2, 5)
register_food_effect("farming:jaffa_cake", player_monoids.jump, 2, 5)
register_food_effect("farming:turkish_delight", player_monoids.visual_size, {x=0.3, y=0.3, z=0.3}, 5)

