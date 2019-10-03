
minetest.log("warning", "[damocles_custom] integration-test enabled!")

minetest.register_on_mods_loaded(function()
	minetest.log("warning", "[damocles_custom] all mods loaded, starting delayed test-function")

	minetest.after(1, function()
		minetest.log("warning", "[damocle_custom] starting integration test")

		local data = minetest.write_json({ success = true }, true);
		local file = io.open(minetest.get_worldpath().."/integration_test.json", "w" );
		if file then
			file:write(data)
			file:close()
		end

		file = io.open(minetest.get_worldpath().."/registered_nodes.txt", "w" );
		if file then
			for name in pairs(minetest.registered_nodes) do
				file:write(name .. '\n')
			end
			file:close()
		end

		minetest.log("warning", "[damocles_custom] integration tests done!")
		minetest.request_shutdown("success")
	end)
end)
