
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

naturia.expowers["naturia2:"..name.."_tree"]=5

minetest.register_node("naturia2:"..name.."_wood", {
	description = "Packaged "..cName.." Wood",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"n2_"..name.."_wood.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

naturia.expowers["naturia2:"..name.."_wood"]=2

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
				items = {"naturia2:"..name.."_sapling"},
				rarity = 20,
			},
			{
				items = {"naturia2:"..name.."_leaves"},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = after_place_leaves,
})

naturia.expowers["naturia2:"..name.."_leaves"]=5

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

naturia.expowers["naturia2:"..name.."_sapling"]=9

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
naturia.expowers["naturia2:"..name.."_berries"]=3
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
	connects_to={"naturia2:paste", "naturia2:rune_1", "naturia2:pedestal", "naturia2:ennolte", "naturia2:rune_2"},
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

local function copy(t)
	local l={}
	for _,v in pairs(t) do
		l[_]=v
	end
	return l
end

naturia.collectStructure=function(pos, acceptable)
	local iPos=copy(pos)
	local stc = {[pos.x..pos.y..pos.z]=pos}
	local l2={iPos}
	local con=1
	while con > 0 do
		con=0
		for _,v in pairs(l2) do
			local npos = copy(v)
			npos.x=npos.x+1
			if acceptable[minetest.get_node(npos).name] and not stc[npos.x..npos.y..npos.z] then
				stc[npos.x..npos.y..npos.z]=copy(npos)
				table.insert(l2, copy(npos))
				con=con+1
			end
			local npos = copy(v)
			npos.x=npos.x-1
			if acceptable[minetest.get_node(npos).name] and not stc[npos.x..npos.y..npos.z] then
				stc[npos.x..npos.y..npos.z]=copy(npos)
				table.insert(l2, copy(npos))
				con=con+1
			end
			local npos = copy(v)
			npos.z=npos.z+1
			if acceptable[minetest.get_node(npos).name] and not stc[npos.x..npos.y..npos.z] then
				stc[npos.x..npos.y..npos.z]=copy(npos)
				table.insert(l2, copy(npos))
				con=con+1
			end
			local npos = copy(v)
			npos.z=npos.z-1
			if acceptable[minetest.get_node(npos).name] and not stc[npos.x..npos.y..npos.z] then
				stc[npos.x..npos.y..npos.z]=copy(npos)
				table.insert(l2, copy(npos))
				con=con+1
			end
		end
	end
	
	for k,v in pairs(stc) do
		stc[k].name=minetest.get_node(v).name
	end
	
	return(stc)
end

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
			{-0.3, -0.3, -0.3, 0.3, 0.4, 0.3},
			{-0.2, -0.4, -0.2, 0.2, 0.5, 0.2},
			{-0.5, -0.5, -0.5, 0.5, -0.4, 0.5},
		},
	},
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		if itemstack:get_name()=="naturia2:rowan_wand" then
			local acc={["naturia2:paste"]=1, ["naturia2:pedestal"]=1, ["naturia2:ennolte"]=1, ["naturia2:rune_2"]=1}
			local struct=naturia.collectStructure(pos, acc)
			local flow=0
			local power=0
			local connection=0
			local map={}
			for _,v in pairs(struct) do
				if v.name=="naturia2:paste" then
					flow=flow+5
					if acc[minetest.get_node({x=v.x+1, y=v.y, z=v.z}).name] then
						flow=flow-1
						connection=connection+1
					end
					if acc[minetest.get_node({x=v.x-1, y=v.y, z=v.z}).name] then
						flow=flow-1
						connection=connection+1
					end
					if acc[minetest.get_node({x=v.x, y=v.y, z=v.z+1}).name] then
						flow=flow-1
						connection=connection+1
					end
					if acc[minetest.get_node({x=v.x, y=v.y, z=v.z-1}).name] then
						flow=flow-1
						connection=connection+1
					end
				elseif v.name=="naturia2:rune_2" then
					power=power+15
				end
			end
			local poses={
				[1]={x=pos.x, y=pos.y, z=pos.z+3},
				[2]={x=pos.x+1, y=pos.y, z=pos.z+3},
				[3]={x=pos.x+2, y=pos.y, z=pos.z+2},
				[4]={x=pos.x+3, y=pos.y, z=pos.z+1},
				[5]={x=pos.x+3, y=pos.y, z=pos.z},
				[6]={x=pos.x+3, y=pos.y, z=pos.z-1},
				[7]={x=pos.x+2, y=pos.y, z=pos.z-2},
				[8]={x=pos.x+1, y=pos.y, z=pos.z-3},
				[9]={x=pos.x, y=pos.y, z=pos.z-3},
				[10]={x=pos.x-1, y=pos.y, z=pos.z-3},
				[11]={x=pos.x-2, y=pos.y, z=pos.z-2},
				[12]={x=pos.x-3, y=pos.y, z=pos.z-1},
				[13]={x=pos.x-3, y=pos.y, z=pos.z},
				[15]={x=pos.x-3, y=pos.y, z=pos.z+1},
				[16]={x=pos.x-2, y=pos.y, z=pos.z+2},
				[17]={x=pos.x-1, y=pos.y, z=pos.z+3},
			}
			
			local poses2={
				[1]={x=pos.x, y=pos.y, z=pos.z+4},
				[2]={x=pos.x, y=pos.y, z=pos.z-4},
				[3]={x=pos.x+4, y=pos.y, z=pos.z},
				[4]={x=pos.x-4, y=pos.y, z=pos.z},
				[5]={x=pos.x+3, y=pos.y, z=pos.z+3},
				[6]={x=pos.x-3, y=pos.y, z=pos.z-3},
				[7]={x=pos.x+3, y=pos.y, z=pos.z-3},
				[8]={x=pos.x-3, y=pos.y, z=pos.z+3},
			}
			
			local sp=""
			local xp="naturia2:ennoltenaturia2:pedestalnaturia2:ennoltenaturia2:pedestalnaturia2:ennoltenaturia2:pedestalnaturia2:ennoltenaturia2:pedestalnaturia2:ennoltenaturia2:pedestalnaturia2:ennoltenaturia2:pedestalnaturia2:ennolte"
			for _,p in ipairs(poses) do
				local n=minetest.get_node(p).name
				sp=sp..n
			end
			
			local sp2=""
			local xp2="naturia2:ennoltenaturia2:ennoltenaturia2:ennoltenaturia2:ennoltenaturia2:ennoltenaturia2:ennoltenaturia2:ennoltenaturia2:ennolte"
			for _,p in ipairs(poses2) do
				local n=minetest.get_node(p).name
				sp2=sp2..n
			end
			
			if sp==xp and sp2==xp2 then
				naturia.begin_crafting(pos, flow, power, connection, player)
				
			end			
		end
	end
})

