
minetest.register_chatcommand("node_here", {
    description = "places a node at the current position",
    privs = {damocles_builder=true},
    func = function(name)
	local player = minetest.get_player_by_name(name)
	local pos = player:get_pos()
	if not minetest.is_protected(pos, name) then
		minetest.set_node(pos, { name="default:stone" })
	end
    end,
})

