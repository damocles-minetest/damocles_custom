
minetest.register_node("damocles_custom:transportation_animation", {
	tiles = {
		{
			name = "hyperloop_door1IN.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 32,
				aspect_h = 32,
				length = 1.0,
			},
		}
	},
	light_source = 2,
	sounds = default.node_sound_metal_defaults(),
	groups = {cracky=1},
	is_ground_content = false,
})
