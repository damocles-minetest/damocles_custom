
local monoid_id = "food_effect"

local function add_effect(player, monoid, value, seconds)
	monoid:add_change(player, value, monoid_id)
	local playername = player:get_player_name()
	minetest.after(seconds, function()
		player = minetest.get_player_by_name(playername)
		if player then
			monoid:del_change(player, monoid_id)
		end
	end)
end

minetest.register_on_item_eat(function(_, _, itemstack, player)
	local name = itemstack:get_name()
	if name == "farming:coffee_cup_hot" then
		add_effect(player, player_monoids.speed, 2, 5)
	elseif name == "farming:jaffa_cake" then
		add_effect(player, player_monoids.jump, 2, 5)
	end
end)
