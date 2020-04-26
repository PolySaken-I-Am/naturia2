
minetest.register_craftitem("naturia2:mortar", {
	description = "Mortar and Pestle",
	inventory_image = "n2_mortar.png",
	stack_max=1,
})

minetest.register_craftitem("naturia2:rowan_sprig", {
	description = "Rowan Sprig",
	inventory_image = "n2_rowan_sprig.png",
})

naturia.expowers["naturia2:rowan_sprig"]=2

minetest.register_craftitem("naturia2:rowan_stick", {
	description = "Rowan Stick",
	inventory_image = "n2_rowan_twig.png",
})

naturia.expowers["naturia2:rowan_stick"]=1

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
	description = "Rowan Càdre",
	inventory_image = "n2_rowan_wand.png",
	stack_max=1,
	on_use=function(itemstack, placer, pointed_thing)
	
	end
})

naturia.expowers["naturia2:rowan_wand"]=15

minetest.register_craftitem("naturia2:yarrow", {
	description = "Yarrow Heads",
	inventory_image = "n2_yarrowhead.png",
})

naturia.expowers["naturia2:yarrow"]=4

minetest.register_craftitem("naturia2:bottle_1", {
	description = "Phial",
	inventory_image = "n2_bottle_small.png",
})

minetest.register_craftitem("naturia2:bottle_2", {
	description = "Jar",
	inventory_image = "n2_bottle_med.png",
})

minetest.register_craftitem("naturia2:bottle_3", {
	description = "Bottle",
	inventory_image = "n2_bottle_large.png",
})

minetest.register_craftitem("naturia2:coagulant", {
	description = "Coagulant",
	inventory_image = "n2_coagulant.png",
})

naturia.expowers["naturia2:coagulant"]=1

minetest.register_craftitem("naturia2:acid", {
	description = "Rending Catalyst",
	inventory_image = "n2_acid.png",
})

naturia.expowers["naturia2:acid"]=2

minetest.register_craftitem("naturia2:pine_dust", {
	description = "White Pine Dust",
	inventory_image = "n2_pine_dust.png",
})
naturia.expowers["naturia2:pine_dust"]=1

minetest.register_tool("naturia2:rune_paste", {
	description = "Runpotr",
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
naturia.expowers["naturia2:rune_paste"]=10

minetest.register_craftitem("naturia2:mildew", {
	description = "Black Beech Mold",
	inventory_image = "n2_mildew.png",
})
naturia.expowers["naturia2:mildew"]=3

minetest.register_craftitem("naturia2:naghota", {
	description = "Twyfon Sheaf",
	inventory_image = "n2_naghota_leaf.png",
})
naturia.expowers["naturia2:naghota"]=16

minetest.register_craftitem("naturia2:invertor", {
	description = "Nerí",
	inventory_image = "n2_invertor.png",
})
naturia.expowers["naturia2:invertor"]=11

minetest.register_craftitem("naturia2:nightshade", {
	description = "Nightshade Leaf",
	inventory_image = "n2_nightshade_i.png",
})
naturia.expowers["naturia2:nightshade"]=4

minetest.register_craftitem("naturia2:poison", {
	description = "Poison",
	inventory_image = "n2_poison.png",
})
naturia.expowers["naturia2:poison"]=3

minetest.register_craftitem("naturia2:claws_1", {
	wield_image = "n2_hand.png",
	wield_scale = {x=1,y=1,z=2.5},
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level = 0,
		groupcaps = {
			crumbly = {times={[2]=1.00, [3]=0.230}, uses=0, maxlevel=1},
			snappy = {times={[3]=0.10}, uses=0, maxlevel=1},
			oddly_breakable_by_hand = {times={[1]=1.50,[2]=1.00,[3]=0.40}, uses=0}
		},
		damage_groups = {fleshy=5},
	}
})

minetest.register_craftitem("naturia2:cutra_1", {
	description = "Cuìtra Jan",
	inventory_image = "n2_cutra.png",
	stack_max=1,
	on_use=function(itemstack, player, pointed_thing)
		player:get_inventory():set_size("hand", 1)
		player:get_inventory():set_stack("hand", 1, "naturia2:claws_1")
		itemstack:take_item()
		return itemstack
	end
})

minetest.register_craftitem("naturia2:uncutra", {
	description = "Cuìtra Nerí",
	inventory_image = "n2_cutra2.png",
	stack_max=1,
	on_use=function(itemstack, player, pointed_thing)
		player:get_inventory():set_size("hand", 1)
		player:get_inventory():set_stack("hand", 1, "")
		itemstack:take_item()
		return itemstack
	end
})