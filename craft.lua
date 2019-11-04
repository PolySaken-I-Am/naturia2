
minetest.register_craft({
	output="naturia2:yarrow_seeds",
	type="shapeless",
	recipe={"naturia2:yarrow"},
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
