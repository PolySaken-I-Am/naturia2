
local crop_def = {
	drawtype = "plantlike",
	tiles = {"n2_wirryn_c1.png"},
	paramtype = "light",
	sunlight_propagates = true,
	waving = 1,
	walkable = false,
	buildable_to = true,
	drop = "",
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 0.5, 6 / 16},
	},
	groups = {
		snappy = 3, flammable = 3, plant = 1, attached_node = 1,
		not_in_creative_inventory = 1, growing = 1
	},
	sounds = default.node_sound_leaves_defaults()
}

minetest.register_node("naturia2:wirryn_crop_1", table.copy(crop_def))

crop_def.tiles = {"n2_wirryn_c2.png"}
minetest.register_node("naturia2:wirryn_crop_2", table.copy(crop_def))

crop_def.tiles = {"n2_wirryn_c3.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	max_items = 5, items = {
		{items = {'naturia2:wirryn_seeds'}, rarity = 1},
		{items = {'naturia2:wirryn_leaf'}, rarity = 1},
		{items = {'naturia2:wirryn_leaf'}, rarity = 2},
		{items = {'naturia2:wirryn_seeds'}, rarity = 2},
		{items = {'naturia2:wirryn_leaf'}, rarity = 5},
	}
}
minetest.register_node("naturia2:wirryn_crop_3", table.copy(crop_def))

farming.registered_plants["naturia2:wirryn"] = {
	crop = "naturia2:wirryn_crop",
	seed = "naturia2:wirryn_seeds",
	minlight = 13,
	maxlight = 15,
	steps = 3,
}

if bonemeal then
	bonemeal:add_crop({
		{"naturia2:wirryn_crop_", 3},
	})
end