myflooring = {}

dofile(minetest.get_modpath("myflooring").."/flooring.lua")
dofile(minetest.get_modpath("myflooring").."/machine.lua")
dofile(minetest.get_modpath("myflooring").."/register.lua")



if minetest.get_modpath("hardenedclay") then
	dofile(minetest.get_modpath("myflooring").."/hardenedclay.lua")
end

if minetest.get_modpath("myores") then
	dofile(minetest.get_modpath("myflooring").."/myores.lua")
end

if minetest.get_modpath("mywhiteblock") then
	dofile(minetest.get_modpath("myflooring").."/mywhiteblock.lua")
end
