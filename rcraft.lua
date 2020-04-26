
local rm = function(pos)
	local objs = minetest.env:get_objects_inside_radius({x=pos.x,y=pos.y+1,z=pos.z}, 1)
	if objs then
		for _, obj in ipairs(objs) do
			if obj and obj:get_luaentity() and obj:get_luaentity().name == "naturia2:floater" then
				obj:remove()
			end
		end
	end
end


naturia.rituals={}
function naturia.register_ritual_craft(ring, result)
	naturia.rituals[result]={items=ring, output=result}
end

local function copy(t)
	local l={}
	for _,v in pairs(t) do
		l[_]=v
	end
	return l
end

local function tlen(t)
	local l=0
	for k, v in pairs(t) do
		l = l + 1
	end
	return l
end

local exemptables={
	[""]=true,
	["naturia2:essence_crystal"]=true,
	["naturia2:essence_crystal_invert"]=true,
}

naturia.begin_crafting=function(pos, flow, power, connection, player)
	local npos=copy(pos)
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
		[14]={x=pos.x-3, y=pos.y, z=pos.z+1},
		[15]={x=pos.x-2, y=pos.y, z=pos.z+2},
		[16]={x=pos.x-1, y=pos.y, z=pos.z+3},
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
	
	local lrcp={}
	local rpower=0
	
	for _,v in ipairs(poses) do
		local n=minetest.get_node(v).name
		local i=""
		if n=="naturia2:ennolte" then
			i=minetest.get_meta(v):get_string("item") or ""
		elseif n=="naturia2:pedestal" then
			v.y=v.y+1
			i=minetest.get_node(v).name
		end
		lrcp[_..""]=i
	end	
	for _,v  in pairs(naturia.rituals) do
		local rev=0
		for __,vv in pairs(v.items) do
			if lrcp[__]==vv then rev=rev+1 end
		end
		for _,vv in pairs(lrcp) do
			if not exemptables[vv] then 
				rpower=rpower+10+(naturia.expowers[vv] or 0)
			end
		end
		print(flow.." "..power.." "..connection)
		print(rpower)
		if power < rpower then
			minetest.chat_send_player(player:get_player_name(), "The ritual sputters and dies. It seems you do not have enough power.")
			return
		end
		if connection < power then 
			minetest.chat_send_player(player:get_player_name(), "The power overloads and escapes into the air. You do not have enough Runpotr.")
			return
		end
		if flow < connection then 
			minetest.chat_send_player(player:get_player_name(), "Your circle draws enough energy, but it burns away due to resistance. Your circle is too jumbled, try some more straight lines.")
			return
		end
		if rev==tlen(v.items) then 
			lrcp={}
			for b,d in ipairs(poses) do
				local n=minetest.get_node(d).name
				if n=="naturia2:ennolte" then
					minetest.get_meta(d):set_string("item", "")
					rm(d)
				end
			end
			minetest.add_item({x=npos.x, y=npos.y+1, z=npos.z}, v.output)
		end
	end
end

naturia.register_ritual_craft({
	["1"]="naturia2:naghota",
	["2"]="naturia2:essence_crystal",
	["3"]="naturia2:merlith",
	["4"]="naturia2:essence_crystal",
	["5"]="naturia2:naghota",
	["6"]="naturia2:essence_crystal",
	["7"]="naturia2:merlith",
	["8"]="naturia2:essence_crystal",
	["9"]="naturia2:naghota",
	["10"]="naturia2:essence_crystal",
	["11"]="naturia2:merlith",
	["12"]="naturia2:essence_crystal",
	["13"]="naturia2:naghota",
	["14"]="naturia2:essence_crystal",
	["15"]="naturia2:merlith",
	["16"]="naturia2:essence_crystal"
}, "naturia2:essence_crystal_invert")

naturia.register_ritual_craft({
	["1"]="naturia2:poison",
	["2"]="naturia2:essence_crystal_invert",
	["3"]="naturia2:coagulant",
	["4"]="naturia2:essence_crystal_invert",
	["5"]="default:flint",
	["6"]="naturia2:essence_crystal",
	["7"]="naturia2:acid",
	["8"]="naturia2:essence_crystal",
	["9"]="default:apple",
	["10"]="naturia2:essence_crystal",
	["11"]="naturia2:poison",
	["12"]="naturia2:essence_crystal",
	["13"]="naturia2:poison",
	["14"]="naturia2:essence_crystal",
	["15"]="naturia2:poison",
	["16"]="naturia2:essence_crystal"
}, "naturia2:cutra_1 4")