
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

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
	fill_ratio=0.0002,
	y_min = -300,
	y_max = 300,
	decoration="naturia2:yarrow_growing",
})

minetest.register_node("naturia2:paste", {
	description = "paste",
	tiles = {"n2_paste2.png"},
	drop = "",
	connects_to={"naturia2:paste", "naturia2:stone_i"},
	walkable = false,
	sounds = default.node_sound_leaves_defaults(),
	groups={not_in_creative_inventory=1, snappy=3},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "connected",
		fixed =         {-0.125, -0.5, -0.125, 0.125, -0.47, 0.125},
		connect_front = {-0.125, -0.5, -0.5, 0.125, -0.47, 0.125},
		connect_back =  {-0.125, -0.5, 0.5, 0.125, -0.47, 0.125},
		connect_left =  {-0.125, -0.5, -0.125, -0.5, -0.47, 0.125},
		connect_right =  {-0.125, -0.5, -0.125, 0.5, -0.47, 0.125},
	}
})

minetest.register_node("naturia2:nightshade_growing", {
	description = "Nightshade",
	drawtype = "plantlike",
	tiles = {"n2_nightshade.png"},
	inventory_image = "n2_nightshade.png",
	wield_image = "n2_nightshade.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 0.5, 6 / 16},
	},
	groups = {snappy = 3, flammable = 2, not_in_creative_inventory=1},
	sounds = default.node_sound_leaves_defaults(),
	drop="naturia2:nightshade",
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
	fill_ratio=0.0002,
	y_min = -300,
	y_max = 300,
	decoration="naturia2:nightshade_growing",
})



minetest.register_entity("naturia2:floater",{
	hp_max = 1,
	visual="wielditem",
	visual_size={x=.33,y=.33},
	collisionbox = {0,0,0,0,0,0},
	physical=false,
	textures={"air"},
})

local rm = function(pos)
	local objs = minetest.env:get_objects_inside_radius({x=pos.x,y=pos.y+1,z=pos.z}, 0.5)
	if objs then
		for _, obj in ipairs(objs) do
			if obj and obj:get_luaentity() and obj:get_luaentity().name == "naturia2:floater" then
				obj:remove()
			end
		end
	end
end

local up = function(pos, r, m)
	rm(pos)
	local meta = minetest.get_meta(pos)
	if meta:get_string("item") ~= "" then
		pos.y = pos.y + 0.6
		local texture = ItemStack(meta:get_string("item")):get_name()
		local ent=minetest.add_entity(pos, "naturia2:floater")
		ent:set_properties({textures={texture}})
		if r and type(r)=="number" then ent:set_yaw(r) end
		local ep=ent:get_pos()
		if m and type(m)=="table" then ent:set_pos({x=ep.x+m.x,y=ep.y,z=ep.z+m.z}) end
	end
end


local d = function(pos)
	local meta = minetest.get_meta(pos)
	if meta:get_string("item") ~= "" then
		minetest.add_item({x=pos.x,y=pos.y+1,z=pos.z}, meta:get_string("item"))
		meta:set_string("item","")
	end
	rm(pos)
end

minetest.register_node("naturia2:ennolte", {
	description="Ennoltè",
	tiles={"default_stone.png", "default_stone.png", "default_stone.png"},
	sunlight_propagates=true,
	is_ground_content=false,
	groups={cracky=3, oddly_breakable_by_hand=3},
	sounds=default.node_sound_stone_defaults(),
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3, -0.5, -0.3, 0.3, 0.4, 0.3},
			{-0.5, -0.5, -0.5, 0.5, -0.4, 0.5}
		},
	},
	on_rightclick = function(pos, node, clicker, itemstack)
		local meta = minetest.get_meta(pos)
		if itemstack then
			d(pos)
			meta:set_string("item", itemstack:get_name())
			itemstack:take_item()
			up(pos)
		else
			d(pos)
		end
		return itemstack
	end,
	on_destruct = function(pos)
		d(pos)
	end,
	on_punch = function(pos, node, player, pointed_thing)
		if player:get_wielded_item():get_definition().groups.axe==1 then
			local meta=minetest.get_meta(pos)
			local item=meta:get_string("item")
			if item then
				if truCraft.chops[item] then
					rm(pos)
					minetest.add_item({x=pos.x,y=pos.y+1,z=pos.z}, truCraft.chops[item])
					meta:set_string("item", "")
				end
			end
		end
	end,
})

minetest.register_lbm({
	name = "naturia2:fix_ent",
	run_at_every_load=true,
	nodenames = {"naturia2:ennolte"},
	action = function(pos, node)
		local meta=minetest.get_meta(pos)
		local r=0
		if meta:get_int("itemr") then r=meta:get_int("itemr") end
		local m={x=0, z=0}
		if meta:get_int("plposx") then m.x=meta:get_int("plposx") end
		if meta:get_int("plposz") then m.z=meta:get_int("plposz") end
		up(pos, r, m)
	end,
})

minetest.register_node("naturia2:rune_1", {
	description="Oghess",
	tiles={"default_stone.png", "default_stone.png", "default_stone.png^n2_rune1.png"},
	sunlight_propagates=true,
	is_ground_content=false,
	groups={cracky=3, oddly_breakable_by_hand=3},
	sounds=default.node_sound_stone_defaults(),
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3, -0.4, -0.3, 0.3, 0.4, 0.3},
			{-0.2, -0.4, -0.2, 0.2, 0.5, 0.2},
			{-0.35, -0.5, -0.35, 0.35, -0.4, 0.35},
		},
	},
})