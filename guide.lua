
guideBooks.Common.register_guideBook("naturia2:guide", {
	inventory_image="n2_guidestone.png",
	description_short="Coextant",
	description_long=minetest.colorize("#888888", "Naturia 2 Guide"),
	style={
		cover={
			bg="n2_fbg2.png",
			next="n2_frn.png",
			w=10,
			h=10
		},
		page={
			bg="n2_fbg.png",
			next="n2_frn.png",
			prev="n2_frp.png",
			start="n2_frb.png",
			w=10,
			h=10
		},
		buttonGeneric="n2_fbg.png",
	},
	ptype=true,
})

guideBooks.Common.register_section("naturia2:guide","tutorial", {
	description="To begin"
})
guideBooks.Common.register_page("naturia2:guide", "tutorial", 1, {
	text1=[[
		(((This guide assumes you have a separate crafting guide such as Unified Inventory)))
		To begin harnessing natural energy, one must first have these basic tools:
		- A mortar and pestle
		- A carving knife
		- A set of phials, jars and bottles
		Once you have these instruments you can begin shaping the world and yourself using
		the life-powers of the world.
		
		It would be wise to collect ample natural materials such as yarrow and ferns
		for later use.
	]], 
	extra=[[]]
})

guideBooks.Common.register_section("naturia2:guide","plants", {
	description="For what to look"
})

guideBooks.Common.register_page("naturia2:guide", "plants", 1, {
	text1=[[
		This chapter is comprised of descriptions of plants and trees.
		
		--- Yarrow ---
		Yarrow is a tough weedy plant with white or pink flowers which grows in temperate
		and dryish climates. Its sap is a form of coagulant and helps wounds to heal by
		promoting blood clotting.
		
		--- Nightshade ---
		A poisonous weed-plant with dull green foliage and dark purple berries. It can be used
		to create a toxic agent.
		
		--- Twfon ---
		Pronounced Tu-ih-von, twyfon is a small plant with dark bell-shaped sheaves. 
		Twyfon seems to have a negatory effect on most things.
		
		--- Rowan ---
		A small tree with bitter orange fruit, rowan has dark wood and brittle twigs.
		
		--- Yew ---
		A small bush-like shrub with sharp needles. Yew is mildly toxic and extremely flexible.
		
		--- Beech ---
		Tall dark trees oft-covered in dark honeydew.
		Beech is a light wood and not very dense.
	]], 
	extra=[[]]
})