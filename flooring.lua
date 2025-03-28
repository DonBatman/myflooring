
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
	groups = {cracky = 1},--mygroups,
	sounds = default.node_sound_stone_defaults(),
})
end
end
