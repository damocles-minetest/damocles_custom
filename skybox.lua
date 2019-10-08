
local function reset_sky(player)
  if not player then
    return
  end

  player:set_clouds({
    thickness = 1,
    color = { r=243, g=214, b=255, a=229 },
    ambient = { r=0, g=0, b=0, a=255 },
    density = 0,
    height= 100,
    speed={ y=-2, x=-1 }
  })

  player:set_sky({r=0, g=0, b=0}, "skybox", {
      "heaven_up.jpg^[transformR270",
      "heaven_dn.jpg^[transformR90",
      "heaven_ft.jpg",
      "heaven_bk.jpg",
      "heaven_lf.jpg",
      "heaven_rt.jpg"
    })
end


minetest.register_on_joinplayer(reset_sky)


epic.register_hook({
  on_epic_exit = function(playername)
    reset_sky(minetest.get_player_by_name(playername))
  end,

  on_epic_abort = function(playername)
    reset_sky(minetest.get_player_by_name(playername))
  end,

})