minetest.register_node("naturia2:naghota_growing", {
	description = "Twyfon",
	drawtype = "plantlike",
	tiles = {"n2_naghota.png"},
	inventory_image = "n2_naghota.png",
	wield_image = "n2_naghota.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 0.5, 6 / 16},
	},
	groups = {snappy = 3, flammable = 2, not_in_creative_inventory=1},
	sounds = default.node_sound_leaves_defaults(),
	drop="naturia2:naghota",
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_coniferous_litter"},
	sidelen = 16,
	fill_ratio=0.0002,
	y_min = -300,
	y_max = 300,
	decoration="naturia2:naghota_growing",
})

minetest.register_node("naturia2:urglin", {
	description = "Krén Jasper",
	place_param2 = 0,
	tiles = {"n2_urglin.png"},
	is_ground_content = false,
	groups = {cracky=1},
	sounds = default.node_sound_wood_defaults(),
})

naturia.expowers["naturia2:urglin"]=5

minetest.register_node("naturia2:merlith", {
	description = "Krén Jasper Lattice",
	drawtype="glasslike",
	use_texture_alpha=true,
	place_param2 = 0,
	tiles = {"n2_urglin2.png"},
	is_ground_content = false,
	groups = {cracky=1},
	sounds = default.node_sound_wood_defaults(),
})

naturia.expowers["naturia2:merlith"]=6

minetest.register_node("naturia2:essence_crystal", {
	description = "Wrglyd",
	drawtype="nodebox",
	use_texture_alpha=true,
	sunlight_propagates=true,
	paramtype="light",
	place_param2 = 0,
	tiles = {"n2_urglin2.png"},
	is_ground_content = false,
	groups = {cracky=1},
	sounds = default.node_sound_glass_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-0.015, -0.4, -0.015, 0.015, 0.4, 0.015},
			{-0.03, -0.25, -0.03, 0.03, 0.25, 0.03},
			{-0.05, -0.2, -0.05, 0.05, 0.2, 0.05},
		},
	},
})

minetest.register_node("naturia2:pedestal", {
	description="Glydoin",
	tiles={"default_desert_stone.png"},
	sunlight_propagates=true,
	is_ground_content=false,
	groups={cracky=3, oddly_breakable_by_hand=3},
	sounds=default.node_sound_stone_defaults(),
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1, -0.4, -0.1, 0.1, 0.4, 0.1},
			{-0.2, 0.4, -0.2, 0.2, 0.5, 0.2},
			{-0.25, -0.4, -0.25, 0.25, -0.3, 0.25},
			{-0.5, -0.5, -0.5, 0.5, -0.4, 0.5},
		},
	},
})

minetest.register_node("naturia2:rune_2", {
	description="Aésilith",
	tiles={"default_cobble.png"},
	sunlight_propagates=true,
	is_ground_content=false,
	groups={cracky=3, oddly_breakable_by_hand=3},
	sounds=default.node_sound_stone_defaults(),
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.45, -0.4, -0.2, 0.45, 1.5, 0.2},
			{-0.2, -0.4, -0.45, 0.2, 1.5, 0.45},
			{-0.35, -0.4, -0.35, 0.35, 1.6, 0.35},
			{-0.3, -0.4, -0.3, 0.3, 1.8, 0.3},
			{-0.25, -0.4, -0.25, 0.25, 2.2, 0.25},
			{-0.15, -0.4, -0.15, 0.15, 2.5, 0.15},
			{-0.5, -0.5, -0.5, 0.5, -0.4, 0.5},
		},
	},
})

minetest.register_node("naturia2:essence_crystal_invert", {
	description = "Wrglyd Nerí",
	drawtype="nodebox",
	use_texture_alpha=true,
	sunlight_propagates=true,
	paramtype="light",
	place_param2 = 0,
	tiles = {"n2_urglin3.png"},
	is_ground_content = false,
	groups = {cracky=1},
	sounds = default.node_sound_glass_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-0.015, -0.4, -0.015, 0.015, 0.4, 0.015},
			{-0.03, -0.25, -0.03, 0.03, 0.25, 0.03},
			{-0.05, -0.2, -0.05, 0.05, 0.2, 0.05},
		},
	},
})