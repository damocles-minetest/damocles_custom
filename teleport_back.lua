-- static spawn point
local spawn_pos = { x=0, y=0, z=0 }

-- check every few seconds if the player belongs to the current position
-- if not, teleport them back to spawn
local timer = 0
minetest.register_globalstep(function(dtime)
	timer = timer + dtime

	-- every 10 seconds
	if timer < 10 then return end
	timer = 0

	for _,player in ipairs(minetest.get_connected_players()) do

		local pos = player:get_pos()

		-- check if player can travel there
		if pos.y < -1000 or pos.y > 1000 then
			player:set_pos(spawn_pos)
			minetest.chat_send_player(player:get_player_name(), "Please adhere to the world-limits: 1000 > y > -1000")
		end
	end
end)
