
minetest.register_craftitem("naturia2:mortar", {
	description = "Mortar and Pestle",
	inventory_image = "n2_mortar.png",
	stack_max=1,
})

minetest.register_craftitem("naturia2:rowan_sprig", {
	description = "Rowan Sprig",
	inventory_image = "n2_rowan_sprig.png",
})

minetest.register_craftitem("naturia2:rowan_stick", {
	description = "Rowan Stick",
	inventory_image = "n2_rowan_twig.png",
})

minetest.register_craftitem("naturia2:knife", {
	description = "Carving Knife",
	inventory_image = "n2_knife.png",
	stack_max=1
})

minetest.register_craftitem("naturia2:knife2", {
	description = "Artificer's Knife",
	inventory_image = "n2_knife2.png",
	stack_max=1,
	tool_capabilities={
		full_punch_interval=0.7,
		damage_groups={fleshy=7.5},
	},
})

minetest.register_craftitem("naturia2:rowan_wand", {
	description = "Rowan Càna",
	inventory_image = "n2_rowan_wand.png",
	stack_max=1,
	on_use=function(itemstack, placer, pointed_thing)
	
	end
})

minetest.register_craftitem("naturia2:yarrow", {
	description = "Yarrow Heads",
	inventory_image = "n2_yarrowhead.png",
	stack_max=1
})

minetest.register_craftitem("naturia2:bottle_1", {
	description = "Phial",
	inventory_image = "n2_bottle_small.png",
})

minetest.register_craftitem("naturia2:bottle_2", {
	description = "Bottle",
	inventory_image = "n2_bottle_med.png",
})

minetest.register_craftitem("naturia2:bottle_3", {
	description = "Jar",
	inventory_image = "n2_bottle_large.png",
})

minetest.register_craftitem("naturia2:coagulant", {
	description = "Bottle Of Coagulant",
	inventory_image = "n2_coagulant.png",
})

minetest.register_craftitem("naturia2:acid", {
	description = "Bottled Rending Catalyst",
	inventory_image = "n2_acid.png",
})

minetest.register_craftitem("naturia2:pine_dust", {
	description = "White Pine Dust",
	inventory_image = "n2_pine_dust.png",
})

minetest.register_tool("naturia2:rune_paste", {
	description = "Runic Marking Paste",
	inventory_image = "n2_paste.png",
	on_use=function(itemstack, placer, pointed_thing)
	local n=pointed_thing.above
		if n then
			if minetest.get_node(n).name=="air" then
				minetest.set_node(n, {name="naturia2:paste"})
				itemstack:add_wear(65535/100)
				return itemstack
			end
		end
	end
})

minetest.register_craftitem("naturia2:mildew", {
	description = "Black Beech Mold",
	inventory_image = "n2_mildew.png",
})