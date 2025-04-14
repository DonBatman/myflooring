local mater = {}
local shape = {}
local make_ok = {}
local anzahl = {}

minetest.register_node("myflooring:machine", {
	description = "Flooring Machine",
	tiles = {
		"myflooring_machine_top.png",
		"myflooring_machine_bottom.png",
		"myflooring_machine_side.png",
		"myflooring_machine_side.png",
		"myflooring_machine_front.png",
		"myflooring_machine_front.png",
		},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=2},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.125, 0.5, 0.5, 0.125},
			{-0.5, 0.0625, -0.1875, 0.5, 0.4375, 0.1875},
			{-0.5, 0.125, -0.25, 0.5, 0.375, 0.25},
			{0.375, -0.5, -0.5, 0.5, -0.375, -0.375},
			{0.375, -0.5, 0.375, 0.5, -0.375, 0.5},
			{-0.5, -0.5, 0.375, -0.375, -0.375, 0.5},
			{-0.5, -0.5, -0.5, -0.375, -0.375, -0.375},
			{-0.5, -0.375, -0.5, 0.5, 0, 0.5}, 
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		}
	},

	after_place_node = function(pos, placer)
		local meta = minetest.get_meta(pos);
			meta:set_string("owner",  (placer:get_player_name() or ""));
			meta:set_string("infotext",  "Flooring Machine (owned by " .. (placer:get_player_name() or "") .. ")");
	end,

	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
			if player:get_player_name() == meta:get_string("owner") and
				inv:is_empty("flooring") and
				inv:is_empty("res") then
				return true
			else
				return false
			end
	end,

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", "invsize[10,11;]"..
			"background[-0.15,-0.25;10.40,11.75;myflooring_background.png]"..
			"list[current_name;flooring;8,2;1,1;]"..
			"list[current_name;res;8,4;1,1;]"..
			"label[8,1.5;Input:]"..
			"label[8,3.5;Output:]"..
			"label[0,0;Choose Flooring Stye:]"..
			"image_button[0.5,1;1,1;myflooring_flooring1.png;flooring1; ]"..
			"image_button[0.5,2;1,1;myflooring_flooring2.png;flooring2; ]"..
			"image_button[0.5,3;1,1;myflooring_flooring3.png;flooring3; ]"..
			"image_button[0.5,4;1,1;myflooring_flooring9.png;flooring9; ]"..
			"image_button[0.5,5;1,1;myflooring_flooring10.png;flooring10; ]"..
			"image_button[0.5,6;1,1;myflooring_flooring11.png;flooring11; ]"..
			"image_button[2,1;1,1;myflooring_flooring4.png;flooring4; ]"..
			"image_button[2,2;1,1;myflooring_flooring5.png;flooring5; ]"..
			"image_button[2,3;1,1;myflooring_flooring6.png;flooring6; ]"..
			"image_button[2,4;1,1;myflooring_flooring12.png;flooring12; ]"..
			"image_button[2,5;1,1;myflooring_flooring13.png;flooring13; ]"..
			"image_button[2,6;1,1;myflooring_flooring14.png;flooring14; ]"..
			"image_button[3.5,1;1,1;myflooring_flooring7.png;flooring7; ]"..
			"image_button[3.5,2;1,1;myflooring_flooring8.png;flooring8; ]"..
			"image_button[3.5,3;1,1;myflooring_flooring15.png;flooring15; ]"..
			"image_button[3.5,4;1,1;myflooring_flooring20.png;flooring20; ]"..
			"image_button[3.5,5;1,1;myflooring_flooring16.png;flooring16; ]"..
			"image_button[3.5,6;1,1;myflooring_flooring17.png;flooring17; ]"..
			"image_button[5,1;1,1;myflooring_flooring18.png;flooring18; ]"..
			"image_button[5,2;1,1;myflooring_flooring19.png;flooring19; ]"..
			"image_button[5,3;1,1;myflooring_flooring21.png;flooring21; ]"..
			"image_button[5,4;1,1;myflooring_flooring22.png;flooring22; ]"..
			"image_button[5,5;1,1;myflooring_flooring23.png;flooring23; ]"..
			"image_button[5,6;1,1;myflooring_flooring24.png;flooring24; ]"..
			"image_button[6.5,1;1,1;myflooring_flooring25.png;flooring25; ]"..
			"image_button[6.5,2;1,1;myflooring_flooring26.png;flooring26; ]"..
			"image_button[6.5,3;1,1;myflooring_flooring27.png;flooring27; ]"..
			"image_button[6.5,4;1,1;myflooring_flooring28.png;flooring28; ]"..
			"image_button[6.5,5;1,1;myflooring_flooring29.png;flooring29; ]"..
			"image_button[6.5,6;1,1;myflooring_flooring30.png;flooring30; ]"..
			"list[current_player;main;1,7;8,4;]")
		meta:set_string("infotext", "Flooring Machine")
		local inv = meta:get_inventory()
		inv:set_size("flooring", 1)
		inv:set_size("res", 1)
	end,

	on_receive_fields = function(pos, formname, fields, sender)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()

		if fields["flooring1"] 
		or fields["flooring2"] 
		or fields["flooring3"] 
		or fields["flooring4"]
		or fields["flooring5"]
		or fields["flooring6"]
		or fields["flooring7"]
		or fields["flooring8"]
		or fields["flooring9"] 
		or fields["flooring10"] 
		or fields["flooring11"] 
		or fields["flooring12"]
		or fields["flooring13"]
		or fields["flooring14"]
		or fields["flooring15"]
		or fields["flooring16"]
		or fields["flooring17"]
		or fields["flooring18"]
		or fields["flooring19"]
		or fields["flooring20"]
		or fields["flooring21"]
		or fields["flooring22"]
		or fields["flooring23"]
		or fields["flooring24"]
		or fields["flooring25"]
		or fields["flooring26"]
		or fields["flooring27"]
		or fields["flooring28"]
		or fields["flooring29"]
		or fields["flooring30"]
		then

			if fields["flooring1"] then
				make_ok = "0"
				anzahl = "1"
				shape = "myflooring:flooring1"
				if inv:is_empty("flooring") then
					return
				end
			end

			if fields["flooring2"] then
				make_ok = "0"
				anzahl = "1"
				shape = "myflooring:flooring2"
				if inv:is_empty("flooring") then
					return
				end
			end

			if fields["flooring3"] then
				make_ok = "0"
				anzahl = "1"
				shape = "myflooring:flooring3"
				if inv:is_empty("flooring") then
					return
				end
			end

			if fields["flooring4"] then
				make_ok = "0"
				anzahl = "1"
				shape = "myflooring:flooring4"
				if inv:is_empty("flooring") then
					return
				end
			end

			if fields["flooring5"] then
				make_ok = "0"
				anzahl = "1"
				shape = "myflooring:flooring5"
				if inv:is_empty("flooring") then
					return
				end
			end

			if fields["flooring6"] then
				make_ok = "0"
				anzahl = "1"
				shape = "myflooring:flooring6"
				if inv:is_empty("flooring") then
					return
				end
			end

			if fields["flooring7"] then
				make_ok = "0"
				anzahl = "1"
				shape = "myflooring:flooring7"
				if inv:is_empty("flooring") then
					return
				end
			end

			if fields["flooring8"] then
				make_ok = "0"
				anzahl = "1"
				shape = "myflooring:flooring8"
				if inv:is_empty("flooring") then
					return
				end
			end

			if fields["flooring9"] then
				make_ok = "0"
				anzahl = "1"
				shape = "myflooring:flooring9"
				if inv:is_empty("flooring") then
					return
				end
			end

			if fields["flooring10"] then
				make_ok = "0"
				anzahl = "1"
				shape = "myflooring:flooring10"
				if inv:is_empty("flooring") then
					return
				end
			end

			if fields["flooring11"] then
				make_ok = "0"
				anzahl = "1"
				shape = "myflooring:flooring11"
				if inv:is_empty("flooring") then
					return
				end
			end

			if fields["flooring12"] then
				make_ok = "0"
				anzahl = "1"
				shape = "myflooring:flooring12"
				if inv:is_empty("flooring") then
					return
				end
			end

			if fields["flooring13"] then
				make_ok = "0"
				anzahl = "1"
				shape = "myflooring:flooring13"
				if inv:is_empty("flooring") then
					return
				end
			end

			if fields["flooring14"] then
				make_ok = "0"
				anzahl = "1"
				shape = "myflooring:flooring14"
				if inv:is_empty("flooring") then
					return
				end
			end

			if fields["flooring15"] then
				make_ok = "0"
				anzahl = "1"
				shape = "myflooring:flooring15"
				if inv:is_empty("flooring") then
					return
				end
			end

			if fields["flooring16"] then
				make_ok = "0"
				anzahl = "1"
				shape = "myflooring:flooring16"
				if inv:is_empty("flooring") then
					return
				end
			end

			if fields["flooring17"] then
				make_ok = "0"
				anzahl = "1"
				shape = "myflooring:flooring17"
				if inv:is_empty("flooring") then
					return
				end
			end

			if fields["flooring18"] then
				make_ok = "0"
				anzahl = "1"
				shape = "myflooring:flooring18"
				if inv:is_empty("flooring") then
					return
				end
			end

			if fields["flooring19"] then
				make_ok = "0"
				anzahl = "1"
				shape = "myflooring:flooring19"
				if inv:is_empty("flooring") then
					return
				end
			end

			if fields["flooring20"] then
				make_ok = "0"
				anzahl = "1"
				shape = "myflooring:flooring20"
				if inv:is_empty("flooring") then
					return
				end
			end

			if fields["flooring21"] then
				make_ok = "0"
				anzahl = "1"
				shape = "myflooring:flooring21"
				if inv:is_empty("flooring") then
					return
				end
			end

			if fields["flooring22"] then
				make_ok = "0"
				anzahl = "1"
				shape = "myflooring:flooring22"
				if inv:is_empty("flooring") then
					return
				end
			end

			if fields["flooring23"] then
				make_ok = "0"
				anzahl = "1"
				shape = "myflooring:flooring23"
				if inv:is_empty("flooring") then
					return
				end
			end

			if fields["flooring24"] then
				make_ok = "0"
				anzahl = "1"
				shape = "myflooring:flooring24"
				if inv:is_empty("flooring") then
					return
				end
			end

			if fields["flooring25"] then
				make_ok = "0"
				anzahl = "1"
				shape = "myflooring:flooring25"
				if inv:is_empty("flooring") then
					return
				end
			end

			if fields["flooring26"] then
				make_ok = "0"
				anzahl = "1"
				shape = "myflooring:flooring26"
				if inv:is_empty("flooring") then
					return
				end
			end

			if fields["flooring27"] then
				make_ok = "0"
				anzahl = "1"
				shape = "myflooring:flooring27"
				if inv:is_empty("flooring") then
					return
				end
			end

			if fields["flooring28"] then
				make_ok = "0"
				anzahl = "1"
				shape = "myflooring:flooring28"
				if inv:is_empty("flooring") then
					return
				end
			end

			if fields["flooring29"] then
				make_ok = "0"
				anzahl = "1"
				shape = "myflooring:flooring29"
				if inv:is_empty("flooring") then
					return
				end
			end

			if fields["flooring30"] then
				make_ok = "0"
				anzahl = "1"
				shape = "myflooring:flooring30"
				if inv:is_empty("flooring") then
					return
				end
			end

			local floor_stack = inv:get_stack("flooring", 1)
			local resstack = inv:get_stack("res", 1)

			local mat_tab = {
					{"default:clay",		"default_clay"},
					{"default:cobble",		"default_cobble"},
					{"default:desert_cobble",	"default_desert_cobble"},
					{"default:desert_stone",	"default_desert_stone"},
					{"default:desert_sandstone",	"default_desert_sandstone"},
					{"default:sandstone",	"default_sandstone"},
					{"default:silver_sandstone",	"default_silver_sandstone"},
					{"default:dirt",		"default_dirt"},
					{"default:junglewood",		"default_junglewood"},
					{"default:mossycobble",		"default_mossycobble"},
					{"default:pine_wood",		"default_pine_wood"},
					{"default:aspen_wood",		"default_aspen_wood"},
					{"default:acacia_wood",		"default_acacia_wood"},
					{"default:stone",			"default_stone"},
					{"default:wood",			"default_wood"},
					{"farming:straw",		"farming_straw"},
					{"wool:black",			"wool_black"},
					{"wool:blue",			"wool_blue"},
					{"wool:brown",			"wool_brown"},
					{"wool:cyan",			"wool_cyan"},
					{"wool:dark_green",		"wool_dark_green"},
					{"wool:dark_grey",		"wool_dark_grey"},
					{"wool:green",			"wool_green"},
					{"wool:grey",			"wool_grey"},
					{"wool:magenta",		"wool_magenta"},
					{"wool:orange",			"wool_orange"},
					{"wool:pink",			"wool_pink"},
					{"wool:red",			"wool_red"},
					{"wool:violet",			"wool_violet"},
					{"wool:white",			"wool_white"},
					{"wool:yellow",			"wool_yellow"},

					{"moreblocks:cactus_brick",			"cactus_brick"},
					{"moreblocks:cactus_checker",		"cactus_checker"},
					{"moreblocks:coal_stone_bricks",	"coal_stone_bricks"},
					{"moreblocks:circle_stone_bricks",	"circle_stone_bricks"},
					{"moreblocks:iron_checker",			"iron_checker"},
					{"moreblocks:iron_stone_bricks",	"iron_stone_bricks"},
					{"moreblocks:plankstone",			"plankstone"},
					{"moreblocks:stone_tile",			"stone_tile"},
					{"moreblocks:wood_tile_center",		"wood_tile_center"},
					{"moreblocks:wood_tile_full",		"wood_tile_full"},

					{"moretrees:apple_planks",			"apple_tree"},
					{"moretrees:beech_planks",			"beech"},
					{"moretrees:oak_planks",			"oak"},
					{"moretrees:sequoia_planks",		"sequoia"},
					{"moretrees:birch_planks",			"birch"},
					{"moretrees:palm_planks",			"palm"},
					{"moretrees:spruce_planks",			"spruce"},
					{"moretrees:willow_planks",			"willow"},
					{"moretrees:rubber_tree_planks",	"rubber_tree"},
					{"moretrees:fir_planks",			"fir"},

					{"hardenedclay:hardened_clay",				"hardened_clay"},
					{"hardenedclay:hardened_clay_white",		"hardened_clay_white"},
					{"hardenedclay:hardened_clay_black",		"hardened_clay_black"},
					{"hardenedclay:hardened_clay_light_blue",	"hardened_clay_light_blue"},
					{"hardenedclay:hardened_clay_green",		"hardened_clay_green"},
					{"hardenedclay:hardened_clay_red",			"hardened_clay_red"},
					{"hardenedclay:hardened_clay_light_grey",	"hardened_clay_light_grey"},
					{"hardenedclay:hardened_clay_violet",		"hardened_clay_violet"},
					{"hardenedclay:hardened_clay_lime",			"hardened_clay_lime"},
					{"hardenedclay:hardened_clay_magenta",		"hardened_clay_magenta"},
					{"hardenedclay:hardened_clay_orange",		"hardened_clay_orange"},
					{"hardenedclay:hardened_clay_brown",		"hardened_clay_brown"},
					{"hardenedclay:hardened_clay_blue",			"hardened_clay_blue"},
					{"hardenedclay:hardened_clay_yellow",		"hardened_clay_yellow"},
					{"hardenedclay:hardened_clay_pink",			"hardened_clay_pink"},
					{"hardenedclay:hardened_clay_cyan",			"hardened_clay_cyan"},
					{"hardenedclay:hardened_clay_grey",			"hardened_clay_grey"},

					{"myores:slate",			"slate"},
					{"myores:shale",			"shale"},
					{"myores:schist",			"schist"},
					{"myores:gneiss",			"gneiss"},
					{"myores:basalt",			"basalt"},
					{"myores:granite",			"granite"},
					{"myores:marble",			"marble"},
					{"myores:chromium",			"chromium"},
					{"myores:manganese",		"manganese"},
					{"myores:quartz",			"quartz"},
					{"myores:chalcopyrite",		"chalcopyrite"},
					{"myores:cobalt",			"cobalt"},
					{"myores:uvarovite",		"uvarovite"},
					{"myores:selenite",			"selenite"},
					{"myores:miserite",			"miserite"},
					{"myores:limonite",			"limonite"},
					{"myores:sulfur",			"sulfur"},
					{"myores:lapis_lazuli",		"lapis_lazuli"},
					{"myores:emerald",			"emerald"},
					{"myores:amethyst",			"amethyst"},
				}

			for i in ipairs (mat_tab) do
				local titem = mat_tab[i][1]
				local tmat  = mat_tab[i][2]

					if floor_stack:get_name()==titem then
							mater = tmat
							make_ok = "1"
					end
			end

			if sender:get_player_name() == meta:get_string("owner") and
			   make_ok == "1" then
					local give = {}
					for i = 0, anzahl-1 do
						give[i+1]=inv:add_item("res",shape.."_"..mater)
					end
				floor_stack:take_item()
				inv:set_stack("flooring",1,floor_stack)
				make_ok = 0
			end
		end
	end
})

minetest.register_craft({
		output = 'myflooring:machine',
		recipe = {
			{'', '', ''},
			{'', 'default:steel_ingot', ''},
			{'default:brick', "default:brick", 'default:brick'},
		},
})
