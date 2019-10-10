
local function teleport_to_spawn(name)
    local player = minetest.get_player_by_name(name)
    if player == nil then
        -- just a check to prevent the server crashing
        return false
    end
    player:setpos({ x=0, y=0, z=0 })
    minetest.chat_send_player(name, "Teleported to center!")
end

minetest.register_chatcommand("center", {
    description = "Teleports you to the center.",
    func = teleport_to_spawn,
})

