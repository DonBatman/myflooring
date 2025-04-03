
function myflooring.register_block(mat, desc, image, mygroups, craft, drawtype)

local floor = {
				{"1","myflooring_flooring1"},
				{"2","myflooring_flooring2"},
				{"3","myflooring_flooring3"},
				{"4","myflooring_flooring4"},
				{"5","myflooring_flooring5"},
				{"6","myflooring_flooring6"},
				{"7","myflooring_flooring7"},
				{"8","myflooring_flooring8"},
				{"9","myflooring_flooring9"},
				{"10","myflooring_flooring10"},
				{"11","myflooring_flooring11"},
				{"12","myflooring_flooring12"},
				{"13","myflooring_flooring13"},
				{"14","myflooring_flooring14"},
				{"15","myflooring_flooring15"},
				{"16","myflooring_flooring16"},
				{"17","myflooring_flooring17"},
				{"18","myflooring_flooring18"},
				{"19","myflooring_flooring19"},
				{"20","myflooring_flooring20"},
				{"21","myflooring_flooring21"},
				{"22","myflooring_flooring22"},
				{"23","myflooring_flooring23"},
				{"24","myflooring_flooring24"},
				{"25","myflooring_flooring25"},
				{"26","myflooring_flooring26"},
				{"27","myflooring_flooring27"},
				{"28","myflooring_flooring28"},
				{"29","myflooring_flooring29"},
				{"30","myflooring_flooring30"},
				}

for i in ipairs(floor) do
local fnum = floor[i][1]
local fmat = floor[i][2]

minetest.register_node("myflooring:flooring"..fnum.."_"..mat, {
	description = desc.." Flooring",
	drawtype = drawtype,
	tiles = {
		image.."^"..fmat..".png",
		image,
		image,
		image,
		image,
		image,
		},
	inventory_image = fmat..".png",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {cracky = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_stone_defaults(),
})
end
end
