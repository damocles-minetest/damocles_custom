

local function ends_with(str, ending)
   return ending == "" or str:sub(-#ending) == ending
end


minetest.register_on_mods_loaded(function()
  for _, abm in ipairs(minetest.registered_abms) do

    if abm.name and ends_with(abm.name, " spawning") then
      abm.action = function() end
    end
  end
end)
