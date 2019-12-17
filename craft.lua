-- replacements={{"naturia2:mortar","naturia2:mortar"}}

minetest.register_craft({
	output="naturia2:mortar",
	recipe={
		{"", "default:stone", ""},
		{"default:cobble", "default:flint", "default:cobble"},
		{"", "default:cobble", ""}
	},
})

minetest.register_craft({
	output="naturia2:rowan_wood 4",
	recipe={"naturia2:rowan_tree"},
	type="shapeless"
})

minetest.register_craft({
	output="naturia2:rowan_stick 4",
	recipe={"naturia2:rowan_leaves"},
	type="shapeless"
})

minetest.register_craft({
	output="naturia2:knife",
	recipe={
		{"", "", "default:steel_ingot"},
		{"", "default:stick", ""},
		{"default:copper_ingot", "", ""}
	},
})

minetest.register_craft({
	output="naturia2:knife2",
	recipe={
		{"", "", "default:steel_ingot"},
		{"default:gold_ingot", "naturia2:knife", ""},
		{"", "naturia2:yew_wood", ""}
	},
	replacements={{"naturia2:knife","default:stick"}}
})

minetest.register_craft({
	output="naturia2:yew_wood 4",
	recipe={"naturia2:yew_tree"},
	type="shapeless"
})

minetest.register_craft({
	output="naturia2:rowan_wand",
	recipe={"naturia2:knife2", "naturia2:rowan_tree"},
	type="shapeless",
	replacements={{"naturia2:knife2","naturia2:knife2"}}
})

minetest.register_craft({
	output="naturia2:bottle_1 25",
	recipe={
		{"", "", ""},
		{"xpanes:pane_flat", "", "xpanes:pane_flat"},
		{"", "xpanes:pane_flat", ""}
	},
})

minetest.register_craft({
	output="naturia2:bottle_2 25",
	recipe={
		{"xpanes:pane_flat", "", "xpanes:pane_flat"},
		{"xpanes:pane_flat", "", "xpanes:pane_flat"},
		{"", "xpanes:pane_flat", ""}
	},
})

minetest.register_craft({
	output="naturia2:bottle_3 25",
	recipe={
		{"xpanes:pane_flat", "", "xpanes:pane_flat"},
		{"xpanes:pane_flat", "", "xpanes:pane_flat"},
		{"xpanes:pane_flat", "xpanes:pane_flat", "xpanes:pane_flat"}
	},
})


minetest.register_craft({
	output="naturia2:coagulant",
	recipe={"naturia2:mortar", "naturia2:yarrow", "naturia2:bottle_2"},
	type="shapeless",
	replacements={{"naturia2:mortar","naturia2:mortar"}}
})

minetest.register_craft({
	output="naturia2:acid",
	recipe={"naturia2:mortar", "default:fern_1", "naturia2:bottle_2"},
	type="shapeless",
	replacements={{"naturia2:mortar","naturia2:mortar"}}
})

minetest.register_craft({
	output="naturia2:pine_dust",
	recipe={"default:pine_tree", "naturia2:acid"},
	type="shapeless"
})

minetest.register_craft({
	output="naturia2:rune_paste",
	recipe={"naturia2:pine_dust", "naturia2:coagulant"},
	type="shapeless",
	replacements={{"naturia2:coagulant","naturia2:bottle_2"}}
})

minetest.register_craft({
	output="naturia2:beech_wood 4",
	recipe={"naturia2:beech_tree"},
	type="shapeless"
})

minetest.register_craft({
	output="naturia2:mildew",
	recipe={"naturia2:knife2", "naturia2:beech_tree", "naturia2:bottle_2"},
	type="shapeless",
	replacements={{"naturia2:knife2","naturia2:knife2"}, {"naturia2:beech_tree", "naturia2:beech_wood 4"}}
})

minetest.register_craft({
	output="naturia2:incense",
	recipe={"naturia2:mildew", "naturia2:rowan_stick", "naturia2:coagulant"},
	type="shapeless",
	replacements={{"naturia2:mildew","naturia2:bottle_2 2"}}
})

minetest.register_craft({
	output="naturia2:incense_attach",
	recipe={"naturia2:incense", "naturia2:acid"},
	replacements={{"naturia2:acid","naturia2:bottle_2"}}
	type="shapeless",
})