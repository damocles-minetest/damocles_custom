

local player_map = {} -- playername => boolean

minetest.register_on_leaveplayer(function(player)
	player_map[player:get_player_name()] = nil
end)

local timer = 0
minetest.register_globalstep(function(dtime)
	timer = timer + dtime
	if timer < 1 then
		return
	end

	timer = 0

	for _, player in ipairs(minetest.get_connected_players()) do
		local playername = player:get_player_name()
		local ppos = player:get_pos()

		local is_in_center = vector.distance({x=0, y=0, z=0}, ppos) < 250

		if is_in_center and not player_map[playername] then
			-- moved to the center
			player_monoids.speed:add_change(player, 2, "center_fast")
			player_map[playername] = true
		elseif not is_in_center and player_map[playername] then
			-- moved out of the center
			player_monoids.speed:del_change(player, "center_fast")
			player_map[playername] = nil
		end
	end


end)
