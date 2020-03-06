
minetest.register_on_joinplayer(function(player)
  if minetest.check_player_privs(player:get_player_name(), "damocles_builder") then
    -- leave default inventory
    return
  else
    -- set "plain" inventory formspec
    sfinv.set_player_inventory_formspec(player)
  end
end)
