
local has_epic = minetest.get_modpath("epic")


local function teleport_to_spawn(name)
	if has_epic and epic.get_state(name) then
		-- no teleporting while on a quest
		minetest.chat_send_player(name, "i'm sorry i can't do that dave")
		return
	end

	local player = minetest.get_player_by_name(name)
	player:setpos({ x=0, y=0, z=0 })
	minetest.chat_send_player(name, "Teleported to center!")
end

minetest.register_chatcommand("center", {
    description = "Teleports you to the center.",
    func = teleport_to_spawn,
})

