

local function ends_with(str, ending)
   return ending == "" or str:sub(-#ending) == ending
end


minetest.register_on_mods_loaded(function()
  for _, abm in ipairs(minetest.registered_abms) do
    if abm.label and ends_with(abm.label, " spawning") then
      abm.action = function() end
    end
  end
end)
