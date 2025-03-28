myflooring = {}

dofile(minetest.get_modpath("myflooring").."/flooring.lua")
dofile(minetest.get_modpath("myflooring").."/machine.lua")
dofile(minetest.get_modpath("myflooring").."/register.lua")



if minetest.get_modpath("hardenedclay") then
	dofile(minetest.get_modpath("myflooring").."/hardenedclay.lua")
end

if minetest.get_modpath("ores") then
	dofile(minetest.get_modpath("myflooring").."/ores.lua")
end
