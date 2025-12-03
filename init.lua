myflooring = {}

local hardenedclay = core.settings:get_bool("myflooring.hardenedclay", true)
local myores = core.settings:get_bool("myflooring.myores", true)
local mywhiteblock = core.settings:get_bool("myflooring.mywhiteblock", true)

dofile(core.get_modpath("myflooring").."/flooring.lua")
dofile(core.get_modpath("myflooring").."/machine.lua")
dofile(core.get_modpath("myflooring").."/register.lua")


if hardenedclay then
	if core.get_modpath("hardenedclay") then
		dofile(core.get_modpath("myflooring").."/hardenedclay.lua")
	end
end
if myores then
	if core.get_modpath("myores") then
		dofile(core.get_modpath("myflooring").."/myores.lua")
	end
end
if mywhiteblock then
	if core.get_modpath("mywhiteblock") then
		dofile(core.get_modpath("myflooring").."/mywhiteblock.lua")
	end
end
