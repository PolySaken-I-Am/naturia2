
local function regsiter_tree(name, cName, berry, lDrop, schem)
minetest.register_node("naturia2:"..name.."_tree", {
	description = cName.." Wood",
	tiles = {"n2_"..name.."_tree_top.png", "n2_"..name.."_tree_top.png", "n2_"..name.."_tree_side.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("naturia2:"..name.."_wood", {
	description = "Packaged "..cName.." Wood",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"n2_"..name.."_wood.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("naturia2:"..name.."_leaves", {
	description = cName.." Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"n2_"..name.."_leaves.png"},
	special_tiles = {"n2_"..name.."_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{
				items = {"naturia2:sapling_"..name},
				rarity = 20,
			},
			{
				items = {"naturia2:leaves_"..name},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = after_place_leaves,
})

minetest.register_node("naturia2:"..name.."_sapling", {
	description = cName.." Sapling",
	drawtype = "plantlike",
	tiles = {"n2_"..name.."_sapling.png"},
	inventory_image = "n2_"..name.."_sapling.png",
	wield_image = "n2_"..name.."_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
})

if berry then
	minetest.register_node("naturia2:"..name.."_berries", {
	description = cName.." Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"n2_"..name.."_berries.png"},
	special_tiles = {"n2_"..name.."_berries.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, not_in_creative_inventory=1},
	drop = "naturia2:"..name.."_sprig",
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = after_place_leaves,
})
end
if schem then
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
	fill_ratio=0.0002,
	y_min = -300,
	y_max = 300,
	schematic = "schems/"..name..".mts",
	flags={place_center_x=true, place_center_y=false, place_center_z=true, force_placement=true,},
	rotation="random",
})
end
end

regsiter_tree("rowan", "Rowan", true, "", true)
regsiter_tree("yew", "Yew", false, "", true)
regsiter_tree("beech", "Beech", false, "", true)

minetest.register_node("naturia2:yarrow_growing", {
	description = "Yarrow",
	drawtype = "plantlike",
	tiles = {"n2_yarrow.png"},
	inventory_image = "n2_yarrow.png",
	wield_image = "n2_yarrow.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 0.5, 6 / 16},
	},
	groups = {snappy = 3, flammable = 2, not_in_creative_inventory=1},
	sounds = default.node_sound_leaves_defaults(),
	drop="naturia2:yarrow",
})

minetest.register_node("naturia2:paste", {
	description = "paste",
	tiles = {"n2_paste2.png"},
	drop = "",
	connects_to={"naturia2:paste"},
	walkable = false,
	sounds = default.node_sound_leaves_defaults(),
	groups={not_in_creative_inventory=1, snappy=3},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "connected",
		fixed =         {-0.25, -0.5, -0.25, 0.25, -0.47, 0.25},
		connect_front = {-0.25, -0.5, -0.5, 0.25, -0.47, 0.25},
		connect_back =  {-0.25, -0.5, 0.5, 0.25, -0.47, 0.25},
		connect_left =  {-0.25, -0.5, -0.25, -0.5, -0.47, 0.25},
		connect_right =  {-0.25, -0.5, -0.25, 0.5, -0.47, 0.25},
	}
})