
minetest.register_craft({
	output="naturia2:wirryn_seeds",
	type="shapeless",
	recipe={"naturia2:wirryn"},
})

minetest.register_craft({
	output="naturia2:mortar",
	recipe={
		{"", "default:stone", ""},
		{"default:cobble", "default:flint", "default:cobble"},
		{"", "default:cobble", ""}
	},
})

-- replacements={{"naturia2:mortar","naturia2:mortar"}}
