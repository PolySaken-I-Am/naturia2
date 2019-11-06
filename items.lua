
minetest.register_craftitem("naturia2:wirryn_leaf", {
	description = "Wirryn Leaf",
	inventory_image = "n2_wirryn.png",
	groups = {flammable = 3, wirryn=1, plant=1, flora=1},
})

minetest.register_craftitem("naturia2:wirryn_seeds", {
	description = "Wirryn Spores",
	inventory_image = "n2_wirryn_seeds.png",
	groups = {seed = 1, flammable = 3},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "naturia2:wirryn_crop_1")
	end,
})

minetest.register_craftitem("naturia2:mortar", {
	description = "Mortar and Pestle",
	inventory_image = "n2_mortar.png",
})