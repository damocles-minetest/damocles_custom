
local MP = minetest.get_modpath("damocles_custom")

minetest.override_item("default:ice", {
	groups = {cracky = 3, cools_lava = 1, slippery = 10}
})

dofile(MP.."/center.lua")
dofile(MP.."/privs.lua")
dofile(MP.."/teleport_back.lua")
dofile(MP.."/node_here.lua")


if minetest.get_modpath("moreblocks") then
	dofile(MP.."/moreblocks.lua")
end

if minetest.get_modpath("travelnet") then
	dofile(MP.."/travelnet.lua")
end

if minetest.get_modpath("epic_skybox") then
	dofile(MP.."/skybox.lua")
end

if minetest.settings:get_bool("enable_integration_test") then
	dofile(MP.."/integration_test.lua")
end

dofile(MP.."/stats.lua")
